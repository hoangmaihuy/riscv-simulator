//
// Created by Mai Hoàng on 21/10/2021.
//

#ifndef RISCV_SIMULATOR_SINGLE_HPP
#define RISCV_SIMULATOR_SINGLE_HPP

#include "riscv/riscv.hpp"
#include "base.hpp"


class SingleCycleArch : public BaseArch {
private:
  /* Fetch result */
  RVInstruction *inst;
  uint64_t valP; // next PC

  /* Decode result */
  uint64_t dstE;
  uint64_t dstM;
  int64_t valA; // reg[rs1]
  int64_t valB; // reg[rs2]
  int64_t valC; // imm

  /* Execute result */
  int64_t valE;
  bool cc;

  /* Memory result */
  int64_t valM;

  void fetch();

  void decode();

  void execute();

  void memory();

  void writeback();

public:
  SingleCycleArch(Simulator *sim);

  virtual void run_cycle();
};

#endif //RISCV_SIMULATOR_SINGLE_HPP
