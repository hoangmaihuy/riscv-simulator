//
// Created by Mai Hoàng on 15/10/2021.
//

#include "riscv.hpp"

/* Search instruction tab */
void RVInstruction::decode()
{
  for (auto &instDef: InstTab)
  {
    bool checkOpCode = opcode == instDef.opcode;
    bool checkFunct3 = (instDef.funct3 == SKIP_FUNCT || instDef.funct3 == funct3);
    bool checkFunct7 = (instDef.funct7 == SKIP_FUNCT || instDef.funct7 == funct7);
    if (checkOpCode && checkFunct3 && checkFunct7)
    {
      op = instDef.op;
      type = instDef.type;
      return;
    }
  }
  fprintf(stderr, "Unknown instruction: opcode = 0x%x, funct3 = 0x%x, funct7 = 0x%x\n", opcode, funct3, funct7);
  exit(1);
}

RVInstruction::RVInstruction(unsigned int inst)
{
  this->inst = inst;
  opcode = get_bits(0, 6);
  funct3 = get_bits(12, 14);
  funct7 = get_bits(25, 31);
  rs1 = get_bits(15, 19);
  rs2 = get_bits(20, 24);
  rd = get_bits(7, 11);

  decode();

  switch (type) {
    case TYPE_R:
      rd = get_bits(7,11);
      rs1 = get_bits(15, 19);
      rs2 = get_bits(20, 24);
      break;
    case TYPE_I:
      rd = get_bits(7, 11);
      rs1 = get_bits(15, 19);
      imm = get_bits(20, 31);
      break;
    case TYPE_S:
      rs1 = get_bits(15, 19);
      rs2 = get_bits(20, 24);
      imm = (get_bits(25, 31) << 5) | get_bits(7, 11);
    case TYPE_SB:
      rs1 = get_bits(15, 19);
      rs2 = get_bits(20, 24);
      imm = (get_bits(31, 31) << 12) | (get_bits(7, 7) << 11) | (get_bits(25, 30) << 5) | (get_bits(8, 11) << 1);
    case TYPE_U:
      rd = get_bits(7, 11);
      imm = get_bits(12, 31) << 12;
    case TYPE_UJ:
      rd = get_bits(7, 11);
      imm = (get_bits(31, 31) << 20) | (get_bits(12, 19) << 12) | (get_bits(20, 20) << 11) | (get_bits(21, 30) << 1);
    default:
      fprintf(stderr, "Unknown instruction type: %d\n", type);
      exit(1);
  }
}

unsigned int RVInstruction::get_bits(unsigned int lo, unsigned int hi)
{
  return inst << (31 - hi) >> (31 - hi + lo);
}
