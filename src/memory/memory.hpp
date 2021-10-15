//
// Created by Mai Hoàng on 14/10/2021.
//

#ifndef RISCV_SIMULATOR_MEMORY_HPP
#define RISCV_SIMULATOR_MEMORY_HPP

#include "global.hpp"

class VirtualMemoryArea
{
public:
  uint64_t start;
  uint64_t size;
  uint8_t flags;
  char *data;

  VirtualMemoryArea(uint64_t start, uint64_t size, uint8_t flags, const char *data);

  VirtualMemoryArea(uint64_t start, uint64_t size);

  bool operator<(VirtualMemoryArea const &that) const;
};

class VirtualMemory
{
private:
  set<VirtualMemoryArea> areas;

public:
  void insert_vma(uint64_t start, uint64_t size, uint8_t flags, const char *data);

  VirtualMemoryArea find_vma(uint64_t addr, uint64_t size);

  /* Read 4 bytes */
  uint32_t read(uint64_t addr, bool executable);
  uint64_t readw(uint64_t addr);

};

#endif //RISCV_SIMULATOR_MEMORY_HPP
