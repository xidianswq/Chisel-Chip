module Memory(
  input         clock,
  input  [31:0] io_instmem_addr,
  output [31:0] io_instmem_inst,
  input  [31:0] io_datamem_addr,
  output [31:0] io_datamem_rdata,
  input         io_datamem_wen,
  input  [31:0] io_datamem_wdata
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
  reg [7:0] mem [0:1023]; // @[Memory.scala 45:18]
  wire [7:0] mem_io_instmem_inst_hi_hi_data; // @[Memory.scala 45:18]
  wire [9:0] mem_io_instmem_inst_hi_hi_addr; // @[Memory.scala 45:18]
  wire [7:0] mem_io_instmem_inst_hi_lo_data; // @[Memory.scala 45:18]
  wire [9:0] mem_io_instmem_inst_hi_lo_addr; // @[Memory.scala 45:18]
  wire [7:0] mem_io_instmem_inst_lo_hi_data; // @[Memory.scala 45:18]
  wire [9:0] mem_io_instmem_inst_lo_hi_addr; // @[Memory.scala 45:18]
  wire [7:0] mem_io_instmem_inst_lo_lo_data; // @[Memory.scala 45:18]
  wire [9:0] mem_io_instmem_inst_lo_lo_addr; // @[Memory.scala 45:18]
  wire [7:0] mem_io_datamem_rdata_hi_hi_data; // @[Memory.scala 45:18]
  wire [9:0] mem_io_datamem_rdata_hi_hi_addr; // @[Memory.scala 45:18]
  wire [7:0] mem_io_datamem_rdata_hi_lo_data; // @[Memory.scala 45:18]
  wire [9:0] mem_io_datamem_rdata_hi_lo_addr; // @[Memory.scala 45:18]
  wire [7:0] mem_io_datamem_rdata_lo_hi_data; // @[Memory.scala 45:18]
  wire [9:0] mem_io_datamem_rdata_lo_hi_addr; // @[Memory.scala 45:18]
  wire [7:0] mem_io_datamem_rdata_lo_lo_data; // @[Memory.scala 45:18]
  wire [9:0] mem_io_datamem_rdata_lo_lo_addr; // @[Memory.scala 45:18]
  wire [7:0] mem_MPORT_data; // @[Memory.scala 45:18]
  wire [9:0] mem_MPORT_addr; // @[Memory.scala 45:18]
  wire  mem_MPORT_mask; // @[Memory.scala 45:18]
  wire  mem_MPORT_en; // @[Memory.scala 45:18]
  wire [7:0] mem_MPORT_1_data; // @[Memory.scala 45:18]
  wire [9:0] mem_MPORT_1_addr; // @[Memory.scala 45:18]
  wire  mem_MPORT_1_mask; // @[Memory.scala 45:18]
  wire  mem_MPORT_1_en; // @[Memory.scala 45:18]
  wire [7:0] mem_MPORT_2_data; // @[Memory.scala 45:18]
  wire [9:0] mem_MPORT_2_addr; // @[Memory.scala 45:18]
  wire  mem_MPORT_2_mask; // @[Memory.scala 45:18]
  wire  mem_MPORT_2_en; // @[Memory.scala 45:18]
  wire [7:0] mem_MPORT_3_data; // @[Memory.scala 45:18]
  wire [9:0] mem_MPORT_3_addr; // @[Memory.scala 45:18]
  wire  mem_MPORT_3_mask; // @[Memory.scala 45:18]
  wire  mem_MPORT_3_en; // @[Memory.scala 45:18]
  wire [31:0] _io_instmem_inst_T_1 = io_instmem_addr + 32'h3; // @[Memory.scala 51:29]
  wire [31:0] _io_instmem_inst_T_4 = io_instmem_addr + 32'h2; // @[Memory.scala 52:29]
  wire [31:0] _io_instmem_inst_T_7 = io_instmem_addr + 32'h1; // @[Memory.scala 53:29]
  wire [15:0] io_instmem_inst_lo = {mem_io_instmem_inst_lo_hi_data,mem_io_instmem_inst_lo_lo_data}; // @[Cat.scala 30:58]
  wire [15:0] io_instmem_inst_hi = {mem_io_instmem_inst_hi_hi_data,mem_io_instmem_inst_hi_lo_data}; // @[Cat.scala 30:58]
  wire [31:0] _io_datamem_rdata_T_1 = io_datamem_addr + 32'h3; // @[Memory.scala 58:29]
  wire [31:0] _io_datamem_rdata_T_4 = io_datamem_addr + 32'h2; // @[Memory.scala 59:29]
  wire [31:0] _io_datamem_rdata_T_7 = io_datamem_addr + 32'h1; // @[Memory.scala 60:29]
  wire [15:0] io_datamem_rdata_lo = {mem_io_datamem_rdata_lo_hi_data,mem_io_datamem_rdata_lo_lo_data}; // @[Cat.scala 30:58]
  wire [15:0] io_datamem_rdata_hi = {mem_io_datamem_rdata_hi_hi_data,mem_io_datamem_rdata_hi_lo_data}; // @[Cat.scala 30:58]
  assign mem_io_instmem_inst_hi_hi_addr = _io_instmem_inst_T_1[9:0];
  assign mem_io_instmem_inst_hi_hi_data = mem[mem_io_instmem_inst_hi_hi_addr]; // @[Memory.scala 45:18]
  assign mem_io_instmem_inst_hi_lo_addr = _io_instmem_inst_T_4[9:0];
  assign mem_io_instmem_inst_hi_lo_data = mem[mem_io_instmem_inst_hi_lo_addr]; // @[Memory.scala 45:18]
  assign mem_io_instmem_inst_lo_hi_addr = _io_instmem_inst_T_7[9:0];
  assign mem_io_instmem_inst_lo_hi_data = mem[mem_io_instmem_inst_lo_hi_addr]; // @[Memory.scala 45:18]
  assign mem_io_instmem_inst_lo_lo_addr = io_instmem_addr[9:0];
  assign mem_io_instmem_inst_lo_lo_data = mem[mem_io_instmem_inst_lo_lo_addr]; // @[Memory.scala 45:18]
  assign mem_io_datamem_rdata_hi_hi_addr = _io_datamem_rdata_T_1[9:0];
  assign mem_io_datamem_rdata_hi_hi_data = mem[mem_io_datamem_rdata_hi_hi_addr]; // @[Memory.scala 45:18]
  assign mem_io_datamem_rdata_hi_lo_addr = _io_datamem_rdata_T_4[9:0];
  assign mem_io_datamem_rdata_hi_lo_data = mem[mem_io_datamem_rdata_hi_lo_addr]; // @[Memory.scala 45:18]
  assign mem_io_datamem_rdata_lo_hi_addr = _io_datamem_rdata_T_7[9:0];
  assign mem_io_datamem_rdata_lo_hi_data = mem[mem_io_datamem_rdata_lo_hi_addr]; // @[Memory.scala 45:18]
  assign mem_io_datamem_rdata_lo_lo_addr = io_datamem_addr[9:0];
  assign mem_io_datamem_rdata_lo_lo_data = mem[mem_io_datamem_rdata_lo_lo_addr]; // @[Memory.scala 45:18]
  assign mem_MPORT_data = io_datamem_wdata[7:0];
  assign mem_MPORT_addr = io_datamem_addr[9:0];
  assign mem_MPORT_mask = 1'h1;
  assign mem_MPORT_en = io_datamem_wen;
  assign mem_MPORT_1_data = io_datamem_wdata[15:8];
  assign mem_MPORT_1_addr = _io_datamem_rdata_T_7[9:0];
  assign mem_MPORT_1_mask = 1'h1;
  assign mem_MPORT_1_en = io_datamem_wen;
  assign mem_MPORT_2_data = io_datamem_wdata[23:16];
  assign mem_MPORT_2_addr = _io_datamem_rdata_T_4[9:0];
  assign mem_MPORT_2_mask = 1'h1;
  assign mem_MPORT_2_en = io_datamem_wen;
  assign mem_MPORT_3_data = io_datamem_wdata[31:24];
  assign mem_MPORT_3_addr = _io_datamem_rdata_T_1[9:0];
  assign mem_MPORT_3_mask = 1'h1;
  assign mem_MPORT_3_en = io_datamem_wen;
  assign io_instmem_inst = {io_instmem_inst_hi,io_instmem_inst_lo}; // @[Cat.scala 30:58]
  assign io_datamem_rdata = {io_datamem_rdata_hi,io_datamem_rdata_lo}; // @[Cat.scala 30:58]
  always @(posedge clock) begin
    if(mem_MPORT_en & mem_MPORT_mask) begin
      mem[mem_MPORT_addr] <= mem_MPORT_data; // @[Memory.scala 45:18]
    end
    if(mem_MPORT_1_en & mem_MPORT_1_mask) begin
      mem[mem_MPORT_1_addr] <= mem_MPORT_1_data; // @[Memory.scala 45:18]
    end
    if(mem_MPORT_2_en & mem_MPORT_2_mask) begin
      mem[mem_MPORT_2_addr] <= mem_MPORT_2_data; // @[Memory.scala 45:18]
    end
    if(mem_MPORT_3_en & mem_MPORT_3_mask) begin
      mem[mem_MPORT_3_addr] <= mem_MPORT_3_data; // @[Memory.scala 45:18]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    mem[initvar] = _RAND_0[7:0];
`endif // RANDOMIZE_MEM_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PC(
  input         clock,
  input         reset,
  input         io_in_id_in_stall_flag,
  input  [31:0] io_in_ex_in_alu_out,
  input         io_in_ex_in_jump_flag,
  input         io_in_br_in_br_flag,
  input  [31:0] io_in_br_in_br_target,
  output [31:0] io_out_reg_pc,
  output [31:0] io_out_inst,
  output        io_out_br_flag,
  output        io_out_jump_flag,
  output [31:0] io_instmem_addr,
  input  [31:0] io_instmem_inst
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] reg_pc; // @[PC.scala 100:25]
  wire [31:0] reg_pc_next_default = reg_pc + 32'h4; // @[PC.scala 101:38]
  wire  _T_1 = ~reset; // @[PC.scala 118:11]
  assign io_out_reg_pc = reg_pc; // @[PC.scala 112:19]
  assign io_out_inst = io_instmem_inst; // @[PC.scala 113:17]
  assign io_out_br_flag = io_in_br_in_br_flag; // @[PC.scala 114:20]
  assign io_out_jump_flag = io_in_ex_in_jump_flag; // @[PC.scala 115:22]
  assign io_instmem_addr = reg_pc; // @[PC.scala 111:21]
  always @(posedge clock) begin
    if (reset) begin // @[PC.scala 100:25]
      reg_pc <= 32'h0; // @[PC.scala 100:25]
    end else if (io_in_br_in_br_flag) begin // @[Mux.scala 98:16]
      reg_pc <= io_in_br_in_br_target;
    end else if (io_in_ex_in_jump_flag) begin // @[Mux.scala 98:16]
      reg_pc <= io_in_ex_in_alu_out;
    end else if (!(io_in_id_in_stall_flag)) begin // @[Mux.scala 98:16]
      reg_pc <= reg_pc_next_default;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset) begin
          $fwrite(32'h80000002,"-----------------------START----------------------\n"); // @[PC.scala 118:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1) begin
          $fwrite(32'h80000002,"-------------IF------------\n"); // @[PC.scala 119:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1) begin
          $fwrite(32'h80000002,"reg_pc: 0x%x\n",reg_pc); // @[PC.scala 120:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1) begin
          $fwrite(32'h80000002,"inst: 0x%x\n",io_instmem_inst); // @[PC.scala 121:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  reg_pc = _RAND_0[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ID(
  input         clock,
  input         reset,
  input  [31:0] io_in_if_in_reg_pc,
  input  [31:0] io_in_if_in_inst,
  input         io_in_if_in_br_flag,
  input         io_in_if_in_jump_flag,
  input  [4:0]  io_in_id_reg_in_rd_addr,
  input         io_in_id_reg_in_rd_wen,
  input         io_in_mem_in_rd_wen,
  input  [4:0]  io_in_mem_in_rd_addr,
  input  [31:0] io_in_mem_in_rd_data,
  input         io_in_wb_in_rd_wen,
  input  [4:0]  io_in_wb_in_rd_addr,
  input  [31:0] io_in_wb_in_rd_data,
  output [31:0] io_out_op1_data,
  output [31:0] io_out_op2_data,
  output [4:0]  io_out_rd_addr,
  output [31:0] io_out_csr_addr_default,
  output [4:0]  io_out_exe_fun,
  output        io_out_mem_wen,
  output        io_out_rd_wen,
  output [2:0]  io_out_rd_sel,
  output [2:0]  io_out_csr_cmd,
  output [31:0] io_out_rs2_data,
  output [31:0] io_out_imm_b_sext,
  output        io_out_stall_flag
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] reg_x_0; // @[ID.scala 77:24]
  reg [31:0] reg_x_1; // @[ID.scala 77:24]
  reg [31:0] reg_x_2; // @[ID.scala 77:24]
  reg [31:0] reg_x_3; // @[ID.scala 77:24]
  reg [31:0] reg_x_4; // @[ID.scala 77:24]
  reg [31:0] reg_x_5; // @[ID.scala 77:24]
  reg [31:0] reg_x_6; // @[ID.scala 77:24]
  reg [31:0] reg_x_7; // @[ID.scala 77:24]
  reg [31:0] reg_x_8; // @[ID.scala 77:24]
  reg [31:0] reg_x_9; // @[ID.scala 77:24]
  reg [31:0] reg_x_10; // @[ID.scala 77:24]
  reg [31:0] reg_x_11; // @[ID.scala 77:24]
  reg [31:0] reg_x_12; // @[ID.scala 77:24]
  reg [31:0] reg_x_13; // @[ID.scala 77:24]
  reg [31:0] reg_x_14; // @[ID.scala 77:24]
  reg [31:0] reg_x_15; // @[ID.scala 77:24]
  reg [31:0] reg_x_16; // @[ID.scala 77:24]
  reg [31:0] reg_x_17; // @[ID.scala 77:24]
  reg [31:0] reg_x_18; // @[ID.scala 77:24]
  reg [31:0] reg_x_19; // @[ID.scala 77:24]
  reg [31:0] reg_x_20; // @[ID.scala 77:24]
  reg [31:0] reg_x_21; // @[ID.scala 77:24]
  reg [31:0] reg_x_22; // @[ID.scala 77:24]
  reg [31:0] reg_x_23; // @[ID.scala 77:24]
  reg [31:0] reg_x_24; // @[ID.scala 77:24]
  reg [31:0] reg_x_25; // @[ID.scala 77:24]
  reg [31:0] reg_x_26; // @[ID.scala 77:24]
  reg [31:0] reg_x_27; // @[ID.scala 77:24]
  reg [31:0] reg_x_28; // @[ID.scala 77:24]
  reg [31:0] reg_x_29; // @[ID.scala 77:24]
  reg [31:0] reg_x_30; // @[ID.scala 77:24]
  reg [31:0] reg_x_31; // @[ID.scala 77:24]
  wire [4:0] rs1_addr_default = io_in_if_in_inst[19:15]; // @[ID.scala 94:40]
  wire [4:0] rs2_addr_default = io_in_if_in_inst[24:20]; // @[ID.scala 95:40]
  wire  rs1_data_hazard = io_in_id_reg_in_rd_wen & rs1_addr_default != 5'h0 & rs1_addr_default ==
    io_in_id_reg_in_rd_addr; // @[ID.scala 96:80]
  wire  rs2_data_hazard = io_in_id_reg_in_rd_wen & rs2_addr_default != 5'h0 & rs2_addr_default ==
    io_in_id_reg_in_rd_addr; // @[ID.scala 97:80]
  wire  stall_flag = rs1_data_hazard | rs2_data_hazard; // @[ID.scala 98:39]
  wire  _inst_T_1 = io_in_if_in_br_flag | io_in_if_in_jump_flag | stall_flag; // @[ID.scala 100:31]
  wire [31:0] inst = _inst_T_1 ? 32'h13 : io_in_if_in_inst; // @[Mux.scala 98:16]
  wire [4:0] rs1_addr = inst[19:15]; // @[ID.scala 104:24]
  wire [4:0] rs2_addr = inst[24:20]; // @[ID.scala 105:24]
  wire [4:0] rd_addr = inst[11:7]; // @[ID.scala 106:24]
  wire [11:0] csr_addr_default = inst[31:20]; // @[ID.scala 107:32]
  wire  _rs1_data_T = rs1_addr == 5'h0; // @[ID.scala 109:19]
  wire  _rs1_data_T_3 = rs1_addr == io_in_mem_in_rd_addr & io_in_mem_in_rd_wen; // @[ID.scala 110:37]
  wire  _rs1_data_T_6 = rs1_addr == io_in_wb_in_rd_addr & io_in_wb_in_rd_wen; // @[ID.scala 111:36]
  wire [31:0] _GEN_1 = 5'h1 == rs1_addr ? reg_x_1 : reg_x_0; // @[Mux.scala 98:16 Mux.scala 98:16]
  wire [31:0] _GEN_2 = 5'h2 == rs1_addr ? reg_x_2 : _GEN_1; // @[Mux.scala 98:16 Mux.scala 98:16]
  wire [31:0] _GEN_3 = 5'h3 == rs1_addr ? reg_x_3 : _GEN_2; // @[Mux.scala 98:16 Mux.scala 98:16]
  wire [31:0] _GEN_4 = 5'h4 == rs1_addr ? reg_x_4 : _GEN_3; // @[Mux.scala 98:16 Mux.scala 98:16]
  wire [31:0] _GEN_5 = 5'h5 == rs1_addr ? reg_x_5 : _GEN_4; // @[Mux.scala 98:16 Mux.scala 98:16]
  wire [31:0] _GEN_6 = 5'h6 == rs1_addr ? reg_x_6 : _GEN_5; // @[Mux.scala 98:16 Mux.scala 98:16]
  wire [31:0] _GEN_7 = 5'h7 == rs1_addr ? reg_x_7 : _GEN_6; // @[Mux.scala 98:16 Mux.scala 98:16]
  wire [31:0] _GEN_8 = 5'h8 == rs1_addr ? reg_x_8 : _GEN_7; // @[Mux.scala 98:16 Mux.scala 98:16]
  wire [31:0] _GEN_9 = 5'h9 == rs1_addr ? reg_x_9 : _GEN_8; // @[Mux.scala 98:16 Mux.scala 98:16]
  wire [31:0] _GEN_10 = 5'ha == rs1_addr ? reg_x_10 : _GEN_9; // @[Mux.scala 98:16 Mux.scala 98:16]
  wire [31:0] _GEN_11 = 5'hb == rs1_addr ? reg_x_11 : _GEN_10; // @[Mux.scala 98:16 Mux.scala 98:16]
  wire [31:0] _GEN_12 = 5'hc == rs1_addr ? reg_x_12 : _GEN_11; // @[Mux.scala 98:16 Mux.scala 98:16]
  wire [31:0] _GEN_13 = 5'hd == rs1_addr ? reg_x_13 : _GEN_12; // @[Mux.scala 98:16 Mux.scala 98:16]
  wire [31:0] _GEN_14 = 5'he == rs1_addr ? reg_x_14 : _GEN_13; // @[Mux.scala 98:16 Mux.scala 98:16]
  wire [31:0] _GEN_15 = 5'hf == rs1_addr ? reg_x_15 : _GEN_14; // @[Mux.scala 98:16 Mux.scala 98:16]
  wire [31:0] _GEN_16 = 5'h10 == rs1_addr ? reg_x_16 : _GEN_15; // @[Mux.scala 98:16 Mux.scala 98:16]
  wire [31:0] _GEN_17 = 5'h11 == rs1_addr ? reg_x_17 : _GEN_16; // @[Mux.scala 98:16 Mux.scala 98:16]
  wire [31:0] _GEN_18 = 5'h12 == rs1_addr ? reg_x_18 : _GEN_17; // @[Mux.scala 98:16 Mux.scala 98:16]
  wire [31:0] _GEN_19 = 5'h13 == rs1_addr ? reg_x_19 : _GEN_18; // @[Mux.scala 98:16 Mux.scala 98:16]
  wire [31:0] _GEN_20 = 5'h14 == rs1_addr ? reg_x_20 : _GEN_19; // @[Mux.scala 98:16 Mux.scala 98:16]
  wire [31:0] _GEN_21 = 5'h15 == rs1_addr ? reg_x_21 : _GEN_20; // @[Mux.scala 98:16 Mux.scala 98:16]
  wire [31:0] _GEN_22 = 5'h16 == rs1_addr ? reg_x_22 : _GEN_21; // @[Mux.scala 98:16 Mux.scala 98:16]
  wire [31:0] _GEN_23 = 5'h17 == rs1_addr ? reg_x_23 : _GEN_22; // @[Mux.scala 98:16 Mux.scala 98:16]
  wire [31:0] _GEN_24 = 5'h18 == rs1_addr ? reg_x_24 : _GEN_23; // @[Mux.scala 98:16 Mux.scala 98:16]
  wire [31:0] _GEN_25 = 5'h19 == rs1_addr ? reg_x_25 : _GEN_24; // @[Mux.scala 98:16 Mux.scala 98:16]
  wire [31:0] _GEN_26 = 5'h1a == rs1_addr ? reg_x_26 : _GEN_25; // @[Mux.scala 98:16 Mux.scala 98:16]
  wire [31:0] _GEN_27 = 5'h1b == rs1_addr ? reg_x_27 : _GEN_26; // @[Mux.scala 98:16 Mux.scala 98:16]
  wire [31:0] _GEN_28 = 5'h1c == rs1_addr ? reg_x_28 : _GEN_27; // @[Mux.scala 98:16 Mux.scala 98:16]
  wire [31:0] _GEN_29 = 5'h1d == rs1_addr ? reg_x_29 : _GEN_28; // @[Mux.scala 98:16 Mux.scala 98:16]
  wire [31:0] _GEN_30 = 5'h1e == rs1_addr ? reg_x_30 : _GEN_29; // @[Mux.scala 98:16 Mux.scala 98:16]
  wire [31:0] _GEN_31 = 5'h1f == rs1_addr ? reg_x_31 : _GEN_30; // @[Mux.scala 98:16 Mux.scala 98:16]
  wire [31:0] _rs1_data_T_7 = _rs1_data_T_6 ? io_in_wb_in_rd_data : _GEN_31; // @[Mux.scala 98:16]
  wire [31:0] _rs1_data_T_8 = _rs1_data_T_3 ? io_in_mem_in_rd_data : _rs1_data_T_7; // @[Mux.scala 98:16]
  wire [31:0] rs1_data = _rs1_data_T ? 32'h0 : _rs1_data_T_8; // @[Mux.scala 98:16]
  wire  _rs2_data_T = rs2_addr == 5'h0; // @[ID.scala 114:19]
  wire  _rs2_data_T_3 = rs2_addr == io_in_mem_in_rd_addr & io_in_mem_in_rd_wen; // @[ID.scala 115:37]
  wire  _rs2_data_T_6 = rs2_addr == io_in_wb_in_rd_addr & io_in_wb_in_rd_wen; // @[ID.scala 116:36]
  wire [31:0] _GEN_33 = 5'h1 == rs2_addr ? reg_x_1 : reg_x_0; // @[Mux.scala 98:16 Mux.scala 98:16]
  wire [31:0] _GEN_34 = 5'h2 == rs2_addr ? reg_x_2 : _GEN_33; // @[Mux.scala 98:16 Mux.scala 98:16]
  wire [31:0] _GEN_35 = 5'h3 == rs2_addr ? reg_x_3 : _GEN_34; // @[Mux.scala 98:16 Mux.scala 98:16]
  wire [31:0] _GEN_36 = 5'h4 == rs2_addr ? reg_x_4 : _GEN_35; // @[Mux.scala 98:16 Mux.scala 98:16]
  wire [31:0] _GEN_37 = 5'h5 == rs2_addr ? reg_x_5 : _GEN_36; // @[Mux.scala 98:16 Mux.scala 98:16]
  wire [31:0] _GEN_38 = 5'h6 == rs2_addr ? reg_x_6 : _GEN_37; // @[Mux.scala 98:16 Mux.scala 98:16]
  wire [31:0] _GEN_39 = 5'h7 == rs2_addr ? reg_x_7 : _GEN_38; // @[Mux.scala 98:16 Mux.scala 98:16]
  wire [31:0] _GEN_40 = 5'h8 == rs2_addr ? reg_x_8 : _GEN_39; // @[Mux.scala 98:16 Mux.scala 98:16]
  wire [31:0] _GEN_41 = 5'h9 == rs2_addr ? reg_x_9 : _GEN_40; // @[Mux.scala 98:16 Mux.scala 98:16]
  wire [31:0] _GEN_42 = 5'ha == rs2_addr ? reg_x_10 : _GEN_41; // @[Mux.scala 98:16 Mux.scala 98:16]
  wire [31:0] _GEN_43 = 5'hb == rs2_addr ? reg_x_11 : _GEN_42; // @[Mux.scala 98:16 Mux.scala 98:16]
  wire [31:0] _GEN_44 = 5'hc == rs2_addr ? reg_x_12 : _GEN_43; // @[Mux.scala 98:16 Mux.scala 98:16]
  wire [31:0] _GEN_45 = 5'hd == rs2_addr ? reg_x_13 : _GEN_44; // @[Mux.scala 98:16 Mux.scala 98:16]
  wire [31:0] _GEN_46 = 5'he == rs2_addr ? reg_x_14 : _GEN_45; // @[Mux.scala 98:16 Mux.scala 98:16]
  wire [31:0] _GEN_47 = 5'hf == rs2_addr ? reg_x_15 : _GEN_46; // @[Mux.scala 98:16 Mux.scala 98:16]
  wire [31:0] _GEN_48 = 5'h10 == rs2_addr ? reg_x_16 : _GEN_47; // @[Mux.scala 98:16 Mux.scala 98:16]
  wire [31:0] _GEN_49 = 5'h11 == rs2_addr ? reg_x_17 : _GEN_48; // @[Mux.scala 98:16 Mux.scala 98:16]
  wire [31:0] _GEN_50 = 5'h12 == rs2_addr ? reg_x_18 : _GEN_49; // @[Mux.scala 98:16 Mux.scala 98:16]
  wire [31:0] _GEN_51 = 5'h13 == rs2_addr ? reg_x_19 : _GEN_50; // @[Mux.scala 98:16 Mux.scala 98:16]
  wire [31:0] _GEN_52 = 5'h14 == rs2_addr ? reg_x_20 : _GEN_51; // @[Mux.scala 98:16 Mux.scala 98:16]
  wire [31:0] _GEN_53 = 5'h15 == rs2_addr ? reg_x_21 : _GEN_52; // @[Mux.scala 98:16 Mux.scala 98:16]
  wire [31:0] _GEN_54 = 5'h16 == rs2_addr ? reg_x_22 : _GEN_53; // @[Mux.scala 98:16 Mux.scala 98:16]
  wire [31:0] _GEN_55 = 5'h17 == rs2_addr ? reg_x_23 : _GEN_54; // @[Mux.scala 98:16 Mux.scala 98:16]
  wire [31:0] _GEN_56 = 5'h18 == rs2_addr ? reg_x_24 : _GEN_55; // @[Mux.scala 98:16 Mux.scala 98:16]
  wire [31:0] _GEN_57 = 5'h19 == rs2_addr ? reg_x_25 : _GEN_56; // @[Mux.scala 98:16 Mux.scala 98:16]
  wire [31:0] _GEN_58 = 5'h1a == rs2_addr ? reg_x_26 : _GEN_57; // @[Mux.scala 98:16 Mux.scala 98:16]
  wire [31:0] _GEN_59 = 5'h1b == rs2_addr ? reg_x_27 : _GEN_58; // @[Mux.scala 98:16 Mux.scala 98:16]
  wire [31:0] _GEN_60 = 5'h1c == rs2_addr ? reg_x_28 : _GEN_59; // @[Mux.scala 98:16 Mux.scala 98:16]
  wire [31:0] _GEN_61 = 5'h1d == rs2_addr ? reg_x_29 : _GEN_60; // @[Mux.scala 98:16 Mux.scala 98:16]
  wire [31:0] _GEN_62 = 5'h1e == rs2_addr ? reg_x_30 : _GEN_61; // @[Mux.scala 98:16 Mux.scala 98:16]
  wire [31:0] _GEN_63 = 5'h1f == rs2_addr ? reg_x_31 : _GEN_62; // @[Mux.scala 98:16 Mux.scala 98:16]
  wire [31:0] _rs2_data_T_7 = _rs2_data_T_6 ? io_in_wb_in_rd_data : _GEN_63; // @[Mux.scala 98:16]
  wire [31:0] _rs2_data_T_8 = _rs2_data_T_3 ? io_in_mem_in_rd_data : _rs2_data_T_7; // @[Mux.scala 98:16]
  wire [31:0] rs2_data = _rs2_data_T ? 32'h0 : _rs2_data_T_8; // @[Mux.scala 98:16]
  wire [19:0] imm_i_sext_hi = csr_addr_default[11] ? 20'hfffff : 20'h0; // @[Bitwise.scala 72:12]
  wire [31:0] imm_i_sext = {imm_i_sext_hi,csr_addr_default}; // @[Cat.scala 30:58]
  wire [6:0] imm_s_hi = inst[31:25]; // @[ID.scala 120:28]
  wire [11:0] imm_s = {imm_s_hi,rd_addr}; // @[Cat.scala 30:58]
  wire [19:0] imm_s_sext_hi = imm_s[11] ? 20'hfffff : 20'h0; // @[Bitwise.scala 72:12]
  wire [31:0] imm_s_sext = {imm_s_sext_hi,imm_s_hi,rd_addr}; // @[Cat.scala 30:58]
  wire  imm_b_hi_hi = inst[31]; // @[ID.scala 122:25]
  wire  imm_b_hi_lo = inst[7]; // @[ID.scala 122:35]
  wire [5:0] imm_b_lo_hi = inst[30:25]; // @[ID.scala 122:44]
  wire [3:0] imm_b_lo_lo = inst[11:8]; // @[ID.scala 122:58]
  wire [11:0] imm_b = {imm_b_hi_hi,imm_b_hi_lo,imm_b_lo_hi,imm_b_lo_lo}; // @[Cat.scala 30:58]
  wire [18:0] imm_b_sext_hi_hi = imm_b[11] ? 19'h7ffff : 19'h0; // @[Bitwise.scala 72:12]
  wire [30:0] imm_b_sext_hi = {imm_b_sext_hi_hi,imm_b_hi_hi,imm_b_hi_lo,imm_b_lo_hi,imm_b_lo_lo}; // @[Cat.scala 30:58]
  wire [7:0] imm_j_hi_lo = inst[19:12]; // @[ID.scala 124:35]
  wire  imm_j_lo_hi = inst[20]; // @[ID.scala 124:49]
  wire [9:0] imm_j_lo_lo = inst[30:21]; // @[ID.scala 124:59]
  wire [19:0] imm_j = {imm_b_hi_hi,imm_j_hi_lo,imm_j_lo_hi,imm_j_lo_lo}; // @[Cat.scala 30:58]
  wire [10:0] imm_j_sext_hi_hi = imm_j[19] ? 11'h7ff : 11'h0; // @[Bitwise.scala 72:12]
  wire [31:0] imm_j_sext = {imm_j_sext_hi_hi,imm_b_hi_hi,imm_j_hi_lo,imm_j_lo_hi,imm_j_lo_lo,1'h0}; // @[Cat.scala 30:58]
  wire [19:0] imm_u = inst[31:12]; // @[ID.scala 126:21]
  wire [31:0] imm_u_shifted = {imm_u,12'h0}; // @[Cat.scala 30:58]
  wire [31:0] imm_z_uext = {27'h0,rs1_addr}; // @[Cat.scala 30:58]
  wire [31:0] _inst_type_T = inst & 32'h707f; // @[Lookup.scala 31:38]
  wire  _inst_type_T_1 = 32'h2003 == _inst_type_T; // @[Lookup.scala 31:38]
  wire  _inst_type_T_3 = 32'h2023 == _inst_type_T; // @[Lookup.scala 31:38]
  wire [31:0] _inst_type_T_4 = inst & 32'hfe00707f; // @[Lookup.scala 31:38]
  wire  _inst_type_T_5 = 32'h33 == _inst_type_T_4; // @[Lookup.scala 31:38]
  wire  _inst_type_T_7 = 32'h13 == _inst_type_T; // @[Lookup.scala 31:38]
  wire  _inst_type_T_9 = 32'h40000033 == _inst_type_T_4; // @[Lookup.scala 31:38]
  wire  _inst_type_T_11 = 32'h7033 == _inst_type_T_4; // @[Lookup.scala 31:38]
  wire  _inst_type_T_13 = 32'h6033 == _inst_type_T_4; // @[Lookup.scala 31:38]
  wire  _inst_type_T_15 = 32'h4033 == _inst_type_T_4; // @[Lookup.scala 31:38]
  wire  _inst_type_T_17 = 32'h7013 == _inst_type_T; // @[Lookup.scala 31:38]
  wire  _inst_type_T_19 = 32'h6013 == _inst_type_T; // @[Lookup.scala 31:38]
  wire  _inst_type_T_21 = 32'h4013 == _inst_type_T; // @[Lookup.scala 31:38]
  wire  _inst_type_T_23 = 32'h1033 == _inst_type_T_4; // @[Lookup.scala 31:38]
  wire  _inst_type_T_25 = 32'h5033 == _inst_type_T_4; // @[Lookup.scala 31:38]
  wire  _inst_type_T_27 = 32'h40005033 == _inst_type_T_4; // @[Lookup.scala 31:38]
  wire  _inst_type_T_29 = 32'h1013 == _inst_type_T_4; // @[Lookup.scala 31:38]
  wire  _inst_type_T_31 = 32'h5013 == _inst_type_T_4; // @[Lookup.scala 31:38]
  wire  _inst_type_T_33 = 32'h40005013 == _inst_type_T_4; // @[Lookup.scala 31:38]
  wire  _inst_type_T_35 = 32'h2033 == _inst_type_T_4; // @[Lookup.scala 31:38]
  wire  _inst_type_T_37 = 32'h3033 == _inst_type_T_4; // @[Lookup.scala 31:38]
  wire  _inst_type_T_39 = 32'h2013 == _inst_type_T; // @[Lookup.scala 31:38]
  wire  _inst_type_T_41 = 32'h3013 == _inst_type_T; // @[Lookup.scala 31:38]
  wire  _inst_type_T_43 = 32'h63 == _inst_type_T; // @[Lookup.scala 31:38]
  wire  _inst_type_T_45 = 32'h1063 == _inst_type_T; // @[Lookup.scala 31:38]
  wire  _inst_type_T_47 = 32'h5063 == _inst_type_T; // @[Lookup.scala 31:38]
  wire  _inst_type_T_49 = 32'h7063 == _inst_type_T; // @[Lookup.scala 31:38]
  wire  _inst_type_T_51 = 32'h4063 == _inst_type_T; // @[Lookup.scala 31:38]
  wire  _inst_type_T_53 = 32'h6063 == _inst_type_T; // @[Lookup.scala 31:38]
  wire [31:0] _inst_type_T_54 = inst & 32'h7f; // @[Lookup.scala 31:38]
  wire  _inst_type_T_55 = 32'h6f == _inst_type_T_54; // @[Lookup.scala 31:38]
  wire  _inst_type_T_57 = 32'h67 == _inst_type_T; // @[Lookup.scala 31:38]
  wire  _inst_type_T_59 = 32'h37 == _inst_type_T_54; // @[Lookup.scala 31:38]
  wire  _inst_type_T_61 = 32'h17 == _inst_type_T_54; // @[Lookup.scala 31:38]
  wire  _inst_type_T_63 = 32'h1073 == _inst_type_T; // @[Lookup.scala 31:38]
  wire  _inst_type_T_65 = 32'h5073 == _inst_type_T; // @[Lookup.scala 31:38]
  wire  _inst_type_T_67 = 32'h2073 == _inst_type_T; // @[Lookup.scala 31:38]
  wire  _inst_type_T_69 = 32'h6073 == _inst_type_T; // @[Lookup.scala 31:38]
  wire  _inst_type_T_71 = 32'h3073 == _inst_type_T; // @[Lookup.scala 31:38]
  wire  _inst_type_T_73 = 32'h7073 == _inst_type_T; // @[Lookup.scala 31:38]
  wire  _inst_type_T_75 = 32'h73 == inst; // @[Lookup.scala 31:38]
  wire [4:0] _inst_type_T_77 = _inst_type_T_73 ? 5'h12 : 5'h0; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_78 = _inst_type_T_71 ? 5'h12 : _inst_type_T_77; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_79 = _inst_type_T_69 ? 5'h12 : _inst_type_T_78; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_80 = _inst_type_T_67 ? 5'h12 : _inst_type_T_79; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_81 = _inst_type_T_65 ? 5'h12 : _inst_type_T_80; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_82 = _inst_type_T_63 ? 5'h12 : _inst_type_T_81; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_83 = _inst_type_T_61 ? 5'h1 : _inst_type_T_82; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_84 = _inst_type_T_59 ? 5'h1 : _inst_type_T_83; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_85 = _inst_type_T_57 ? 5'h11 : _inst_type_T_84; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_86 = _inst_type_T_55 ? 5'h1 : _inst_type_T_85; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_87 = _inst_type_T_53 ? 5'hf : _inst_type_T_86; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_88 = _inst_type_T_51 ? 5'hd : _inst_type_T_87; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_89 = _inst_type_T_49 ? 5'h10 : _inst_type_T_88; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_90 = _inst_type_T_47 ? 5'he : _inst_type_T_89; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_91 = _inst_type_T_45 ? 5'hc : _inst_type_T_90; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_92 = _inst_type_T_43 ? 5'hb : _inst_type_T_91; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_93 = _inst_type_T_41 ? 5'ha : _inst_type_T_92; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_94 = _inst_type_T_39 ? 5'h9 : _inst_type_T_93; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_95 = _inst_type_T_37 ? 5'ha : _inst_type_T_94; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_96 = _inst_type_T_35 ? 5'h9 : _inst_type_T_95; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_97 = _inst_type_T_33 ? 5'h8 : _inst_type_T_96; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_98 = _inst_type_T_31 ? 5'h7 : _inst_type_T_97; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_99 = _inst_type_T_29 ? 5'h6 : _inst_type_T_98; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_100 = _inst_type_T_27 ? 5'h8 : _inst_type_T_99; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_101 = _inst_type_T_25 ? 5'h7 : _inst_type_T_100; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_102 = _inst_type_T_23 ? 5'h6 : _inst_type_T_101; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_103 = _inst_type_T_21 ? 5'h5 : _inst_type_T_102; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_104 = _inst_type_T_19 ? 5'h4 : _inst_type_T_103; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_105 = _inst_type_T_17 ? 5'h3 : _inst_type_T_104; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_106 = _inst_type_T_15 ? 5'h5 : _inst_type_T_105; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_107 = _inst_type_T_13 ? 5'h4 : _inst_type_T_106; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_108 = _inst_type_T_11 ? 5'h3 : _inst_type_T_107; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_109 = _inst_type_T_9 ? 5'h2 : _inst_type_T_108; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_110 = _inst_type_T_7 ? 5'h1 : _inst_type_T_109; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_111 = _inst_type_T_5 ? 5'h1 : _inst_type_T_110; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_112 = _inst_type_T_3 ? 5'h1 : _inst_type_T_111; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_113 = _inst_type_T_75 ? 2'h2 : 2'h0; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_114 = _inst_type_T_73 ? 2'h3 : _inst_type_T_113; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_115 = _inst_type_T_71 ? 2'h0 : _inst_type_T_114; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_116 = _inst_type_T_69 ? 2'h3 : _inst_type_T_115; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_117 = _inst_type_T_67 ? 2'h0 : _inst_type_T_116; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_118 = _inst_type_T_65 ? 2'h3 : _inst_type_T_117; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_119 = _inst_type_T_63 ? 2'h0 : _inst_type_T_118; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_120 = _inst_type_T_61 ? 2'h1 : _inst_type_T_119; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_121 = _inst_type_T_59 ? 2'h2 : _inst_type_T_120; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_122 = _inst_type_T_57 ? 2'h0 : _inst_type_T_121; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_123 = _inst_type_T_55 ? 2'h1 : _inst_type_T_122; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_124 = _inst_type_T_53 ? 2'h0 : _inst_type_T_123; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_125 = _inst_type_T_51 ? 2'h0 : _inst_type_T_124; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_126 = _inst_type_T_49 ? 2'h0 : _inst_type_T_125; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_127 = _inst_type_T_47 ? 2'h0 : _inst_type_T_126; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_128 = _inst_type_T_45 ? 2'h0 : _inst_type_T_127; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_129 = _inst_type_T_43 ? 2'h0 : _inst_type_T_128; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_130 = _inst_type_T_41 ? 2'h0 : _inst_type_T_129; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_131 = _inst_type_T_39 ? 2'h0 : _inst_type_T_130; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_132 = _inst_type_T_37 ? 2'h0 : _inst_type_T_131; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_133 = _inst_type_T_35 ? 2'h0 : _inst_type_T_132; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_134 = _inst_type_T_33 ? 2'h0 : _inst_type_T_133; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_135 = _inst_type_T_31 ? 2'h0 : _inst_type_T_134; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_136 = _inst_type_T_29 ? 2'h0 : _inst_type_T_135; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_137 = _inst_type_T_27 ? 2'h0 : _inst_type_T_136; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_138 = _inst_type_T_25 ? 2'h0 : _inst_type_T_137; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_139 = _inst_type_T_23 ? 2'h0 : _inst_type_T_138; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_140 = _inst_type_T_21 ? 2'h0 : _inst_type_T_139; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_141 = _inst_type_T_19 ? 2'h0 : _inst_type_T_140; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_142 = _inst_type_T_17 ? 2'h0 : _inst_type_T_141; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_143 = _inst_type_T_15 ? 2'h0 : _inst_type_T_142; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_144 = _inst_type_T_13 ? 2'h0 : _inst_type_T_143; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_145 = _inst_type_T_11 ? 2'h0 : _inst_type_T_144; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_146 = _inst_type_T_9 ? 2'h0 : _inst_type_T_145; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_147 = _inst_type_T_7 ? 2'h0 : _inst_type_T_146; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_148 = _inst_type_T_5 ? 2'h0 : _inst_type_T_147; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_149 = _inst_type_T_3 ? 2'h0 : _inst_type_T_148; // @[Lookup.scala 33:37]
  wire [1:0] inst_type_1 = _inst_type_T_1 ? 2'h0 : _inst_type_T_149; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_150 = _inst_type_T_75 ? 3'h0 : 3'h1; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_151 = _inst_type_T_73 ? 3'h0 : _inst_type_T_150; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_152 = _inst_type_T_71 ? 3'h0 : _inst_type_T_151; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_153 = _inst_type_T_69 ? 3'h0 : _inst_type_T_152; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_154 = _inst_type_T_67 ? 3'h0 : _inst_type_T_153; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_155 = _inst_type_T_65 ? 3'h0 : _inst_type_T_154; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_156 = _inst_type_T_63 ? 3'h0 : _inst_type_T_155; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_157 = _inst_type_T_61 ? 3'h5 : _inst_type_T_156; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_158 = _inst_type_T_59 ? 3'h5 : _inst_type_T_157; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_159 = _inst_type_T_57 ? 3'h2 : _inst_type_T_158; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_160 = _inst_type_T_55 ? 3'h4 : _inst_type_T_159; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_161 = _inst_type_T_53 ? 3'h1 : _inst_type_T_160; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_162 = _inst_type_T_51 ? 3'h1 : _inst_type_T_161; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_163 = _inst_type_T_49 ? 3'h1 : _inst_type_T_162; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_164 = _inst_type_T_47 ? 3'h1 : _inst_type_T_163; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_165 = _inst_type_T_45 ? 3'h1 : _inst_type_T_164; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_166 = _inst_type_T_43 ? 3'h1 : _inst_type_T_165; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_167 = _inst_type_T_41 ? 3'h2 : _inst_type_T_166; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_168 = _inst_type_T_39 ? 3'h2 : _inst_type_T_167; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_169 = _inst_type_T_37 ? 3'h1 : _inst_type_T_168; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_170 = _inst_type_T_35 ? 3'h1 : _inst_type_T_169; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_171 = _inst_type_T_33 ? 3'h2 : _inst_type_T_170; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_172 = _inst_type_T_31 ? 3'h2 : _inst_type_T_171; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_173 = _inst_type_T_29 ? 3'h2 : _inst_type_T_172; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_174 = _inst_type_T_27 ? 3'h1 : _inst_type_T_173; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_175 = _inst_type_T_25 ? 3'h1 : _inst_type_T_174; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_176 = _inst_type_T_23 ? 3'h1 : _inst_type_T_175; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_177 = _inst_type_T_21 ? 3'h2 : _inst_type_T_176; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_178 = _inst_type_T_19 ? 3'h2 : _inst_type_T_177; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_179 = _inst_type_T_17 ? 3'h2 : _inst_type_T_178; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_180 = _inst_type_T_15 ? 3'h1 : _inst_type_T_179; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_181 = _inst_type_T_13 ? 3'h1 : _inst_type_T_180; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_182 = _inst_type_T_11 ? 3'h1 : _inst_type_T_181; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_183 = _inst_type_T_9 ? 3'h1 : _inst_type_T_182; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_184 = _inst_type_T_7 ? 3'h2 : _inst_type_T_183; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_185 = _inst_type_T_5 ? 3'h1 : _inst_type_T_184; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_186 = _inst_type_T_3 ? 3'h3 : _inst_type_T_185; // @[Lookup.scala 33:37]
  wire [2:0] inst_type_2 = _inst_type_T_1 ? 3'h2 : _inst_type_T_186; // @[Lookup.scala 33:37]
  wire  _inst_type_T_235 = _inst_type_T_53 ? 1'h0 : _inst_type_T_55 | (_inst_type_T_57 | (_inst_type_T_59 | (
    _inst_type_T_61 | (_inst_type_T_63 | (_inst_type_T_65 | (_inst_type_T_67 | (_inst_type_T_69 | (_inst_type_T_71 |
    _inst_type_T_73)))))))); // @[Lookup.scala 33:37]
  wire  _inst_type_T_236 = _inst_type_T_51 ? 1'h0 : _inst_type_T_235; // @[Lookup.scala 33:37]
  wire  _inst_type_T_237 = _inst_type_T_49 ? 1'h0 : _inst_type_T_236; // @[Lookup.scala 33:37]
  wire  _inst_type_T_238 = _inst_type_T_47 ? 1'h0 : _inst_type_T_237; // @[Lookup.scala 33:37]
  wire  _inst_type_T_239 = _inst_type_T_45 ? 1'h0 : _inst_type_T_238; // @[Lookup.scala 33:37]
  wire  _inst_type_T_240 = _inst_type_T_43 ? 1'h0 : _inst_type_T_239; // @[Lookup.scala 33:37]
  wire  _inst_type_T_260 = _inst_type_T_3 ? 1'h0 : _inst_type_T_5 | (_inst_type_T_7 | (_inst_type_T_9 | (_inst_type_T_11
     | (_inst_type_T_13 | (_inst_type_T_15 | (_inst_type_T_17 | (_inst_type_T_19 | (_inst_type_T_21 | (_inst_type_T_23
     | (_inst_type_T_25 | (_inst_type_T_27 | (_inst_type_T_29 | (_inst_type_T_31 | (_inst_type_T_33 | (_inst_type_T_35
     | (_inst_type_T_37 | (_inst_type_T_39 | (_inst_type_T_41 | _inst_type_T_240)))))))))))))))))); // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_262 = _inst_type_T_73 ? 3'h3 : 3'h0; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_263 = _inst_type_T_71 ? 3'h3 : _inst_type_T_262; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_264 = _inst_type_T_69 ? 3'h3 : _inst_type_T_263; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_265 = _inst_type_T_67 ? 3'h3 : _inst_type_T_264; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_266 = _inst_type_T_65 ? 3'h3 : _inst_type_T_265; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_267 = _inst_type_T_63 ? 3'h3 : _inst_type_T_266; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_268 = _inst_type_T_61 ? 3'h0 : _inst_type_T_267; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_269 = _inst_type_T_59 ? 3'h0 : _inst_type_T_268; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_270 = _inst_type_T_57 ? 3'h2 : _inst_type_T_269; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_271 = _inst_type_T_55 ? 3'h2 : _inst_type_T_270; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_272 = _inst_type_T_53 ? 3'h0 : _inst_type_T_271; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_273 = _inst_type_T_51 ? 3'h0 : _inst_type_T_272; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_274 = _inst_type_T_49 ? 3'h0 : _inst_type_T_273; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_275 = _inst_type_T_47 ? 3'h0 : _inst_type_T_274; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_276 = _inst_type_T_45 ? 3'h0 : _inst_type_T_275; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_277 = _inst_type_T_43 ? 3'h0 : _inst_type_T_276; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_278 = _inst_type_T_41 ? 3'h0 : _inst_type_T_277; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_279 = _inst_type_T_39 ? 3'h0 : _inst_type_T_278; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_280 = _inst_type_T_37 ? 3'h0 : _inst_type_T_279; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_281 = _inst_type_T_35 ? 3'h0 : _inst_type_T_280; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_282 = _inst_type_T_33 ? 3'h0 : _inst_type_T_281; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_283 = _inst_type_T_31 ? 3'h0 : _inst_type_T_282; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_284 = _inst_type_T_29 ? 3'h0 : _inst_type_T_283; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_285 = _inst_type_T_27 ? 3'h0 : _inst_type_T_284; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_286 = _inst_type_T_25 ? 3'h0 : _inst_type_T_285; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_287 = _inst_type_T_23 ? 3'h0 : _inst_type_T_286; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_288 = _inst_type_T_21 ? 3'h0 : _inst_type_T_287; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_289 = _inst_type_T_19 ? 3'h0 : _inst_type_T_288; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_290 = _inst_type_T_17 ? 3'h0 : _inst_type_T_289; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_291 = _inst_type_T_15 ? 3'h0 : _inst_type_T_290; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_292 = _inst_type_T_13 ? 3'h0 : _inst_type_T_291; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_293 = _inst_type_T_11 ? 3'h0 : _inst_type_T_292; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_294 = _inst_type_T_9 ? 3'h0 : _inst_type_T_293; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_295 = _inst_type_T_7 ? 3'h0 : _inst_type_T_294; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_296 = _inst_type_T_5 ? 3'h0 : _inst_type_T_295; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_297 = _inst_type_T_3 ? 3'h0 : _inst_type_T_296; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_298 = _inst_type_T_75 ? 3'h4 : 3'h0; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_299 = _inst_type_T_73 ? 3'h3 : _inst_type_T_298; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_300 = _inst_type_T_71 ? 3'h3 : _inst_type_T_299; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_301 = _inst_type_T_69 ? 3'h2 : _inst_type_T_300; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_302 = _inst_type_T_67 ? 3'h2 : _inst_type_T_301; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_303 = _inst_type_T_65 ? 3'h1 : _inst_type_T_302; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_304 = _inst_type_T_63 ? 3'h1 : _inst_type_T_303; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_305 = _inst_type_T_61 ? 3'h0 : _inst_type_T_304; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_306 = _inst_type_T_59 ? 3'h0 : _inst_type_T_305; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_307 = _inst_type_T_57 ? 3'h0 : _inst_type_T_306; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_308 = _inst_type_T_55 ? 3'h0 : _inst_type_T_307; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_309 = _inst_type_T_53 ? 3'h0 : _inst_type_T_308; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_310 = _inst_type_T_51 ? 3'h0 : _inst_type_T_309; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_311 = _inst_type_T_49 ? 3'h0 : _inst_type_T_310; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_312 = _inst_type_T_47 ? 3'h0 : _inst_type_T_311; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_313 = _inst_type_T_45 ? 3'h0 : _inst_type_T_312; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_314 = _inst_type_T_43 ? 3'h0 : _inst_type_T_313; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_315 = _inst_type_T_41 ? 3'h0 : _inst_type_T_314; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_316 = _inst_type_T_39 ? 3'h0 : _inst_type_T_315; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_317 = _inst_type_T_37 ? 3'h0 : _inst_type_T_316; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_318 = _inst_type_T_35 ? 3'h0 : _inst_type_T_317; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_319 = _inst_type_T_33 ? 3'h0 : _inst_type_T_318; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_320 = _inst_type_T_31 ? 3'h0 : _inst_type_T_319; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_321 = _inst_type_T_29 ? 3'h0 : _inst_type_T_320; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_322 = _inst_type_T_27 ? 3'h0 : _inst_type_T_321; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_323 = _inst_type_T_25 ? 3'h0 : _inst_type_T_322; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_324 = _inst_type_T_23 ? 3'h0 : _inst_type_T_323; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_325 = _inst_type_T_21 ? 3'h0 : _inst_type_T_324; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_326 = _inst_type_T_19 ? 3'h0 : _inst_type_T_325; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_327 = _inst_type_T_17 ? 3'h0 : _inst_type_T_326; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_328 = _inst_type_T_15 ? 3'h0 : _inst_type_T_327; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_329 = _inst_type_T_13 ? 3'h0 : _inst_type_T_328; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_330 = _inst_type_T_11 ? 3'h0 : _inst_type_T_329; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_331 = _inst_type_T_9 ? 3'h0 : _inst_type_T_330; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_332 = _inst_type_T_7 ? 3'h0 : _inst_type_T_331; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_333 = _inst_type_T_5 ? 3'h0 : _inst_type_T_332; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_334 = _inst_type_T_3 ? 3'h0 : _inst_type_T_333; // @[Lookup.scala 33:37]
  wire  _op1_data_T = inst_type_1 == 2'h0; // @[ID.scala 177:18]
  wire  _op1_data_T_1 = inst_type_1 == 2'h1; // @[ID.scala 178:18]
  wire  _op1_data_T_2 = inst_type_1 == 2'h3; // @[ID.scala 179:18]
  wire [31:0] _op1_data_T_3 = _op1_data_T_2 ? imm_z_uext : 32'h0; // @[Mux.scala 98:16]
  wire [31:0] _op1_data_T_4 = _op1_data_T_1 ? io_in_if_in_reg_pc : _op1_data_T_3; // @[Mux.scala 98:16]
  wire [31:0] op1_data = _op1_data_T ? rs1_data : _op1_data_T_4; // @[Mux.scala 98:16]
  wire  _op2_data_T = inst_type_2 == 3'h1; // @[ID.scala 183:18]
  wire  _op2_data_T_1 = inst_type_2 == 3'h2; // @[ID.scala 184:18]
  wire  _op2_data_T_2 = inst_type_2 == 3'h3; // @[ID.scala 185:18]
  wire  _op2_data_T_3 = inst_type_2 == 3'h4; // @[ID.scala 186:18]
  wire  _op2_data_T_4 = inst_type_2 == 3'h5; // @[ID.scala 187:18]
  wire [31:0] _op2_data_T_5 = _op2_data_T_4 ? imm_u_shifted : 32'h0; // @[Mux.scala 98:16]
  wire [31:0] _op2_data_T_6 = _op2_data_T_3 ? imm_j_sext : _op2_data_T_5; // @[Mux.scala 98:16]
  wire [31:0] _op2_data_T_7 = _op2_data_T_2 ? imm_s_sext : _op2_data_T_6; // @[Mux.scala 98:16]
  wire [31:0] _op2_data_T_8 = _op2_data_T_1 ? imm_i_sext : _op2_data_T_7; // @[Mux.scala 98:16]
  wire [31:0] op2_data = _op2_data_T ? rs2_data : _op2_data_T_8; // @[Mux.scala 98:16]
  wire [31:0] _GEN_128 = {{27'd0}, io_in_wb_in_rd_addr}; // @[ID.scala 191:45]
  wire  _T_4 = ~reset; // @[ID.scala 213:11]
  assign io_out_op1_data = _op1_data_T ? rs1_data : _op1_data_T_4; // @[Mux.scala 98:16]
  assign io_out_op2_data = _op2_data_T ? rs2_data : _op2_data_T_8; // @[Mux.scala 98:16]
  assign io_out_rd_addr = inst[11:7]; // @[ID.scala 106:24]
  assign io_out_csr_addr_default = {{20'd0}, csr_addr_default}; // @[ID.scala 107:32]
  assign io_out_exe_fun = _inst_type_T_1 ? 5'h1 : _inst_type_T_112; // @[Lookup.scala 33:37]
  assign io_out_mem_wen = _inst_type_T_1 ? 1'h0 : _inst_type_T_3; // @[Lookup.scala 33:37]
  assign io_out_rd_wen = _inst_type_T_1 | _inst_type_T_260; // @[Lookup.scala 33:37]
  assign io_out_rd_sel = _inst_type_T_1 ? 3'h1 : _inst_type_T_297; // @[Lookup.scala 33:37]
  assign io_out_csr_cmd = _inst_type_T_1 ? 3'h0 : _inst_type_T_334; // @[Lookup.scala 33:37]
  assign io_out_rs2_data = _rs2_data_T ? 32'h0 : _rs2_data_T_8; // @[Mux.scala 98:16]
  assign io_out_imm_b_sext = {imm_b_sext_hi,1'h0}; // @[Cat.scala 30:58]
  assign io_out_stall_flag = rs1_data_hazard | rs2_data_hazard; // @[ID.scala 98:39]
  always @(posedge clock) begin
    if (reset) begin // @[ID.scala 77:24]
      reg_x_0 <= 32'h0; // @[ID.scala 77:24]
    end else if (io_in_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 191:65]
      if (5'h0 == io_in_wb_in_rd_addr) begin // @[ID.scala 192:27]
        reg_x_0 <= io_in_wb_in_rd_data; // @[ID.scala 192:27]
      end
    end
    if (reset) begin // @[ID.scala 77:24]
      reg_x_1 <= 32'h0; // @[ID.scala 77:24]
    end else if (io_in_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 191:65]
      if (5'h1 == io_in_wb_in_rd_addr) begin // @[ID.scala 192:27]
        reg_x_1 <= io_in_wb_in_rd_data; // @[ID.scala 192:27]
      end
    end
    if (reset) begin // @[ID.scala 77:24]
      reg_x_2 <= 32'h0; // @[ID.scala 77:24]
    end else if (io_in_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 191:65]
      if (5'h2 == io_in_wb_in_rd_addr) begin // @[ID.scala 192:27]
        reg_x_2 <= io_in_wb_in_rd_data; // @[ID.scala 192:27]
      end
    end
    if (reset) begin // @[ID.scala 77:24]
      reg_x_3 <= 32'h0; // @[ID.scala 77:24]
    end else if (io_in_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 191:65]
      if (5'h3 == io_in_wb_in_rd_addr) begin // @[ID.scala 192:27]
        reg_x_3 <= io_in_wb_in_rd_data; // @[ID.scala 192:27]
      end
    end
    if (reset) begin // @[ID.scala 77:24]
      reg_x_4 <= 32'h0; // @[ID.scala 77:24]
    end else if (io_in_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 191:65]
      if (5'h4 == io_in_wb_in_rd_addr) begin // @[ID.scala 192:27]
        reg_x_4 <= io_in_wb_in_rd_data; // @[ID.scala 192:27]
      end
    end
    if (reset) begin // @[ID.scala 77:24]
      reg_x_5 <= 32'h0; // @[ID.scala 77:24]
    end else if (io_in_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 191:65]
      if (5'h5 == io_in_wb_in_rd_addr) begin // @[ID.scala 192:27]
        reg_x_5 <= io_in_wb_in_rd_data; // @[ID.scala 192:27]
      end
    end
    if (reset) begin // @[ID.scala 77:24]
      reg_x_6 <= 32'h0; // @[ID.scala 77:24]
    end else if (io_in_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 191:65]
      if (5'h6 == io_in_wb_in_rd_addr) begin // @[ID.scala 192:27]
        reg_x_6 <= io_in_wb_in_rd_data; // @[ID.scala 192:27]
      end
    end
    if (reset) begin // @[ID.scala 77:24]
      reg_x_7 <= 32'h0; // @[ID.scala 77:24]
    end else if (io_in_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 191:65]
      if (5'h7 == io_in_wb_in_rd_addr) begin // @[ID.scala 192:27]
        reg_x_7 <= io_in_wb_in_rd_data; // @[ID.scala 192:27]
      end
    end
    if (reset) begin // @[ID.scala 77:24]
      reg_x_8 <= 32'h0; // @[ID.scala 77:24]
    end else if (io_in_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 191:65]
      if (5'h8 == io_in_wb_in_rd_addr) begin // @[ID.scala 192:27]
        reg_x_8 <= io_in_wb_in_rd_data; // @[ID.scala 192:27]
      end
    end
    if (reset) begin // @[ID.scala 77:24]
      reg_x_9 <= 32'h0; // @[ID.scala 77:24]
    end else if (io_in_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 191:65]
      if (5'h9 == io_in_wb_in_rd_addr) begin // @[ID.scala 192:27]
        reg_x_9 <= io_in_wb_in_rd_data; // @[ID.scala 192:27]
      end
    end
    if (reset) begin // @[ID.scala 77:24]
      reg_x_10 <= 32'h0; // @[ID.scala 77:24]
    end else if (io_in_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 191:65]
      if (5'ha == io_in_wb_in_rd_addr) begin // @[ID.scala 192:27]
        reg_x_10 <= io_in_wb_in_rd_data; // @[ID.scala 192:27]
      end
    end
    if (reset) begin // @[ID.scala 77:24]
      reg_x_11 <= 32'h0; // @[ID.scala 77:24]
    end else if (io_in_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 191:65]
      if (5'hb == io_in_wb_in_rd_addr) begin // @[ID.scala 192:27]
        reg_x_11 <= io_in_wb_in_rd_data; // @[ID.scala 192:27]
      end
    end
    if (reset) begin // @[ID.scala 77:24]
      reg_x_12 <= 32'h0; // @[ID.scala 77:24]
    end else if (io_in_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 191:65]
      if (5'hc == io_in_wb_in_rd_addr) begin // @[ID.scala 192:27]
        reg_x_12 <= io_in_wb_in_rd_data; // @[ID.scala 192:27]
      end
    end
    if (reset) begin // @[ID.scala 77:24]
      reg_x_13 <= 32'h0; // @[ID.scala 77:24]
    end else if (io_in_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 191:65]
      if (5'hd == io_in_wb_in_rd_addr) begin // @[ID.scala 192:27]
        reg_x_13 <= io_in_wb_in_rd_data; // @[ID.scala 192:27]
      end
    end
    if (reset) begin // @[ID.scala 77:24]
      reg_x_14 <= 32'h0; // @[ID.scala 77:24]
    end else if (io_in_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 191:65]
      if (5'he == io_in_wb_in_rd_addr) begin // @[ID.scala 192:27]
        reg_x_14 <= io_in_wb_in_rd_data; // @[ID.scala 192:27]
      end
    end
    if (reset) begin // @[ID.scala 77:24]
      reg_x_15 <= 32'h0; // @[ID.scala 77:24]
    end else if (io_in_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 191:65]
      if (5'hf == io_in_wb_in_rd_addr) begin // @[ID.scala 192:27]
        reg_x_15 <= io_in_wb_in_rd_data; // @[ID.scala 192:27]
      end
    end
    if (reset) begin // @[ID.scala 77:24]
      reg_x_16 <= 32'h0; // @[ID.scala 77:24]
    end else if (io_in_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 191:65]
      if (5'h10 == io_in_wb_in_rd_addr) begin // @[ID.scala 192:27]
        reg_x_16 <= io_in_wb_in_rd_data; // @[ID.scala 192:27]
      end
    end
    if (reset) begin // @[ID.scala 77:24]
      reg_x_17 <= 32'h0; // @[ID.scala 77:24]
    end else if (io_in_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 191:65]
      if (5'h11 == io_in_wb_in_rd_addr) begin // @[ID.scala 192:27]
        reg_x_17 <= io_in_wb_in_rd_data; // @[ID.scala 192:27]
      end
    end
    if (reset) begin // @[ID.scala 77:24]
      reg_x_18 <= 32'h0; // @[ID.scala 77:24]
    end else if (io_in_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 191:65]
      if (5'h12 == io_in_wb_in_rd_addr) begin // @[ID.scala 192:27]
        reg_x_18 <= io_in_wb_in_rd_data; // @[ID.scala 192:27]
      end
    end
    if (reset) begin // @[ID.scala 77:24]
      reg_x_19 <= 32'h0; // @[ID.scala 77:24]
    end else if (io_in_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 191:65]
      if (5'h13 == io_in_wb_in_rd_addr) begin // @[ID.scala 192:27]
        reg_x_19 <= io_in_wb_in_rd_data; // @[ID.scala 192:27]
      end
    end
    if (reset) begin // @[ID.scala 77:24]
      reg_x_20 <= 32'h0; // @[ID.scala 77:24]
    end else if (io_in_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 191:65]
      if (5'h14 == io_in_wb_in_rd_addr) begin // @[ID.scala 192:27]
        reg_x_20 <= io_in_wb_in_rd_data; // @[ID.scala 192:27]
      end
    end
    if (reset) begin // @[ID.scala 77:24]
      reg_x_21 <= 32'h0; // @[ID.scala 77:24]
    end else if (io_in_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 191:65]
      if (5'h15 == io_in_wb_in_rd_addr) begin // @[ID.scala 192:27]
        reg_x_21 <= io_in_wb_in_rd_data; // @[ID.scala 192:27]
      end
    end
    if (reset) begin // @[ID.scala 77:24]
      reg_x_22 <= 32'h0; // @[ID.scala 77:24]
    end else if (io_in_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 191:65]
      if (5'h16 == io_in_wb_in_rd_addr) begin // @[ID.scala 192:27]
        reg_x_22 <= io_in_wb_in_rd_data; // @[ID.scala 192:27]
      end
    end
    if (reset) begin // @[ID.scala 77:24]
      reg_x_23 <= 32'h0; // @[ID.scala 77:24]
    end else if (io_in_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 191:65]
      if (5'h17 == io_in_wb_in_rd_addr) begin // @[ID.scala 192:27]
        reg_x_23 <= io_in_wb_in_rd_data; // @[ID.scala 192:27]
      end
    end
    if (reset) begin // @[ID.scala 77:24]
      reg_x_24 <= 32'h0; // @[ID.scala 77:24]
    end else if (io_in_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 191:65]
      if (5'h18 == io_in_wb_in_rd_addr) begin // @[ID.scala 192:27]
        reg_x_24 <= io_in_wb_in_rd_data; // @[ID.scala 192:27]
      end
    end
    if (reset) begin // @[ID.scala 77:24]
      reg_x_25 <= 32'h0; // @[ID.scala 77:24]
    end else if (io_in_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 191:65]
      if (5'h19 == io_in_wb_in_rd_addr) begin // @[ID.scala 192:27]
        reg_x_25 <= io_in_wb_in_rd_data; // @[ID.scala 192:27]
      end
    end
    if (reset) begin // @[ID.scala 77:24]
      reg_x_26 <= 32'h0; // @[ID.scala 77:24]
    end else if (io_in_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 191:65]
      if (5'h1a == io_in_wb_in_rd_addr) begin // @[ID.scala 192:27]
        reg_x_26 <= io_in_wb_in_rd_data; // @[ID.scala 192:27]
      end
    end
    if (reset) begin // @[ID.scala 77:24]
      reg_x_27 <= 32'h0; // @[ID.scala 77:24]
    end else if (io_in_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 191:65]
      if (5'h1b == io_in_wb_in_rd_addr) begin // @[ID.scala 192:27]
        reg_x_27 <= io_in_wb_in_rd_data; // @[ID.scala 192:27]
      end
    end
    if (reset) begin // @[ID.scala 77:24]
      reg_x_28 <= 32'h0; // @[ID.scala 77:24]
    end else if (io_in_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 191:65]
      if (5'h1c == io_in_wb_in_rd_addr) begin // @[ID.scala 192:27]
        reg_x_28 <= io_in_wb_in_rd_data; // @[ID.scala 192:27]
      end
    end
    if (reset) begin // @[ID.scala 77:24]
      reg_x_29 <= 32'h0; // @[ID.scala 77:24]
    end else if (io_in_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 191:65]
      if (5'h1d == io_in_wb_in_rd_addr) begin // @[ID.scala 192:27]
        reg_x_29 <= io_in_wb_in_rd_data; // @[ID.scala 192:27]
      end
    end
    if (reset) begin // @[ID.scala 77:24]
      reg_x_30 <= 32'h0; // @[ID.scala 77:24]
    end else if (io_in_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 191:65]
      if (5'h1e == io_in_wb_in_rd_addr) begin // @[ID.scala 192:27]
        reg_x_30 <= io_in_wb_in_rd_data; // @[ID.scala 192:27]
      end
    end
    if (reset) begin // @[ID.scala 77:24]
      reg_x_31 <= 32'h0; // @[ID.scala 77:24]
    end else if (io_in_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 191:65]
      if (5'h1f == io_in_wb_in_rd_addr) begin // @[ID.scala 192:27]
        reg_x_31 <= io_in_wb_in_rd_data; // @[ID.scala 192:27]
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset) begin
          $fwrite(32'h80000002,"-------------ID------------\n"); // @[ID.scala 213:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_4) begin
          $fwrite(32'h80000002,"rs1_addr: %d\n",rs1_addr); // @[ID.scala 214:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_4) begin
          $fwrite(32'h80000002,"rs2_addr: %d\n",rs2_addr); // @[ID.scala 215:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_4) begin
          $fwrite(32'h80000002,"op1_data: 0x%x\n",op1_data); // @[ID.scala 216:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_4) begin
          $fwrite(32'h80000002,"op2_data: 0x%x\n",op2_data); // @[ID.scala 217:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_4) begin
          $fwrite(32'h80000002,"stall_flag: %d\n",stall_flag); // @[ID.scala 218:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  reg_x_0 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  reg_x_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  reg_x_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  reg_x_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  reg_x_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  reg_x_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  reg_x_6 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  reg_x_7 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  reg_x_8 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  reg_x_9 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  reg_x_10 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  reg_x_11 = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  reg_x_12 = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  reg_x_13 = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  reg_x_14 = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  reg_x_15 = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  reg_x_16 = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  reg_x_17 = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  reg_x_18 = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  reg_x_19 = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  reg_x_20 = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  reg_x_21 = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  reg_x_22 = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  reg_x_23 = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  reg_x_24 = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  reg_x_25 = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  reg_x_26 = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  reg_x_27 = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  reg_x_28 = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  reg_x_29 = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  reg_x_30 = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  reg_x_31 = _RAND_31[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ALU(
  input         clock,
  input         reset,
  input  [31:0] io_in_id_in_op1_data,
  input  [31:0] io_in_id_in_op2_data,
  input  [4:0]  io_in_id_in_exe_fun,
  input  [2:0]  io_in_id_in_rd_sel,
  output [31:0] io_out_alu_out,
  output        io_out_jump_flag
);
  wire  _alu_out_T = io_in_id_in_exe_fun == 5'h1; // @[ALU.scala 55:18]
  wire [31:0] _alu_out_T_2 = io_in_id_in_op1_data + io_in_id_in_op2_data; // @[ALU.scala 55:46]
  wire  _alu_out_T_3 = io_in_id_in_exe_fun == 5'h2; // @[ALU.scala 56:18]
  wire [31:0] _alu_out_T_5 = io_in_id_in_op1_data - io_in_id_in_op2_data; // @[ALU.scala 56:46]
  wire  _alu_out_T_6 = io_in_id_in_exe_fun == 5'h3; // @[ALU.scala 57:18]
  wire [31:0] _alu_out_T_7 = io_in_id_in_op1_data & io_in_id_in_op2_data; // @[ALU.scala 57:46]
  wire  _alu_out_T_8 = io_in_id_in_exe_fun == 5'h4; // @[ALU.scala 58:18]
  wire [31:0] _alu_out_T_9 = io_in_id_in_op1_data | io_in_id_in_op2_data; // @[ALU.scala 58:46]
  wire  _alu_out_T_10 = io_in_id_in_exe_fun == 5'h5; // @[ALU.scala 59:18]
  wire [31:0] _alu_out_T_11 = io_in_id_in_op1_data ^ io_in_id_in_op2_data; // @[ALU.scala 59:46]
  wire  _alu_out_T_12 = io_in_id_in_exe_fun == 5'h6; // @[ALU.scala 60:18]
  wire [62:0] _GEN_0 = {{31'd0}, io_in_id_in_op1_data}; // @[ALU.scala 60:46]
  wire [62:0] _alu_out_T_14 = _GEN_0 << io_in_id_in_op2_data[4:0]; // @[ALU.scala 60:46]
  wire  _alu_out_T_16 = io_in_id_in_exe_fun == 5'h7; // @[ALU.scala 61:18]
  wire [31:0] _alu_out_T_18 = io_in_id_in_op1_data >> io_in_id_in_op2_data[4:0]; // @[ALU.scala 61:46]
  wire  _alu_out_T_19 = io_in_id_in_exe_fun == 5'h8; // @[ALU.scala 62:18]
  wire [31:0] _alu_out_T_23 = $signed(io_in_id_in_op1_data) >>> io_in_id_in_op2_data[4:0]; // @[ALU.scala 62:80]
  wire  _alu_out_T_24 = io_in_id_in_exe_fun == 5'h9; // @[ALU.scala 63:18]
  wire  _alu_out_T_27 = $signed(io_in_id_in_op1_data) < $signed(io_in_id_in_op2_data); // @[ALU.scala 63:55]
  wire  _alu_out_T_28 = io_in_id_in_exe_fun == 5'ha; // @[ALU.scala 64:18]
  wire  _alu_out_T_29 = io_in_id_in_op1_data < io_in_id_in_op2_data; // @[ALU.scala 64:46]
  wire  _alu_out_T_30 = io_in_id_in_exe_fun == 5'h11; // @[ALU.scala 65:18]
  wire [31:0] _alu_out_T_34 = _alu_out_T_2 & 32'hfffffffe; // @[ALU.scala 65:59]
  wire  _alu_out_T_35 = io_in_id_in_exe_fun == 5'h12; // @[ALU.scala 66:18]
  wire [31:0] _alu_out_T_36 = _alu_out_T_35 ? io_in_id_in_op1_data : 32'h0; // @[Mux.scala 98:16]
  wire [31:0] _alu_out_T_37 = _alu_out_T_30 ? _alu_out_T_34 : _alu_out_T_36; // @[Mux.scala 98:16]
  wire [31:0] _alu_out_T_38 = _alu_out_T_28 ? {{31'd0}, _alu_out_T_29} : _alu_out_T_37; // @[Mux.scala 98:16]
  wire [31:0] _alu_out_T_39 = _alu_out_T_24 ? {{31'd0}, _alu_out_T_27} : _alu_out_T_38; // @[Mux.scala 98:16]
  wire [31:0] _alu_out_T_40 = _alu_out_T_19 ? _alu_out_T_23 : _alu_out_T_39; // @[Mux.scala 98:16]
  wire [31:0] _alu_out_T_41 = _alu_out_T_16 ? _alu_out_T_18 : _alu_out_T_40; // @[Mux.scala 98:16]
  wire [31:0] _alu_out_T_42 = _alu_out_T_12 ? _alu_out_T_14[31:0] : _alu_out_T_41; // @[Mux.scala 98:16]
  wire [31:0] _alu_out_T_43 = _alu_out_T_10 ? _alu_out_T_11 : _alu_out_T_42; // @[Mux.scala 98:16]
  wire [31:0] _alu_out_T_44 = _alu_out_T_8 ? _alu_out_T_9 : _alu_out_T_43; // @[Mux.scala 98:16]
  wire [31:0] _alu_out_T_45 = _alu_out_T_6 ? _alu_out_T_7 : _alu_out_T_44; // @[Mux.scala 98:16]
  wire [31:0] _alu_out_T_46 = _alu_out_T_3 ? _alu_out_T_5 : _alu_out_T_45; // @[Mux.scala 98:16]
  wire [31:0] alu_out = _alu_out_T ? _alu_out_T_2 : _alu_out_T_46; // @[Mux.scala 98:16]
  wire  jump_flag = io_in_id_in_rd_sel == 3'h2; // @[ALU.scala 69:29]
  wire  _T_1 = ~reset; // @[ALU.scala 76:11]
  assign io_out_alu_out = _alu_out_T ? _alu_out_T_2 : _alu_out_T_46; // @[Mux.scala 98:16]
  assign io_out_jump_flag = io_in_id_in_rd_sel == 3'h2; // @[ALU.scala 69:29]
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset) begin
          $fwrite(32'h80000002,"-------------EX------------\n"); // @[ALU.scala 76:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1) begin
          $fwrite(32'h80000002,"alu_out: 0x%x\n",alu_out); // @[ALU.scala 77:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1) begin
          $fwrite(32'h80000002,"jump_flg: %d\n",jump_flag); // @[ALU.scala 78:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module BR(
  input         clock,
  input         reset,
  input  [31:0] io_in_if_in_reg_pc,
  input  [31:0] io_in_id_in_op1_data,
  input  [31:0] io_in_id_in_op2_data,
  input  [4:0]  io_in_id_in_exe_fun,
  input  [31:0] io_in_id_in_imm_b_sext,
  output        io_out_br_flag,
  output [31:0] io_out_br_target
);
  wire [31:0] br_target = io_in_if_in_reg_pc + io_in_id_in_imm_b_sext; // @[BR.scala 56:28]
  wire  _br_flag_T = io_in_id_in_exe_fun == 5'hb; // @[BR.scala 58:18]
  wire  _br_flag_T_1 = io_in_id_in_op1_data == io_in_id_in_op2_data; // @[BR.scala 58:45]
  wire  _br_flag_T_2 = io_in_id_in_exe_fun == 5'hc; // @[BR.scala 59:18]
  wire  _br_flag_T_4 = ~_br_flag_T_1; // @[BR.scala 59:34]
  wire  _br_flag_T_5 = io_in_id_in_exe_fun == 5'hd; // @[BR.scala 60:18]
  wire  _br_flag_T_8 = $signed(io_in_id_in_op1_data) < $signed(io_in_id_in_op2_data); // @[BR.scala 60:54]
  wire  _br_flag_T_9 = io_in_id_in_exe_fun == 5'he; // @[BR.scala 61:18]
  wire  _br_flag_T_13 = ~_br_flag_T_8; // @[BR.scala 61:34]
  wire  _br_flag_T_14 = io_in_id_in_exe_fun == 5'hf; // @[BR.scala 62:18]
  wire  _br_flag_T_15 = io_in_id_in_op1_data < io_in_id_in_op2_data; // @[BR.scala 62:45]
  wire  _br_flag_T_16 = io_in_id_in_exe_fun == 5'h10; // @[BR.scala 63:18]
  wire  _br_flag_T_18 = ~_br_flag_T_15; // @[BR.scala 63:34]
  wire  _br_flag_T_20 = _br_flag_T_14 ? _br_flag_T_15 : _br_flag_T_16 & _br_flag_T_18; // @[Mux.scala 98:16]
  wire  _br_flag_T_21 = _br_flag_T_9 ? _br_flag_T_13 : _br_flag_T_20; // @[Mux.scala 98:16]
  wire  _br_flag_T_22 = _br_flag_T_5 ? _br_flag_T_8 : _br_flag_T_21; // @[Mux.scala 98:16]
  wire  _br_flag_T_23 = _br_flag_T_2 ? _br_flag_T_4 : _br_flag_T_22; // @[Mux.scala 98:16]
  wire  br_flag = _br_flag_T ? _br_flag_T_1 : _br_flag_T_23; // @[Mux.scala 98:16]
  wire  _T_1 = ~reset; // @[BR.scala 71:11]
  assign io_out_br_flag = _br_flag_T ? _br_flag_T_1 : _br_flag_T_23; // @[Mux.scala 98:16]
  assign io_out_br_target = io_in_if_in_reg_pc + io_in_id_in_imm_b_sext; // @[BR.scala 56:28]
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset) begin
          $fwrite(32'h80000002,"branch_flg: %d\n",br_flag); // @[BR.scala 71:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1) begin
          $fwrite(32'h80000002,"branch_target: 0x%x\n",br_target); // @[BR.scala 72:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module MEM(
  input         clock,
  input         reset,
  input  [31:0] io_in_if_in_reg_pc,
  input  [31:0] io_in_id_in_op1_data,
  input  [4:0]  io_in_id_in_rd_addr,
  input  [31:0] io_in_id_in_csr_addr_default,
  input         io_in_id_in_mem_wen,
  input         io_in_id_in_rd_wen,
  input  [2:0]  io_in_id_in_rd_sel,
  input  [2:0]  io_in_id_in_csr_cmd,
  input  [31:0] io_in_id_in_rs2_data,
  input  [31:0] io_in_ex_in_alu_out,
  output        io_out_rd_wen,
  output [4:0]  io_out_rd_addr,
  output [31:0] io_out_rd_data,
  output [31:0] io_datamem_addr,
  input  [31:0] io_datamem_rdata,
  output        io_datamem_wen,
  output [31:0] io_datamem_wdata
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] reg_csr_0; // @[MEM.scala 54:26]
  reg [31:0] reg_csr_1; // @[MEM.scala 54:26]
  reg [31:0] reg_csr_2; // @[MEM.scala 54:26]
  reg [31:0] reg_csr_3; // @[MEM.scala 54:26]
  reg [31:0] reg_csr_4; // @[MEM.scala 54:26]
  reg [31:0] reg_csr_5; // @[MEM.scala 54:26]
  reg [31:0] reg_csr_6; // @[MEM.scala 54:26]
  reg [31:0] reg_csr_7; // @[MEM.scala 54:26]
  reg [31:0] reg_csr_8; // @[MEM.scala 54:26]
  reg [31:0] reg_csr_9; // @[MEM.scala 54:26]
  reg [31:0] reg_csr_10; // @[MEM.scala 54:26]
  reg [31:0] reg_csr_11; // @[MEM.scala 54:26]
  reg [31:0] reg_csr_12; // @[MEM.scala 54:26]
  reg [31:0] reg_csr_13; // @[MEM.scala 54:26]
  reg [31:0] reg_csr_14; // @[MEM.scala 54:26]
  reg [31:0] reg_csr_15; // @[MEM.scala 54:26]
  reg [31:0] reg_csr_16; // @[MEM.scala 54:26]
  reg [31:0] reg_csr_17; // @[MEM.scala 54:26]
  reg [31:0] reg_csr_18; // @[MEM.scala 54:26]
  reg [31:0] reg_csr_19; // @[MEM.scala 54:26]
  reg [31:0] reg_csr_20; // @[MEM.scala 54:26]
  reg [31:0] reg_csr_21; // @[MEM.scala 54:26]
  reg [31:0] reg_csr_22; // @[MEM.scala 54:26]
  reg [31:0] reg_csr_23; // @[MEM.scala 54:26]
  reg [31:0] reg_csr_24; // @[MEM.scala 54:26]
  reg [31:0] reg_csr_25; // @[MEM.scala 54:26]
  reg [31:0] reg_csr_26; // @[MEM.scala 54:26]
  reg [31:0] reg_csr_27; // @[MEM.scala 54:26]
  reg [31:0] reg_csr_28; // @[MEM.scala 54:26]
  reg [31:0] reg_csr_29; // @[MEM.scala 54:26]
  reg [31:0] reg_csr_30; // @[MEM.scala 54:26]
  reg [31:0] reg_csr_31; // @[MEM.scala 54:26]
  wire  _csr_addr_T = io_in_id_in_csr_cmd == 3'h4; // @[MEM.scala 78:18]
  wire [31:0] csr_addr = _csr_addr_T ? 32'h342 : io_in_id_in_csr_addr_default; // @[Mux.scala 98:16]
  wire  _csr_wdata_T = io_in_id_in_csr_cmd == 3'h1; // @[MEM.scala 82:18]
  wire  _csr_wdata_T_1 = io_in_id_in_csr_cmd == 3'h2; // @[MEM.scala 83:18]
  wire [31:0] _GEN_1 = 5'h1 == csr_addr[4:0] ? reg_csr_1 : reg_csr_0; // @[MEM.scala 83:43 MEM.scala 83:43]
  wire [31:0] _GEN_2 = 5'h2 == csr_addr[4:0] ? reg_csr_2 : _GEN_1; // @[MEM.scala 83:43 MEM.scala 83:43]
  wire [31:0] _GEN_3 = 5'h3 == csr_addr[4:0] ? reg_csr_3 : _GEN_2; // @[MEM.scala 83:43 MEM.scala 83:43]
  wire [31:0] _GEN_4 = 5'h4 == csr_addr[4:0] ? reg_csr_4 : _GEN_3; // @[MEM.scala 83:43 MEM.scala 83:43]
  wire [31:0] _GEN_5 = 5'h5 == csr_addr[4:0] ? reg_csr_5 : _GEN_4; // @[MEM.scala 83:43 MEM.scala 83:43]
  wire [31:0] _GEN_6 = 5'h6 == csr_addr[4:0] ? reg_csr_6 : _GEN_5; // @[MEM.scala 83:43 MEM.scala 83:43]
  wire [31:0] _GEN_7 = 5'h7 == csr_addr[4:0] ? reg_csr_7 : _GEN_6; // @[MEM.scala 83:43 MEM.scala 83:43]
  wire [31:0] _GEN_8 = 5'h8 == csr_addr[4:0] ? reg_csr_8 : _GEN_7; // @[MEM.scala 83:43 MEM.scala 83:43]
  wire [31:0] _GEN_9 = 5'h9 == csr_addr[4:0] ? reg_csr_9 : _GEN_8; // @[MEM.scala 83:43 MEM.scala 83:43]
  wire [31:0] _GEN_10 = 5'ha == csr_addr[4:0] ? reg_csr_10 : _GEN_9; // @[MEM.scala 83:43 MEM.scala 83:43]
  wire [31:0] _GEN_11 = 5'hb == csr_addr[4:0] ? reg_csr_11 : _GEN_10; // @[MEM.scala 83:43 MEM.scala 83:43]
  wire [31:0] _GEN_12 = 5'hc == csr_addr[4:0] ? reg_csr_12 : _GEN_11; // @[MEM.scala 83:43 MEM.scala 83:43]
  wire [31:0] _GEN_13 = 5'hd == csr_addr[4:0] ? reg_csr_13 : _GEN_12; // @[MEM.scala 83:43 MEM.scala 83:43]
  wire [31:0] _GEN_14 = 5'he == csr_addr[4:0] ? reg_csr_14 : _GEN_13; // @[MEM.scala 83:43 MEM.scala 83:43]
  wire [31:0] _GEN_15 = 5'hf == csr_addr[4:0] ? reg_csr_15 : _GEN_14; // @[MEM.scala 83:43 MEM.scala 83:43]
  wire [31:0] _GEN_16 = 5'h10 == csr_addr[4:0] ? reg_csr_16 : _GEN_15; // @[MEM.scala 83:43 MEM.scala 83:43]
  wire [31:0] _GEN_17 = 5'h11 == csr_addr[4:0] ? reg_csr_17 : _GEN_16; // @[MEM.scala 83:43 MEM.scala 83:43]
  wire [31:0] _GEN_18 = 5'h12 == csr_addr[4:0] ? reg_csr_18 : _GEN_17; // @[MEM.scala 83:43 MEM.scala 83:43]
  wire [31:0] _GEN_19 = 5'h13 == csr_addr[4:0] ? reg_csr_19 : _GEN_18; // @[MEM.scala 83:43 MEM.scala 83:43]
  wire [31:0] _GEN_20 = 5'h14 == csr_addr[4:0] ? reg_csr_20 : _GEN_19; // @[MEM.scala 83:43 MEM.scala 83:43]
  wire [31:0] _GEN_21 = 5'h15 == csr_addr[4:0] ? reg_csr_21 : _GEN_20; // @[MEM.scala 83:43 MEM.scala 83:43]
  wire [31:0] _GEN_22 = 5'h16 == csr_addr[4:0] ? reg_csr_22 : _GEN_21; // @[MEM.scala 83:43 MEM.scala 83:43]
  wire [31:0] _GEN_23 = 5'h17 == csr_addr[4:0] ? reg_csr_23 : _GEN_22; // @[MEM.scala 83:43 MEM.scala 83:43]
  wire [31:0] _GEN_24 = 5'h18 == csr_addr[4:0] ? reg_csr_24 : _GEN_23; // @[MEM.scala 83:43 MEM.scala 83:43]
  wire [31:0] _GEN_25 = 5'h19 == csr_addr[4:0] ? reg_csr_25 : _GEN_24; // @[MEM.scala 83:43 MEM.scala 83:43]
  wire [31:0] _GEN_26 = 5'h1a == csr_addr[4:0] ? reg_csr_26 : _GEN_25; // @[MEM.scala 83:43 MEM.scala 83:43]
  wire [31:0] _GEN_27 = 5'h1b == csr_addr[4:0] ? reg_csr_27 : _GEN_26; // @[MEM.scala 83:43 MEM.scala 83:43]
  wire [31:0] _GEN_28 = 5'h1c == csr_addr[4:0] ? reg_csr_28 : _GEN_27; // @[MEM.scala 83:43 MEM.scala 83:43]
  wire [31:0] _GEN_29 = 5'h1d == csr_addr[4:0] ? reg_csr_29 : _GEN_28; // @[MEM.scala 83:43 MEM.scala 83:43]
  wire [31:0] _GEN_30 = 5'h1e == csr_addr[4:0] ? reg_csr_30 : _GEN_29; // @[MEM.scala 83:43 MEM.scala 83:43]
  wire [31:0] _GEN_31 = 5'h1f == csr_addr[4:0] ? reg_csr_31 : _GEN_30; // @[MEM.scala 83:43 MEM.scala 83:43]
  wire [31:0] _csr_wdata_T_2 = _GEN_31 | io_in_id_in_op1_data; // @[MEM.scala 83:43]
  wire  _csr_wdata_T_3 = io_in_id_in_csr_cmd == 3'h3; // @[MEM.scala 84:18]
  wire [31:0] _csr_wdata_T_4 = ~io_in_id_in_op1_data; // @[MEM.scala 84:45]
  wire [31:0] _csr_wdata_T_5 = _GEN_31 & _csr_wdata_T_4; // @[MEM.scala 84:43]
  wire [31:0] _csr_wdata_T_7 = _csr_addr_T ? 32'hb : 32'h0; // @[Mux.scala 98:16]
  wire [31:0] _csr_wdata_T_8 = _csr_wdata_T_3 ? _csr_wdata_T_5 : _csr_wdata_T_7; // @[Mux.scala 98:16]
  wire [31:0] _csr_wdata_T_9 = _csr_wdata_T_1 ? _csr_wdata_T_2 : _csr_wdata_T_8; // @[Mux.scala 98:16]
  wire [31:0] csr_wdata = _csr_wdata_T ? io_in_id_in_op1_data : _csr_wdata_T_9; // @[Mux.scala 98:16]
  wire  _rd_data_T = io_in_id_in_rd_sel == 3'h1; // @[MEM.scala 93:17]
  wire  _rd_data_T_1 = io_in_id_in_rd_sel == 3'h2; // @[MEM.scala 94:17]
  wire [31:0] _rd_data_T_3 = io_in_if_in_reg_pc + 32'h4; // @[MEM.scala 94:40]
  wire  _rd_data_T_4 = io_in_id_in_rd_sel == 3'h3; // @[MEM.scala 95:17]
  wire [31:0] _rd_data_T_5 = _rd_data_T_4 ? _GEN_31 : io_in_ex_in_alu_out; // @[Mux.scala 98:16]
  wire [31:0] _rd_data_T_6 = _rd_data_T_1 ? _rd_data_T_3 : _rd_data_T_5; // @[Mux.scala 98:16]
  wire  _T_3 = ~reset; // @[MEM.scala 106:11]
  assign io_out_rd_wen = io_in_id_in_rd_wen; // @[MEM.scala 101:19]
  assign io_out_rd_addr = io_in_id_in_rd_addr; // @[MEM.scala 102:20]
  assign io_out_rd_data = _rd_data_T ? io_datamem_rdata : _rd_data_T_6; // @[Mux.scala 98:16]
  assign io_datamem_addr = io_in_ex_in_alu_out; // @[MEM.scala 72:22]
  assign io_datamem_wen = io_in_id_in_mem_wen; // @[MEM.scala 73:39]
  assign io_datamem_wdata = io_in_id_in_rs2_data; // @[MEM.scala 74:22]
  always @(posedge clock) begin
    if (reset) begin // @[MEM.scala 54:26]
      reg_csr_0 <= 32'h0; // @[MEM.scala 54:26]
    end else if (io_in_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 87:31]
      if (5'h0 == csr_addr[4:0]) begin // @[MEM.scala 88:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_0 <= io_in_id_in_op1_data;
        end else begin
          reg_csr_0 <= _csr_wdata_T_9;
        end
      end
    end
    if (reset) begin // @[MEM.scala 54:26]
      reg_csr_1 <= 32'h0; // @[MEM.scala 54:26]
    end else if (io_in_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 87:31]
      if (5'h1 == csr_addr[4:0]) begin // @[MEM.scala 88:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_1 <= io_in_id_in_op1_data;
        end else begin
          reg_csr_1 <= _csr_wdata_T_9;
        end
      end
    end
    if (reset) begin // @[MEM.scala 54:26]
      reg_csr_2 <= 32'h0; // @[MEM.scala 54:26]
    end else if (io_in_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 87:31]
      if (5'h2 == csr_addr[4:0]) begin // @[MEM.scala 88:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_2 <= io_in_id_in_op1_data;
        end else begin
          reg_csr_2 <= _csr_wdata_T_9;
        end
      end
    end
    if (reset) begin // @[MEM.scala 54:26]
      reg_csr_3 <= 32'h0; // @[MEM.scala 54:26]
    end else if (io_in_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 87:31]
      if (5'h3 == csr_addr[4:0]) begin // @[MEM.scala 88:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_3 <= io_in_id_in_op1_data;
        end else begin
          reg_csr_3 <= _csr_wdata_T_9;
        end
      end
    end
    if (reset) begin // @[MEM.scala 54:26]
      reg_csr_4 <= 32'h0; // @[MEM.scala 54:26]
    end else if (io_in_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 87:31]
      if (5'h4 == csr_addr[4:0]) begin // @[MEM.scala 88:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_4 <= io_in_id_in_op1_data;
        end else begin
          reg_csr_4 <= _csr_wdata_T_9;
        end
      end
    end
    if (reset) begin // @[MEM.scala 54:26]
      reg_csr_5 <= 32'h0; // @[MEM.scala 54:26]
    end else if (io_in_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 87:31]
      if (5'h5 == csr_addr[4:0]) begin // @[MEM.scala 88:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_5 <= io_in_id_in_op1_data;
        end else begin
          reg_csr_5 <= _csr_wdata_T_9;
        end
      end
    end
    if (reset) begin // @[MEM.scala 54:26]
      reg_csr_6 <= 32'h0; // @[MEM.scala 54:26]
    end else if (io_in_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 87:31]
      if (5'h6 == csr_addr[4:0]) begin // @[MEM.scala 88:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_6 <= io_in_id_in_op1_data;
        end else begin
          reg_csr_6 <= _csr_wdata_T_9;
        end
      end
    end
    if (reset) begin // @[MEM.scala 54:26]
      reg_csr_7 <= 32'h0; // @[MEM.scala 54:26]
    end else if (io_in_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 87:31]
      if (5'h7 == csr_addr[4:0]) begin // @[MEM.scala 88:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_7 <= io_in_id_in_op1_data;
        end else begin
          reg_csr_7 <= _csr_wdata_T_9;
        end
      end
    end
    if (reset) begin // @[MEM.scala 54:26]
      reg_csr_8 <= 32'h0; // @[MEM.scala 54:26]
    end else if (io_in_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 87:31]
      if (5'h8 == csr_addr[4:0]) begin // @[MEM.scala 88:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_8 <= io_in_id_in_op1_data;
        end else begin
          reg_csr_8 <= _csr_wdata_T_9;
        end
      end
    end
    if (reset) begin // @[MEM.scala 54:26]
      reg_csr_9 <= 32'h0; // @[MEM.scala 54:26]
    end else if (io_in_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 87:31]
      if (5'h9 == csr_addr[4:0]) begin // @[MEM.scala 88:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_9 <= io_in_id_in_op1_data;
        end else begin
          reg_csr_9 <= _csr_wdata_T_9;
        end
      end
    end
    if (reset) begin // @[MEM.scala 54:26]
      reg_csr_10 <= 32'h0; // @[MEM.scala 54:26]
    end else if (io_in_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 87:31]
      if (5'ha == csr_addr[4:0]) begin // @[MEM.scala 88:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_10 <= io_in_id_in_op1_data;
        end else begin
          reg_csr_10 <= _csr_wdata_T_9;
        end
      end
    end
    if (reset) begin // @[MEM.scala 54:26]
      reg_csr_11 <= 32'h0; // @[MEM.scala 54:26]
    end else if (io_in_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 87:31]
      if (5'hb == csr_addr[4:0]) begin // @[MEM.scala 88:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_11 <= io_in_id_in_op1_data;
        end else begin
          reg_csr_11 <= _csr_wdata_T_9;
        end
      end
    end
    if (reset) begin // @[MEM.scala 54:26]
      reg_csr_12 <= 32'h0; // @[MEM.scala 54:26]
    end else if (io_in_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 87:31]
      if (5'hc == csr_addr[4:0]) begin // @[MEM.scala 88:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_12 <= io_in_id_in_op1_data;
        end else begin
          reg_csr_12 <= _csr_wdata_T_9;
        end
      end
    end
    if (reset) begin // @[MEM.scala 54:26]
      reg_csr_13 <= 32'h0; // @[MEM.scala 54:26]
    end else if (io_in_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 87:31]
      if (5'hd == csr_addr[4:0]) begin // @[MEM.scala 88:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_13 <= io_in_id_in_op1_data;
        end else begin
          reg_csr_13 <= _csr_wdata_T_9;
        end
      end
    end
    if (reset) begin // @[MEM.scala 54:26]
      reg_csr_14 <= 32'h0; // @[MEM.scala 54:26]
    end else if (io_in_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 87:31]
      if (5'he == csr_addr[4:0]) begin // @[MEM.scala 88:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_14 <= io_in_id_in_op1_data;
        end else begin
          reg_csr_14 <= _csr_wdata_T_9;
        end
      end
    end
    if (reset) begin // @[MEM.scala 54:26]
      reg_csr_15 <= 32'h0; // @[MEM.scala 54:26]
    end else if (io_in_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 87:31]
      if (5'hf == csr_addr[4:0]) begin // @[MEM.scala 88:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_15 <= io_in_id_in_op1_data;
        end else begin
          reg_csr_15 <= _csr_wdata_T_9;
        end
      end
    end
    if (reset) begin // @[MEM.scala 54:26]
      reg_csr_16 <= 32'h0; // @[MEM.scala 54:26]
    end else if (io_in_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 87:31]
      if (5'h10 == csr_addr[4:0]) begin // @[MEM.scala 88:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_16 <= io_in_id_in_op1_data;
        end else begin
          reg_csr_16 <= _csr_wdata_T_9;
        end
      end
    end
    if (reset) begin // @[MEM.scala 54:26]
      reg_csr_17 <= 32'h0; // @[MEM.scala 54:26]
    end else if (io_in_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 87:31]
      if (5'h11 == csr_addr[4:0]) begin // @[MEM.scala 88:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_17 <= io_in_id_in_op1_data;
        end else begin
          reg_csr_17 <= _csr_wdata_T_9;
        end
      end
    end
    if (reset) begin // @[MEM.scala 54:26]
      reg_csr_18 <= 32'h0; // @[MEM.scala 54:26]
    end else if (io_in_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 87:31]
      if (5'h12 == csr_addr[4:0]) begin // @[MEM.scala 88:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_18 <= io_in_id_in_op1_data;
        end else begin
          reg_csr_18 <= _csr_wdata_T_9;
        end
      end
    end
    if (reset) begin // @[MEM.scala 54:26]
      reg_csr_19 <= 32'h0; // @[MEM.scala 54:26]
    end else if (io_in_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 87:31]
      if (5'h13 == csr_addr[4:0]) begin // @[MEM.scala 88:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_19 <= io_in_id_in_op1_data;
        end else begin
          reg_csr_19 <= _csr_wdata_T_9;
        end
      end
    end
    if (reset) begin // @[MEM.scala 54:26]
      reg_csr_20 <= 32'h0; // @[MEM.scala 54:26]
    end else if (io_in_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 87:31]
      if (5'h14 == csr_addr[4:0]) begin // @[MEM.scala 88:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_20 <= io_in_id_in_op1_data;
        end else begin
          reg_csr_20 <= _csr_wdata_T_9;
        end
      end
    end
    if (reset) begin // @[MEM.scala 54:26]
      reg_csr_21 <= 32'h0; // @[MEM.scala 54:26]
    end else if (io_in_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 87:31]
      if (5'h15 == csr_addr[4:0]) begin // @[MEM.scala 88:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_21 <= io_in_id_in_op1_data;
        end else begin
          reg_csr_21 <= _csr_wdata_T_9;
        end
      end
    end
    if (reset) begin // @[MEM.scala 54:26]
      reg_csr_22 <= 32'h0; // @[MEM.scala 54:26]
    end else if (io_in_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 87:31]
      if (5'h16 == csr_addr[4:0]) begin // @[MEM.scala 88:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_22 <= io_in_id_in_op1_data;
        end else begin
          reg_csr_22 <= _csr_wdata_T_9;
        end
      end
    end
    if (reset) begin // @[MEM.scala 54:26]
      reg_csr_23 <= 32'h0; // @[MEM.scala 54:26]
    end else if (io_in_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 87:31]
      if (5'h17 == csr_addr[4:0]) begin // @[MEM.scala 88:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_23 <= io_in_id_in_op1_data;
        end else begin
          reg_csr_23 <= _csr_wdata_T_9;
        end
      end
    end
    if (reset) begin // @[MEM.scala 54:26]
      reg_csr_24 <= 32'h0; // @[MEM.scala 54:26]
    end else if (io_in_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 87:31]
      if (5'h18 == csr_addr[4:0]) begin // @[MEM.scala 88:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_24 <= io_in_id_in_op1_data;
        end else begin
          reg_csr_24 <= _csr_wdata_T_9;
        end
      end
    end
    if (reset) begin // @[MEM.scala 54:26]
      reg_csr_25 <= 32'h0; // @[MEM.scala 54:26]
    end else if (io_in_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 87:31]
      if (5'h19 == csr_addr[4:0]) begin // @[MEM.scala 88:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_25 <= io_in_id_in_op1_data;
        end else begin
          reg_csr_25 <= _csr_wdata_T_9;
        end
      end
    end
    if (reset) begin // @[MEM.scala 54:26]
      reg_csr_26 <= 32'h0; // @[MEM.scala 54:26]
    end else if (io_in_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 87:31]
      if (5'h1a == csr_addr[4:0]) begin // @[MEM.scala 88:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_26 <= io_in_id_in_op1_data;
        end else begin
          reg_csr_26 <= _csr_wdata_T_9;
        end
      end
    end
    if (reset) begin // @[MEM.scala 54:26]
      reg_csr_27 <= 32'h0; // @[MEM.scala 54:26]
    end else if (io_in_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 87:31]
      if (5'h1b == csr_addr[4:0]) begin // @[MEM.scala 88:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_27 <= io_in_id_in_op1_data;
        end else begin
          reg_csr_27 <= _csr_wdata_T_9;
        end
      end
    end
    if (reset) begin // @[MEM.scala 54:26]
      reg_csr_28 <= 32'h0; // @[MEM.scala 54:26]
    end else if (io_in_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 87:31]
      if (5'h1c == csr_addr[4:0]) begin // @[MEM.scala 88:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_28 <= io_in_id_in_op1_data;
        end else begin
          reg_csr_28 <= _csr_wdata_T_9;
        end
      end
    end
    if (reset) begin // @[MEM.scala 54:26]
      reg_csr_29 <= 32'h0; // @[MEM.scala 54:26]
    end else if (io_in_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 87:31]
      if (5'h1d == csr_addr[4:0]) begin // @[MEM.scala 88:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_29 <= io_in_id_in_op1_data;
        end else begin
          reg_csr_29 <= _csr_wdata_T_9;
        end
      end
    end
    if (reset) begin // @[MEM.scala 54:26]
      reg_csr_30 <= 32'h0; // @[MEM.scala 54:26]
    end else if (io_in_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 87:31]
      if (5'h1e == csr_addr[4:0]) begin // @[MEM.scala 88:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_30 <= io_in_id_in_op1_data;
        end else begin
          reg_csr_30 <= _csr_wdata_T_9;
        end
      end
    end
    if (reset) begin // @[MEM.scala 54:26]
      reg_csr_31 <= 32'h0; // @[MEM.scala 54:26]
    end else if (io_in_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 87:31]
      if (5'h1f == csr_addr[4:0]) begin // @[MEM.scala 88:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_31 <= io_in_id_in_op1_data;
        end else begin
          reg_csr_31 <= _csr_wdata_T_9;
        end
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset) begin
          $fwrite(32'h80000002,"-------------MEM-----------\n"); // @[MEM.scala 106:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_3) begin
          $fwrite(32'h80000002,"datamem.wen: %d\n",io_datamem_wen); // @[MEM.scala 107:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_3) begin
          $fwrite(32'h80000002,"datamem.wdata: 0x%x\n",io_datamem_wdata); // @[MEM.scala 108:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_3) begin
          $fwrite(32'h80000002,"csr_wdata: 0x%x\n",csr_wdata); // @[MEM.scala 109:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  reg_csr_0 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  reg_csr_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  reg_csr_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  reg_csr_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  reg_csr_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  reg_csr_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  reg_csr_6 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  reg_csr_7 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  reg_csr_8 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  reg_csr_9 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  reg_csr_10 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  reg_csr_11 = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  reg_csr_12 = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  reg_csr_13 = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  reg_csr_14 = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  reg_csr_15 = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  reg_csr_16 = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  reg_csr_17 = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  reg_csr_18 = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  reg_csr_19 = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  reg_csr_20 = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  reg_csr_21 = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  reg_csr_22 = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  reg_csr_23 = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  reg_csr_24 = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  reg_csr_25 = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  reg_csr_26 = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  reg_csr_27 = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  reg_csr_28 = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  reg_csr_29 = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  reg_csr_30 = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  reg_csr_31 = _RAND_31[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module WB(
  input         clock,
  input         reset,
  input         io_in_mem_in_rd_wen,
  input  [4:0]  io_in_mem_in_rd_addr,
  input  [31:0] io_in_mem_in_rd_data,
  output        io_out_rd_wen,
  output [4:0]  io_out_rd_addr,
  output [31:0] io_out_rd_data
);
  wire  _T_1 = ~reset; // @[WB.scala 61:11]
  assign io_out_rd_wen = io_in_mem_in_rd_wen; // @[WB.scala 56:19]
  assign io_out_rd_addr = io_in_mem_in_rd_addr; // @[WB.scala 57:20]
  assign io_out_rd_data = io_in_mem_in_rd_data; // @[WB.scala 58:20]
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset) begin
          $fwrite(32'h80000002,"-------------WB------------\n"); // @[WB.scala 61:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1) begin
          $fwrite(32'h80000002,"rd_wen: %d\n",io_in_mem_in_rd_wen); // @[WB.scala 62:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1) begin
          $fwrite(32'h80000002,"rd_addr: %d\n",io_in_mem_in_rd_addr); // @[WB.scala 63:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1) begin
          $fwrite(32'h80000002,"rd_data: 0x%x\n",io_in_mem_in_rd_data); // @[WB.scala 64:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module PC_BUBBLE_REG(
  input         clock,
  input         reset,
  input         io_stall_flag,
  input  [31:0] io_in_reg_pc,
  input  [31:0] io_in_inst,
  input         io_in_br_flag,
  input         io_in_jump_flag,
  output [31:0] io_out_reg_pc,
  output [31:0] io_out_inst,
  output        io_out_br_flag,
  output        io_out_jump_flag
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] reg_pc; // @[PC.scala 50:25]
  reg [31:0] inst; // @[PC.scala 51:23]
  wire  _inst_T = io_in_br_flag | io_in_jump_flag; // @[PC.scala 65:18]
  assign io_out_reg_pc = reg_pc; // @[PC.scala 70:19]
  assign io_out_inst = inst; // @[PC.scala 71:17]
  assign io_out_br_flag = io_in_br_flag; // @[PC.scala 72:20]
  assign io_out_jump_flag = io_in_jump_flag; // @[PC.scala 73:22]
  always @(posedge clock) begin
    if (reset) begin // @[PC.scala 50:25]
      reg_pc <= 32'h0; // @[PC.scala 50:25]
    end else if (!(io_stall_flag)) begin // @[Mux.scala 98:16]
      reg_pc <= io_in_reg_pc;
    end
    if (reset) begin // @[PC.scala 51:23]
      inst <= 32'h0; // @[PC.scala 51:23]
    end else if (_inst_T) begin // @[Mux.scala 98:16]
      inst <= 32'h13;
    end else if (!(io_stall_flag)) begin // @[Mux.scala 98:16]
      inst <= io_in_inst;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  reg_pc = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  inst = _RAND_1[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PC_IO_REG(
  input         clock,
  input         reset,
  input  [31:0] io_in_reg_pc,
  output [31:0] io_out_reg_pc
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] pc_io_reg_reg_pc; // @[PC.scala 31:28]
  assign io_out_reg_pc = pc_io_reg_reg_pc; // @[PC.scala 34:15]
  always @(posedge clock) begin
    if (reset) begin // @[PC.scala 31:28]
      pc_io_reg_reg_pc <= 32'h0; // @[PC.scala 31:28]
    end else begin
      pc_io_reg_reg_pc <= io_in_reg_pc; // @[PC.scala 33:15]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  pc_io_reg_reg_pc = _RAND_0[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ID_IO_REG(
  input         clock,
  input         reset,
  input  [31:0] io_in_op1_data,
  input  [31:0] io_in_op2_data,
  input  [4:0]  io_in_rd_addr,
  input  [31:0] io_in_csr_addr_default,
  input  [4:0]  io_in_exe_fun,
  input         io_in_mem_wen,
  input         io_in_rd_wen,
  input  [2:0]  io_in_rd_sel,
  input  [2:0]  io_in_csr_cmd,
  input  [31:0] io_in_rs2_data,
  input  [31:0] io_in_imm_b_sext,
  output [31:0] io_out_op1_data,
  output [31:0] io_out_op2_data,
  output [4:0]  io_out_rd_addr,
  output [31:0] io_out_csr_addr_default,
  output [4:0]  io_out_exe_fun,
  output        io_out_mem_wen,
  output        io_out_rd_wen,
  output [2:0]  io_out_rd_sel,
  output [2:0]  io_out_csr_cmd,
  output [31:0] io_out_rs2_data,
  output [31:0] io_out_imm_b_sext
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] id_io_reg_op1_data; // @[ID.scala 55:28]
  reg [31:0] id_io_reg_op2_data; // @[ID.scala 55:28]
  reg [4:0] id_io_reg_rd_addr; // @[ID.scala 55:28]
  reg [31:0] id_io_reg_csr_addr_default; // @[ID.scala 55:28]
  reg [4:0] id_io_reg_exe_fun; // @[ID.scala 55:28]
  reg  id_io_reg_mem_wen; // @[ID.scala 55:28]
  reg  id_io_reg_rd_wen; // @[ID.scala 55:28]
  reg [2:0] id_io_reg_rd_sel; // @[ID.scala 55:28]
  reg [2:0] id_io_reg_csr_cmd; // @[ID.scala 55:28]
  reg [31:0] id_io_reg_rs2_data; // @[ID.scala 55:28]
  reg [31:0] id_io_reg_imm_b_sext; // @[ID.scala 55:28]
  assign io_out_op1_data = id_io_reg_op1_data; // @[ID.scala 58:12]
  assign io_out_op2_data = id_io_reg_op2_data; // @[ID.scala 58:12]
  assign io_out_rd_addr = id_io_reg_rd_addr; // @[ID.scala 58:12]
  assign io_out_csr_addr_default = id_io_reg_csr_addr_default; // @[ID.scala 58:12]
  assign io_out_exe_fun = id_io_reg_exe_fun; // @[ID.scala 58:12]
  assign io_out_mem_wen = id_io_reg_mem_wen; // @[ID.scala 58:12]
  assign io_out_rd_wen = id_io_reg_rd_wen; // @[ID.scala 58:12]
  assign io_out_rd_sel = id_io_reg_rd_sel; // @[ID.scala 58:12]
  assign io_out_csr_cmd = id_io_reg_csr_cmd; // @[ID.scala 58:12]
  assign io_out_rs2_data = id_io_reg_rs2_data; // @[ID.scala 58:12]
  assign io_out_imm_b_sext = id_io_reg_imm_b_sext; // @[ID.scala 58:12]
  always @(posedge clock) begin
    if (reset) begin // @[ID.scala 55:28]
      id_io_reg_op1_data <= 32'h0; // @[ID.scala 55:28]
    end else begin
      id_io_reg_op1_data <= io_in_op1_data; // @[ID.scala 57:15]
    end
    if (reset) begin // @[ID.scala 55:28]
      id_io_reg_op2_data <= 32'h0; // @[ID.scala 55:28]
    end else begin
      id_io_reg_op2_data <= io_in_op2_data; // @[ID.scala 57:15]
    end
    if (reset) begin // @[ID.scala 55:28]
      id_io_reg_rd_addr <= 5'h0; // @[ID.scala 55:28]
    end else begin
      id_io_reg_rd_addr <= io_in_rd_addr; // @[ID.scala 57:15]
    end
    if (reset) begin // @[ID.scala 55:28]
      id_io_reg_csr_addr_default <= 32'h0; // @[ID.scala 55:28]
    end else begin
      id_io_reg_csr_addr_default <= io_in_csr_addr_default; // @[ID.scala 57:15]
    end
    if (reset) begin // @[ID.scala 55:28]
      id_io_reg_exe_fun <= 5'h0; // @[ID.scala 55:28]
    end else begin
      id_io_reg_exe_fun <= io_in_exe_fun; // @[ID.scala 57:15]
    end
    if (reset) begin // @[ID.scala 55:28]
      id_io_reg_mem_wen <= 1'h0; // @[ID.scala 55:28]
    end else begin
      id_io_reg_mem_wen <= io_in_mem_wen; // @[ID.scala 57:15]
    end
    if (reset) begin // @[ID.scala 55:28]
      id_io_reg_rd_wen <= 1'h0; // @[ID.scala 55:28]
    end else begin
      id_io_reg_rd_wen <= io_in_rd_wen; // @[ID.scala 57:15]
    end
    if (reset) begin // @[ID.scala 55:28]
      id_io_reg_rd_sel <= 3'h0; // @[ID.scala 55:28]
    end else begin
      id_io_reg_rd_sel <= io_in_rd_sel; // @[ID.scala 57:15]
    end
    if (reset) begin // @[ID.scala 55:28]
      id_io_reg_csr_cmd <= 3'h0; // @[ID.scala 55:28]
    end else begin
      id_io_reg_csr_cmd <= io_in_csr_cmd; // @[ID.scala 57:15]
    end
    if (reset) begin // @[ID.scala 55:28]
      id_io_reg_rs2_data <= 32'h0; // @[ID.scala 55:28]
    end else begin
      id_io_reg_rs2_data <= io_in_rs2_data; // @[ID.scala 57:15]
    end
    if (reset) begin // @[ID.scala 55:28]
      id_io_reg_imm_b_sext <= 32'h0; // @[ID.scala 55:28]
    end else begin
      id_io_reg_imm_b_sext <= io_in_imm_b_sext; // @[ID.scala 57:15]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  id_io_reg_op1_data = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  id_io_reg_op2_data = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  id_io_reg_rd_addr = _RAND_2[4:0];
  _RAND_3 = {1{`RANDOM}};
  id_io_reg_csr_addr_default = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  id_io_reg_exe_fun = _RAND_4[4:0];
  _RAND_5 = {1{`RANDOM}};
  id_io_reg_mem_wen = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  id_io_reg_rd_wen = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  id_io_reg_rd_sel = _RAND_7[2:0];
  _RAND_8 = {1{`RANDOM}};
  id_io_reg_csr_cmd = _RAND_8[2:0];
  _RAND_9 = {1{`RANDOM}};
  id_io_reg_rs2_data = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  id_io_reg_imm_b_sext = _RAND_10[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ALU_IO_REG(
  input         clock,
  input         reset,
  input  [31:0] io_in_alu_out,
  output [31:0] io_out_alu_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] alu_io_reg_alu_out; // @[ALU.scala 29:29]
  assign io_out_alu_out = alu_io_reg_alu_out; // @[ALU.scala 32:12]
  always @(posedge clock) begin
    if (reset) begin // @[ALU.scala 29:29]
      alu_io_reg_alu_out <= 32'h0; // @[ALU.scala 29:29]
    end else begin
      alu_io_reg_alu_out <= io_in_alu_out; // @[ALU.scala 31:16]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  alu_io_reg_alu_out = _RAND_0[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module WB_IO_REG(
  input         clock,
  input         reset,
  input         io_in_rd_wen,
  input  [4:0]  io_in_rd_addr,
  input  [31:0] io_in_rd_data,
  output        io_out_rd_wen,
  output [4:0]  io_out_rd_addr,
  output [31:0] io_out_rd_data
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg  wb_io_reg_rd_wen; // @[WB.scala 31:28]
  reg [4:0] wb_io_reg_rd_addr; // @[WB.scala 31:28]
  reg [31:0] wb_io_reg_rd_data; // @[WB.scala 31:28]
  assign io_out_rd_wen = wb_io_reg_rd_wen; // @[WB.scala 34:12]
  assign io_out_rd_addr = wb_io_reg_rd_addr; // @[WB.scala 34:12]
  assign io_out_rd_data = wb_io_reg_rd_data; // @[WB.scala 34:12]
  always @(posedge clock) begin
    if (reset) begin // @[WB.scala 31:28]
      wb_io_reg_rd_wen <= 1'h0; // @[WB.scala 31:28]
    end else begin
      wb_io_reg_rd_wen <= io_in_rd_wen; // @[WB.scala 33:15]
    end
    if (reset) begin // @[WB.scala 31:28]
      wb_io_reg_rd_addr <= 5'h0; // @[WB.scala 31:28]
    end else begin
      wb_io_reg_rd_addr <= io_in_rd_addr; // @[WB.scala 33:15]
    end
    if (reset) begin // @[WB.scala 31:28]
      wb_io_reg_rd_data <= 32'h0; // @[WB.scala 31:28]
    end else begin
      wb_io_reg_rd_data <= io_in_rd_data; // @[WB.scala 33:15]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  wb_io_reg_rd_wen = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  wb_io_reg_rd_addr = _RAND_1[4:0];
  _RAND_2 = {1{`RANDOM}};
  wb_io_reg_rd_data = _RAND_2[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Top(
  input   clock,
  input   reset,
  output  io_exit
);
  wire  memory_clock; // @[Top.scala 15:24]
  wire [31:0] memory_io_instmem_addr; // @[Top.scala 15:24]
  wire [31:0] memory_io_instmem_inst; // @[Top.scala 15:24]
  wire [31:0] memory_io_datamem_addr; // @[Top.scala 15:24]
  wire [31:0] memory_io_datamem_rdata; // @[Top.scala 15:24]
  wire  memory_io_datamem_wen; // @[Top.scala 15:24]
  wire [31:0] memory_io_datamem_wdata; // @[Top.scala 15:24]
  wire  pc_clock; // @[Top.scala 16:20]
  wire  pc_reset; // @[Top.scala 16:20]
  wire  pc_io_in_id_in_stall_flag; // @[Top.scala 16:20]
  wire [31:0] pc_io_in_ex_in_alu_out; // @[Top.scala 16:20]
  wire  pc_io_in_ex_in_jump_flag; // @[Top.scala 16:20]
  wire  pc_io_in_br_in_br_flag; // @[Top.scala 16:20]
  wire [31:0] pc_io_in_br_in_br_target; // @[Top.scala 16:20]
  wire [31:0] pc_io_out_reg_pc; // @[Top.scala 16:20]
  wire [31:0] pc_io_out_inst; // @[Top.scala 16:20]
  wire  pc_io_out_br_flag; // @[Top.scala 16:20]
  wire  pc_io_out_jump_flag; // @[Top.scala 16:20]
  wire [31:0] pc_io_instmem_addr; // @[Top.scala 16:20]
  wire [31:0] pc_io_instmem_inst; // @[Top.scala 16:20]
  wire  id_clock; // @[Top.scala 17:20]
  wire  id_reset; // @[Top.scala 17:20]
  wire [31:0] id_io_in_if_in_reg_pc; // @[Top.scala 17:20]
  wire [31:0] id_io_in_if_in_inst; // @[Top.scala 17:20]
  wire  id_io_in_if_in_br_flag; // @[Top.scala 17:20]
  wire  id_io_in_if_in_jump_flag; // @[Top.scala 17:20]
  wire [4:0] id_io_in_id_reg_in_rd_addr; // @[Top.scala 17:20]
  wire  id_io_in_id_reg_in_rd_wen; // @[Top.scala 17:20]
  wire  id_io_in_mem_in_rd_wen; // @[Top.scala 17:20]
  wire [4:0] id_io_in_mem_in_rd_addr; // @[Top.scala 17:20]
  wire [31:0] id_io_in_mem_in_rd_data; // @[Top.scala 17:20]
  wire  id_io_in_wb_in_rd_wen; // @[Top.scala 17:20]
  wire [4:0] id_io_in_wb_in_rd_addr; // @[Top.scala 17:20]
  wire [31:0] id_io_in_wb_in_rd_data; // @[Top.scala 17:20]
  wire [31:0] id_io_out_op1_data; // @[Top.scala 17:20]
  wire [31:0] id_io_out_op2_data; // @[Top.scala 17:20]
  wire [4:0] id_io_out_rd_addr; // @[Top.scala 17:20]
  wire [31:0] id_io_out_csr_addr_default; // @[Top.scala 17:20]
  wire [4:0] id_io_out_exe_fun; // @[Top.scala 17:20]
  wire  id_io_out_mem_wen; // @[Top.scala 17:20]
  wire  id_io_out_rd_wen; // @[Top.scala 17:20]
  wire [2:0] id_io_out_rd_sel; // @[Top.scala 17:20]
  wire [2:0] id_io_out_csr_cmd; // @[Top.scala 17:20]
  wire [31:0] id_io_out_rs2_data; // @[Top.scala 17:20]
  wire [31:0] id_io_out_imm_b_sext; // @[Top.scala 17:20]
  wire  id_io_out_stall_flag; // @[Top.scala 17:20]
  wire  alu_clock; // @[Top.scala 18:21]
  wire  alu_reset; // @[Top.scala 18:21]
  wire [31:0] alu_io_in_id_in_op1_data; // @[Top.scala 18:21]
  wire [31:0] alu_io_in_id_in_op2_data; // @[Top.scala 18:21]
  wire [4:0] alu_io_in_id_in_exe_fun; // @[Top.scala 18:21]
  wire [2:0] alu_io_in_id_in_rd_sel; // @[Top.scala 18:21]
  wire [31:0] alu_io_out_alu_out; // @[Top.scala 18:21]
  wire  alu_io_out_jump_flag; // @[Top.scala 18:21]
  wire  br_clock; // @[Top.scala 19:20]
  wire  br_reset; // @[Top.scala 19:20]
  wire [31:0] br_io_in_if_in_reg_pc; // @[Top.scala 19:20]
  wire [31:0] br_io_in_id_in_op1_data; // @[Top.scala 19:20]
  wire [31:0] br_io_in_id_in_op2_data; // @[Top.scala 19:20]
  wire [4:0] br_io_in_id_in_exe_fun; // @[Top.scala 19:20]
  wire [31:0] br_io_in_id_in_imm_b_sext; // @[Top.scala 19:20]
  wire  br_io_out_br_flag; // @[Top.scala 19:20]
  wire [31:0] br_io_out_br_target; // @[Top.scala 19:20]
  wire  mem_clock; // @[Top.scala 20:21]
  wire  mem_reset; // @[Top.scala 20:21]
  wire [31:0] mem_io_in_if_in_reg_pc; // @[Top.scala 20:21]
  wire [31:0] mem_io_in_id_in_op1_data; // @[Top.scala 20:21]
  wire [4:0] mem_io_in_id_in_rd_addr; // @[Top.scala 20:21]
  wire [31:0] mem_io_in_id_in_csr_addr_default; // @[Top.scala 20:21]
  wire  mem_io_in_id_in_mem_wen; // @[Top.scala 20:21]
  wire  mem_io_in_id_in_rd_wen; // @[Top.scala 20:21]
  wire [2:0] mem_io_in_id_in_rd_sel; // @[Top.scala 20:21]
  wire [2:0] mem_io_in_id_in_csr_cmd; // @[Top.scala 20:21]
  wire [31:0] mem_io_in_id_in_rs2_data; // @[Top.scala 20:21]
  wire [31:0] mem_io_in_ex_in_alu_out; // @[Top.scala 20:21]
  wire  mem_io_out_rd_wen; // @[Top.scala 20:21]
  wire [4:0] mem_io_out_rd_addr; // @[Top.scala 20:21]
  wire [31:0] mem_io_out_rd_data; // @[Top.scala 20:21]
  wire [31:0] mem_io_datamem_addr; // @[Top.scala 20:21]
  wire [31:0] mem_io_datamem_rdata; // @[Top.scala 20:21]
  wire  mem_io_datamem_wen; // @[Top.scala 20:21]
  wire [31:0] mem_io_datamem_wdata; // @[Top.scala 20:21]
  wire  wb_clock; // @[Top.scala 21:20]
  wire  wb_reset; // @[Top.scala 21:20]
  wire  wb_io_in_mem_in_rd_wen; // @[Top.scala 21:20]
  wire [4:0] wb_io_in_mem_in_rd_addr; // @[Top.scala 21:20]
  wire [31:0] wb_io_in_mem_in_rd_data; // @[Top.scala 21:20]
  wire  wb_io_out_rd_wen; // @[Top.scala 21:20]
  wire [4:0] wb_io_out_rd_addr; // @[Top.scala 21:20]
  wire [31:0] wb_io_out_rd_data; // @[Top.scala 21:20]
  wire  if_io_reg_clock; // @[Top.scala 24:27]
  wire  if_io_reg_reset; // @[Top.scala 24:27]
  wire  if_io_reg_io_stall_flag; // @[Top.scala 24:27]
  wire [31:0] if_io_reg_io_in_reg_pc; // @[Top.scala 24:27]
  wire [31:0] if_io_reg_io_in_inst; // @[Top.scala 24:27]
  wire  if_io_reg_io_in_br_flag; // @[Top.scala 24:27]
  wire  if_io_reg_io_in_jump_flag; // @[Top.scala 24:27]
  wire [31:0] if_io_reg_io_out_reg_pc; // @[Top.scala 24:27]
  wire [31:0] if_io_reg_io_out_inst; // @[Top.scala 24:27]
  wire  if_io_reg_io_out_br_flag; // @[Top.scala 24:27]
  wire  if_io_reg_io_out_jump_flag; // @[Top.scala 24:27]
  wire  if_io_reg_n_clock; // @[Top.scala 25:29]
  wire  if_io_reg_n_reset; // @[Top.scala 25:29]
  wire [31:0] if_io_reg_n_io_in_reg_pc; // @[Top.scala 25:29]
  wire [31:0] if_io_reg_n_io_out_reg_pc; // @[Top.scala 25:29]
  wire  if_io_reg_nn_clock; // @[Top.scala 26:30]
  wire  if_io_reg_nn_reset; // @[Top.scala 26:30]
  wire [31:0] if_io_reg_nn_io_in_reg_pc; // @[Top.scala 26:30]
  wire [31:0] if_io_reg_nn_io_out_reg_pc; // @[Top.scala 26:30]
  wire  id_io_reg_clock; // @[Top.scala 27:27]
  wire  id_io_reg_reset; // @[Top.scala 27:27]
  wire [31:0] id_io_reg_io_in_op1_data; // @[Top.scala 27:27]
  wire [31:0] id_io_reg_io_in_op2_data; // @[Top.scala 27:27]
  wire [4:0] id_io_reg_io_in_rd_addr; // @[Top.scala 27:27]
  wire [31:0] id_io_reg_io_in_csr_addr_default; // @[Top.scala 27:27]
  wire [4:0] id_io_reg_io_in_exe_fun; // @[Top.scala 27:27]
  wire  id_io_reg_io_in_mem_wen; // @[Top.scala 27:27]
  wire  id_io_reg_io_in_rd_wen; // @[Top.scala 27:27]
  wire [2:0] id_io_reg_io_in_rd_sel; // @[Top.scala 27:27]
  wire [2:0] id_io_reg_io_in_csr_cmd; // @[Top.scala 27:27]
  wire [31:0] id_io_reg_io_in_rs2_data; // @[Top.scala 27:27]
  wire [31:0] id_io_reg_io_in_imm_b_sext; // @[Top.scala 27:27]
  wire [31:0] id_io_reg_io_out_op1_data; // @[Top.scala 27:27]
  wire [31:0] id_io_reg_io_out_op2_data; // @[Top.scala 27:27]
  wire [4:0] id_io_reg_io_out_rd_addr; // @[Top.scala 27:27]
  wire [31:0] id_io_reg_io_out_csr_addr_default; // @[Top.scala 27:27]
  wire [4:0] id_io_reg_io_out_exe_fun; // @[Top.scala 27:27]
  wire  id_io_reg_io_out_mem_wen; // @[Top.scala 27:27]
  wire  id_io_reg_io_out_rd_wen; // @[Top.scala 27:27]
  wire [2:0] id_io_reg_io_out_rd_sel; // @[Top.scala 27:27]
  wire [2:0] id_io_reg_io_out_csr_cmd; // @[Top.scala 27:27]
  wire [31:0] id_io_reg_io_out_rs2_data; // @[Top.scala 27:27]
  wire [31:0] id_io_reg_io_out_imm_b_sext; // @[Top.scala 27:27]
  wire  id_io_reg_n_clock; // @[Top.scala 28:29]
  wire  id_io_reg_n_reset; // @[Top.scala 28:29]
  wire [31:0] id_io_reg_n_io_in_op1_data; // @[Top.scala 28:29]
  wire [31:0] id_io_reg_n_io_in_op2_data; // @[Top.scala 28:29]
  wire [4:0] id_io_reg_n_io_in_rd_addr; // @[Top.scala 28:29]
  wire [31:0] id_io_reg_n_io_in_csr_addr_default; // @[Top.scala 28:29]
  wire [4:0] id_io_reg_n_io_in_exe_fun; // @[Top.scala 28:29]
  wire  id_io_reg_n_io_in_mem_wen; // @[Top.scala 28:29]
  wire  id_io_reg_n_io_in_rd_wen; // @[Top.scala 28:29]
  wire [2:0] id_io_reg_n_io_in_rd_sel; // @[Top.scala 28:29]
  wire [2:0] id_io_reg_n_io_in_csr_cmd; // @[Top.scala 28:29]
  wire [31:0] id_io_reg_n_io_in_rs2_data; // @[Top.scala 28:29]
  wire [31:0] id_io_reg_n_io_in_imm_b_sext; // @[Top.scala 28:29]
  wire [31:0] id_io_reg_n_io_out_op1_data; // @[Top.scala 28:29]
  wire [31:0] id_io_reg_n_io_out_op2_data; // @[Top.scala 28:29]
  wire [4:0] id_io_reg_n_io_out_rd_addr; // @[Top.scala 28:29]
  wire [31:0] id_io_reg_n_io_out_csr_addr_default; // @[Top.scala 28:29]
  wire [4:0] id_io_reg_n_io_out_exe_fun; // @[Top.scala 28:29]
  wire  id_io_reg_n_io_out_mem_wen; // @[Top.scala 28:29]
  wire  id_io_reg_n_io_out_rd_wen; // @[Top.scala 28:29]
  wire [2:0] id_io_reg_n_io_out_rd_sel; // @[Top.scala 28:29]
  wire [2:0] id_io_reg_n_io_out_csr_cmd; // @[Top.scala 28:29]
  wire [31:0] id_io_reg_n_io_out_rs2_data; // @[Top.scala 28:29]
  wire [31:0] id_io_reg_n_io_out_imm_b_sext; // @[Top.scala 28:29]
  wire  ex_io_reg_clock; // @[Top.scala 29:27]
  wire  ex_io_reg_reset; // @[Top.scala 29:27]
  wire [31:0] ex_io_reg_io_in_alu_out; // @[Top.scala 29:27]
  wire [31:0] ex_io_reg_io_out_alu_out; // @[Top.scala 29:27]
  wire  mem_io_reg_clock; // @[Top.scala 30:28]
  wire  mem_io_reg_reset; // @[Top.scala 30:28]
  wire  mem_io_reg_io_in_rd_wen; // @[Top.scala 30:28]
  wire [4:0] mem_io_reg_io_in_rd_addr; // @[Top.scala 30:28]
  wire [31:0] mem_io_reg_io_in_rd_data; // @[Top.scala 30:28]
  wire  mem_io_reg_io_out_rd_wen; // @[Top.scala 30:28]
  wire [4:0] mem_io_reg_io_out_rd_addr; // @[Top.scala 30:28]
  wire [31:0] mem_io_reg_io_out_rd_data; // @[Top.scala 30:28]
  wire [31:0] _io_exit_T = pc_io_out_inst; // @[Top.scala 72:15]
  wire  _io_exit_T_1 = 32'hc0001073 == _io_exit_T; // @[Top.scala 72:15]
  wire  _io_exit_T_2 = pc_io_out_inst == 32'h0; // @[Top.scala 73:15]
  wire  _io_exit_T_3 = pc_io_out_reg_pc == 32'h44; // @[Top.scala 74:17]
  wire  _T_1 = ~reset; // @[Top.scala 76:11]
  Memory memory ( // @[Top.scala 15:24]
    .clock(memory_clock),
    .io_instmem_addr(memory_io_instmem_addr),
    .io_instmem_inst(memory_io_instmem_inst),
    .io_datamem_addr(memory_io_datamem_addr),
    .io_datamem_rdata(memory_io_datamem_rdata),
    .io_datamem_wen(memory_io_datamem_wen),
    .io_datamem_wdata(memory_io_datamem_wdata)
  );
  PC pc ( // @[Top.scala 16:20]
    .clock(pc_clock),
    .reset(pc_reset),
    .io_in_id_in_stall_flag(pc_io_in_id_in_stall_flag),
    .io_in_ex_in_alu_out(pc_io_in_ex_in_alu_out),
    .io_in_ex_in_jump_flag(pc_io_in_ex_in_jump_flag),
    .io_in_br_in_br_flag(pc_io_in_br_in_br_flag),
    .io_in_br_in_br_target(pc_io_in_br_in_br_target),
    .io_out_reg_pc(pc_io_out_reg_pc),
    .io_out_inst(pc_io_out_inst),
    .io_out_br_flag(pc_io_out_br_flag),
    .io_out_jump_flag(pc_io_out_jump_flag),
    .io_instmem_addr(pc_io_instmem_addr),
    .io_instmem_inst(pc_io_instmem_inst)
  );
  ID id ( // @[Top.scala 17:20]
    .clock(id_clock),
    .reset(id_reset),
    .io_in_if_in_reg_pc(id_io_in_if_in_reg_pc),
    .io_in_if_in_inst(id_io_in_if_in_inst),
    .io_in_if_in_br_flag(id_io_in_if_in_br_flag),
    .io_in_if_in_jump_flag(id_io_in_if_in_jump_flag),
    .io_in_id_reg_in_rd_addr(id_io_in_id_reg_in_rd_addr),
    .io_in_id_reg_in_rd_wen(id_io_in_id_reg_in_rd_wen),
    .io_in_mem_in_rd_wen(id_io_in_mem_in_rd_wen),
    .io_in_mem_in_rd_addr(id_io_in_mem_in_rd_addr),
    .io_in_mem_in_rd_data(id_io_in_mem_in_rd_data),
    .io_in_wb_in_rd_wen(id_io_in_wb_in_rd_wen),
    .io_in_wb_in_rd_addr(id_io_in_wb_in_rd_addr),
    .io_in_wb_in_rd_data(id_io_in_wb_in_rd_data),
    .io_out_op1_data(id_io_out_op1_data),
    .io_out_op2_data(id_io_out_op2_data),
    .io_out_rd_addr(id_io_out_rd_addr),
    .io_out_csr_addr_default(id_io_out_csr_addr_default),
    .io_out_exe_fun(id_io_out_exe_fun),
    .io_out_mem_wen(id_io_out_mem_wen),
    .io_out_rd_wen(id_io_out_rd_wen),
    .io_out_rd_sel(id_io_out_rd_sel),
    .io_out_csr_cmd(id_io_out_csr_cmd),
    .io_out_rs2_data(id_io_out_rs2_data),
    .io_out_imm_b_sext(id_io_out_imm_b_sext),
    .io_out_stall_flag(id_io_out_stall_flag)
  );
  ALU alu ( // @[Top.scala 18:21]
    .clock(alu_clock),
    .reset(alu_reset),
    .io_in_id_in_op1_data(alu_io_in_id_in_op1_data),
    .io_in_id_in_op2_data(alu_io_in_id_in_op2_data),
    .io_in_id_in_exe_fun(alu_io_in_id_in_exe_fun),
    .io_in_id_in_rd_sel(alu_io_in_id_in_rd_sel),
    .io_out_alu_out(alu_io_out_alu_out),
    .io_out_jump_flag(alu_io_out_jump_flag)
  );
  BR br ( // @[Top.scala 19:20]
    .clock(br_clock),
    .reset(br_reset),
    .io_in_if_in_reg_pc(br_io_in_if_in_reg_pc),
    .io_in_id_in_op1_data(br_io_in_id_in_op1_data),
    .io_in_id_in_op2_data(br_io_in_id_in_op2_data),
    .io_in_id_in_exe_fun(br_io_in_id_in_exe_fun),
    .io_in_id_in_imm_b_sext(br_io_in_id_in_imm_b_sext),
    .io_out_br_flag(br_io_out_br_flag),
    .io_out_br_target(br_io_out_br_target)
  );
  MEM mem ( // @[Top.scala 20:21]
    .clock(mem_clock),
    .reset(mem_reset),
    .io_in_if_in_reg_pc(mem_io_in_if_in_reg_pc),
    .io_in_id_in_op1_data(mem_io_in_id_in_op1_data),
    .io_in_id_in_rd_addr(mem_io_in_id_in_rd_addr),
    .io_in_id_in_csr_addr_default(mem_io_in_id_in_csr_addr_default),
    .io_in_id_in_mem_wen(mem_io_in_id_in_mem_wen),
    .io_in_id_in_rd_wen(mem_io_in_id_in_rd_wen),
    .io_in_id_in_rd_sel(mem_io_in_id_in_rd_sel),
    .io_in_id_in_csr_cmd(mem_io_in_id_in_csr_cmd),
    .io_in_id_in_rs2_data(mem_io_in_id_in_rs2_data),
    .io_in_ex_in_alu_out(mem_io_in_ex_in_alu_out),
    .io_out_rd_wen(mem_io_out_rd_wen),
    .io_out_rd_addr(mem_io_out_rd_addr),
    .io_out_rd_data(mem_io_out_rd_data),
    .io_datamem_addr(mem_io_datamem_addr),
    .io_datamem_rdata(mem_io_datamem_rdata),
    .io_datamem_wen(mem_io_datamem_wen),
    .io_datamem_wdata(mem_io_datamem_wdata)
  );
  WB wb ( // @[Top.scala 21:20]
    .clock(wb_clock),
    .reset(wb_reset),
    .io_in_mem_in_rd_wen(wb_io_in_mem_in_rd_wen),
    .io_in_mem_in_rd_addr(wb_io_in_mem_in_rd_addr),
    .io_in_mem_in_rd_data(wb_io_in_mem_in_rd_data),
    .io_out_rd_wen(wb_io_out_rd_wen),
    .io_out_rd_addr(wb_io_out_rd_addr),
    .io_out_rd_data(wb_io_out_rd_data)
  );
  PC_BUBBLE_REG if_io_reg ( // @[Top.scala 24:27]
    .clock(if_io_reg_clock),
    .reset(if_io_reg_reset),
    .io_stall_flag(if_io_reg_io_stall_flag),
    .io_in_reg_pc(if_io_reg_io_in_reg_pc),
    .io_in_inst(if_io_reg_io_in_inst),
    .io_in_br_flag(if_io_reg_io_in_br_flag),
    .io_in_jump_flag(if_io_reg_io_in_jump_flag),
    .io_out_reg_pc(if_io_reg_io_out_reg_pc),
    .io_out_inst(if_io_reg_io_out_inst),
    .io_out_br_flag(if_io_reg_io_out_br_flag),
    .io_out_jump_flag(if_io_reg_io_out_jump_flag)
  );
  PC_IO_REG if_io_reg_n ( // @[Top.scala 25:29]
    .clock(if_io_reg_n_clock),
    .reset(if_io_reg_n_reset),
    .io_in_reg_pc(if_io_reg_n_io_in_reg_pc),
    .io_out_reg_pc(if_io_reg_n_io_out_reg_pc)
  );
  PC_IO_REG if_io_reg_nn ( // @[Top.scala 26:30]
    .clock(if_io_reg_nn_clock),
    .reset(if_io_reg_nn_reset),
    .io_in_reg_pc(if_io_reg_nn_io_in_reg_pc),
    .io_out_reg_pc(if_io_reg_nn_io_out_reg_pc)
  );
  ID_IO_REG id_io_reg ( // @[Top.scala 27:27]
    .clock(id_io_reg_clock),
    .reset(id_io_reg_reset),
    .io_in_op1_data(id_io_reg_io_in_op1_data),
    .io_in_op2_data(id_io_reg_io_in_op2_data),
    .io_in_rd_addr(id_io_reg_io_in_rd_addr),
    .io_in_csr_addr_default(id_io_reg_io_in_csr_addr_default),
    .io_in_exe_fun(id_io_reg_io_in_exe_fun),
    .io_in_mem_wen(id_io_reg_io_in_mem_wen),
    .io_in_rd_wen(id_io_reg_io_in_rd_wen),
    .io_in_rd_sel(id_io_reg_io_in_rd_sel),
    .io_in_csr_cmd(id_io_reg_io_in_csr_cmd),
    .io_in_rs2_data(id_io_reg_io_in_rs2_data),
    .io_in_imm_b_sext(id_io_reg_io_in_imm_b_sext),
    .io_out_op1_data(id_io_reg_io_out_op1_data),
    .io_out_op2_data(id_io_reg_io_out_op2_data),
    .io_out_rd_addr(id_io_reg_io_out_rd_addr),
    .io_out_csr_addr_default(id_io_reg_io_out_csr_addr_default),
    .io_out_exe_fun(id_io_reg_io_out_exe_fun),
    .io_out_mem_wen(id_io_reg_io_out_mem_wen),
    .io_out_rd_wen(id_io_reg_io_out_rd_wen),
    .io_out_rd_sel(id_io_reg_io_out_rd_sel),
    .io_out_csr_cmd(id_io_reg_io_out_csr_cmd),
    .io_out_rs2_data(id_io_reg_io_out_rs2_data),
    .io_out_imm_b_sext(id_io_reg_io_out_imm_b_sext)
  );
  ID_IO_REG id_io_reg_n ( // @[Top.scala 28:29]
    .clock(id_io_reg_n_clock),
    .reset(id_io_reg_n_reset),
    .io_in_op1_data(id_io_reg_n_io_in_op1_data),
    .io_in_op2_data(id_io_reg_n_io_in_op2_data),
    .io_in_rd_addr(id_io_reg_n_io_in_rd_addr),
    .io_in_csr_addr_default(id_io_reg_n_io_in_csr_addr_default),
    .io_in_exe_fun(id_io_reg_n_io_in_exe_fun),
    .io_in_mem_wen(id_io_reg_n_io_in_mem_wen),
    .io_in_rd_wen(id_io_reg_n_io_in_rd_wen),
    .io_in_rd_sel(id_io_reg_n_io_in_rd_sel),
    .io_in_csr_cmd(id_io_reg_n_io_in_csr_cmd),
    .io_in_rs2_data(id_io_reg_n_io_in_rs2_data),
    .io_in_imm_b_sext(id_io_reg_n_io_in_imm_b_sext),
    .io_out_op1_data(id_io_reg_n_io_out_op1_data),
    .io_out_op2_data(id_io_reg_n_io_out_op2_data),
    .io_out_rd_addr(id_io_reg_n_io_out_rd_addr),
    .io_out_csr_addr_default(id_io_reg_n_io_out_csr_addr_default),
    .io_out_exe_fun(id_io_reg_n_io_out_exe_fun),
    .io_out_mem_wen(id_io_reg_n_io_out_mem_wen),
    .io_out_rd_wen(id_io_reg_n_io_out_rd_wen),
    .io_out_rd_sel(id_io_reg_n_io_out_rd_sel),
    .io_out_csr_cmd(id_io_reg_n_io_out_csr_cmd),
    .io_out_rs2_data(id_io_reg_n_io_out_rs2_data),
    .io_out_imm_b_sext(id_io_reg_n_io_out_imm_b_sext)
  );
  ALU_IO_REG ex_io_reg ( // @[Top.scala 29:27]
    .clock(ex_io_reg_clock),
    .reset(ex_io_reg_reset),
    .io_in_alu_out(ex_io_reg_io_in_alu_out),
    .io_out_alu_out(ex_io_reg_io_out_alu_out)
  );
  WB_IO_REG mem_io_reg ( // @[Top.scala 30:28]
    .clock(mem_io_reg_clock),
    .reset(mem_io_reg_reset),
    .io_in_rd_wen(mem_io_reg_io_in_rd_wen),
    .io_in_rd_addr(mem_io_reg_io_in_rd_addr),
    .io_in_rd_data(mem_io_reg_io_in_rd_data),
    .io_out_rd_wen(mem_io_reg_io_out_rd_wen),
    .io_out_rd_addr(mem_io_reg_io_out_rd_addr),
    .io_out_rd_data(mem_io_reg_io_out_rd_data)
  );
  assign io_exit = _io_exit_T_1 | (_io_exit_T_2 | _io_exit_T_3); // @[Mux.scala 98:16]
  assign memory_clock = clock;
  assign memory_io_instmem_addr = pc_io_instmem_addr; // @[Top.scala 37:21]
  assign memory_io_datamem_addr = mem_io_datamem_addr; // @[Top.scala 64:21]
  assign memory_io_datamem_wen = mem_io_datamem_wen; // @[Top.scala 64:21]
  assign memory_io_datamem_wdata = mem_io_datamem_wdata; // @[Top.scala 64:21]
  assign pc_clock = clock;
  assign pc_reset = reset;
  assign pc_io_in_id_in_stall_flag = id_io_out_stall_flag; // @[Top.scala 34:24]
  assign pc_io_in_ex_in_alu_out = alu_io_out_alu_out; // @[Top.scala 35:24]
  assign pc_io_in_ex_in_jump_flag = alu_io_out_jump_flag; // @[Top.scala 35:24]
  assign pc_io_in_br_in_br_flag = br_io_out_br_flag; // @[Top.scala 36:24]
  assign pc_io_in_br_in_br_target = br_io_out_br_target; // @[Top.scala 36:24]
  assign pc_io_instmem_inst = memory_io_instmem_inst; // @[Top.scala 37:21]
  assign id_clock = clock;
  assign id_reset = reset;
  assign id_io_in_if_in_reg_pc = if_io_reg_io_out_reg_pc; // @[Top.scala 39:24]
  assign id_io_in_if_in_inst = if_io_reg_io_out_inst; // @[Top.scala 39:24]
  assign id_io_in_if_in_br_flag = if_io_reg_io_out_br_flag; // @[Top.scala 39:24]
  assign id_io_in_if_in_jump_flag = if_io_reg_io_out_jump_flag; // @[Top.scala 39:24]
  assign id_io_in_id_reg_in_rd_addr = id_io_reg_io_out_rd_addr; // @[Top.scala 42:24]
  assign id_io_in_id_reg_in_rd_wen = id_io_reg_io_out_rd_wen; // @[Top.scala 42:24]
  assign id_io_in_mem_in_rd_wen = mem_io_out_rd_wen; // @[Top.scala 44:22]
  assign id_io_in_mem_in_rd_addr = mem_io_out_rd_addr; // @[Top.scala 44:22]
  assign id_io_in_mem_in_rd_data = mem_io_out_rd_data; // @[Top.scala 44:22]
  assign id_io_in_wb_in_rd_wen = wb_io_out_rd_wen; // @[Top.scala 43:24]
  assign id_io_in_wb_in_rd_addr = wb_io_out_rd_addr; // @[Top.scala 43:24]
  assign id_io_in_wb_in_rd_data = wb_io_out_rd_data; // @[Top.scala 43:24]
  assign alu_clock = clock;
  assign alu_reset = reset;
  assign alu_io_in_id_in_op1_data = id_io_reg_io_out_op1_data; // @[Top.scala 46:24]
  assign alu_io_in_id_in_op2_data = id_io_reg_io_out_op2_data; // @[Top.scala 46:24]
  assign alu_io_in_id_in_exe_fun = id_io_reg_io_out_exe_fun; // @[Top.scala 46:24]
  assign alu_io_in_id_in_rd_sel = id_io_reg_io_out_rd_sel; // @[Top.scala 46:24]
  assign br_clock = clock;
  assign br_reset = reset;
  assign br_io_in_if_in_reg_pc = if_io_reg_n_io_out_reg_pc; // @[Top.scala 49:24]
  assign br_io_in_id_in_op1_data = id_io_reg_io_out_op1_data; // @[Top.scala 52:24]
  assign br_io_in_id_in_op2_data = id_io_reg_io_out_op2_data; // @[Top.scala 52:24]
  assign br_io_in_id_in_exe_fun = id_io_reg_io_out_exe_fun; // @[Top.scala 52:24]
  assign br_io_in_id_in_imm_b_sext = id_io_reg_io_out_imm_b_sext; // @[Top.scala 52:24]
  assign mem_clock = clock;
  assign mem_reset = reset;
  assign mem_io_in_if_in_reg_pc = if_io_reg_nn_io_out_reg_pc; // @[Top.scala 55:24]
  assign mem_io_in_id_in_op1_data = id_io_reg_n_io_out_op1_data; // @[Top.scala 59:24]
  assign mem_io_in_id_in_rd_addr = id_io_reg_n_io_out_rd_addr; // @[Top.scala 59:24]
  assign mem_io_in_id_in_csr_addr_default = id_io_reg_n_io_out_csr_addr_default; // @[Top.scala 59:24]
  assign mem_io_in_id_in_mem_wen = id_io_reg_n_io_out_mem_wen; // @[Top.scala 59:24]
  assign mem_io_in_id_in_rd_wen = id_io_reg_n_io_out_rd_wen; // @[Top.scala 59:24]
  assign mem_io_in_id_in_rd_sel = id_io_reg_n_io_out_rd_sel; // @[Top.scala 59:24]
  assign mem_io_in_id_in_csr_cmd = id_io_reg_n_io_out_csr_cmd; // @[Top.scala 59:24]
  assign mem_io_in_id_in_rs2_data = id_io_reg_n_io_out_rs2_data; // @[Top.scala 59:24]
  assign mem_io_in_ex_in_alu_out = ex_io_reg_io_out_alu_out; // @[Top.scala 62:24]
  assign mem_io_datamem_rdata = memory_io_datamem_rdata; // @[Top.scala 64:21]
  assign wb_clock = clock;
  assign wb_reset = reset;
  assign wb_io_in_mem_in_rd_wen = mem_io_reg_io_out_rd_wen; // @[Top.scala 66:24]
  assign wb_io_in_mem_in_rd_addr = mem_io_reg_io_out_rd_addr; // @[Top.scala 66:24]
  assign wb_io_in_mem_in_rd_data = mem_io_reg_io_out_rd_data; // @[Top.scala 66:24]
  assign if_io_reg_clock = clock;
  assign if_io_reg_reset = reset;
  assign if_io_reg_io_stall_flag = id_io_out_stall_flag; // @[Top.scala 40:34]
  assign if_io_reg_io_in_reg_pc = pc_io_out_reg_pc; // @[Top.scala 58:29]
  assign if_io_reg_io_in_inst = pc_io_out_inst; // @[Top.scala 58:29]
  assign if_io_reg_io_in_br_flag = pc_io_out_br_flag; // @[Top.scala 58:29]
  assign if_io_reg_io_in_jump_flag = pc_io_out_jump_flag; // @[Top.scala 58:29]
  assign if_io_reg_n_clock = clock;
  assign if_io_reg_n_reset = reset;
  assign if_io_reg_n_io_in_reg_pc = if_io_reg_io_out_reg_pc; // @[Top.scala 57:29]
  assign if_io_reg_nn_clock = clock;
  assign if_io_reg_nn_reset = reset;
  assign if_io_reg_nn_io_in_reg_pc = if_io_reg_n_io_out_reg_pc; // @[Top.scala 56:29]
  assign id_io_reg_clock = clock;
  assign id_io_reg_reset = reset;
  assign id_io_reg_io_in_op1_data = id_io_out_op1_data; // @[Top.scala 61:29]
  assign id_io_reg_io_in_op2_data = id_io_out_op2_data; // @[Top.scala 61:29]
  assign id_io_reg_io_in_rd_addr = id_io_out_rd_addr; // @[Top.scala 61:29]
  assign id_io_reg_io_in_csr_addr_default = id_io_out_csr_addr_default; // @[Top.scala 61:29]
  assign id_io_reg_io_in_exe_fun = id_io_out_exe_fun; // @[Top.scala 61:29]
  assign id_io_reg_io_in_mem_wen = id_io_out_mem_wen; // @[Top.scala 61:29]
  assign id_io_reg_io_in_rd_wen = id_io_out_rd_wen; // @[Top.scala 61:29]
  assign id_io_reg_io_in_rd_sel = id_io_out_rd_sel; // @[Top.scala 61:29]
  assign id_io_reg_io_in_csr_cmd = id_io_out_csr_cmd; // @[Top.scala 61:29]
  assign id_io_reg_io_in_rs2_data = id_io_out_rs2_data; // @[Top.scala 61:29]
  assign id_io_reg_io_in_imm_b_sext = id_io_out_imm_b_sext; // @[Top.scala 61:29]
  assign id_io_reg_n_clock = clock;
  assign id_io_reg_n_reset = reset;
  assign id_io_reg_n_io_in_op1_data = id_io_reg_io_out_op1_data; // @[Top.scala 60:29]
  assign id_io_reg_n_io_in_op2_data = id_io_reg_io_out_op2_data; // @[Top.scala 60:29]
  assign id_io_reg_n_io_in_rd_addr = id_io_reg_io_out_rd_addr; // @[Top.scala 60:29]
  assign id_io_reg_n_io_in_csr_addr_default = id_io_reg_io_out_csr_addr_default; // @[Top.scala 60:29]
  assign id_io_reg_n_io_in_exe_fun = id_io_reg_io_out_exe_fun; // @[Top.scala 60:29]
  assign id_io_reg_n_io_in_mem_wen = id_io_reg_io_out_mem_wen; // @[Top.scala 60:29]
  assign id_io_reg_n_io_in_rd_wen = id_io_reg_io_out_rd_wen; // @[Top.scala 60:29]
  assign id_io_reg_n_io_in_rd_sel = id_io_reg_io_out_rd_sel; // @[Top.scala 60:29]
  assign id_io_reg_n_io_in_csr_cmd = id_io_reg_io_out_csr_cmd; // @[Top.scala 60:29]
  assign id_io_reg_n_io_in_rs2_data = id_io_reg_io_out_rs2_data; // @[Top.scala 60:29]
  assign id_io_reg_n_io_in_imm_b_sext = id_io_reg_io_out_imm_b_sext; // @[Top.scala 60:29]
  assign ex_io_reg_clock = clock;
  assign ex_io_reg_reset = reset;
  assign ex_io_reg_io_in_alu_out = alu_io_out_alu_out; // @[Top.scala 63:29]
  assign mem_io_reg_clock = clock;
  assign mem_io_reg_reset = reset;
  assign mem_io_reg_io_in_rd_wen = mem_io_out_rd_wen; // @[Top.scala 67:29]
  assign mem_io_reg_io_in_rd_addr = mem_io_out_rd_addr; // @[Top.scala 67:29]
  assign mem_io_reg_io_in_rd_data = mem_io_out_rd_data; // @[Top.scala 67:29]
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset) begin
          $fwrite(32'h80000002,"------------------------END-----------------------\n"); // @[Top.scala 76:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1) begin
          $fwrite(32'h80000002,"exit: %d\n",io_exit); // @[Top.scala 77:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1) begin
          $fwrite(32'h80000002,"\n"); // @[Top.scala 78:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
