//
// Created by Mai Hoàng on 14/10/2021.
//

#ifndef RISCV_SIMULATOR_VM_HPP
#define RISCV_SIMULATOR_VM_HPP

#include "global.hpp"
#include "cache/storage.hpp"

#define MAX_MEM (1LL << 56)

class VirtualMemoryArea {
public:
  uint64_t start;
  uint64_t size;
  uint8_t flags;
  char *data;

  VirtualMemoryArea(uint64_t start, uint64_t size, uint8_t flags, const char *data, uint64_t data_size);

  VirtualMemoryArea(uint64_t start, uint64_t size);

  bool operator<(VirtualMemoryArea const &that) const;
};

class VirtualMemory : public Storage {
private:
  set<VirtualMemoryArea> areas;

public:
  VirtualMemory() {}

  ~VirtualMemory() {}

  bool trace_mode = false;

  void insert_vma(uint64_t start, uint64_t size, uint8_t flags, const char *data, uint64_t data_size);

  VirtualMemoryArea find_vma(uint64_t addr, uint64_t size);

  // Main access process
  void HandleRequest(uint64_t addr, int bytes, int read,
                     char *content, int &hit, int &time);

  /* Read up to 8 bytes */
  uint64_t read(uint64_t addr, unsigned int size, bool executable = false);
  void read_buf(uint64_t addr, uint64_t size, char *data);

  /* Write up to 8 bytes */
  void write(uint64_t addr, unsigned int size, uint64_t data);
  void write_buf(uint64_t addr, unsigned int size, char *data);

  DISALLOW_COPY_AND_ASSIGN(VirtualMemory);
};

#endif //RISCV_SIMULATOR_VM_HPP
