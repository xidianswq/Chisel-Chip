package cpu

import chisel3._
import chisel3.util._
import public.Consts._
import public.Instructions._

class Core extends Module{
    val io = IO(new Bundle{
        val instmem = Flipped(new InstMemPortIO())
        val datamem = Flipped(new DataMemPortIO())
        val exit = Output(Bool())   //program end signal
    })
    
    //32x32bit general purpose register and a WORD_LEN-bit program counter
    val reg_x = Mem(REGX_Num, UInt(WORD_LEN.W))
    val reg_pc = RegInit(START_ADDR)
    val reg_csr = Mem(CSR_Num, UInt(WORD_LEN.W))



    //**********  Instruction Fetch (IF) Stage  **********
    io.instmem.addr := reg_pc
    val inst = io.instmem.inst

    val br_flag   = Wire(Bool())
    val br_target = Wire(UInt(WORD_LEN.W))
    val jump_flag  = Wire(Bool())
    val alu_out   = Wire(UInt(WORD_LEN.W))

    //program counter update
    val reg_pc_next_default = reg_pc + 4.U(WORD_LEN.W)
    val reg_pc_next = MuxCase(reg_pc_next_default, Seq(
        br_flag  -> br_target,
        jump_flag -> alu_out,
        (inst === ECALL) -> reg_csr(0x305) // go to trap_vector
    ))
    reg_pc := reg_pc_next



    //**********  Instruction Decode (ID) Stage **********
    val rs1_addr = inst(19, 15)
    val rs2_addr = inst(24, 20)
    val rd_addr  = inst(11, 7)
    val csr_addr_default = inst(31,20)
    val rs1_data = Mux((rs1_addr =/= 0.U(WORD_LEN.W)), reg_x(rs1_addr), 0.U(WORD_LEN.W))
    val rs2_data = Mux((rs2_addr =/= 0.U(WORD_LEN.W)), reg_x(rs2_addr), 0.U(WORD_LEN.W))
    
    val imm_i    = inst(31, 20)                         //I-type imm
    val imm_i_sext = Cat(Fill(20, imm_i(11)), imm_i)    //sign-extend imm_i
    val imm_s    = Cat(inst(31, 25), inst(11, 7))       //S-type imm
    val imm_s_sext = Cat(Fill(20, imm_s(11)), imm_s)    //sign-extend imm_s
    val imm_b = Cat(inst(31), inst(7), inst(30, 25), inst(11, 8))
    val imm_b_sext = Cat(Fill(19, imm_b(11)), imm_b, 0.U(1.U))
    val imm_j = Cat(inst(31), inst(19, 12), inst(20), inst(30, 21))
    val imm_j_sext = Cat(Fill(11, imm_j(19)), imm_j, 0.U(1.U))
    val imm_u = inst(31,12)
    val imm_u_shifted = Cat(imm_u, Fill(12, 0.U))
    val imm_z = inst(19,15)                             //U-type imm
    val imm_z_uext = Cat(Fill(27, 0.U), imm_z)          //unsign-extend imm_z

