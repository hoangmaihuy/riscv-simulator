//
// Created by Mai Hoàng on 22/10/2021.
//

#include "pipeline.hpp"
#include "simulator/simulator.hpp"

PipelineArch::PipelineArch(Simulator *sim) : BaseArch(sim) {
  memset(&stats, 0, sizeof(stats));

  memset(&curF, 0, sizeof(curF));
  memset(&nextF, 0, sizeof(nextF));
  memset(&curD, 0, sizeof(curD));
  memset(&nextD, 0, sizeof(nextD));
  memset(&curE, 0, sizeof(curE));
  memset(&nextE, 0, sizeof(nextE));
  memset(&curM, 0, sizeof(curM));
  memset(&nextM, 0, sizeof(nextM));

  curF.bubbled = true;
  curD.bubbled = true;
  curE.bubbled = true;
  curM.bubbled = true;
}

void PipelineArch::fetch() {

  uint64_t valP = sim->cpu->get_pc();

  int hit, time;
  auto instRaw = (uint32_t) sim->memory->read(valP, INST_SIZE, hit, time);
  cycle_cost += time;
  auto inst = new RVInstruction(instRaw, valP);

  nextF.bubbled = false;
  nextF.stalled = 0;
  nextF.inst = inst;
  nextF.valP = valP;

  if (!curF.stalled)
    sim->cpu->set_pc(valP + INST_SIZE);

  if (verbose) {
    fprintf(stderr, "\nfetch\t: %.08llx:  %.08x    %s\n", inst->addr, inst->inst, inst->to_str().c_str());
  }
}

void PipelineArch::decode() {

  if (curF.stalled) {
    if (verbose) {
      fprintf(stderr, "decode\t: stalled\n");
    }
    return;
  }

  if (curF.bubbled) {
    nextD.bubbled = true;
    if (verbose) {
      fprintf(stderr, "decode\t: bubbled\n");
    }
    return;
  }

  // curF -> nextD
  auto inst = curF.inst;
  if (verbose) {
    fprintf(stderr, "decode\t: %.08llx:  %.08x    %s\n", inst->addr, inst->inst, inst->to_str().c_str());
  }
  // branch predict
  if (inst->is_branch()) {
    // branch not taken
    this->predPC = curF.valP + INST_SIZE;
    this->alterPC = curF.valP + inst->imm;
  }

  int64_t valA = 0, valB = 0, valC = 0;
  uint32_t srcA = inst->rs1;
  uint32_t srcB = inst->rs2;
  uint32_t dstE = NO_REG;
  uint32_t dstM = NO_REG;

  switch (inst->type) {
    case TYPE_R:
      valA = sim->cpu->get_reg(srcA);
      valB = sim->cpu->get_reg(srcB);
      dstE = inst->rd;
      break;
    case TYPE_I:
      if (inst->op != OP_ECALL) {
        valA = sim->cpu->get_reg(srcA);
        valB = 0;
        srcB = NO_REG;
        valC = inst->imm;
        if (inst->is_load()) {
          dstM = inst->rd;
        } else {
          dstE = inst->rd;
        }
      } else {
        valA = sim->cpu->get_reg(reg("a0"));
        srcA = reg("a0");
        valB = sim->cpu->get_reg(reg("a7"));
        srcB = reg("a7");
        valC = 0;
        // read syscall
        if (valB >= 10 && valB < 20) {
          dstE = reg("a0");
        }
      }
      break;
    case TYPE_S:
      valA = sim->cpu->get_reg(srcA);
      valB = sim->cpu->get_reg(srcB);
      valC = inst->imm;
      break;
    case TYPE_SB:
      valA = sim->cpu->get_reg(srcA);
      valB = sim->cpu->get_reg(srcB);
      valC = inst->imm;
      break;
    case TYPE_U:
      valA = valB = 0;
      srcA = srcB = NO_REG;
      valC = inst->imm;
      dstE = inst->rd;
      break;
    case TYPE_UJ:
      valA = 0;
      valB = 0;
      srcA = srcB = NO_REG;
      valC = inst->imm;
      dstE = inst->rd;
      break;
  }

  if (srcA == reg("zero"))
    valA = 0;
  if (srcB == reg("zero"))
    valB = 0;

  nextD.stalled = 0;
  nextD.bubbled = false;
  nextD.srcA = srcA;
  nextD.srcB = srcB;
  nextD.valA = valA;
  nextD.valB = valB;
  nextD.valC = valC;
  nextD.valP = curF.valP;
  nextD.inst = inst;
  nextD.dstE = dstE;
  nextD.dstM = dstM;
}

