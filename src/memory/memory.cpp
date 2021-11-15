//
// Created by Mai Hoàng on 14/11/2021.
//

#include "memory.hpp"

Memory::Memory() {
  l1 = new Cache();
  l2 = new Cache();
  llc = new Cache();
  vm = new VirtualMemory();


  StorageStats stats;
  memset(&stats, 0, sizeof(stats));

  CacheConfig l1_config;
  StorageLatency l1_latency;
  l1_config.size = L1_SIZE;
  l1_config.associativity = ASSOCIATIVITY;
  l1_config.block_size = BLOCK_SIZE;
  l1_config.set_num = L1_SIZE / ASSOCIATIVITY / BLOCK_SIZE;
  l1_config.write_through = WRITE_THROUGH;
  l1_config.write_allocate = WRITE_ALLOCATE;
  l1_latency.hit_latency = L1_HIT_LAT;
  l1_latency.bus_latency = L1_BUS_LAT;
  l1->SetConfig(l1_config);
  l1->SetLatency(l1_latency);
  l1->SetStats(stats);

  CacheConfig l2_config;
  StorageLatency l2_latency;
  l2_config.size = L2_SIZE;
  l2_config.associativity = ASSOCIATIVITY;
  l2_config.block_size = BLOCK_SIZE;
  l2_config.set_num = L2_SIZE / ASSOCIATIVITY / BLOCK_SIZE;
  l2_config.write_through = WRITE_THROUGH;
  l2_config.write_allocate = WRITE_ALLOCATE;
  l2_latency.hit_latency = L2_HIT_LAT;
  l2_latency.bus_latency = L2_BUS_LAT;
  l2->SetConfig(l2_config);
  l2->SetLatency(l2_latency);
  l2->SetStats(stats);

  CacheConfig llc_config;
  StorageLatency llc_latency;
  llc_config.size = LLC_SIZE;
  llc_config.associativity = ASSOCIATIVITY;
  llc_config.block_size = BLOCK_SIZE;
  llc_config.set_num = LLC_SIZE / ASSOCIATIVITY / BLOCK_SIZE;
  llc_config.write_through = WRITE_THROUGH;
  llc_config.write_allocate = WRITE_ALLOCATE;
  llc_latency.hit_latency = LLC_HIT_LAT;
  llc_latency.bus_latency = LLC_BUS_LAT;
  llc->SetConfig(llc_config);
  llc->SetLatency(llc_latency);
  llc->SetStats(stats);

  StorageLatency vm_latency;
  vm_latency.hit_latency = MEM_HIT_LAT;
  vm_latency.bus_latency = 0;
  vm->SetLatency(vm_latency);

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

uint64_t Memory::read(uint64_t addr, unsigned int size, int &hit, int &time) {
  char buf[BLOCK_SIZE];
  vm->HandleRequest(addr, (int) size, 1, buf, hit, time);
  int offset = addr & (BLOCK_SIZE - 1);
  uint64_t val = 0;
  for (int i = 0; i < size; i++) {
    uint64_t x = (unsigned char) buf[offset + i];
    val |= x << (i * 8);
  }
  return val;
}

void Memory::write(uint64_t addr, unsigned int size, uint64_t data, int &hit, int &time) {
  char buf[BLOCK_SIZE];
  int offset = addr & (BLOCK_SIZE - 1);
  for (int i = 0; i < size; i++) {
    auto x = (uint8_t) data;
    buf[offset + i] = (char) x;
    data >>= 8;
  }
  vm->HandleRequest(addr, (int) size, 0, buf, hit, time);
}
