package score

import chisel3._
import chisel3.util._
import public.PConsts._
import public.Instructions._

/*
type: IO Port
name: BP_IO(分支预测器接口)
pred_flag: 预测标志位,output
pred_target: 预测目标地址,output
*/
class BP_IO extends Bundle {
    val pred_flag   = Output(Bool())
    val pred_target = Output(UInt(WORD_LEN.W))
}

/*
type: Hardware
name: BP Pipeline Register(分支预测器流水线寄存器)
*/
class BP_IO_REG extends Module {
    val io = IO(new Bundle {
        val in  = Flipped(new BP_IO())
        val out = new BP_IO()
    })

    val bp_io_reg = RegInit(0.U.asTypeOf(new BP_IO()))

    bp_io_reg := io.in
    io.out    := bp_io_reg
}

/*
type: Hardware
name: BP(分支预测器)
note: 采用2位饱和计数器构成的两级预测器+分支目标缓冲器的分支预测器
*/
class BP extends Module {
    val io = IO(new Bundle {
        val in = new Bundle {
            val pc_io    = Flipped(new PC_IO())
            val ex_pc_io = Flipped(new PC_IO())
            val ex_io    = Flipped(new EX_IO())
        }
        val out     = new BP_IO()
    })

    // saturating counter
    val sNT::wNT::wT::sT::Nil   = Enum(4)
    // storage elements
    val branch_history          = RegInit(VecInit(Seq.fill(TABLE_DEPTH)(0.U(TABLE_WIDTH.W))))
    val pattern_table           = RegInit(VecInit(Seq.fill(TABLE_DEPTH)(wNT)))
    val branch_target_buffer    = RegInit(VecInit(Seq.fill(TABLE_DEPTH)(0.U(IMEM_WIDTH.W))))

    // input wire connection
    val reg_pc      = io.in.pc_io.reg_pc
    val inst        = io.in.pc_io.inst

    val ex_reg_pc   = io.in.ex_pc_io.reg_pc
    val ex_iost     = io.in.ex_pc_io.inst
    val ex_pt_flag  = io.in.ex_io.br_io.pt_flag
    val jump_flag   = io.in.ex_io.alu_io.jump_flag
    val jump_target = io.in.ex_io.alu_io.alu_out
    val br_flag     = io.in.ex_io.br_io.br_flag
    val br_target   = io.in.ex_io.br_io.br_target

    // updata logic
    val bh_mask     = 0xFF.U(TABLE_WIDTH.W) // 10 bits mask for branch history index
    val ex_bh_iodex = ex_reg_pc(TABLE_WIDTH+1, 2) // 10 bits for index
    val ex_bh_value = branch_history(ex_bh_iodex) & bh_mask
    val ex_pt_value = pattern_table(ex_bh_value)
    val shifted_bh  = (ex_bh_value << 1)(TABLE_WIDTH-1, 0)
    val new_bh_value= WireInit(shifted_bh)
    def nextState(state: UInt, br_flag: Bool): UInt = {
        val new_state = WireDefault(wNT)
        switch(state) {
            is(sNT) { new_state := Mux(br_flag, wNT, sNT) }
            is(wNT) { new_state := Mux(br_flag, wT , sNT) }
            is(wT)  { new_state := Mux(br_flag, sT , wNT) }
            is(sT)  { new_state := Mux(br_flag, sT , wT ) }
        }
        new_state
    }

    new_bh_value    := (ex_bh_value << 1)(TABLE_WIDTH-1, 0)
    when(ex_pt_flag){
        // updata branch history and pattern table
        new_bh_value := shifted_bh | br_flag.asUInt
        branch_history(ex_bh_iodex) := new_bh_value
        pattern_table(new_bh_value) := nextState(ex_pt_value, br_flag)
    }
    when(br_flag || jump_flag) {
        // update branch target buffer
        branch_target_buffer(ex_bh_iodex) := Mux(br_flag, br_target, jump_target)
    }

    // branch prediction logic  
    val bh_iodex    = reg_pc(TABLE_WIDTH+1, 2) // 10 bits for index
    val bh_value    = branch_history(bh_iodex) & bh_mask
    val pt_value    = pattern_table(bh_value)
    val pred_flag   = WireInit(false.B)
    val pred_target = WireInit(0.U(WORD_LEN.W))

    val pt_flag   = MuxCase(false.B, Seq(
        (inst === BEQ ) -> true.B,
        (inst === BNE ) -> true.B,
        (inst === BGE ) -> true.B,
        (inst === BGEU) -> true.B,
        (inst === BLT ) -> true.B,
        (inst === BLTU) -> true.B
    ))
    when(pt_flag) {
        when(pt_value === wT || pt_value === sT) {
            pred_flag := true.B
        }.otherwise {
            pred_flag := false.B
        }
    }.otherwise{
        when(inst === JAL || inst === JALR){
            pred_flag := true.B
        }.otherwise {
            pred_flag := false.B
        } 
    }
    val btb_value    = branch_target_buffer(bh_iodex)
    pred_target     := Mux(pred_flag && btb_value =/= 0.U, btb_value, reg_pc+4.U(WORD_LEN.W))

    // output wire connection
    io.out.pred_flag   := pred_flag
    io.out.pred_target := pred_target
}