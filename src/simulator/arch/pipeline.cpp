//
// Created by Mai Hoàng on 22/10/2021.
//

#include "pipeline.hpp"
#include "simulator/simulator.hpp"

PipelineArch::PipelineArch(Simulator *sim) : BaseArch(sim) {
  memset(&curF, 0, sizeof(curF));
  memset(&nextF, 0, sizeof(nextF));
  memset(&curD, 0, sizeof(curD));
  memset(&nextD, 0, sizeof(nextD));
  memset(&curE, 0, sizeof(curE));
  memset(&nextE, 0, sizeof(nextE));
  memset(&curM, 0, sizeof(curM));
  memset(&nextM, 0, sizeof(nextM));
  memset(&curW, 0, sizeof(curW));
  memset(&nextW, 0, sizeof(nextW));

  curF.bubbled = true;
  curD.bubbled = true;
  curE.bubbled = true;
  curM.bubbled = true;
  curW.bubbled = true;
}

void PipelineArch::fetch() {

  uint64_t valP = sim->cpu->get_pc();

  auto instRaw = (uint32_t) sim->memory->read(valP, INST_SIZE, true);
  auto inst = new RVInstruction(instRaw, valP);

  nextF.bubbled = false;
  nextF.stalled = 0;
  nextF.inst = inst;
  nextF.valP = valP;

  if (!curF.stalled)
    sim->cpu->set_pc(valP + INST_SIZE);

  if (verbose) {
    fprintf(stderr, "\nfetch: %.08llx:  %x    %s\n", inst->addr, inst->inst, inst->to_str().c_str());
  }
}

void PipelineArch::decode() {

  if (curF.stalled) {
    return;
  }

  if (curF.bubbled) {
    nextD.bubbled = true;
    return;
  }

  // curF -> nextD
  auto inst = curF.inst;
  // branch predict
  if (inst->type == TYPE_SB) {
    // branch not taken
    this->predPC = curF.valP + INST_SIZE;
    this->alterPC = curF.valP + inst->imm;
    nextF.bubbled = true;
  }

  int64_t valA = 0, valB = 0, valC = 0;
  uint32_t srcA = inst->rs1;
  uint32_t srcB = inst->rs2;
  uint32_t dst = NO_REG;

  switch (inst->type) {
    case TYPE_R:
      valA = sim->cpu->get_reg(srcA);
      valB = sim->cpu->get_reg(srcB);
      dst = inst->rd;
      break;
    case TYPE_I:
      if (inst->op != OP_ECALL) {
        valA = sim->cpu->get_reg(curD.srcA);
        valB = 0;
        valC = inst->imm;
        dst = inst->rd;
      } else {
        valA = sim->cpu->get_reg(reg("a0"));
        srcA = reg("a0");
        valB = sim->cpu->get_reg(reg("a7"));
        srcB = reg("a7");
        valC = 0;
        // read syscall
        if (valB >= 10 && valB < 20) {
          dst = reg("a0");
        } else {
          dst = NO_REG;
        }
      }
      break;
    case TYPE_S:
      valA = sim->cpu->get_reg(srcA);
      valB = sim->cpu->get_reg(srcB);
      valC = inst->imm;
      dst = NO_REG;
      break;
    case TYPE_SB:
      valA = sim->cpu->get_reg(srcA);
      valB = sim->cpu->get_reg(srcB);
      valC = inst->imm;
      dst = NO_REG;
      break;
    case TYPE_U:
      valA = valB = 0;
      valC = inst->imm;
      dst = inst->rd;
      break;
    case TYPE_UJ:
      valA = valB = 0;
      valC = inst->imm;
      dst = inst->rd;
      break;
  }

  nextD.stalled = 0;
  nextD.bubbled = false;
  nextD.srcA = srcA;
  nextD.srcB = srcB;
  nextD.valA = valA;
  nextD.valB = valB;
  nextD.valC = valC;
  nextD.valP = curF.valP;
  nextD.inst = inst;
  nextD.dst = dst;
}

