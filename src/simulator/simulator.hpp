//
// Created by Mai Hoàng on 14/10/2021.
//

#ifndef RISCV_SIMULATOR_SIMULATOR_HPP
#define RISCV_SIMULATOR_SIMULATOR_HPP

#include "memory/memory.hpp"
#include "cpu/cpu.hpp"
#include "elfio/elfio.hpp"
#include "riscv/riscv.hpp"
#include "simulator/arch/single.hpp"

#define STACK_ADDR (MAX_MEM >> 1)
#define STACK_SIZE (1 << 20)

class Simulator {
private:
  char *elfPath;
  int exit_code;
  map<string, uint64_t> symbols;
  set<uint64_t> breakpoints;

  ELFIO::elfio elfReader;

  BaseArch *arch;

public:

  CPU *cpu;
  VirtualMemory *memory;

  Simulator(char *elfPath);

  void read_elf();

  void load_memory();

  void init_cpu();

  void syscall();

private:

  bool is_breakpoint(uint64_t addr);

  void handle_cmd(const string &cmd);

  uint64_t get_symbol(const string &sym);

public:
  void run(bool debug_mode);
};


#endif //RISCV_SIMULATOR_SIMULATOR_HPP
