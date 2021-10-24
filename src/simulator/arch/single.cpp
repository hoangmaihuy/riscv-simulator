//
// Created by Mai Hoàng on 14/10/2021.
//

#include "simulator/arch/single.hpp"
#include "simulator/simulator.hpp"
#include "cpu/cpu.hpp"

SingleCycleArch::SingleCycleArch(Simulator *sim) : BaseArch(sim) {
  this->inst = nullptr;
}

void SingleCycleArch::fetch() {
  inst_cnt += 1;
  if (last_inst)
    free(last_inst);
  last_inst = inst;

  if (inst) {
    uint64_t newPC = 0;
    switch (inst->type) {
      case TYPE_R:
      case TYPE_U:
      case TYPE_S:
        newPC = valP + INST_SIZE;
        break;
      case TYPE_I:
        switch (inst->op) {
          case OP_JALR:
            newPC = valE;
            break;
          default:
            newPC = valP + INST_SIZE;
        }
        break;
      case TYPE_SB:
        newPC = (cc ? valE : (valP + INST_SIZE));
        break;
      case TYPE_UJ:
        newPC = valE;
    }
    sim->cpu->set_pc(newPC);
  }

  valP = sim->cpu->get_pc();
  auto instRaw = (uint32_t) sim->memory->read(valP, INST_SIZE, true);
  inst = new RVInstruction(instRaw, valP);
  if (verbose)
    fprintf(stderr, "\nfetch: %llx:  %x    %s\n", inst->addr, inst->inst, inst->to_str().c_str());
}

void SingleCycleArch::decode() {
  sim->cpu->set_reg(0, 0);
  switch (inst->type) {
    case TYPE_R:
      valA = sim->cpu->get_reg(inst->rs1);
      valB = sim->cpu->get_reg(inst->rs2);
      valC = 0;
      dstE = inst->rd;
      dstM = 0;
      break;
    case TYPE_I:
      if (inst->op != OP_ECALL) {
        valA = sim->cpu->get_reg(inst->rs1);
        valB = 0;
        valC = inst->imm;
        dstE = inst->rd;
        dstM = inst->rd;
      } else {
        valA = sim->cpu->get_reg(reg("a0"));
        valB = sim->cpu->get_reg(reg("a7"));
        valC = 0;
        // read syscall
        if (valB >= 10 && valB < 20) {
          dstE = reg("a0");
        } else {
          dstE = -1;
        }
      }
      break;
    case TYPE_S:
      valA = sim->cpu->get_reg(inst->rs1);
      valB = sim->cpu->get_reg(inst->rs2);
      valC = inst->imm;
      dstE = 0;
      dstM = 0;
      break;
    case TYPE_SB:
      valA = sim->cpu->get_reg(inst->rs1);
      valB = sim->cpu->get_reg(inst->rs2);
      valC = inst->imm;
      dstE = 0;
      break;
    case TYPE_U:
      valA = valB = 0;
      valC = inst->imm;
      dstE = inst->rd;
      break;
    case TYPE_UJ:
      valA = valB = 0;
      valC = inst->imm;
      dstE = inst->rd;
      break;
  }
}

void SingleCycleArch::execute() {
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
      cc = valA == valB;
      valE = valP + valC;
      break;
    case OP_BNE:
      cc = valA != valB;
      valE = valP + valC;
      break;
    case OP_BLT:
      cc = valA < valB;
      valE = valP + valC;
      break;
    case OP_BGE:
      cc = valA >= valB;
      valE = valP + valC;
      break;
    case OP_BLTU:
      cc = (uint64_t) valA < (uint64_t) valB;
      valE = valP + valC;
      break;
    case OP_BGEU:
      cc = (uint64_t) valA >= (uint64_t) valB;
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
}

void SingleCycleArch::memory() {
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
}

void SingleCycleArch::writeback() {
  switch (inst->type) {
    case TYPE_R:
    case TYPE_U:
      sim->cpu->set_reg(dstE, valE);
      break;
    case TYPE_I:
      switch (inst->op) {
        case OP_JALR:
          sim->cpu->set_reg(dstE, valP + INST_SIZE);
          break;
        case OP_ECALL:
          if (valB >= 10 && valB < 20)
            sim->cpu->set_reg(dstE, valE);
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

void SingleCycleArch::inc_cycle() {
  cycle_cnt += 1;
}

void SingleCycleArch::run_cycle() {
  sim->cpu->set_reg(0, 0);
  fetch();
  decode();
  execute();
  memory();
  writeback();
  inc_cycle();
  if (verbose) {
    sim->cpu->print();
  }
}