void PipelineArch::execute() {

  if (curD.stalled) {
    nextE.bubbled = true;
    return;
  }

  if (curD.bubbled) {
    nextE.bubbled = true;
    return;
  }

  inst_cnt += 1;

  auto inst = curD.inst;
  int64_t valA = curD.valA;
  int64_t valB = curD.valB;
  int64_t valC = curD.valC;
  int64_t valP = curD.valP;
  int64_t valE;
  bool cond = false;
  uint32_t dst = curD.dst;

  switch (inst->op) {
    /* R-Type instruction */
    case OP_ADD:
      valE = valA + valB;
      break;
    case OP_MUL:
      valE = valA * valB;
      break;
    case OP_SUB:
      valE = valA - valB;
      break;
    case OP_SLL:
      valE = valA << valB;
      break;
    case OP_MULH:
      valE = ((__int128_t) valA * valB) >> 64;
      break;
    case OP_SLT:
      valE = (valA < valB) ? 1 : 0;
      break;
    case OP_XOR:
      valE = valA ^ valB;
      break;
    case OP_DIV:
      valE = valA / valB;
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
      break;
    case OP_REMW:
      valE = (int32_t) ((int32_t) valA % (int32_t) valB);
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
    sim->cpu->set_pc(alterPC);
    nextF.bubbled = true;
    nextD.bubbled = true;
  }

  if (inst->is_jump()) {
    sim->cpu->set_pc(valE);
    nextF.bubbled = true;
    nextD.bubbled = true;
  }

  if (inst->is_load()) {
    if (nextD.srcA == curD.dst || nextD.srcB == curD.dst) {
      nextF.stalled = 2;
      nextD.stalled = 2;
      nextE.bubbled = true;
    }
  }

  // forward data
  if (!inst->is_load() && dst != NO_REG) {
    if (nextD.srcA == dst) {
      nextD.valA = valE;
      fwE = dst;
    }
    if (nextD.srcB == dst) {
      nextD.valB = valE;
      fwE = dst;
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
}

void PipelineArch::memory() {

  if (curE.stalled) {
    return;
  }

  if (curE.bubbled) {
    nextM.bubbled = true;
    return;
  }

  int64_t valM;
  int64_t valE = curE.valE;
  int64_t valB = curE.valB;
  uint32_t dst = curE.dst;
  auto inst = curE.inst;

  switch (inst->op) {
    case OP_LB:
      valM = (int64_t) (int8_t) (uint8_t) sim->memory->read(valE, 1);
      break;
    case OP_LH:
      valM = (int64_t) (int16_t) (uint16_t) sim->memory->read(valE, 2);
      break;
    case OP_LW:
      valM = (int64_t) (int32_t) (uint32_t) sim->memory->read(valE, 4);
      break;
    case OP_LD:
      valM = (int64_t) sim->memory->read(valE, 8);
      break;
    case OP_LBU:
      valM = (uint64_t) (uint8_t) sim->memory->read(valE, 1);
      break;
    case OP_LHU:
      valM = (uint64_t) (uint16_t) sim->memory->read(valE, 2);
      break;
    case OP_LWU:
      valM = (uint64_t) (uint32_t) sim->memory->read(valE, 4);
      break;
    case OP_SB:
      sim->memory->write(valE, 1, valB);
      valM = 0;
      break;
    case OP_SH:
      sim->memory->write(valE, 2, valB);
      valM = 0;
      break;
    case OP_SW:
      sim->memory->write(valE, 4, valB);
      valM = 0;
      break;
    case OP_SD:
      sim->memory->write(valE, 8, valB);
      valM = 0;
      break;
    default:
      valM = 0;
  }

  // forward data
  if (dst != NO_REG && inst->is_load()) {
    if (nextD.srcA == dst && fwE != dst) {
      nextD.valA = valM;
      fwM = dst;
    }
    if (nextD.srcB == dst && fwE != dst) {
      nextD.valB = valM;
      fwM = dst;
    }
    if (curD.stalled) {
      if (curD.srcA == dst) curD.valA = valM;
      if (curD.srcB == dst) curD.valB = valM;
      fwM = dst;
    }
  }

  nextM.bubbled = false;
  nextM.stalled = 0;
  nextM.inst = inst;
  nextM.valM = valM;
  nextM.valP = curE.valP;
  nextM.dst = dst;
  nextM.cond = curE.cond;
}

void PipelineArch::writeback() {

  if (curM.bubbled || curM.stalled) {
    return;
  }

  auto dst = curM.dst;
  auto valE = curM.valE;
  auto valM = curM.valM;
  auto valP = curM.valP;
  int64_t valW;

  switch (curW.type) {
    case TYPE_R:
    case TYPE_U:
      valW = valE;
      break;
    case TYPE_I:
      switch (curW.op) {
        case OP_JALR:
          valW = valP + INST_SIZE;
          break;
        case OP_ECALL:
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
  if (dst != NO_REG) {
    if (nextD.srcA == dst && fwE != dst && fwM != dst) {
      nextD.valA = valW;
    }
    if (nextD.srcB == dst && fwE != dst && fwM != dst) {
      nextD.valB = valW;
    }
    sim->cpu->set_reg(dst, valW);
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

  fwE = fwM = NO_REG;

  cycle_cnt += 1;
}