    val inst_type = ListLookup(inst,
        List(ALU_NULL, OP1_RS1, OP2_RS2, MEN_NULL, REN_NULL, WB_NULL  , CSR_NULL),
        Array(
            LW    -> List(ALU_ADD  , OP1_RS1 , OP2_IMI , MEN_NULL, REN_EN  , WB_MEM , CSR_NULL),
            SW    -> List(ALU_ADD  , OP1_RS1 , OP2_IMS , MEN_EN  , REN_NULL, WB_NULL, CSR_NULL),
            ADD   -> List(ALU_ADD  , OP1_RS1 , OP2_RS2 , MEN_NULL, REN_EN  , WB_ALU , CSR_NULL),
            ADDI  -> List(ALU_ADD  , OP1_RS1 , OP2_IMI , MEN_NULL, REN_EN  , WB_ALU , CSR_NULL),
            SUB   -> List(ALU_SUB  , OP1_RS1 , OP2_RS2 , MEN_NULL, REN_EN  , WB_ALU , CSR_NULL),
            AND   -> List(ALU_AND  , OP1_RS1 , OP2_RS2 , MEN_NULL, REN_EN  , WB_ALU , CSR_NULL),
            OR    -> List(ALU_OR   , OP1_RS1 , OP2_RS2 , MEN_NULL, REN_EN  , WB_ALU , CSR_NULL),
            XOR   -> List(ALU_XOR  , OP1_RS1 , OP2_RS2 , MEN_NULL, REN_EN  , WB_ALU , CSR_NULL),
            ANDI  -> List(ALU_AND  , OP1_RS1 , OP2_IMI , MEN_NULL, REN_EN  , WB_ALU , CSR_NULL),
            ORI   -> List(ALU_OR   , OP1_RS1 , OP2_IMI , MEN_NULL, REN_EN  , WB_ALU , CSR_NULL),
            XORI  -> List(ALU_XOR  , OP1_RS1 , OP2_IMI , MEN_NULL, REN_EN  , WB_ALU , CSR_NULL),
            SLL   -> List(ALU_SLL  , OP1_RS1 , OP2_RS2 , MEN_NULL, REN_EN  , WB_ALU , CSR_NULL),
            SRL   -> List(ALU_SRL  , OP1_RS1 , OP2_RS2 , MEN_NULL, REN_EN  , WB_ALU , CSR_NULL),
            SRA   -> List(ALU_SRA  , OP1_RS1 , OP2_RS2 , MEN_NULL, REN_EN  , WB_ALU , CSR_NULL),
            SLLI  -> List(ALU_SLL  , OP1_RS1 , OP2_IMI , MEN_NULL, REN_EN  , WB_ALU , CSR_NULL),
            SRLI  -> List(ALU_SRL  , OP1_RS1 , OP2_IMI , MEN_NULL, REN_EN  , WB_ALU , CSR_NULL),
            SRAI  -> List(ALU_SRA  , OP1_RS1 , OP2_IMI , MEN_NULL, REN_EN  , WB_ALU , CSR_NULL),
            SLT   -> List(ALU_SLT  , OP1_RS1 , OP2_RS2 , MEN_NULL, REN_EN  , WB_ALU , CSR_NULL),
            SLTU  -> List(ALU_SLTU , OP1_RS1 , OP2_RS2 , MEN_NULL, REN_EN  , WB_ALU , CSR_NULL),
            SLTI  -> List(ALU_SLT  , OP1_RS1 , OP2_IMI , MEN_NULL, REN_EN  , WB_ALU , CSR_NULL),
            SLTIU -> List(ALU_SLTU , OP1_RS1 , OP2_IMI , MEN_NULL, REN_EN  , WB_ALU , CSR_NULL),
            BEQ   -> List(BR_BEQ   , OP1_RS1 , OP2_RS2 , MEN_NULL, REN_NULL, WB_NULL, CSR_NULL),
            BNE   -> List(BR_BNE   , OP1_RS1 , OP2_RS2 , MEN_NULL, REN_NULL, WB_NULL, CSR_NULL),
            BGE   -> List(BR_BGE   , OP1_RS1 , OP2_RS2 , MEN_NULL, REN_NULL, WB_NULL, CSR_NULL),
            BGEU  -> List(BR_BGEU  , OP1_RS1 , OP2_RS2 , MEN_NULL, REN_NULL, WB_NULL, CSR_NULL),
            BLT   -> List(BR_BLT   , OP1_RS1 , OP2_RS2 , MEN_NULL, REN_NULL, WB_NULL, CSR_NULL),
            BLTU  -> List(BR_BLTU  , OP1_RS1 , OP2_RS2 , MEN_NULL, REN_NULL, WB_NULL, CSR_NULL),
            JAL   -> List(ALU_ADD  , OP1_PC  , OP2_IMJ , MEN_NULL, REN_EN  , WB_PC  , CSR_NULL),
            JALR  -> List(ALU_JALR , OP1_RS1 , OP2_IMI , MEN_NULL, REN_EN  , WB_PC  , CSR_NULL),
            LUI   -> List(ALU_ADD  , OP1_NULL, OP2_IMU , MEN_NULL, REN_EN  , WB_ALU , CSR_NULL),
            AUIPC -> List(ALU_ADD  , OP1_PC  , OP2_IMU , MEN_NULL, REN_EN  , WB_ALU , CSR_NULL),
            CSRRW -> List(ALU_COPY1, OP1_RS1 , OP2_NULL, MEN_NULL, REN_EN  , WB_CSR , CSR_W   ),
            CSRRWI-> List(ALU_COPY1, OP1_IMZ , OP2_NULL, MEN_NULL, REN_EN  , WB_CSR , CSR_W   ),
            CSRRS -> List(ALU_COPY1, OP1_RS1 , OP2_NULL, MEN_NULL, REN_EN  , WB_CSR , CSR_S   ),
            CSRRSI-> List(ALU_COPY1, OP1_IMZ , OP2_NULL, MEN_NULL, REN_EN  , WB_CSR , CSR_S   ),
            CSRRC -> List(ALU_COPY1, OP1_RS1 , OP2_NULL, MEN_NULL, REN_EN  , WB_CSR , CSR_C   ),
            CSRRCI-> List(ALU_COPY1, OP1_IMZ , OP2_NULL, MEN_NULL, REN_EN  , WB_CSR , CSR_C   ),
            ECALL -> List(ALU_NULL , OP1_NULL, OP2_NULL, MEN_NULL, REN_NULL, WB_NULL, CSR_E   )
        )
    )
    val exe_fun :: op1_sel :: op2_sel :: mem_wen :: rd_wen :: rd_sel :: csr_cmd :: Nil = inst_type

