//
// Created by Mai Hoàng on 14/11/2021.
//

#include "memory.hpp"

Memory::Memory() {
  StorageStats stats;
  memset(&stats, 0, sizeof(stats));

  CacheConfig l1_config;
  StorageLatency l1_latency;
  l1_config.size = 32 * (1 << 10);
  l1_config.associativity = 8;
  l1_config.block_size = 64;
  l1_config.set_num = l1_config.size / l1_config.associativity / l1_config.block_size;
  l1_config.write_through = false;
  l1_config.write_allocate = true;
  l1_latency.hit_latency = 1;
  l1_latency.bus_latency = 0;
  l1->SetConfig(l1_config);
  l1->SetLatency(l1_latency);
  l1->SetStats(stats);

  CacheConfig l2_config;
  StorageLatency l2_latency;
  l2_config.size = 256 * (1 << 10);
  l2_config.associativity = 8;
  l2_config.block_size = 64;
  l2_config.set_num = l2_config.size / l2_config.associativity / l2_config.block_size;
  l2_config.write_through = false;
  l2_config.write_allocate = true;
  l2_latency.hit_latency = 8;
  l2_latency.bus_latency = 6;
  l2->SetConfig(l2_config);
  l2->SetLatency(l2_latency);
  l2->SetStats(stats);

  CacheConfig llc_config;
  StorageLatency llc_latency;
  llc_config.size = 8 * (1 << 20);
  llc_config.associativity = 8;
  llc_config.block_size = 64;
  llc_config.set_num = llc_config.size / llc_config.associativity / llc_config.block_size;
  llc_config.write_through = false;
  llc_config.write_allocate = true;
  llc_latency.hit_latency = 20;
  llc_latency.bus_latency = 20;
  llc->SetConfig(llc_config);
  llc->SetLatency(llc_latency);
  llc->SetStats(stats);

  l1->SetLower(l2);
  l2->SetLower(llc);
  llc->SetLower(vm);
}

Memory::~Memory() {
  delete l1;
  delete l2;
  delete llc;
  delete vm;
}

uint64_t Memory::read(uint64_t addr, unsigned int size, bool executable) {
  return vm->read(addr, size, executable);
}

void Memory::write(uint64_t addr, unsigned int size, uint64_t data) {
  vm->write(addr, size, data);
}
