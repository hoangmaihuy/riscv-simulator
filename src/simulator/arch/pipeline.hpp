//
// Created by Mai Hoàng on 22/10/2021.
//

#ifndef RISCV_SIMULATOR_PIPELINE_HPP
#define RISCV_SIMULATOR_PIPELINE_HPP

#include "global.hpp"
#include "base.hpp"
#include "riscv/riscv.hpp"

struct FReg {
  bool stalled;
  bool bubbled;
  uint64_t predPC;
};

struct DReg {
  bool stalled;
  bool bubbled;
  RVInstOp op;
  RVInstType type;
  uint32_t srcA, srcB;
  int64_t valC;
  uint64_t valP;
  uint32_t dstE;
};

struct EReg {
  bool stalled;
  bool bubbled;
  RVInstOp op;
  RVInstType type;
  int64_t valA, valB, valC, valP;
  uint32_t dstE, dstM;
};

struct MReg {
  bool stalled;
  bool bubbled;
  RVInstOp op;
  RVInstType type;
  int64_t valB, valE, valP;
  uint32_t dstE, dstM;
  bool cond;
};

struct WReg {
  bool stalled;
  bool bubbled;
  RVInstOp op;
  RVInstType type;
  int64_t valP, valM, valE;
  uint32_t dstE, dstM;
};

class PipelineArch : public BaseArch {
protected:
  unsigned int data_hazard_cnt = 0;
  unsigned int control_hazard_cnt = 0;

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
