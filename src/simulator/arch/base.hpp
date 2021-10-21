//
// Created by Mai Hoàng on 21/10/2021.
//

#ifndef RISCV_SIMULATOR_BASE_HPP
#define RISCV_SIMULATOR_BASE_HPP

class Simulator;

class BaseArch {
public:
  Simulator *sim;
  explicit BaseArch(Simulator *sim);

  virtual void run_cycle() = 0;
};

#endif //RISCV_SIMULATOR_BASE_HPP
