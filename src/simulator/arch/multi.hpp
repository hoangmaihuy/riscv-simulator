//
// Created by Mai Hoàng on 21/10/2021.
//

#ifndef RISCV_SIMULATOR_MULTI_HPP
#define RISCV_SIMULATOR_MULTI_HPP

#include "base.hpp"

#define MUL_CYCLE_CNT 2
#define DIV_CYCLE_CNT 40
#define REM_CYCLE_CNT 40

class MultiCycleArch : public SingleCycleArch {
protected:
  virtual void inc_cycle();

public:
  MultiCycleArch(Simulator *sim);
};


#endif //RISCV_SIMULATOR_MULTI_HPP
