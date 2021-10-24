//
// Created by Mai Hoàng on 15/10/2021.
//
#include "cpu/cpu.hpp"
#include "riscv.hpp"

/* Search instruction tab */
void RVInstruction::decode() {
  for (auto &instDef: InstTab) {
    bool checkOpCode = opcode == instDef.opcode;
    bool checkFunct3 = (instDef.funct3 == SKIP_FUNCT || instDef.funct3 == funct3);
    bool checkFunct7 = (instDef.funct7 == SKIP_FUNCT || instDef.funct7 == funct7);
    if (checkOpCode && checkFunct3 && checkFunct7) {
      op = instDef.op;
      type = instDef.type;
      opname = instDef.opname;
      return;
    }
  }
  fprintf(stderr, "Unknown instruction: addr = 0x%llx, inst = %x, opcode = 0x%x, funct3 = 0x%x, funct7 = 0x%x\n", addr,
          inst, opcode, funct3, funct7);
  exit(1);
}

RVInstruction::RVInstruction(unsigned int inst, uint64_t addr) {
  this->inst = inst;
  this->addr = addr;
  opcode = get_bits(0, 6);
  funct3 = get_bits(12, 14);
  funct7 = get_bits(25, 31);
  rs1 = get_bits(15, 19);
  rs2 = get_bits(20, 24);
  rd = get_bits(7, 11);

  /* SLLI, SRLI, SRAI only have 6-bits funct7 */
  if (opcode == 0x13 && (funct3 == 0x1 || funct3 == 0x5))
    funct7 >>= 1;

  decode();

  switch (type) {
    case TYPE_R:
      rd = get_bits(7, 11);
      rs1 = get_bits(15, 19);
      rs2 = get_bits(20, 24);
      imm = 0;
      break;
    case TYPE_I:
      rd = get_bits(7, 11);
      rs1 = get_bits(15, 19);
      imm = (int) get_bits(20, 31) << 20 >> 20;
      break;
    case TYPE_S:
      rs1 = get_bits(15, 19);
      rs2 = get_bits(20, 24);
      imm = (int) ((get_bits(25, 31) << 5) | get_bits(7, 11)) << 20 >> 20;
      break;
    case TYPE_SB:
      rs1 = get_bits(15, 19);
      rs2 = get_bits(20, 24);
      imm = (int) ((get_bits(31, 31) << 12) | (get_bits(7, 7) << 11) | (get_bits(25, 30) << 5) | (get_bits(8, 11) << 1))
          << 20 >> 20;
      break;
    case TYPE_U:
      rd = get_bits(7, 11);
      imm = (int) (get_bits(12, 31) << 12);
      break;
    case TYPE_UJ:
      rd = get_bits(7, 11);
      imm = (int) ((get_bits(31, 31) << 20) | (get_bits(12, 19) << 12) | (get_bits(20, 20) << 11) |
                   (get_bits(21, 30) << 1)) << 11 >> 11;
      break;
    default:
      fprintf(stderr, "Unknown instruction type: %d\n", type);
      exit(1);
  }
}

unsigned int RVInstruction::get_bits(unsigned int lo, unsigned int hi) {
  return inst << (31 - hi) >> (31 - hi + lo);
}

string RVInstruction::to_str() {
  switch (type) {
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

string RVInstruction::type_r_str() const {
  char buf[MAX_INST_LENGTH];
  sprintf(buf, "%s %s, %s, %s", opname, get_regname(rd), get_regname(rs1),
          get_regname(rs2));
  return {buf};
}

string RVInstruction::type_i_str() const {
  char buf[MAX_INST_LENGTH];
  switch (op) {
    case OP_LB:
    case OP_LH:
    case OP_LW:
    case OP_LD:
      sprintf(buf, "%s %s, %d(%s)", opname, get_regname(rd), imm, get_regname(rs1));
      break;
    case OP_ECALL:
      sprintf(buf, "ecall");
      break;
    default:
      sprintf(buf, "%s %s, %s, %d", opname, get_regname(rd), get_regname(rs1), imm);
  }
  return {buf};
}

string RVInstruction::type_s_str() const {
  char buf[MAX_INST_LENGTH];
  sprintf(buf, "%s %s, %d(%s)", opname, get_regname(rs2), imm, get_regname(rs1));
  return {buf};
}

string RVInstruction::type_sb_str() const {
  char buf[MAX_INST_LENGTH];
  sprintf(buf, "%s %s, %s, %d", opname, get_regname(rs1), get_regname(rs2), imm);
  return {buf};
}

string RVInstruction::type_u_str() const {
  char buf[MAX_INST_LENGTH];
  sprintf(buf, "%s %s, %d", opname, get_regname(rd), imm);
  return {buf};
}

string RVInstruction::type_uj_str() const {
  char buf[MAX_INST_LENGTH];
  sprintf(buf, "%s %s, %d", opname, get_regname(rd), imm);
  return {buf};
}

bool RVInstruction::is_load() const {
  return (op == OP_LB || op == OP_LH || op == OP_LW || op == OP_LD || op == OP_LBU || op == OP_LHU || op == OP_LWU);
}

bool RVInstruction::is_jump() const {
  return (op == OP_JAL || op == OP_JALR);
}

bool RVInstruction::is_branch() const {
  return type == TYPE_SB;
}