void PipelineArch::execute() {

  cycle_cost = 1;

  if (curD.stalled) {
    nextE.bubbled = true;
    if (verbose) {
      fprintf(stderr, "execute\t: stalled\n");
    }
    return;
  }

  if (curD.bubbled) {
    nextE.bubbled = true;
    if (verbose) {
      fprintf(stderr, "execute\t: bubbled\n");
    }
    return;
  }

  stats.inst_cnt += 1;

  auto inst = curD.inst;
  auto last_inst = curE.inst;
  int64_t valA = curD.valA;
  int64_t valB = curD.valB;
  int64_t valC = curD.valC;
  int64_t valP = curD.valP;
  int64_t valE;
  bool cond = false;
  uint32_t dstE = curD.dstE;
  uint32_t dstM = curD.dstM;

  if (curD.srcA == reg("zero"))
    valA = 0;
  if (curD.srcB == reg("zero"))
    valB = 0;

  switch (inst->op) {
    /* R-Type instruction */
    case OP_ADD:
      valE = valA + valB;
      break;
    case OP_MUL:
      valE = valA * valB;
      cycle_cost = MUL_CYCLE_CNT;
      break;
    case OP_SUB:
      valE = valA - valB;
      break;
    case OP_SLL:
      valE = valA << valB;
      break;
    case OP_MULH:
      valE = ((__int128_t) valA * valB) >> 64;
      cycle_cost = MUL_CYCLE_CNT;
      break;
    case OP_SLT:
      valE = (valA < valB) ? 1 : 0;
      break;
    case OP_XOR:
      valE = valA ^ valB;
      break;
    case OP_DIV:
      valE = valA / valB;
      cycle_cost = DIV_CYCLE_CNT;
      nextF.stalled = DIV_CYCLE_CNT - 1;
      nextD.stalled = DIV_CYCLE_CNT - 1;
      nextE.stalled = DIV_CYCLE_CNT - 2;
      break;
    case OP_SRL:
      valE = (int64_t) ((uint64_t) valA >> valB);
      break;
    case OP_SRA:
      valE = valA >> valB;
      break;
    case OP_OR:
      valE = valA | valB;
      break;
    case OP_REM:
      valE = valA % valB;
      if (last_inst && last_inst->op == OP_DIV && last_inst->rs1 == inst->rs1 && last_inst->rs2 == inst->rs2) {
        cycle_cost = 0;
      } else {
        cycle_cost = REM_CYCLE_CNT;
        nextF.stalled = REM_CYCLE_CNT - 1;
        nextD.stalled = REM_CYCLE_CNT - 1;
        nextE.stalled = REM_CYCLE_CNT - 1;
      }
      break;
    case OP_AND:
      valE = valA & valB;
      break;
    case OP_ADDW:
      valE = (int32_t) ((int32_t) valA + (int32_t) valB);
      break;
    case OP_SUBW:
      valE = (int32_t) ((int32_t) valA - (int32_t) valB);
      break;
    case OP_MULW:
      valE = (int32_t) ((int32_t) valA * (int32_t) valB);
      break;
    case OP_DIVW:
      valE = (int32_t) ((int32_t) valA / (int32_t) valB);
      cycle_cost = DIV_CYCLE_CNT;
      nextF.stalled = DIV_CYCLE_CNT - 1;
      nextD.stalled = DIV_CYCLE_CNT - 1;
      nextE.stalled = DIV_CYCLE_CNT - 1;
      break;
    case OP_REMW:
      valE = (int32_t) ((int32_t) valA % (int32_t) valB);
      if (last_inst && last_inst->op == OP_DIVW && last_inst->rs1 == inst->rs1 && last_inst->rs2 == inst->rs2) {
        cycle_cost = 0;
      } else {
        cycle_cost = REM_CYCLE_CNT;
        nextF.stalled = REM_CYCLE_CNT - 1;
        nextD.stalled = REM_CYCLE_CNT - 1;
        nextE.stalled = REM_CYCLE_CNT - 1;
      }
      break;
    case OP_SLLW:
      valE = (int32_t) ((int32_t) valA << (uint32_t) valB);
      break;
    case OP_SRLW:
      valE = (int32_t) ((uint32_t) valA >> (uint32_t) valB);
      break;
    case OP_SRAW:
      valE = (int32_t) ((int32_t) valA >> (uint32_t) valB);
      break;
      /* I-Type instructions */
    case OP_LB:
    case OP_LH:
    case OP_LW:
    case OP_LD:
    case OP_LBU:
    case OP_LHU:
    case OP_LWU:
      valE = valA + valC; // reg[rs1] + offset
      break;
    case OP_ADDI:
      valE = valA + valC;
      break;
    case OP_SLLI:
      valE = valA << (valC & 0x3f);
      break;
    case OP_SRLI:
      valE = (uint64_t) valA >> (valC & 0x3f);
      break;
    case OP_SRAI:
      valE = (int64_t) valA >> (valC & 0x3f);
      break;
    case OP_SLLIW:
      valE = (int32_t) valA << (valC & 0x1f);
      break;
    case OP_SLTI:
      valE = (valA < valC) ? 1 : 0;
      break;
    case OP_XORI:
      valE = valA ^ valC;
      break;
    case OP_SRLIW:
      valE = (uint32_t) valA >> (valC & 0x1f);
      break;
    case OP_SRAIW:
      valE = (int32_t) valA >> (valC & 0x1f);
      break;
    case OP_ORI:
      valE = valA | valC;
      break;
    case OP_ANDI:
      valE = valA & valC;
      break;
    case OP_ADDIW:
      valE = ((int32_t) valA + (int32_t) valC);
      break;
    case OP_JALR:
      valE = valA + valC;
      break;
    case OP_ECALL:
      valE = sim->syscall(valB, valA);
      if (valB >= 10 && valB < 20) {
        dstE = reg("a0");
      }
      break;
      /* S-Type instructions */
    case OP_SB:
    case OP_SH:
    case OP_SW:
    case OP_SD:
      valE = valA + valC;
      break;
      /* SB-Type instructions */
    case OP_BEQ:
      cond = valA == valB;
      valE = valP + valC;
      break;
    case OP_BNE:
      cond = valA != valB;
      valE = valP + valC;
      break;
    case OP_BLT:
      cond = valA < valB;
      valE = valP + valC;
      break;
    case OP_BGE:
      cond = valA >= valB;
      valE = valP + valC;
      break;
    case OP_BLTU:
      cond = (uint64_t) valA < (uint64_t) valB;
      valE = valP + valC;
      break;
    case OP_BGEU:
      cond = (uint64_t) valA >= (uint64_t) valB;
      valE = valP + valC;
      break;
      /* U-Type instructions */
    case OP_AUIPC:
      valE = valP + valC;
      break;
    case OP_LUI:
      valE = valC;
      break;
      /* UJ-Type instructions */
    case OP_JAL:
      valE = valP + valC;
      break;
  }

  // mis-predicted branch
  if (inst->is_branch() && cond) {
    if (verbose) {
      fprintf(stderr, "execute: mis-predicted branch, alterPC = 0x%.08llx\n", alterPC);
    }
    sim->cpu->set_pc(alterPC);
    nextF.bubbled = true;
    nextD.bubbled = true;
    stats.ctrl_hazards++;
  }

  if (inst->is_jump()) {
    sim->cpu->set_pc(valE);
    nextF.bubbled = true;
    nextD.bubbled = true;
    stats.ctrl_hazards++;
  }

  if (inst->is_load()) {
    if (nextD.srcA == dstM || nextD.srcB == dstM) {
      nextF.stalled = 2;
      nextD.stalled = 2;
      nextE.bubbled = true;
      stats.mem_hazards++;
    }
  }

  // forward data
  if (!inst->is_load() && dstE != NO_REG) {
    if (nextD.srcA == dstE) {
      nextD.valA = valE;
      stats.data_hazards++;
      fwE = dstE;
      if (verbose)
        fprintf(stderr, "execute\t: forward %lld to %s\n", valE, get_regname(fwE));
    }
    if (nextD.srcB == dstE) {
      nextD.valB = valE;
      fwE = dstE;
      stats.data_hazards++;
      if (verbose)
        fprintf(stderr, "execute\t: forward %lld to %s\n", valE, get_regname(fwE));
    }
  }

  nextE.bubbled = false;
  nextE.stalled = 0;
  nextE.valP = valP;
  nextE.inst = inst;
  nextE.valA = valA;
  nextE.valB = valB;
  nextE.valE = valE;
  nextE.cond = cond;
  nextE.dstE = dstE;
  nextE.dstM = curD.dstM;

  if (verbose) {
    fprintf(stderr, "execute\t: %.08llx:  %.8x    %s, valA = %lld, valB = %lld, valC = %lld, valE = %lld\n", inst->addr,
            inst->inst, inst->to_str().c_str(),
            valA, valB, valC, valE);
  }
}

