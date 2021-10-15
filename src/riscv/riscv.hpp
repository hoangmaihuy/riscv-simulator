//
// Created by Mai Hoàng on 14/10/2021.
//

#ifndef RISCV_SIMULATOR_RISCV_HPP
#define RISCV_SIMULATOR_RISCV_HPP

#include "global.hpp"

#define SKIP_FUNCT (unsigned int)-1
#define MAX_INST_LENGTH 50
#define INST_SIZE 4

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

const char *get_opname(RVInstOp op);

typedef struct
{
  RVInstOp op;
  RVInstType type;
  unsigned int opcode;
  unsigned int funct3;
  unsigned int funct7;
} RVInstDef;

extern const vector<RVInstDef> InstTab;

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

  unsigned int get_bits(unsigned int lo, unsigned int hi);

  explicit RVInstruction(unsigned int inst);

  void decode();

  string to_str();

private:
  string type_r_str() const;

  string type_i_str() const;

  string type_s_str() const;

  string type_sb_str() const;

  string type_u_str() const;

  string type_uj_str() const;
};

#endif //RISCV_SIMULATOR_RISCV_HPP
