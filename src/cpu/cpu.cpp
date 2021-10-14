//
// Created by Mai Hoàng on 14/10/2021.
//

#include "cpu.hpp"

CPU::CPU()
{
  for (uint64_t &reg: registers)
    reg = 0;
}

uint64_t CPU::read(unsigned int idx)
{
  assert(idx < REGNUM);
  return registers[idx];
}

void CPU::write(unsigned int idx, uint64_t value)
{
  assert(idx < REGNUM);
  registers[idx] = value;
}