void PipelineArch::memory() {

  if (curE.stalled) {
    if (verbose) {
      fprintf(stderr, "memory\t: stalled\n");
    }
    return;
  }

  if (curE.bubbled) {
    nextM.bubbled = true;
    if (verbose) {
      fprintf(stderr, "memory\t: bubbled\n");
    }
    return;
  }

  int64_t valM;
  int64_t valE = curE.valE;
  int64_t valB = curE.valB;
  uint32_t dstE = curE.dstE;
  uint32_t dstM = curE.dstM;
  auto inst = curE.inst;

  if (verbose) {
    fprintf(stderr, "memory\t: %.08llx:  %.8x    %s\tvalE = %lld\n", inst->addr, inst->inst, inst->to_str().c_str(),
            valE);
  }

  int hit = 0, time = 0;

  switch (inst->op) {
    case OP_LB:
      valM = (int64_t) (int8_t) (uint8_t) sim->memory->read(valE, 1, hit, time);
      break;
    case OP_LH:
      valM = (int64_t) (int16_t) (uint16_t) sim->memory->read(valE, 2, hit, time);
      break;
    case OP_LW:
      valM = (int64_t) (int32_t) (uint32_t) sim->memory->read(valE, 4, hit, time);
      break;
    case OP_LD:
      valM = (int64_t) sim->memory->read(valE, 8, hit, time);
      break;
    case OP_LBU:
      valM = (uint64_t) (uint8_t) sim->memory->read(valE, 1, hit, time);
      break;
    case OP_LHU:
      valM = (uint64_t) (uint16_t) sim->memory->read(valE, 2, hit, time);
      break;
    case OP_LWU:
      valM = (uint64_t) (uint32_t) sim->memory->read(valE, 4, hit, time);
      break;
    case OP_SB:
      sim->memory->write(valE, 1, valB, hit, time);
      valM = 0;
      break;
    case OP_SH:
      sim->memory->write(valE, 2, valB, hit, time);
      valM = 0;
      break;
    case OP_SW:
      sim->memory->write(valE, 4, valB, hit, time);
      valM = 0;
      break;
    case OP_SD:
      sim->memory->write(valE, 8, valB, hit, time);
      valM = 0;
      break;
    default:
      valM = 0;
  }
  cycle_cost += time;

  // forward data
  if (dstE != NO_REG) {
    if (nextD.srcA == dstE && fwE != dstE) {
      nextD.valA = valE;
      fwM1 = dstE;
      stats.data_hazards++;
      if (verbose)
        fprintf(stderr, "memory\t: forward %lld to %s\n", valE, get_regname(dstE));
    }
    if (nextD.srcB == dstE && fwE != dstE) {
      nextD.valB = valE;
      fwM1 = dstE;
      stats.data_hazards++;
      if (verbose)
        fprintf(stderr, "memory\t: forward %lld to %s\n", valE, get_regname(dstE));
    }
    if (curD.stalled) {
      if (curD.srcA == dstE) {
        curD.valA = valE;
        stats.data_hazards++;
      }
      if (curD.srcB == dstE) {
        curD.valB = valE;
        stats.data_hazards++;
      }
      fwM1 = dstE;
    }
  }

  // forward data
  if (dstM != NO_REG) {
    if (nextD.srcA == dstM && fwE != dstM) {
      nextD.valA = valM;
      fwM2 = dstM;
      stats.data_hazards++;
      if (verbose) {
        fprintf(stderr, "memory\t: forward %lld to %s\n", valM, get_regname(dstM));
      }
    }
    if (nextD.srcB == dstM && fwE != dstM) {
      nextD.valB = valM;
      fwM2 = dstM;
      stats.data_hazards++;
      if (verbose) {
        fprintf(stderr, "memory\t: forward %lld to %s\n", valM, get_regname(dstM));
      }
    }
    if (curD.stalled) {
      if (curD.srcA == dstM) {
        curD.valA = valM;
        fwM2 = dstM;
        stats.data_hazards++;
      }
      if (curD.srcB == dstM) {
        curD.valB = valM;
        fwM2 = dstM;
        stats.data_hazards++;
      }
    }
  }

  nextM.bubbled = false;
  nextM.stalled = 0;
  nextM.inst = inst;
  nextM.valM = valM;
  nextM.valP = curE.valP;
  nextM.valE = valE;
  nextM.dstE = dstE;
  nextM.dstM = dstM;
  nextM.cond = curE.cond;
}

