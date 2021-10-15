//
// Created by Mai Hoàng on 14/10/2021.
//

#include "riscv.hpp"

const vector<RVInstDef> InstTab = {
    /* R-Type instructions */
    {OP_ADD,   TYPE_R,  0x33, 0x0, 0x00},
    {OP_MUL,   TYPE_R,  0x33, 0x0, 0x01},
    {OP_SUB,   TYPE_R,  0x33, 0x0, 0x20},
    {OP_SLL,   TYPE_R,  0x33, 0x1, 0x00},
    {OP_MULH,  TYPE_R,  0x33, 0x1, 0x01},
    {OP_SLT,   TYPE_R,  0x33, 0x2, 0x00},
    {OP_XOR,   TYPE_R,  0x33, 0x4, 0x00},
    {OP_DIV,   TYPE_R,  0x33, 0x4, 0x01},
    {OP_SRL,   TYPE_R,  0x33, 0x5, 0x00},
    {OP_SRA,   TYPE_R,  0x33, 0x5, 0x20},
    {OP_OR,    TYPE_R,  0x33, 0x6, 0x00},
    {OP_REM,   TYPE_R,  0x33, 0x6, 0x01},
    {OP_AND,   TYPE_R,  0x33, 0x7, 0x00},

    {OP_ADDW,  TYPE_R,  0x3b, 0x0, 0x00},
    {OP_SUBW,  TYPE_R,  0x3b, 0x0, 0x20},
    {OP_MULW,  TYPE_R,  0x3b, 0x0, 0x01},
    {OP_DIVW,  TYPE_R,  0x3b, 0x4, 0x01},
    {OP_REMW,  TYPE_R,  0x3b, 0x6, 0x01},

    /* I-Type instructions */
    {OP_LB,    TYPE_I,  0x03, 0x0,        SKIP_FUNCT},
    {OP_LH,    TYPE_I,  0x03, 0x1,        SKIP_FUNCT},
    {OP_LW,    TYPE_I,  0x03, 0x2,        SKIP_FUNCT},
    {OP_LD,    TYPE_I,  0x03, 0x3,        SKIP_FUNCT},

    {OP_ADDI,  TYPE_I,  0x13, 0x0,        SKIP_FUNCT},
    {OP_SLLI,  TYPE_I,  0x13, 0x1, 0x00},
    {OP_SLTI,  TYPE_I,  0x13, 0x2,        SKIP_FUNCT},
    {OP_XORI,  TYPE_I,  0x13, 0x4,        SKIP_FUNCT},
    {OP_SRLI,  TYPE_I,  0x13, 0x5, 0x00},
    {OP_SRAI,  TYPE_I,  0x13, 0x5, 0x10},
    {OP_ORI,   TYPE_I,  0x13, 0x6,        SKIP_FUNCT},
    {OP_ANDI,  TYPE_I,  0x13, 0x7,        SKIP_FUNCT},

    {OP_ADDIW, TYPE_I,  0x1b, 0x0,        SKIP_FUNCT},

    {OP_JALR,  TYPE_I,  0x67, 0x0,        SKIP_FUNCT},

    {OP_ECALL, TYPE_I,  0x73, 0x0, 0x000},

    /* S-Type instructions */
    {OP_SB,    TYPE_S,  0x23, 0x0,        SKIP_FUNCT},
    {OP_SH,    TYPE_S,  0x23, 0x1,        SKIP_FUNCT},
    {OP_SW,    TYPE_S,  0x23, 0x2,        SKIP_FUNCT},
    {OP_SD,    TYPE_S,  0x23, 0x3,        SKIP_FUNCT},

    /* SB-Type instructions */
    {OP_BEQ,   TYPE_SB, 0x63, 0x0,        SKIP_FUNCT},
    {OP_BNE,   TYPE_SB, 0x63, 0x1,        SKIP_FUNCT},
    {OP_BLT,   TYPE_SB, 0x63, 0x4,        SKIP_FUNCT},
    {OP_BGE,   TYPE_SB, 0x63, 0x5,        SKIP_FUNCT},

    /* U-Type instructions */
    {OP_AUIPC, TYPE_U,  0x17, SKIP_FUNCT, SKIP_FUNCT},
    {OP_LUI,   TYPE_U,  0x37, SKIP_FUNCT, SKIP_FUNCT},

    /* UJ-Type instructions */
    {OP_JAL,   TYPE_UJ, 0x6f, SKIP_FUNCT, SKIP_FUNCT},
};


