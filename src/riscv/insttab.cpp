//
// Created by Mai Hoàng on 14/10/2021.
//

#include "riscv.hpp"

const vector<RVInstDef> InstTab = {
    /* R-Type instructions */
    {"add",   OP_ADD,   TYPE_R,  0x33, 0x0, 0x00},
    {"mul",   OP_MUL,   TYPE_R,  0x33, 0x0, 0x01},
    {"sub",   OP_SUB,   TYPE_R,  0x33, 0x0, 0x20},
    {"sll",   OP_SLL,   TYPE_R,  0x33, 0x1, 0x00},
    {"mulh",  OP_MULH,  TYPE_R,  0x33, 0x1, 0x01},
    {"slt",   OP_SLT,   TYPE_R,  0x33, 0x2, 0x00},
    {"xor",   OP_XOR,   TYPE_R,  0x33, 0x4, 0x00},
    {"div",   OP_DIV,   TYPE_R,  0x33, 0x4, 0x01},
    {"srl",   OP_SRL,   TYPE_R,  0x33, 0x5, 0x00},
    {"sra",   OP_SRA,   TYPE_R,  0x33, 0x5, 0x20},
    {"or",    OP_OR,    TYPE_R,  0x33, 0x6, 0x00},
    {"rem",   OP_REM,   TYPE_R,  0x33, 0x6, 0x01},
    {"and",   OP_AND,   TYPE_R,  0x33, 0x7, 0x00},

    {"addw",  OP_ADDW,  TYPE_R,  0x3b, 0x0, 0x00},
    {"subw",  OP_SUBW,  TYPE_R,  0x3b, 0x0, 0x20},
    {"mulw",  OP_MULW,  TYPE_R,  0x3b, 0x0, 0x01},
    {"divw",  OP_DIVW,  TYPE_R,  0x3b, 0x4, 0x01},
    {"remw",  OP_REMW,  TYPE_R,  0x3b, 0x6, 0x01},
    {"sllw",  OP_SLLW,  TYPE_R,  0x3b, 0x1, 0x00},
    {"srlw",  OP_SRLW,  TYPE_R,  0x3b, 0x5, 0x00},
    {"sraw",  OP_SRAW,  TYPE_R,  0x3b, 0x5, 0x20},

    /* I-Type instructions */
    {"lb",    OP_LB,    TYPE_I,  0x03, 0x0,        SKIP_FUNCT},
    {"lh",    OP_LH,    TYPE_I,  0x03, 0x1,        SKIP_FUNCT},
    {"lw",    OP_LW,    TYPE_I,  0x03, 0x2,        SKIP_FUNCT},
    {"ld",    OP_LD,    TYPE_I,  0x03, 0x3,        SKIP_FUNCT},

    {"lbu",   OP_LBU,   TYPE_I,  0x03, 0x4,        SKIP_FUNCT},
    {"lhu",   OP_LHU,   TYPE_I,  0x03, 0x5,        SKIP_FUNCT},
    {"lwu",   OP_LWU,   TYPE_I,  0x03, 0x6,        SKIP_FUNCT},

    {"addi",  OP_ADDI,  TYPE_I,  0x13, 0x0,        SKIP_FUNCT},
    {"slti",  OP_SLTI,  TYPE_I,  0x13, 0x2,        SKIP_FUNCT},
    {"xori",  OP_XORI,  TYPE_I,  0x13, 0x4,        SKIP_FUNCT},
    {"ori",   OP_ORI,   TYPE_I,  0x13, 0x6,        SKIP_FUNCT},
    {"andi",  OP_ANDI,  TYPE_I,  0x13, 0x7,        SKIP_FUNCT},
    {"slli",  OP_SLLI,  TYPE_I,  0x13, 0x1, 0x00},
    {"srli",  OP_SRLI,  TYPE_I,  0x13, 0x5, 0x00},
    {"srai",  OP_SRAI,  TYPE_I,  0x13, 0x5, 0x10},

    {"addiw", OP_ADDIW, TYPE_I,  0x1b, 0x0,        SKIP_FUNCT},
    {"slliw", OP_SLLIW, TYPE_I,  0x1b, 0x1, 0x00},
    {"srliw", OP_SRLIW, TYPE_I,  0x1b, 0x5, 0x00},
    {"sraiw", OP_SRAIW, TYPE_I,  0x1b, 0x5, 0x20},

    {"salr",  OP_JALR,  TYPE_I,  0x67, 0x0,        SKIP_FUNCT},

    {"ecall", OP_ECALL, TYPE_I,  0x73, 0x0, 0x000},

    /* S-Type instructions */
    {"sb",    OP_SB,    TYPE_S,  0x23, 0x0,        SKIP_FUNCT},
    {"sh",    OP_SH,    TYPE_S,  0x23, 0x1,        SKIP_FUNCT},
    {"sw",    OP_SW,    TYPE_S,  0x23, 0x2,        SKIP_FUNCT},
    {"sd",    OP_SD,    TYPE_S,  0x23, 0x3,        SKIP_FUNCT},

    /* SB-Type instructions */
    {"beq",   OP_BEQ,   TYPE_SB, 0x63, 0x0,        SKIP_FUNCT},
    {"bne",   OP_BNE,   TYPE_SB, 0x63, 0x1,        SKIP_FUNCT},
    {"blt",   OP_BLT,   TYPE_SB, 0x63, 0x4,        SKIP_FUNCT},
    {"bge",   OP_BGE,   TYPE_SB, 0x63, 0x5,        SKIP_FUNCT},
    {"bltu",  OP_BLTU,  TYPE_SB, 0x63, 0x6,        SKIP_FUNCT},
    {"bgeu",  OP_BGEU,  TYPE_SB, 0x63, 0x7,        SKIP_FUNCT},

    /* U-Type instructions */
    {"auipc", OP_AUIPC, TYPE_U,  0x17, SKIP_FUNCT, SKIP_FUNCT},
    {"lui",   OP_LUI,   TYPE_U,  0x37, SKIP_FUNCT, SKIP_FUNCT},

    /* UJ-Type instructions */
    {"jal",   OP_JAL,   TYPE_UJ, 0x6f, SKIP_FUNCT, SKIP_FUNCT},
};


