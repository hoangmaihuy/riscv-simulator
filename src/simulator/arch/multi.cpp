//
// Created by Mai Hoàng on 21/10/2021.
//

#include "simulator/simulator.hpp"
#include "multi.hpp"

MultiCycleArch::MultiCycleArch(Simulator *sim) : SingleCycleArch(sim) {}

void MultiCycleArch::inc_cycle() {
  switch (inst->op) {
    case OP_MUL:
    case OP_MULH:
      cycle_cnt += MUL_CYCLE_CNT;
      break;
    case OP_DIV:
    case OP_DIVW:
      cycle_cnt += DIV_CYCLE_CNT;
      break;
    case OP_REM:
      if (last_inst && last_inst->op == OP_DIV && last_inst->rs1 == inst->rs1 && last_inst->rs2 == inst->rs2 &&
          last_inst->rd != last_inst->rs1 && last_inst->rd != last_inst->rs2) {
        break;
      } else {
        cycle_cnt += REM_CYCLE_CNT;
      }
      break;
    case OP_REMW:
      if (last_inst && last_inst->op == OP_DIVW && last_inst->rs1 == inst->rs1 && last_inst->rs2 == inst->rs2 &&
          last_inst->rd != last_inst->rs1 && last_inst->rd != last_inst->rs2) {
        break;
      } else {
        cycle_cnt += REM_CYCLE_CNT;
      }
      break;
    default:
      cycle_cnt += 1;
      break;
  }
}
