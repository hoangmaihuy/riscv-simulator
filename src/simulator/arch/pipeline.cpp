//
// Created by Mai Hoàng on 22/10/2021.
//

#include "pipeline.hpp"
#include "simulator/simulator.hpp"

PipelineArch::PipelineArch(Simulator *sim) : BaseArch(sim) {
  nextF.predPC = sim->cpu->get_pc();
  nextD.bubbled = true;
  nextE.bubbled = true;
  nextF.bubbled = true;
  nextW.bubbled = true;
}

void PipelineArch::fetch() {

  if (curF.stalled) {
    memcpy(&nextF, &curF, sizeof(FReg));
    nextF.stalled = false;
    nextF.bubbled = false;
    return;
  }

  memset(&nextD, 0, sizeof(DReg));

  if (curF.bubbled) {
    nextD.bubbled = true;
    nextD.stalled = false;
    return;
  }

  uint64_t nextPC;
  nextPC = curF.predPC;

  auto instRaw = (uint32_t) sim->memory->read(nextPC, INST_SIZE, true);
  auto inst = new RVInstruction(instRaw, nextPC);

  nextD.op = inst->op;
  nextD.type = inst->type;
  nextD.srcA = inst->rs1;
  nextD.srcB = inst->rs2;
  nextD.valC = inst->imm;
  nextD.valP = nextPC;
  nextD.dstE = inst->rd;

  uint64_t predPC = 0;

  switch (inst->type) {
    case TYPE_R:
    case TYPE_U:
    case TYPE_S:
      predPC = nextPC + INST_SIZE;
      break;
    case TYPE_I:
      switch (inst->op) {
        case OP_JALR:
          // should wait for write back
          predPC = sim->cpu->get_reg(inst->rs1) + inst->imm;
          break;
        default:
          predPC = nextPC + INST_SIZE;
      }
      break;
    case TYPE_SB:
      predPC = nextPC + INST_SIZE;
      break;
    case TYPE_UJ:
      predPC = nextPC + inst->imm;
  }

  nextF.predPC = predPC;
}

void PipelineArch::decode() {

  if (curD.stalled) {
    memcpy(&nextD, &curD, sizeof(DReg));
    nextD.stalled = false;
    nextD.bubbled = false;
    return;
  }

  memset(&nextE, 0, sizeof(EReg));

  if (curD.bubbled) {
    nextE.bubbled = true;
    nextE.stalled = false;
    return;
  }

  nextE.op = curD.op;
  nextE.type = curD.type;
  nextE.valP = curD.valP;
  switch (curD.type) {
    case TYPE_R:
      nextE.valA = sim->cpu->get_reg(curD.srcA);
      nextE.valB = sim->cpu->get_reg(curD.srcB);
      nextE.dstE = curD.dstE;
      break;
    case TYPE_I:
      if (curD.op != OP_ECALL) {
        nextE.valA = sim->cpu->get_reg(curD.srcA);
        nextE.valB = 0;
        nextE.valC = curD.valC;
        nextE.dstM = curD.dstE;
      } else {
        nextE.valA = nextE.valB = nextE.valC = 0;
        nextE.dstE = 0;
      }
      break;
    case TYPE_S:
      nextE.valA = sim->cpu->get_reg(curD.srcA);
      nextE.valB = sim->cpu->get_reg(curD.srcB);
      nextE.valC = curD.valC;
      break;
    case TYPE_SB:
      nextE.valA = sim->cpu->get_reg(curD.srcA);
      nextE.valB = sim->cpu->get_reg(curD.srcB);
      nextE.valC = curD.valC;
      break;
    case TYPE_U:
      nextE.valA = nextE.valB = 0;
      nextE.valC = curD.valC;
      nextE.dstE = curD.dstE;
      break;
    case TYPE_UJ:
      nextE.valA = nextE.valB = 0;
      nextE.valC = curD.valC;
      nextE.dstE = curD.dstE;
      break;
  }
}

void PipelineArch::execute() {

  if (curE.stalled) {
    memcpy(&nextE, &curE, sizeof(EReg));
    nextE.stalled = false;
    nextE.bubbled = false;
    return;
  }

  memset(&nextM, 0, sizeof(MReg));

  if (curE.bubbled) {
    nextM.bubbled = true;
    nextM.stalled = false;
    return;
  }

  int64_t valA = curE.valA;
  int64_t valB = curE.valB;
  int64_t valC = curE.valC;
  int64_t valP = curE.valP;
  int64_t valE;
  bool cond = false;

  switch (curE.op) {
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
      valE = 0;
      sim->syscall();
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

  nextM.op = curE.op;
  nextM.type = curE.type;
  nextM.valP = curE.valP;
  nextM.valB = curE.valB;
  nextM.valE = valE;
  nextM.cond = cond;
  nextM.dstE = curE.dstE;
  nextM.dstM = curE.dstM;
}

void PipelineArch::memory() {

  if (curM.stalled) {
    memcpy(&nextM, &curM, sizeof(MReg));
    nextM.stalled = false;
    nextM.bubbled = false;
    return;
  }

  memset(&nextM, 0, sizeof(MReg));

  if (curM.bubbled) {
    nextW.bubbled = true;
    nextW.stalled = false;
    return;
  }

  int64_t valM;
  int64_t valE = curM.valE;
  int64_t valB = curM.valB;
  switch (curM.op) {
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

  nextW.op = curM.op;
  nextW.type = curM.type;
  nextW.valP = curM.valP;
  nextW.valM = valM;
  nextW.valE = curM.valE;
  nextW.dstE = curM.dstE;
  nextW.dstM = curM.dstM;
}

void PipelineArch::writeback() {

  if (curW.bubbled || curW.stalled) {
    return;
  }

  auto dstE = curW.dstE;
  auto valE = curW.valE;
  auto valP = curW.valP;
  auto dstM = curW.dstM;
  auto valM = curW.valM;

  switch (curW.type) {
    case TYPE_R:
    case TYPE_U:
      sim->cpu->set_reg(dstE, valE);
      break;
    case TYPE_I:
      switch (curW.op) {
        case OP_JALR:
          sim->cpu->set_reg(dstE, valP + INST_SIZE);
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
          sim->cpu->set_reg(dstM, valM);
          break;
        default:
          sim->cpu->set_reg(dstE, valE);
      }
      break;
    case TYPE_UJ:
      sim->cpu->set_reg(dstE, valP + INST_SIZE);
      break;
    default:
      break;
  }
}

void PipelineArch::run_cycle() {
  sim->cpu->set_reg(0, 0);
  memcpy(&curF, &nextF, sizeof(FReg));
  memcpy(&curD, &nextD, sizeof(DReg));
  memcpy(&curE, &nextE, sizeof(EReg));
  memcpy(&curM, &nextM, sizeof(MReg));
  memcpy(&curW, &nextW, sizeof(WReg));
  fetch();
  decode();
  execute();
  memory();
  writeback();
  inc_cycle();
}

void PipelineArch::inc_cycle() {
  cycle_cnt += 1;
}

