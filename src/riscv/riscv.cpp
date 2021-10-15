//
// Created by Mai Hoàng on 15/10/2021.
//
#include "cpu/cpu.hpp"
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

  switch (type)
  {
    case TYPE_R:
      rd = get_bits(7, 11);
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

string RVInstruction::to_str()
{
  switch (type)
  {
    case TYPE_R:
      return type_r_str();
    case TYPE_I:
      return type_i_str();
    case TYPE_S:
      return type_s_str();
    case TYPE_SB:
      return type_sb_str();
    case TYPE_U:
      return type_u_str();
    case TYPE_UJ:
      return type_uj_str();
    default:
      return "";
  }
}

const char *get_opname(RVInstOp op)
{
  switch (op)
  {
    case OP_ADD:
      return "add";
    case OP_MUL:
      return "mul";
    case OP_SUB:
      return "sub";
    case OP_SLL:
      return "sll";
    case OP_MULH:
      return "mulh";
    case OP_SLT:
      return "slt";
    case OP_XOR:
      return "xor";
    case OP_DIV:
      return "div";
    case OP_SRL:
      return "srl";
    case OP_SRA:
      return "sra";
    case OP_OR:
      return "or";
    case OP_REM:
      return "rem";
    case OP_AND:
      return "and";
    case OP_ADDW:
      return "addw";
    case OP_SUBW:
      return "subw";
    case OP_MULW:
      return "mulw";
    case OP_DIVW:
      return "divw";
    case OP_REMW:
      return "remw";
    case OP_LB:
      return "lb";
    case OP_LH:
      return "lh";
    case OP_LW:
      return "lw";
    case OP_LD:
      return "ld";
    case OP_ADDI:
      return "addi";
    case OP_SLLI:
      return "slli";
    case OP_SLTI:
      return "slti";
    case OP_XORI:
      return "xori";
    case OP_SRLI:
      return "srli";
    case OP_SRAI:
      return "srai";
    case OP_ORI:
      return "ori";
    case OP_ANDI:
      return "andi";
    case OP_ADDIW:
      return "addiw";
    case OP_JALR:
      return "jalr";
    case OP_ECALL:
      return "ecall";
    case OP_SB:
      return "sb";
    case OP_SH:
      return "sh";
    case OP_SW:
      return "sw";
    case OP_SD:
      return "sd";
    case OP_BEQ:
      return "beq";
    case OP_BNE:
      return "bne";
    case OP_BLT:
      return "blt";
    case OP_BGE:
      return "bge";
    case OP_AUIPC:
      return "auipc";
    case OP_LUI:
      return "lui";
    case OP_JAL:
      return "jal";
    default:
      fprintf(stderr, "Unknown op: %d\n", op);
      exit(1);
  }
}

string RVInstruction::type_r_str() const
{
  auto opname = get_opname(op);
  char buf[MAX_INST_LENGTH];
  sprintf(buf, "%s %s, %s, %s", opname, get_regname(rd), get_regname(rs1),
          get_regname(rs2));
  return {buf};
}

string RVInstruction::type_i_str() const
{
  auto opname = get_opname(op);
  char buf[MAX_INST_LENGTH];
  switch (op)
  {
    case OP_LB:
    case OP_LH:
    case OP_LW:
    case OP_LD:
      sprintf(buf, "%s, %s, offset(%s)", opname, get_regname(rd), get_regname(rs1));
      break;
    case OP_ECALL:
      sprintf(buf, "ecall");
    default:
      sprintf(buf, "%s %s, %s, 0x%x", opname, get_regname(rd), get_regname(rs1), imm);
  }
  return {buf};
}

string RVInstruction::type_s_str() const
{
  char buf[MAX_INST_LENGTH];
  sprintf(buf, "%s %s, 0x%x(%s)", get_opname(op), get_regname(rs2), imm, get_regname(rs1));
  return {buf};
}

string RVInstruction::type_sb_str() const
{
  char buf[MAX_INST_LENGTH];
  sprintf(buf, "%s %s, %s, 0x%x", get_opname(op), get_regname(rs1), get_regname(rs2), imm);
  return {buf};
}

string RVInstruction::type_u_str() const
{
  char buf[MAX_INST_LENGTH];
  sprintf(buf, "%s %s, 0x%x", get_opname(op), get_regname(rd), imm);
  return {buf};
}

string RVInstruction::type_uj_str() const
{
  char buf[MAX_INST_LENGTH];
  sprintf(buf, "%s %s, 0x%x", get_opname(op), get_regname(rd), imm);
  return {buf};
}