void PipelineArch::writeback() {

  if (curM.stalled) {
    if (verbose)
      fprintf(stderr, "writeb\t: stalled\n");
    return;
  }

  if (curM.bubbled) {
    if (verbose)
      fprintf(stderr, "writeb\t: bubbled\n");
    return;
  }

  auto dstE = curM.dstE;
  auto dstM = curM.dstM;
  auto valE = curM.valE;
  auto valM = curM.valM;
  auto valP = curM.valP;
  auto inst = curM.inst;
  int64_t valW;

  switch (inst->type) {
    case TYPE_R:
    case TYPE_U:
      valW = valE;
      break;
    case TYPE_I:
      switch (inst->op) {
        case OP_JALR:
          valW = valP + INST_SIZE;
          break;
        case OP_ECALL:
          valW = valE;
          break;
        case OP_LB:
        case OP_LH:
        case OP_LW:
        case OP_LD:
        case OP_LBU:
        case OP_LHU:
        case OP_LWU:
          valW = valM;
          break;
        default:
          valW = valE;
      }
      break;
    case TYPE_UJ:
      valW = valP + INST_SIZE;
      break;
    default:
      break;
  }

  // forward data
  if (dstE != NO_REG) {
    if (nextD.srcA == dstE && fwE != dstE && fwM1 != dstE && fwM2 != dstE) {
      nextD.valA = valW;
      stats.data_hazards++;
    }
    if (nextD.srcB == dstE && fwE != dstE && fwM1 != dstE && fwM2 != dstE) {
      nextD.valB = valW;
      stats.data_hazards++;
    }
    sim->cpu->set_reg(dstE, valW);
  }

  if (dstM != NO_REG) {
    if (nextD.srcA == dstM && fwE != dstM && fwM1 != dstM && fwM2 != dstM) {
      nextD.valA = valW;
      stats.data_hazards++;
    }
    if (nextD.srcB == dstM && fwE != dstM && fwM1 != dstM && fwM2 != dstM) {
      nextD.valB = valW;
      stats.data_hazards++;
    }
    sim->cpu->set_reg(dstM, valW);
  }


  if (verbose) {
    fprintf(stderr, "writeb\t: %.08llx:  %.8x    %s\tdstE = %d, valE = %lld, dstM = %d, valM = %lld\n", inst->addr,
            inst->inst,
            inst->to_str().c_str(), dstE, valE, dstM, valM);
  }
}