    val op1_data = MuxCase(0.U(WORD_LEN.W), Seq(
        (op1_sel === OP1_RS1) -> rs1_data,
        (op1_sel === OP1_PC ) -> reg_pc,
        (op1_sel === OP1_IMZ) -> imm_z_uext
    ))

    val op2_data = MuxCase(0.U(WORD_LEN.W), Seq(
        (op2_sel === OP2_RS2) -> rs2_data,
        (op2_sel === OP2_IMI) -> imm_i_sext,
        (op2_sel === OP2_IMS) -> imm_s_sext,
        (op2_sel === OP2_IMJ) -> imm_j_sext,
        (op2_sel === OP2_IMU) -> imm_u_shifted
    ))



    //********** Instruction Execute (EX) Stage **********
    alu_out := MuxCase(0.U(WORD_LEN.W), Seq(
        (exe_fun === ALU_ADD)   -> (op1_data + op2_data),
        (exe_fun === ALU_SUB)   -> (op1_data - op2_data),
        (exe_fun === ALU_AND)   -> (op1_data & op2_data),
        (exe_fun === ALU_OR)    -> (op1_data | op2_data),
        (exe_fun === ALU_XOR)   -> (op1_data ^ op2_data),
        (exe_fun === ALU_SLL)   -> (op1_data << op2_data(4, 0))(31, 0),
        (exe_fun === ALU_SRL)   -> (op1_data >> op2_data(4, 0)).asUInt(),
        (exe_fun === ALU_SRA)   -> (op1_data.asSInt() >> op2_data(4, 0)).asUInt(),
        (exe_fun === ALU_SLT)   -> (op1_data.asSInt() < op2_data.asSInt()).asUInt(),
        (exe_fun === ALU_SLTU)  -> (op1_data < op2_data).asUInt(),
        (exe_fun === ALU_JALR)  -> ((op1_data + op2_data) & ~1.U(WORD_LEN.W)),
        (exe_fun === ALU_COPY1) -> op1_data
    ))

