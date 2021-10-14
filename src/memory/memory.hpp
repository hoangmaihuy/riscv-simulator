//
// Created by Mai Hoàng on 14/10/2021.
//

#ifndef RISCV_SIMULATOR_MEMORY_HPP
#define RISCV_SIMULATOR_MEMORY_HPP

#include "global.hpp"

class MemoryArea
{
public:
  uint64_t start;
  uint64_t size;
  uint8_t flags;
  char *data;

  MemoryArea(uint64_t start, uint64_t size, uint8_t flags, const char *data);

  bool operator<(MemoryArea const &that) const;
};

class Memory
{
private:
  set<MemoryArea> areas;

public:
  void insertArea(uint64_t start, uint64_t size, uint8_t flags, const char *data);
};

#endif //RISCV_SIMULATOR_MEMORY_HPP
