//
// Created by Mai Hoàng on 14/10/2021.
//

#ifndef RISCV_SIMULATOR_SIMULATOR_HPP
#define RISCV_SIMULATOR_SIMULATOR_HPP

#include "memory/memory.hpp"
#include "cpu/cpu.hpp"
#include "elfio/elfio.hpp"
#include "riscv/riscv.hpp"

#define STACK_ADDR (MAX_MEM >> 1)
#define STACK_SIZE (1 << 20)

class Simulator {
private:
  char *elfPath;
  int exit_code;
  map<string, uint64_t> symbols;
  set<uint64_t> breakpoints;

  ELFIO::elfio elfReader;
  CPU *cpu;
  VirtualMemory *memory;

  /* Fetch result */
  RVInstruction *inst;
  uint64_t valP; // next PC

  /* Decode result */
  uint64_t dstE;
  int64_t valA; // reg[rs1]
  int64_t valB; // reg[rs2]
  int64_t valC; // imm

  /* Execute result */
  int64_t valE;
  bool cc;

  /* Memory result */
  int64_t valM;

public:
  Simulator(char *elfPath);

  void read_elf();

  void load_memory();

  void init_cpu();

  void syscall();

private:
  /* Sequential execution */
  void fetch();

  void decode();

  void execute();

  void memaccess();

  void writeback();

  void pcupdate();

  void run_cycle();

  bool is_breakpoint(uint64_t addr);

  void handle_cmd(const string &cmd);

  uint64_t get_symbol(const string &sym);

public:
  void run(bool debug_mode);
};


#endif //RISCV_SIMULATOR_SIMULATOR_HPP
