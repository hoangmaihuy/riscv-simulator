//
// Created by Mai Hoàng on 14/10/2021.
//

#ifndef RISCV_SIMULATOR_CPU_HPP
#define RISCV_SIMULATOR_CPU_HPP

#include "global.hpp"
#include <cstdint>
#include <cassert>

#define REGNUM 32

extern const char *regnames[REGNUM];

const char *get_regname(unsigned int reg);

unsigned int reg(const char* regname);

class CPU
{
private:
  uint64_t regs[REGNUM]{};

  uint64_t pc;

public:
  CPU();


  uint64_t get_pc() const;

  void set_pc(unsigned int value);

  uint64_t get_reg(unsigned int reg);

  void set_reg(unsigned int reg, uint64_t value);
};


#endif //RISCV_SIMULATOR_CPU_HPP