    //branch
    br_target := reg_pc + imm_b_sext
    br_flag := MuxCase(false.B, Seq(
        (exe_fun === BR_BEQ)  ->  (op1_data === op2_data),
        (exe_fun === BR_BNE)  -> !(op1_data === op2_data),
        (exe_fun === BR_BLT)  ->  (op1_data.asSInt() < op2_data.asSInt()),
        (exe_fun === BR_BGE)  -> !(op1_data.asSInt() < op2_data.asSInt()),
        (exe_fun === BR_BLTU) ->  (op1_data < op2_data),
        (exe_fun === BR_BGEU) -> !(op1_data < op2_data)
    ))

    //jump
    jump_flag := (rd_sel === WB_PC)

    //**********    Memory Access (MEM) Stage   **********
    io.datamem.addr  := alu_out
    io.datamem.wen   := mem_wen.asBool()
    io.datamem.wdata := rs2_data

    //CSR operation
    val csr_addr = MuxCase(csr_addr_default, Seq(
        (csr_cmd === CSR_E) -> 0x342.U(CSR_ADDR_LEN.W)
    ))
    val csr_rdata = reg_csr(csr_addr)
    val csr_wdata = MuxCase(0.U(WORD_LEN.W), Seq(
        (csr_cmd === CSR_W) -> op1_data,
        (csr_cmd === CSR_S) -> (csr_rdata | op1_data),
        (csr_cmd === CSR_C) -> (csr_rdata & ~op1_data),
        (csr_cmd === CSR_E) -> 11.U(WORD_LEN.W)
    ))
    when(csr_cmd =/= CSR_NULL){
        reg_csr(csr_addr) := csr_wdata
    }


    //**********     Write Back (WB) Stage      **********
    val rd_data = MuxCase(alu_out, Seq(
        (rd_sel === WB_MEM) -> io.datamem.rdata,
        (rd_sel === WB_PC)  -> reg_pc_next_default,
        (rd_sel === WB_CSR) -> csr_rdata
    ))

    when(rd_wen === REN_EN){
        reg_x(rd_addr) := rd_data
    }

    io.exit := MuxCase(false.asBool, Seq(
        (inst === UNIMP) -> true.asBool,
        (inst === EXIT_INST) -> true.asBool,
        (reg_pc === EXIT_PC) -> true.asBool
    ))

    //print the information during the simulation
    printf("-----------------------START----------------------\n")
    printf("-------------IF------------\n")
    printf(p"reg_pc: 0x${Hexadecimal(reg_pc)}\n")
    printf(p"inst: 0x${Hexadecimal(inst)}\n")
    printf("-------------ID------------\n")
    printf(p"rs1_addr: $rs1_addr\n")
    printf(p"rs2_addr: $rs2_addr\n")
    printf(p"op1_data: 0x${Hexadecimal(op1_data)}\n")
    printf(p"op2_data: 0x${Hexadecimal(op2_data)}\n")
    printf("-------------EX------------\n")
    printf(p"alu_out: 0x${Hexadecimal(alu_out)}\n")
    printf(p"branch_flg: $br_flag\n")
    printf(p"branch_target: 0x${Hexadecimal(br_target)}\n")
    printf(p"jump_flg: $jump_flag\n")
    printf("-------------MEM-----------\n")
    printf(p"datamem.wen: ${io.datamem.wen}\n")
    printf(p"datamem.wdata: 0x${Hexadecimal(io.datamem.wdata)}\n")
    printf(p"csr_wdata: 0x${Hexadecimal(csr_wdata)}\n")
    printf("-------------WB------------\n")
    printf(p"rd_wen: $rd_wen\n")
    printf(p"rd_addr: $rd_addr\n")
    printf(p"rd_data: 0x${Hexadecimal(rd_data)}\n")
    printf("------------------------END-----------------------\n")
    printf(p"exit: ${io.exit}\n")
    printf(p"globalpointer: ${reg_x(3)}\n")
    printf("\n")
}

