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
  /* R-Type */
  OP_ADD, OP_MUL, OP_SUB, OP_SLL, OP_MULH, OP_SLT, OP_XOR,
  OP_DIV, OP_SRL, OP_DIVW, OP_REMW, OP_SRA, OP_OR, OP_REM,
  OP_AND, OP_ADDW, OP_SUBW, OP_MULW, OP_SLLW, OP_SRLW, OP_SRAW,
  /* I-Type */
  OP_LB, OP_LH, OP_LW, OP_LD, OP_LBU, OP_LHU, OP_LWU, OP_SLLI, OP_SRLI, OP_SRAI,
  OP_ADDI, OP_SLLIW, OP_SLTI, OP_XORI, OP_SRLIW, OP_SRAIW,
  OP_ORI, OP_ANDI, OP_ADDIW, OP_JALR, OP_ECALL,
  /* S-Type */
  OP_SB, OP_SH, OP_SW, OP_SD,
  /* SB-Type */
  OP_BEQ, OP_BNE, OP_BLT, OP_BGE, OP_BLTU, OP_BGEU,
  /* U-Type */
  OP_AUIPC, OP_LUI,
  /* UJ-Type */
  OP_JAL
};

enum RVInstType
{
  TYPE_R, TYPE_I, TYPE_S, TYPE_SB, TYPE_U, TYPE_UJ
};

const char *get_opname(RVInstOp op);

struct RVInstDef
{
  const char *opname;
  RVInstOp op;
  RVInstType type;
  unsigned int opcode;
  unsigned int funct3;
  unsigned int funct7;
};

extern const vector<RVInstDef> InstTab;

class RVInstruction
{
public:
  unsigned int inst;
  uint64_t addr;

  const char *opname;
  RVInstOp op;
  RVInstType type;

  unsigned int opcode = 0;
  unsigned int funct3 = 0;
  unsigned int funct7 = 0;

  unsigned int rs1 = 0;
  unsigned int rs2 = 0;
  unsigned int rd = 0;
  int imm = 0;

  unsigned int get_bits(unsigned int lo, unsigned int hi);

  explicit RVInstruction(unsigned int inst, uint64_t addr);

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
