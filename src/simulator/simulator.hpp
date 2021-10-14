//
// Created by Mai Hoàng on 14/10/2021.
//

#ifndef RISCV_SIMULATOR_SIMULATOR_HPP
#define RISCV_SIMULATOR_SIMULATOR_HPP

#include "memory/memory.hpp"
#include "cpu/cpu.hpp"
#include "elfio/elfio.hpp"

class Simulator
{
private:
  CPU *cpu;
  Memory *memory;

public:
  Simulator();
  void loadMemoryFromElf(char *elfPath);
};


#endif //RISCV_SIMULATOR_SIMULATOR_HPP
