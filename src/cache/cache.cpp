#include <cstdlib>
#include <cassert>
#include <math.h>
#include "cache.hpp"

bool is_power_of_two(uint64_t x) {
  return x && !(x & (x - 1));
}

uint64_t get_bits(uint64_t x, unsigned int lo, unsigned int hi) {
  return x << (ADDR_LEN - hi) >> (ADDR_LEN - hi + lo);
}

void Cache::SetConfig(CacheConfig cc) {
  // Check if config is valid
  assert(is_power_of_two(cc.size));
  assert(is_power_of_two(cc.set_num));
  assert(is_power_of_two(cc.associativity));
  assert(cc.set_num * cc.associativity < cc.size);
  cc.block_size = cc.size / (cc.set_num * cc.associativity);

  config_ = cc;

  s = log2(config_.set_num);
  b = log2(config_.block_size);
  t = ADDR_LEN - s - b;

  sets = vector<CacheSet>(cc.set_num);
  for (int i = 0; i < cc.set_num; i++) {
    sets[i].lines = vector<CacheLine>(cc.associativity);
    for (int j = 0; j < cc.associativity; j++) {
      CacheLine &line = sets[i].lines[j];
      line.access_counter = 0;
      line.valid = false;
      line.dirty = false;
      line.blocks = vector<char>(cc.block_size);
    }
  }
}

void Cache::HandleRequest(uint64_t addr, int bytes, int read,
                          char *content, int &hit, int &time) {
  assert(bytes > 0 && bytes <= 8);
  stats_.access_counter++;
  hit = 0;
  time = 0;
  uint64_t set_idx, tag, block_offset;
  bool in_cache;
  int line_idx = -1;
  int lower_hit = 0, lower_time = 0;

  // Bypass?
  if (!BypassDecision()) {
    PartitionAlgorithm(addr, set_idx, tag, block_offset);
    assert(block_offset + bytes <= config_.block_size);
    line_idx = GetLine(set_idx, tag);
    if (ReplaceDecision(line_idx, read)) {
      // Choose victim
      line_idx = ReplaceAlgorithm(set_idx);
    } else {
      // return hit & time
      if (read) {
        ReadRequest(set_idx, line_idx, block_offset, bytes, content);
      } else {
        WriteRequest(set_idx, line_idx, block_offset, bytes, content);
        if (config_.write_through) {
          lower_->HandleRequest(addr, bytes, read, content, lower_hit, lower_time);
        }
      }
      hit = 1;
      time += latency_.bus_latency + latency_.hit_latency + lower_time;
      stats_.access_time += latency_.bus_latency + latency_.hit_latency;
      return;
    }
  }
  // Prefetch?
  if (PrefetchDecision()) {
    PrefetchAlgorithm();
  } else {
    // Fetch from lower layer
    hit = 0;
    stats_.miss_num++;
    lower_->HandleRequest(addr, bytes, read, content,
                          lower_hit, lower_time);
    // Replacement
    if (line_idx != -1) {
      WriteRequest(set_idx, line_idx, 0, config_.block_size, content);
      time += latency_.bus_latency + latency_.hit_latency + lower_time;
      stats_.access_time += latency_.bus_latency + latency_.hit_latency;
    } else {
      time += latency_.bus_latency + lower_time;
      stats_.access_time += latency_.bus_latency;
    }
  }
}

void Cache::ReadRequest(uint64_t set_idx, uint64_t line_idx, uint64_t block_offset, int bytes, char *content) {
  auto& line = sets[set_idx].lines[line_idx];
  for (uint64_t i = block_offset; i < block_offset + bytes; i++) {
    content[i] = line.blocks[i];
  }
  line.access_counter = stats_.access_counter;
}

void Cache::WriteRequest(uint64_t set_idx, uint64_t line_idx, uint64_t block_offset, int bytes, char *content) {
  auto& line = sets[set_idx].lines[line_idx];
  for (uint64_t i = block_offset; i < block_offset + bytes; i++) {
    line.blocks[i] = content[i];
  }
  line.access_counter = stats_.access_counter;
  line.valid = true;
  if (config_.write_through) {
    line.dirty = false;
  } else {
    line.dirty = true;
  }
}

bool Cache::BypassDecision() {
  return false;
}

void Cache::PartitionAlgorithm(uint64_t addr, uint64_t &set_idx, uint64_t &tag, uint64_t &block_offset) {

  block_offset = get_bits(addr, 0, b - 1);
  set_idx = get_bits(addr, b, b + s - 1);
  tag = get_bits(addr, b + s, ADDR_LEN - 1);

}

int Cache::GetLine(uint64_t set_idx, uint64_t tag) {

  auto &lines = sets[set_idx].lines;

  for (int i = 0; i < config_.associativity; i++) {
    if (lines[i].valid && lines[i].tag == tag)
      return i;
  }

  return -1;
}

bool Cache::ReplaceDecision(int line_idx, int read) {
  if (read) {
    return line_idx == -1;
  } else {
    return line_idx == -1 && config_.write_allocate;
  }
}

int Cache::ReplaceAlgorithm(uint64_t set_idx) {
  int line_idx = -1;
  auto &lines = sets[set_idx].lines;
  for (int i = 0; i < lines.size(); i++) {
    if (!lines[i].valid) return i;
    if (line_idx == -1 || lines[i].access_counter < lines[line_idx].access_counter)
      line_idx = i;
  }
  return line_idx;
}

bool Cache::PrefetchDecision() {
  return false;
}

void Cache::PrefetchAlgorithm() {
}