void PipelineArch::run_cycle() {
  sim->cpu->set_reg(0, 0);

  fetch();
  decode();
  execute();
  memory();
  writeback();
  inc_cycle();
  if (verbose)
    sim->cpu->print();
}

void PipelineArch::inc_cycle() {

  if (curF.stalled) {
    curF.stalled--;
  } else {
    curF = nextF;
  }

  if (curD.stalled) {
    curD.stalled--;
  } else {
    curD = nextD;
  }

  curE = nextE;
  curM = nextM;

  memset(&nextF, 0, sizeof(nextF));
  memset(&nextD, 0, sizeof(nextD));
  memset(&nextE, 0, sizeof(nextE));
  memset(&nextM, 0, sizeof(nextM));

  fwE = fwM1 = fwM2 = NO_REG;

  stats.cycle_cnt += cycle_cost;
}

void PipelineArch::print_stats() {
//  if (!verbose) return;
  fprintf(stderr, "Statistics:\n");
  fprintf(stderr, "  Number of instructions : %d\n", stats.inst_cnt);
  fprintf(stderr, "  Number of cycles       : %d\n", stats.cycle_cnt);
  fprintf(stderr, "  CPI                    : %f\n", (double) stats.cycle_cnt / stats.inst_cnt);
  fprintf(stderr, "  Control hazards count  : %d\n", stats.ctrl_hazards);
  fprintf(stderr, "  Memory hazards count   : %d\n", stats.mem_hazards);
  fprintf(stderr, "  Data hazards count     : %d\n", stats.data_hazards);
}

