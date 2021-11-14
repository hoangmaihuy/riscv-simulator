//
// Created by Mai Hoàng on 14/11/2021.
//

#ifndef RISCV_SIMULATOR_MEMORY_HPP
#define RISCV_SIMULATOR_MEMORY_HPP

#include "cache/cache.hpp"
#include "vm.hpp"
#include "vm.hpp"

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
