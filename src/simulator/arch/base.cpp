//
// Created by Mai Hoàng on 21/10/2021.
//

#include "base.hpp"
#include "global.hpp"

BaseArch::BaseArch(Simulator *sim) {
  this->sim = sim;
  inst_cnt = 0;
  cycle_cnt = 0;
}

void BaseArch::print_stats() {
  fprintf(stderr, "Statistics:\n");
  fprintf(stderr, "  Number of instructions : %d\n", inst_cnt);
  fprintf(stderr, "  Number of cycles       : %d\n", cycle_cnt);
  fprintf(stderr, "  CPI                    : %f\n", (double) cycle_cnt / inst_cnt);
}