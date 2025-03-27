package cpu_riscv_tests

import chisel3._

object Consts {
    // Word size
    val WORD_LEN        = 32

    // Memory
    val IMEM_WIDTH      = 32    // 32bit
    val IMEM_DEPTH      = 16384 // 16KB 16384
    val IMEM_HEX_PATH   = "src/main/resources/CPU/test.hex"
    val DMEM_WIDTH      = 32    // 16KB 16384

    // Rigister
    val REG_LEN         = 32
    val REGX_NUM        = 32
    val REGX_ADDR_LEN   = 5
    val CSR_NUM         = 4096
    val CSR_ADDR_LEN    = 12
    val START_PC        = 0.U(REG_LEN.W)                // PC start address
    val NOP             = "x_00000013".U(IMEM_WIDTH.W)  // [ADDI x0,x0,0] = NOP
    val UNIMP           = "x_c0001073".U(IMEM_WIDTH.W)  // [CSRRW x0, cycle, x0]
    val EXIT_INST       = "x_00000000".U(IMEM_WIDTH.W)  // exit instruction
    val EXIT_PC         = 0x00000044.U(REG_LEN.W)       // exit PC

    // Pipeline parameters
    val PIPELINE_LEN    = 0

    // function in execute stage
    val EXE_FUN_LEN = 5
    val ALU_NULL    =  0.U(EXE_FUN_LEN.W)
    val ALU_ADD     =  1.U(EXE_FUN_LEN.W)
    val ALU_SUB     =  2.U(EXE_FUN_LEN.W)
    val ALU_AND     =  3.U(EXE_FUN_LEN.W)
    val ALU_OR      =  4.U(EXE_FUN_LEN.W)
    val ALU_XOR     =  5.U(EXE_FUN_LEN.W)
    val ALU_SLL     =  6.U(EXE_FUN_LEN.W)
    val ALU_SRL     =  7.U(EXE_FUN_LEN.W)
    val ALU_SRA     =  8.U(EXE_FUN_LEN.W)
    val ALU_SLT     =  9.U(EXE_FUN_LEN.W)
    val ALU_SLTU    = 10.U(EXE_FUN_LEN.W)
    val BR_BEQ      = 11.U(EXE_FUN_LEN.W)
    val BR_BNE      = 12.U(EXE_FUN_LEN.W)
    val BR_BLT      = 13.U(EXE_FUN_LEN.W)
    val BR_BGE      = 14.U(EXE_FUN_LEN.W)
    val BR_BLTU     = 15.U(EXE_FUN_LEN.W)
    val BR_BGEU     = 16.U(EXE_FUN_LEN.W)
    val ALU_JALR    = 17.U(EXE_FUN_LEN.W)
    val ALU_COPY1   = 18.U(EXE_FUN_LEN.W)
    val ALU_VADDVV  = 19.U(EXE_FUN_LEN.W)
    val VSET        = 20.U(EXE_FUN_LEN.W)
    val ALU_PCNT    = 21.U(EXE_FUN_LEN.W)

    // first operand
    val OP1_LEN     = 2
    val OP1_RS1     = 0.U(OP1_LEN.W)
    val OP1_PC      = 1.U(OP1_LEN.W)
    val OP1_NULL    = 2.U(OP1_LEN.W)
    val OP1_IMZ     = 3.U(OP1_LEN.W)

    // second operand
    val OP2_LEN     = 3
    val OP2_NULL    = 0.U(OP2_LEN.W)
    val OP2_RS2     = 1.U(OP2_LEN.W)
    val OP2_IMI     = 2.U(OP2_LEN.W)
    val OP2_IMS     = 3.U(OP2_LEN.W)
    val OP2_IMJ     = 4.U(OP2_LEN.W)
    val OP2_IMU     = 5.U(OP2_LEN.W)

    // memory write enable
    val MEN_LEN     = 1
    val MEN_NULL    = 0.U(MEN_LEN.W)
    val MEN_EN      = 1.U(MEN_LEN.W)

    // register write back enable
    val REN_LEN     = 1
    val REN_NULL    = 0.U(REN_LEN.W)
    val REN_EN      = 1.U(REN_LEN.W)

    // write back select
    val WB_LEN      = 3
    val WB_NULL     = 0.U(WB_LEN.W)
    val WB_ALU      = 0.U(WB_LEN.W)  // default
    val WB_MEM      = 1.U(WB_LEN.W)
    val WB_PC       = 2.U(WB_LEN.W)
    val WB_CSR      = 3.U(WB_LEN.W)

    // memory write select
    val MW_LEN      = 3
    val MW_NULL     = 0.U(MW_LEN.W)
    val MW_W        = 1.U(MW_LEN.W)
    val MW_H        = 2.U(MW_LEN.W)
    val MW_B        = 3.U(MW_LEN.W)
    val MW_HU       = 4.U(MW_LEN.W)
    val MW_BU       = 5.U(MW_LEN.W)

    // CSR operation
    val CSR_LEN     = 3
    val CSR_NULL    = 0.U(CSR_LEN.W)
    val CSR_W       = 1.U(CSR_LEN.W)   // write
    val CSR_S       = 2.U(CSR_LEN.W)   // set
    val CSR_C       = 3.U(CSR_LEN.W)   // clear
    val CSR_E       = 4.U(CSR_LEN.W)   // ecall
    
}
