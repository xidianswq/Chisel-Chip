package cpu_pipeline

import chisel3._
import chisel3.util._
import public.Consts._
import public.Instructions._

/*
type: IO Port
name: ID_IO(译码器接口)
op1_data: Operand 1 data,output
op2_data: Operand 2 data,output
rd_addr: Register destination address,output
csr_addr_default: CSR address,default value,output

exe_fun: Execution function,output
op1_sel: Operand 1 select,output
op2_sel: Operand 2 select,output
mem_wen: Memory write enable,output
rd_wen: Register write enable,output
rd_sel: Register destination select,output
csr_cmd: CSR command,output

rs2_data: Register 2 data,output            (MEM stage,datamem rdata)
imm_b_sext: Sign-extend B-type imm,output   (EX stage,BR br_target)
*/
class ID_IO extends Bundle{
    val op1_data = Output(UInt(WORD_LEN.W))
    val op2_data = Output(UInt(WORD_LEN.W))
    val rd_addr = Output(UInt(REGX_ADDR_LEN.W))
    val csr_addr_default = Output(UInt(WORD_LEN.W))

    val exe_fun = Output(UInt(EXE_FUN_LEN.W))
    val mem_wen = Output(UInt(MEN_LEN.W))
    val rd_wen  = Output(UInt(REN_LEN.W))
    val rd_sel  = Output(UInt(WB_LEN.W))
    val csr_cmd = Output(UInt(CSR_LEN.W))

    val rs2_data = Output(UInt(WORD_LEN.W))        
    val imm_b_sext = Output(UInt(WORD_LEN.W))

    val stall_flag = Output(Bool())
}

/*
type: Hardware
name: ID Pipeline Register(译码器流水线寄存器)
*/
class ID_IO_REG extends Module{
    val io = IO(new Bundle{
        val in  = Flipped(new ID_IO())
        val out = new ID_IO()
    })

    val id_io_reg = RegInit(0.U.asTypeOf(new ID_IO()))

    id_io_reg := io.in
    io.out := id_io_reg
}

/*
type: Hardware
name: Instruction Decoder(指令译码器)
*/
class ID extends Module{
    val io = IO(new Bundle{
        val in = new Bundle{
            val if_in = Flipped(new PC_IO())
            val id_reg_in = Flipped(new ID_IO())
            val mem_in = Flipped(new WB_IO())
            val wb_in = Flipped(new WB_IO())
        }
        val out = new ID_IO()
    })

    //register file
    val reg_x = RegInit(VecInit(Seq.fill(REGX_Num)(0.U(WORD_LEN.W))))

    //input wire connection
    val inst_default = io.in.if_in.inst
    val reg_pc = io.in.if_in.reg_pc
    val br_flag = io.in.if_in.br_flag
    val jump_flag = io.in.if_in.jump_flag
    val ex_rd_wen   = io.in.id_reg_in.rd_wen
    val ex_rd_addr  = io.in.id_reg_in.rd_addr
    val mem_rd_wen  = io.in.mem_in.rd_wen
    val mem_rd_addr = io.in.mem_in.rd_addr
    val mem_rd_data = io.in.mem_in.rd_data
    val wb_rd_wen   = io.in.wb_in.rd_wen
    val wb_rd_addr  = io.in.wb_in.rd_addr
    val wb_rd_data  = io.in.wb_in.rd_data
    
    //data_hazard stall logic
    val rs1_addr_default = inst_default(19, 15)
    val rs2_addr_default = inst_default(24, 20)
    val rs1_data_hazard = (ex_rd_wen === REN_EN) && (rs1_addr_default =/= 0.U) && (rs1_addr_default === ex_rd_addr)
    val rs2_data_hazard = (ex_rd_wen === REN_EN) && (rs2_addr_default =/= 0.U) && (rs2_addr_default === ex_rd_addr)
    val stall_flag = (rs1_data_hazard || rs2_data_hazard)
    val inst = MuxCase(inst_default, Seq(
        (br_flag || jump_flag || stall_flag) -> NOP
    ))

    //decode logic
    val rs1_addr = inst(19, 15)
    val rs2_addr = inst(24, 20)
    val rd_addr  = inst(11, 7)
    val csr_addr_default = inst(31,20)
    val rs1_data = MuxCase(reg_x(rs1_addr),Seq(
        (rs1_addr === 0.U(REGX_ADDR_LEN.W)) -> 0.U(WORD_LEN.W),
        ((rs1_addr === mem_rd_addr) && (mem_rd_wen === REN_EN)) -> mem_rd_data, //direct connect(from MEM_logic)
        ((rs1_addr === wb_rd_addr) && (wb_rd_wen === REN_EN)) -> wb_rd_data     //direct connect(from WB_logic/MEM_reg)
    ))
    val rs2_data = MuxCase(reg_x(rs2_addr),Seq(
        (rs2_addr === 0.U(REGX_ADDR_LEN.W)) -> 0.U(WORD_LEN.W),
        ((rs2_addr === mem_rd_addr) && (mem_rd_wen === REN_EN)) -> mem_rd_data, //direct connect(from MEM_logic)
        ((rs2_addr === wb_rd_addr) && (wb_rd_wen === REN_EN)) -> wb_rd_data     //direct connect(from WB_logic/MEM_reg)
    ))
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

    //write back logic
    when(wb_rd_wen === REN_EN && wb_rd_addr =/= 0.U(WORD_LEN.W)){
        reg_x(wb_rd_addr) := wb_rd_data
    }

    //output wire connection
    io.out.op1_data := op1_data
    io.out.op2_data := op2_data
    io.out.rd_addr := rd_addr
    io.out.csr_addr_default := csr_addr_default
    
    io.out.exe_fun := exe_fun
    io.out.mem_wen := mem_wen
    io.out.rd_wen := rd_wen
    io.out.rd_sel := rd_sel
    io.out.csr_cmd := csr_cmd

    io.out.rs2_data := rs2_data
    io.out.imm_b_sext := imm_b_sext

    io.out.stall_flag := stall_flag
    
    //debug info
    printf("-------------ID------------\n")
    printf(p"rs1_addr: $rs1_addr\n")
    printf(p"rs2_addr: $rs2_addr\n")
    printf(p"op1_data: 0x${Hexadecimal(op1_data)}\n")
    printf(p"op2_data: 0x${Hexadecimal(op2_data)}\n")
    printf(p"stall_flag: $stall_flag\n")
}
