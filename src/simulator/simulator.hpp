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
  char* elfPath;
  ELFIO::elfio elfReader;
  CPU *cpu;
  VirtualMemory *memory;

  RVInstruction *inst;

public:
  Simulator(char *elfPath);
  void read_elf();
  void load_memory();
  void init_cpu();

  /* Sequential execution */
  void s_fetch();
  void s_decode();
  void s_execute();
  void s_memory();
  void s_writeback();
  void s_pcupdate();
};


#endif //RISCV_SIMULATOR_SIMULATOR_HPP
