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

  VirtualMemoryArea(uint64_t start, uint64_t size, uint8_t flags, const char *data, uint64_t data_size);

  VirtualMemoryArea(uint64_t start, uint64_t size);

  bool operator<(VirtualMemoryArea const &that) const;
};

class VirtualMemory
{
private:
  set<VirtualMemoryArea> areas;

public:
  void insert_vma(uint64_t start, uint64_t size, uint8_t flags, const char *data, uint64_t data_size);

  VirtualMemoryArea find_vma(uint64_t addr, uint64_t size);

  /* Read up to 8 bytes */
  uint64_t read(uint64_t addr, unsigned int size, bool executable = false);

  /* Write up to 8 bytes */
  void write(uint64_t addr, unsigned int size, uint64_t data);

};

#endif //RISCV_SIMULATOR_MEMORY_HPP
