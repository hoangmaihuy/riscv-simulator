//
// Created by Mai Hoàng on 14/10/2021.
//

#ifndef RISCV_SIMULATOR_RISCV_HPP
#define RISCV_SIMULATOR_RISCV_HPP

#include "global.hpp"

#define SKIP_FUNCT (unsigned int)-1

enum RVInstOp
{
  OP_ADD, OP_MUL, OP_SUB, OP_SLL, OP_MULH, OP_SLT, OP_XOR, OP_DIV, OP_SRL,
  OP_SRA, OP_OR, OP_REM, OP_AND, OP_ADDW, OP_SUBW, OP_MULW, OP_DIVW, OP_REMW,
  OP_LB, OP_LH, OP_LW, OP_LD, OP_ADDI, OP_SLLI, OP_SLTI, OP_XORI, OP_SRLI, OP_SRAI,
  OP_ORI, OP_ANDI, OP_ADDIW, OP_JALR, OP_ECALL, OP_SB, OP_SH, OP_SW, OP_SD, OP_BEQ,
  OP_BNE, OP_BLT, OP_BGE, OP_AUIPC, OP_LUI, OP_JAL
};

enum RVInstType
{
  TYPE_R, TYPE_I, TYPE_S, TYPE_SB, TYPE_U, TYPE_UJ
};


typedef struct
{
  RVInstOp op;
  RVInstType type;
  unsigned int opcode;
  unsigned int funct3;
  unsigned int funct7;
} RVInstDef;

extern const vector<RVInstDef> instTab;

class RVInstruction
{
public:
  unsigned int inst;

  RVInstOp op;
  RVInstType type;

  unsigned int opcode = 0;
  unsigned int funct3 = 0;
  unsigned int funct7 = 0;

  unsigned int rs1 = 0;
  unsigned int rs2 = 0;
  unsigned int rd = 0;
  unsigned int imm = 0;

  unsigned int getBits(unsigned int lo, unsigned int hi)
  {
    return inst << (31 - hi) >> (31 - hi + lo);
  }

  RVInstDef searchInstTab() {
    for (auto &instDef : instTab)
    {
      bool checkOpCode = opcode == instDef.opcode;
      bool checkFunct3 = (instDef.funct3 == SKIP_FUNCT || instDef.funct3 == funct3);
      bool checkFunct7 = (instDef.funct7 == SKIP_FUNCT || instDef.funct7 == funct7);
      if (checkOpCode && checkFunct3 && checkFunct7)
        return instDef;
    }
    fprintf(stderr, "Unknown instruction: opcode = 0x%x, funct3 = 0x%x, funct7 = 0x%x\n", opcode, funct3, funct7);
    exit(1);
  }

  RVInstruction(unsigned int inst)
  {
    this->inst = inst;
    opcode = getBits(0, 6);
    funct3 = getBits(12, 14);
    funct7 = getBits(25, 31);
    rs1 = getBits(15, 19);
    rs2 = getBits(20, 24);
    rd = getBits(7, 11);

    auto instDef = searchInstTab();
    op = instDef.op;
    type = instDef.type;
  }

};

#endif //RISCV_SIMULATOR_RISCV_HPP
