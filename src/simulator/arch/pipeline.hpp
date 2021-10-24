//
// Created by Mai Hoàng on 22/10/2021.
//

#ifndef RISCV_SIMULATOR_PIPELINE_HPP
#define RISCV_SIMULATOR_PIPELINE_HPP

#include "global.hpp"
#include "base.hpp"
#include "riscv/riscv.hpp"

struct FReg {
  bool bubbled;
  int stalled;
  uint64_t valP;
  RVInstruction *inst;
};

struct DReg {
  bool bubbled;
  int stalled;
  RVInstruction *inst;
  uint32_t srcA, srcB, dst;
  int64_t valA, valB, valC;
  uint64_t valP;
};

struct EReg {
  bool bubbled;
  int stalled;
  RVInstruction *inst;
  int64_t valA, valB, valE, valP;
  uint32_t dst;
  bool cond;
};

struct MReg {
  bool bubbled;
  int stalled;
  RVInstruction *inst;
  int64_t valE, valP, valM;
  uint32_t dst;
  bool cond;
};

struct WReg {
  bool bubbled;
  int stalled;
  RVInstOp op;
  RVInstType type;
  int64_t valP, valM, valE;
  uint32_t dstE, dstM;
};

class PipelineArch : public BaseArch {
protected:
  unsigned int data_hazard_cnt = 0;
  unsigned int control_hazard_cnt = 0;

  uint64_t predPC, alterPC;

  uint32_t fwE, fwM; // forward destination register

  FReg curF, nextF;
  DReg curD, nextD;
  EReg curE, nextE;
  MReg curM, nextM;
  WReg curW, nextW;

  virtual void fetch();

  virtual void decode();

  virtual void execute();

  virtual void memory();

  virtual void writeback();

  void run_cycle() override;

  virtual void inc_cycle();

public:
  explicit PipelineArch(Simulator *sim);
};


#endif //RISCV_SIMULATOR_PIPELINE_HPP
