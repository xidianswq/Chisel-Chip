package score

import chisel3._
import chisel3.util._
import public.PConsts._

/*
type: IO Port
name: WB_IO(写回接口)
rd_wen: Register write enable,output
rd_addr: Register write address,output
rd_data: Register write data,output
*/
class WB_IO extends Bundle{
    val rd_wen  = Output(UInt(REN_LEN.W))
    val rd_addr = Output(UInt(REGX_ADDR_LEN.W))
    val rd_data = Output(UInt(WORD_LEN.W))
}

/*
type: Hardware
name: WB Pipeline Register(写回阶段流水线寄存器)
*/
class WB_IO_REG extends Module{
    val io = IO(new Bundle{
        val in  = Flipped(new WB_IO())
        val out = new WB_IO()
    })

    val wb_io_reg = RegInit(0.U.asTypeOf(new WB_IO()))

    wb_io_reg   := io.in
    io.out      := wb_io_reg
}

/*
type: Hardware
name: Write back unit(写回单元)
*/
class WB extends Module{
    val io = IO(new Bundle{
        val in = new Bundle{
            //val mem_io = Flipped(new MEM_IO())
            val mem_io = Flipped(new WB_IO())
        }
        val out = new WB_IO()
    })

    // input wire connection
    val rd_wen  = io.in.mem_io.rd_wen
    val rd_addr = io.in.mem_io.rd_addr
    val rd_data = io.in.mem_io.rd_data

    // output wire connection
    io.out.rd_wen   := rd_wen
    io.out.rd_addr  := rd_addr
    io.out.rd_data  := rd_data

    // debug info
    // printf("-------------WB------------\n")
    // printf(p"rd_wen: $rd_wen\n")
    // printf(p"rd_addr: $rd_addr\n")
    // printf(p"rd_data: 0x${Hexadecimal(rd_data)}\n")
}
