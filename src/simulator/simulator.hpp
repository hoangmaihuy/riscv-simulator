//
// Created by Mai Hoàng on 14/10/2021.
//

#ifndef RISCV_SIMULATOR_SIMULATOR_HPP
#define RISCV_SIMULATOR_SIMULATOR_HPP

#include "memory/memory.hpp"
#include "cpu/cpu.hpp"
#include "elfio/elfio.hpp"
#include "isa/riscv.hpp"

class Simulator
{
private:
  char* elfPath;
  ELFIO::elfio elfReader;
  CPU *cpu;
  Memory *memory;

public:
  Simulator(char *elfPath);
  void readElf();
  void loadMemory();
  void initCpu();

  void sFetch();
};


#endif //RISCV_SIMULATOR_SIMULATOR_HPP
