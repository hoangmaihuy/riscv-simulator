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
#include "simulator/arch/multi.hpp"
#include "simulator/arch/pipeline.hpp"

#define STACK_ADDR (MAX_MEM >> 1)
#define STACK_SIZE (1 << 20)

enum SimulatorMode {
  SIM_MODE_SINGLE,
  SIM_MODE_MULTI,
  SIM_MODE_PIPE
};

class Simulator {
private:
  char *elf_path;
  bool exited;
  int exit_code;
  map<string, uint64_t> symbols;
  set<uint64_t> breakpoints;

  ELFIO::elfio elfReader;

  BaseArch *arch;

public:

  CPU *cpu;
  VirtualMemory *memory;

  Simulator(char *elf_path, SimulatorMode sim_mode);

  void read_elf();

  void load_memory();

  void init_cpu();

  int64_t syscall(int64_t sysnum, int64_t argument);

private:

  bool is_breakpoint(uint64_t addr);

  void handle_cmd(const string &cmd);

  uint64_t get_symbol(const string &sym);

public:
  void run(bool debug_mode);
};


#endif //RISCV_SIMULATOR_SIMULATOR_HPP
