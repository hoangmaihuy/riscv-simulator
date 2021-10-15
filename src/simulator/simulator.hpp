//
// Created by Mai Hoàng on 14/10/2021.
//

#ifndef RISCV_SIMULATOR_SIMULATOR_HPP
#define RISCV_SIMULATOR_SIMULATOR_HPP

#include "memory/memory.hpp"
#include "cpu/cpu.hpp"
#include "elfio/elfio.hpp"
#include "riscv/riscv.hpp"

class Simulator
{
private:
  char *elfPath;
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

private:
  /* Sequential execution */
  void fetch();

  void decode();

  void execute();

  void memaccess();

  void writeback();

  void pcupdate();

  void run_cycle();

public:
  void run_sequential(bool single_step_mode);
};


#endif //RISCV_SIMULATOR_SIMULATOR_HPP
