//
// Created by Mai Hoàng on 14/10/2021.
//

#include "cpu.hpp"

const char *regnames[REGNUM] = {
    "zero", "ra", "sp", "gp", "tp", "t0", "t1", "t2", "s0", "s1",
    "a0", "a1", "a2", "a3", "a4", "a5", "a6", "a7", "s2", "s3",
    "s4", "s5", "s6", "s7", "s8", "s9", "s10", "s11", "t3", "t4",
    "t5", "t6"
};

CPU::CPU() {
  for (uint64_t &reg: regs)
    reg = 0;
  pc = 0;
}

uint64_t CPU::get_pc() const {
  return pc;
}

void CPU::set_pc(unsigned int value) {
  pc = value;
}

uint64_t CPU::get_reg(unsigned int reg) {
  assert(reg < REGNUM);
  return regs[reg];
}

void CPU::set_reg(unsigned int reg, uint64_t value) {
  assert(reg < REGNUM);
  regs[reg] = value;
}

const char *get_regname(unsigned int reg) {
  assert(reg < REGNUM);
  return regnames[reg];
}

unsigned int reg(const char *regname) {
  for (unsigned int i = 0; i < REGNUM; i++) {
    if (strcmp(regname, regnames[i]) == 0) {
      return i;
    }
  }
  fprintf(stderr, "Unknown register: %s\n", regname);
  exit(1);
}
