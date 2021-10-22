//
// Created by Mai Hoàng on 21/10/2021.
//

#ifndef RISCV_SIMULATOR_BASE_HPP
#define RISCV_SIMULATOR_BASE_HPP

#include <stdio.h>

class Simulator;

class BaseArch {
protected:
  Simulator *sim;

  /* Statistics */
  unsigned int inst_cnt;
  unsigned int cycle_cnt;

public:
  explicit BaseArch(Simulator *sim);

  virtual void run_cycle() = 0;
  virtual void print_stats();
};

#endif //RISCV_SIMULATOR_BASE_HPP
