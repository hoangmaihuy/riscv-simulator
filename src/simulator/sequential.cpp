//
// Created by Mai Hoàng on 14/10/2021.
//

#include "simulator.hpp"

void Simulator::fetch()
{
  valP = cpu->get_pc();
  auto instRaw = (uint32_t) memory->read(valP, INST_SIZE, true);
  if (inst)
    free(inst);
  inst = new RVInstruction(instRaw, valP);
  if (verbose)
    fprintf(stderr, "fetch: %llx:  %x    %s\n", inst->addr, inst->inst, inst->to_str().c_str());
}

void Simulator::decode()
{
  switch (inst->type)
  {
    case TYPE_R:
      valA = cpu->get_reg(inst->rs1);
      valB = cpu->get_reg(inst->rs2);
      valC = 0;
      dstE = inst->rd;
      break;
    case TYPE_I:
      if (inst->op != OP_ECALL)
      {
        valA = cpu->get_reg(inst->rs1);
        valB = 0;
        valC = inst->imm;
        dstE = inst->rd;
      } else
      {
        valA = valB = valC = dstE = 0;
      }
      break;
    case TYPE_S:
      valA = cpu->get_reg(inst->rs1);
      valB = cpu->get_reg(inst->rs2);
      valC = inst->imm;
      dstE = 0;
      break;
    case TYPE_SB:
      valA = cpu->get_reg(inst->rs1);
      valB = cpu->get_reg(inst->rs2);
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

void Simulator::execute()
{
  switch (inst->op)
  {
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
      valE = valA << valC;
      break;
    case OP_SLTI:
      valE = (valA < valC) ? 1 : 0;
      break;
    case OP_XORI:
      valE = valA ^ valC;
      break;
    case OP_SRLI:
      valE = valA >> valC;
      break;
    case OP_SRAI:
      valE = (int64_t) valA >> valC;
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
      fprintf(stderr, "beq: valA = %lld, valB = %lld\n", valA, valB);
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

void Simulator::memaccess()
{
  switch (inst->op)
  {
    case OP_LB:
      valM = (int64_t) (int8_t) (uint8_t) memory->read(valE, 1);
      break;
    case OP_LH:
      valM = (int64_t) (int16_t) (uint16_t) memory->read(valE, 2);
      break;
    case OP_LW:
      valM = (int64_t) (int32_t) (uint32_t) memory->read(valE, 4);
      break;
    case OP_LD:
      valM = (int64_t) memory->read(valE, 8);
      break;
    case OP_LBU:
      valM = (int64_t) (uint8_t) memory->read(valE, 1);
      break;
    case OP_LHU:
      valM = (int64_t) (uint16_t) memory->read(valE, 2);
      break;
    case OP_LWU:
      valM = (int64_t) (uint32_t) memory->read(valE, 4);
      break;
    case OP_SB:
      memory->write(valE, 1, valB);
      valM = 0;
      break;
    case OP_SH:
      memory->write(valE, 2, valB);
      valM = 0;
      break;
    case OP_SW:
      memory->write(valE, 4, valB);
      valM = 0;
      break;
    case OP_SD:
      memory->write(valE, 8, valB);
      valM = 0;
      break;
    default:
      valM = 0;
  }
}

void Simulator::writeback()
{
  switch (inst->type)
  {
    case TYPE_R:
    case TYPE_U:
      cpu->set_reg(dstE, valE);
      break;
    case TYPE_I:
      switch (inst->op)
      {
        case OP_JALR:
          cpu->set_reg(dstE, valP + INST_SIZE);
          break;
        case OP_ECALL:
          break;
        case OP_LB:
        case OP_LH:
        case OP_LW:
        case OP_LD:
          cpu->set_reg(dstE, valM);
          break;
        default:
          cpu->set_reg(dstE, valE);
      }
      break;
    case TYPE_UJ:
      cpu->set_reg(dstE, valP + INST_SIZE);
      break;
    default:
      break;
  }
}

void Simulator::pcupdate()
{
  uint64_t newPC = 0;
  switch (inst->type)
  {
    case TYPE_R:
    case TYPE_U:
    case TYPE_S:
      newPC = valP + INST_SIZE;
      break;
    case TYPE_I:
      switch (inst->op)
      {
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
  cpu->set_pc(newPC);
}

void Simulator::run_cycle()
{
  cpu->set_reg(0, 0);
  fetch();
  decode();
  execute();
  memaccess();
  writeback();
  pcupdate();
}

void Simulator::run_sequential(bool single_step_mode)
{
  string cmd;
  while (single_step_mode)
  {
    cin >> cmd;
    if (cmd == "n")
      run_cycle();
    else if (cmd == "q")
      return;
    else
    {
      fprintf(stderr, "Unknown command: %s\n", cmd.c_str());
      exit(1);
    }
  }

}

void Simulator::run_all()
{
  while (cpu->get_pc() != endPC)
    run_cycle();
}
