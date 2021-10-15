//
// Created by Mai Hoàng on 14/10/2021.
//

#ifndef RISCV_SIMULATOR_CPU_HPP
#define RISCV_SIMULATOR_CPU_HPP

#include "global.hpp"
#include <cstdint>
#include <cassert>

#define REGNUM 32

class CPU
{
public:
  uint64_t registers[REGNUM]{};
  uint64_t pc;

  CPU();

  uint64_t read(unsigned int idx);

  void write(unsigned int idx, uint64_t value);

};


#endif //RISCV_SIMULATOR_CPU_HPP
