//
// Created by Mai Hoàng on 14/11/2021.
//

#ifndef RISCV_SIMULATOR_MEMORY_HPP
#define RISCV_SIMULATOR_MEMORY_HPP

#include "cache/cache.hpp"
#include "vm.hpp"
#include "vm.hpp"

#define L1_SIZE (32 * (1 << 10))
#define L1_HIT_LAT 1
#define L1_BUS_LAT 0
#define L2_SIZE (256 * (1 << 10))
#define L2_HIT_LAT 8
#define L2_BUS_LAT 6
#define LLC_SIZE (8 * (1 << 20))
#define LLC_HIT_LAT 20
#define LLC_BUS_LAT 20
#define MEM_HIT_LAT 100
#define WRITE_THROUGH true
#define WRITE_ALLOCATE false
#define BLOCK_SIZE 64
#define ASSOCIATIVITY 8

class Memory {
public:
  Cache *l1;
  Cache *l2;
  Cache *llc;
  VirtualMemory *vm;

  Memory();
  ~Memory();

  uint64_t read(uint64_t addr, unsigned int size, bool executable = false);
  void write(uint64_t addr, unsigned int size, uint64_t data);
};


#endif //RISCV_SIMULATOR_MEMORY_HPP
