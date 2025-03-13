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
  input  [31:0] io_ex_in_alu_out,
  input         io_ex_in_jump_flag,
  input         io_br_in_br_flag,
  input  [31:0] io_br_in_br_target,
  output [31:0] io_out_reg_pc,
  output [31:0] io_out_inst,
  output [31:0] io_instmem_addr,
  input  [31:0] io_instmem_inst
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] reg_pc; // @[PC.scala 39:25]
  wire [31:0] reg_pc_next_default = reg_pc + 32'h4; // @[PC.scala 40:38]
  assign io_out_reg_pc = reg_pc; // @[PC.scala 50:19]
  assign io_out_inst = io_instmem_inst; // @[PC.scala 51:17]
  assign io_instmem_addr = reg_pc; // @[PC.scala 49:21]
  always @(posedge clock) begin
    if (reset) begin // @[PC.scala 39:25]
      reg_pc <= 32'h0; // @[PC.scala 39:25]
    end else if (io_br_in_br_flag) begin // @[Mux.scala 98:16]
      reg_pc <= io_br_in_br_target;
    end else if (io_ex_in_jump_flag) begin // @[Mux.scala 98:16]
      reg_pc <= io_ex_in_alu_out;
    end else begin
      reg_pc <= reg_pc_next_default;
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
  input  [31:0] io_if_in_reg_pc,
  input  [31:0] io_if_in_inst,
  input         io_wb_in_rd_wen,
  input  [4:0]  io_wb_in_rd_addr,
  input  [31:0] io_wb_in_rd_data,
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
  reg [31:0] reg_x_0; // @[ID.scala 53:24]
  reg [31:0] reg_x_1; // @[ID.scala 53:24]
  reg [31:0] reg_x_2; // @[ID.scala 53:24]
  reg [31:0] reg_x_3; // @[ID.scala 53:24]
  reg [31:0] reg_x_4; // @[ID.scala 53:24]
  reg [31:0] reg_x_5; // @[ID.scala 53:24]
  reg [31:0] reg_x_6; // @[ID.scala 53:24]
  reg [31:0] reg_x_7; // @[ID.scala 53:24]
  reg [31:0] reg_x_8; // @[ID.scala 53:24]
  reg [31:0] reg_x_9; // @[ID.scala 53:24]
  reg [31:0] reg_x_10; // @[ID.scala 53:24]
  reg [31:0] reg_x_11; // @[ID.scala 53:24]
  reg [31:0] reg_x_12; // @[ID.scala 53:24]
  reg [31:0] reg_x_13; // @[ID.scala 53:24]
  reg [31:0] reg_x_14; // @[ID.scala 53:24]
  reg [31:0] reg_x_15; // @[ID.scala 53:24]
  reg [31:0] reg_x_16; // @[ID.scala 53:24]
  reg [31:0] reg_x_17; // @[ID.scala 53:24]
  reg [31:0] reg_x_18; // @[ID.scala 53:24]
  reg [31:0] reg_x_19; // @[ID.scala 53:24]
  reg [31:0] reg_x_20; // @[ID.scala 53:24]
  reg [31:0] reg_x_21; // @[ID.scala 53:24]
  reg [31:0] reg_x_22; // @[ID.scala 53:24]
  reg [31:0] reg_x_23; // @[ID.scala 53:24]
  reg [31:0] reg_x_24; // @[ID.scala 53:24]
  reg [31:0] reg_x_25; // @[ID.scala 53:24]
  reg [31:0] reg_x_26; // @[ID.scala 53:24]
  reg [31:0] reg_x_27; // @[ID.scala 53:24]
  reg [31:0] reg_x_28; // @[ID.scala 53:24]
  reg [31:0] reg_x_29; // @[ID.scala 53:24]
  reg [31:0] reg_x_30; // @[ID.scala 53:24]
  reg [31:0] reg_x_31; // @[ID.scala 53:24]
  wire [4:0] rs1_addr = io_if_in_inst[19:15]; // @[ID.scala 63:24]
  wire [4:0] rs2_addr = io_if_in_inst[24:20]; // @[ID.scala 64:24]
  wire [4:0] rd_addr = io_if_in_inst[11:7]; // @[ID.scala 65:24]
  wire [11:0] csr_addr_default = io_if_in_inst[31:20]; // @[ID.scala 66:32]
  wire [31:0] _GEN_1 = 5'h1 == rs1_addr ? reg_x_1 : reg_x_0; // @[ID.scala 67:23 ID.scala 67:23]
  wire [31:0] _GEN_2 = 5'h2 == rs1_addr ? reg_x_2 : _GEN_1; // @[ID.scala 67:23 ID.scala 67:23]
  wire [31:0] _GEN_3 = 5'h3 == rs1_addr ? reg_x_3 : _GEN_2; // @[ID.scala 67:23 ID.scala 67:23]
  wire [31:0] _GEN_4 = 5'h4 == rs1_addr ? reg_x_4 : _GEN_3; // @[ID.scala 67:23 ID.scala 67:23]
  wire [31:0] _GEN_5 = 5'h5 == rs1_addr ? reg_x_5 : _GEN_4; // @[ID.scala 67:23 ID.scala 67:23]
  wire [31:0] _GEN_6 = 5'h6 == rs1_addr ? reg_x_6 : _GEN_5; // @[ID.scala 67:23 ID.scala 67:23]
  wire [31:0] _GEN_7 = 5'h7 == rs1_addr ? reg_x_7 : _GEN_6; // @[ID.scala 67:23 ID.scala 67:23]
  wire [31:0] _GEN_8 = 5'h8 == rs1_addr ? reg_x_8 : _GEN_7; // @[ID.scala 67:23 ID.scala 67:23]
  wire [31:0] _GEN_9 = 5'h9 == rs1_addr ? reg_x_9 : _GEN_8; // @[ID.scala 67:23 ID.scala 67:23]
  wire [31:0] _GEN_10 = 5'ha == rs1_addr ? reg_x_10 : _GEN_9; // @[ID.scala 67:23 ID.scala 67:23]
  wire [31:0] _GEN_11 = 5'hb == rs1_addr ? reg_x_11 : _GEN_10; // @[ID.scala 67:23 ID.scala 67:23]
  wire [31:0] _GEN_12 = 5'hc == rs1_addr ? reg_x_12 : _GEN_11; // @[ID.scala 67:23 ID.scala 67:23]
  wire [31:0] _GEN_13 = 5'hd == rs1_addr ? reg_x_13 : _GEN_12; // @[ID.scala 67:23 ID.scala 67:23]
  wire [31:0] _GEN_14 = 5'he == rs1_addr ? reg_x_14 : _GEN_13; // @[ID.scala 67:23 ID.scala 67:23]
  wire [31:0] _GEN_15 = 5'hf == rs1_addr ? reg_x_15 : _GEN_14; // @[ID.scala 67:23 ID.scala 67:23]
  wire [31:0] _GEN_16 = 5'h10 == rs1_addr ? reg_x_16 : _GEN_15; // @[ID.scala 67:23 ID.scala 67:23]
  wire [31:0] _GEN_17 = 5'h11 == rs1_addr ? reg_x_17 : _GEN_16; // @[ID.scala 67:23 ID.scala 67:23]
  wire [31:0] _GEN_18 = 5'h12 == rs1_addr ? reg_x_18 : _GEN_17; // @[ID.scala 67:23 ID.scala 67:23]
  wire [31:0] _GEN_19 = 5'h13 == rs1_addr ? reg_x_19 : _GEN_18; // @[ID.scala 67:23 ID.scala 67:23]
  wire [31:0] _GEN_20 = 5'h14 == rs1_addr ? reg_x_20 : _GEN_19; // @[ID.scala 67:23 ID.scala 67:23]
  wire [31:0] _GEN_21 = 5'h15 == rs1_addr ? reg_x_21 : _GEN_20; // @[ID.scala 67:23 ID.scala 67:23]
  wire [31:0] _GEN_22 = 5'h16 == rs1_addr ? reg_x_22 : _GEN_21; // @[ID.scala 67:23 ID.scala 67:23]
  wire [31:0] _GEN_23 = 5'h17 == rs1_addr ? reg_x_23 : _GEN_22; // @[ID.scala 67:23 ID.scala 67:23]
  wire [31:0] _GEN_24 = 5'h18 == rs1_addr ? reg_x_24 : _GEN_23; // @[ID.scala 67:23 ID.scala 67:23]
  wire [31:0] _GEN_25 = 5'h19 == rs1_addr ? reg_x_25 : _GEN_24; // @[ID.scala 67:23 ID.scala 67:23]
  wire [31:0] _GEN_26 = 5'h1a == rs1_addr ? reg_x_26 : _GEN_25; // @[ID.scala 67:23 ID.scala 67:23]
  wire [31:0] _GEN_27 = 5'h1b == rs1_addr ? reg_x_27 : _GEN_26; // @[ID.scala 67:23 ID.scala 67:23]
  wire [31:0] _GEN_28 = 5'h1c == rs1_addr ? reg_x_28 : _GEN_27; // @[ID.scala 67:23 ID.scala 67:23]
  wire [31:0] _GEN_29 = 5'h1d == rs1_addr ? reg_x_29 : _GEN_28; // @[ID.scala 67:23 ID.scala 67:23]
  wire [31:0] _GEN_30 = 5'h1e == rs1_addr ? reg_x_30 : _GEN_29; // @[ID.scala 67:23 ID.scala 67:23]
  wire [31:0] _GEN_31 = 5'h1f == rs1_addr ? reg_x_31 : _GEN_30; // @[ID.scala 67:23 ID.scala 67:23]
  wire [31:0] rs1_data = rs1_addr != 5'h0 ? _GEN_31 : 32'h0; // @[ID.scala 67:23]
  wire [31:0] _GEN_33 = 5'h1 == rs2_addr ? reg_x_1 : reg_x_0; // @[ID.scala 68:23 ID.scala 68:23]
  wire [31:0] _GEN_34 = 5'h2 == rs2_addr ? reg_x_2 : _GEN_33; // @[ID.scala 68:23 ID.scala 68:23]
  wire [31:0] _GEN_35 = 5'h3 == rs2_addr ? reg_x_3 : _GEN_34; // @[ID.scala 68:23 ID.scala 68:23]
  wire [31:0] _GEN_36 = 5'h4 == rs2_addr ? reg_x_4 : _GEN_35; // @[ID.scala 68:23 ID.scala 68:23]
  wire [31:0] _GEN_37 = 5'h5 == rs2_addr ? reg_x_5 : _GEN_36; // @[ID.scala 68:23 ID.scala 68:23]
  wire [31:0] _GEN_38 = 5'h6 == rs2_addr ? reg_x_6 : _GEN_37; // @[ID.scala 68:23 ID.scala 68:23]
  wire [31:0] _GEN_39 = 5'h7 == rs2_addr ? reg_x_7 : _GEN_38; // @[ID.scala 68:23 ID.scala 68:23]
  wire [31:0] _GEN_40 = 5'h8 == rs2_addr ? reg_x_8 : _GEN_39; // @[ID.scala 68:23 ID.scala 68:23]
  wire [31:0] _GEN_41 = 5'h9 == rs2_addr ? reg_x_9 : _GEN_40; // @[ID.scala 68:23 ID.scala 68:23]
  wire [31:0] _GEN_42 = 5'ha == rs2_addr ? reg_x_10 : _GEN_41; // @[ID.scala 68:23 ID.scala 68:23]
  wire [31:0] _GEN_43 = 5'hb == rs2_addr ? reg_x_11 : _GEN_42; // @[ID.scala 68:23 ID.scala 68:23]
  wire [31:0] _GEN_44 = 5'hc == rs2_addr ? reg_x_12 : _GEN_43; // @[ID.scala 68:23 ID.scala 68:23]
  wire [31:0] _GEN_45 = 5'hd == rs2_addr ? reg_x_13 : _GEN_44; // @[ID.scala 68:23 ID.scala 68:23]
  wire [31:0] _GEN_46 = 5'he == rs2_addr ? reg_x_14 : _GEN_45; // @[ID.scala 68:23 ID.scala 68:23]
  wire [31:0] _GEN_47 = 5'hf == rs2_addr ? reg_x_15 : _GEN_46; // @[ID.scala 68:23 ID.scala 68:23]
  wire [31:0] _GEN_48 = 5'h10 == rs2_addr ? reg_x_16 : _GEN_47; // @[ID.scala 68:23 ID.scala 68:23]
  wire [31:0] _GEN_49 = 5'h11 == rs2_addr ? reg_x_17 : _GEN_48; // @[ID.scala 68:23 ID.scala 68:23]
  wire [31:0] _GEN_50 = 5'h12 == rs2_addr ? reg_x_18 : _GEN_49; // @[ID.scala 68:23 ID.scala 68:23]
  wire [31:0] _GEN_51 = 5'h13 == rs2_addr ? reg_x_19 : _GEN_50; // @[ID.scala 68:23 ID.scala 68:23]
  wire [31:0] _GEN_52 = 5'h14 == rs2_addr ? reg_x_20 : _GEN_51; // @[ID.scala 68:23 ID.scala 68:23]
  wire [31:0] _GEN_53 = 5'h15 == rs2_addr ? reg_x_21 : _GEN_52; // @[ID.scala 68:23 ID.scala 68:23]
  wire [31:0] _GEN_54 = 5'h16 == rs2_addr ? reg_x_22 : _GEN_53; // @[ID.scala 68:23 ID.scala 68:23]
  wire [31:0] _GEN_55 = 5'h17 == rs2_addr ? reg_x_23 : _GEN_54; // @[ID.scala 68:23 ID.scala 68:23]
  wire [31:0] _GEN_56 = 5'h18 == rs2_addr ? reg_x_24 : _GEN_55; // @[ID.scala 68:23 ID.scala 68:23]
  wire [31:0] _GEN_57 = 5'h19 == rs2_addr ? reg_x_25 : _GEN_56; // @[ID.scala 68:23 ID.scala 68:23]
  wire [31:0] _GEN_58 = 5'h1a == rs2_addr ? reg_x_26 : _GEN_57; // @[ID.scala 68:23 ID.scala 68:23]
  wire [31:0] _GEN_59 = 5'h1b == rs2_addr ? reg_x_27 : _GEN_58; // @[ID.scala 68:23 ID.scala 68:23]
  wire [31:0] _GEN_60 = 5'h1c == rs2_addr ? reg_x_28 : _GEN_59; // @[ID.scala 68:23 ID.scala 68:23]
  wire [31:0] _GEN_61 = 5'h1d == rs2_addr ? reg_x_29 : _GEN_60; // @[ID.scala 68:23 ID.scala 68:23]
  wire [31:0] _GEN_62 = 5'h1e == rs2_addr ? reg_x_30 : _GEN_61; // @[ID.scala 68:23 ID.scala 68:23]
  wire [31:0] _GEN_63 = 5'h1f == rs2_addr ? reg_x_31 : _GEN_62; // @[ID.scala 68:23 ID.scala 68:23]
  wire [31:0] rs2_data = rs2_addr != 5'h0 ? _GEN_63 : 32'h0; // @[ID.scala 68:23]
  wire [19:0] imm_i_sext_hi = csr_addr_default[11] ? 20'hfffff : 20'h0; // @[Bitwise.scala 72:12]
  wire [31:0] imm_i_sext = {imm_i_sext_hi,csr_addr_default}; // @[Cat.scala 30:58]
  wire [6:0] imm_s_hi = io_if_in_inst[31:25]; // @[ID.scala 72:28]
  wire [11:0] imm_s = {imm_s_hi,rd_addr}; // @[Cat.scala 30:58]
  wire [19:0] imm_s_sext_hi = imm_s[11] ? 20'hfffff : 20'h0; // @[Bitwise.scala 72:12]
  wire [31:0] imm_s_sext = {imm_s_sext_hi,imm_s_hi,rd_addr}; // @[Cat.scala 30:58]
  wire  imm_b_hi_hi = io_if_in_inst[31]; // @[ID.scala 74:25]
  wire  imm_b_hi_lo = io_if_in_inst[7]; // @[ID.scala 74:35]
  wire [5:0] imm_b_lo_hi = io_if_in_inst[30:25]; // @[ID.scala 74:44]
  wire [3:0] imm_b_lo_lo = io_if_in_inst[11:8]; // @[ID.scala 74:58]
  wire [11:0] imm_b = {imm_b_hi_hi,imm_b_hi_lo,imm_b_lo_hi,imm_b_lo_lo}; // @[Cat.scala 30:58]
  wire [18:0] imm_b_sext_hi_hi = imm_b[11] ? 19'h7ffff : 19'h0; // @[Bitwise.scala 72:12]
  wire [30:0] imm_b_sext_hi = {imm_b_sext_hi_hi,imm_b_hi_hi,imm_b_hi_lo,imm_b_lo_hi,imm_b_lo_lo}; // @[Cat.scala 30:58]
  wire [7:0] imm_j_hi_lo = io_if_in_inst[19:12]; // @[ID.scala 76:35]
  wire  imm_j_lo_hi = io_if_in_inst[20]; // @[ID.scala 76:49]
  wire [9:0] imm_j_lo_lo = io_if_in_inst[30:21]; // @[ID.scala 76:59]
  wire [19:0] imm_j = {imm_b_hi_hi,imm_j_hi_lo,imm_j_lo_hi,imm_j_lo_lo}; // @[Cat.scala 30:58]
  wire [10:0] imm_j_sext_hi_hi = imm_j[19] ? 11'h7ff : 11'h0; // @[Bitwise.scala 72:12]
  wire [31:0] imm_j_sext = {imm_j_sext_hi_hi,imm_b_hi_hi,imm_j_hi_lo,imm_j_lo_hi,imm_j_lo_lo,1'h0}; // @[Cat.scala 30:58]
  wire [19:0] imm_u = io_if_in_inst[31:12]; // @[ID.scala 78:21]
  wire [31:0] imm_u_shifted = {imm_u,12'h0}; // @[Cat.scala 30:58]
  wire [31:0] imm_z_uext = {27'h0,rs1_addr}; // @[Cat.scala 30:58]
  wire [31:0] _inst_type_T = io_if_in_inst & 32'h707f; // @[Lookup.scala 31:38]
  wire  _inst_type_T_1 = 32'h2003 == _inst_type_T; // @[Lookup.scala 31:38]
  wire  _inst_type_T_3 = 32'h2023 == _inst_type_T; // @[Lookup.scala 31:38]
  wire [31:0] _inst_type_T_4 = io_if_in_inst & 32'hfe00707f; // @[Lookup.scala 31:38]
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
  wire [31:0] _inst_type_T_54 = io_if_in_inst & 32'h7f; // @[Lookup.scala 31:38]
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
  wire  _inst_type_T_75 = 32'h73 == io_if_in_inst; // @[Lookup.scala 31:38]
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
  wire  _op1_data_T = inst_type_1 == 2'h0; // @[ID.scala 129:18]
  wire  _op1_data_T_1 = inst_type_1 == 2'h1; // @[ID.scala 130:18]
  wire  _op1_data_T_2 = inst_type_1 == 2'h3; // @[ID.scala 131:18]
  wire [31:0] _op1_data_T_3 = _op1_data_T_2 ? imm_z_uext : 32'h0; // @[Mux.scala 98:16]
  wire [31:0] _op1_data_T_4 = _op1_data_T_1 ? io_if_in_reg_pc : _op1_data_T_3; // @[Mux.scala 98:16]
  wire  _op2_data_T = inst_type_2 == 3'h1; // @[ID.scala 135:18]
  wire  _op2_data_T_1 = inst_type_2 == 3'h2; // @[ID.scala 136:18]
  wire  _op2_data_T_2 = inst_type_2 == 3'h3; // @[ID.scala 137:18]
  wire  _op2_data_T_3 = inst_type_2 == 3'h4; // @[ID.scala 138:18]
  wire  _op2_data_T_4 = inst_type_2 == 3'h5; // @[ID.scala 139:18]
  wire [31:0] _op2_data_T_5 = _op2_data_T_4 ? imm_u_shifted : 32'h0; // @[Mux.scala 98:16]
  wire [31:0] _op2_data_T_6 = _op2_data_T_3 ? imm_j_sext : _op2_data_T_5; // @[Mux.scala 98:16]
  wire [31:0] _op2_data_T_7 = _op2_data_T_2 ? imm_s_sext : _op2_data_T_6; // @[Mux.scala 98:16]
  wire [31:0] _op2_data_T_8 = _op2_data_T_1 ? imm_i_sext : _op2_data_T_7; // @[Mux.scala 98:16]
  wire [31:0] _GEN_128 = {{27'd0}, io_wb_in_rd_addr}; // @[ID.scala 143:45]
  assign io_out_op1_data = _op1_data_T ? rs1_data : _op1_data_T_4; // @[Mux.scala 98:16]
  assign io_out_op2_data = _op2_data_T ? rs2_data : _op2_data_T_8; // @[Mux.scala 98:16]
  assign io_out_rd_addr = io_if_in_inst[11:7]; // @[ID.scala 65:24]
  assign io_out_csr_addr_default = {{20'd0}, csr_addr_default}; // @[ID.scala 66:32]
  assign io_out_exe_fun = _inst_type_T_1 ? 5'h1 : _inst_type_T_112; // @[Lookup.scala 33:37]
  assign io_out_mem_wen = _inst_type_T_1 ? 1'h0 : _inst_type_T_3; // @[Lookup.scala 33:37]
  assign io_out_rd_wen = _inst_type_T_1 | _inst_type_T_260; // @[Lookup.scala 33:37]
  assign io_out_rd_sel = _inst_type_T_1 ? 3'h1 : _inst_type_T_297; // @[Lookup.scala 33:37]
  assign io_out_csr_cmd = _inst_type_T_1 ? 3'h0 : _inst_type_T_334; // @[Lookup.scala 33:37]
  assign io_out_rs2_data = rs2_addr != 5'h0 ? _GEN_63 : 32'h0; // @[ID.scala 68:23]
  assign io_out_imm_b_sext = {imm_b_sext_hi,1'h0}; // @[Cat.scala 30:58]
  always @(posedge clock) begin
    if (reset) begin // @[ID.scala 53:24]
      reg_x_0 <= 32'h0; // @[ID.scala 53:24]
    end else if (io_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 143:65]
      if (5'h0 == io_wb_in_rd_addr) begin // @[ID.scala 144:27]
        reg_x_0 <= io_wb_in_rd_data; // @[ID.scala 144:27]
      end
    end
    if (reset) begin // @[ID.scala 53:24]
      reg_x_1 <= 32'h0; // @[ID.scala 53:24]
    end else if (io_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 143:65]
      if (5'h1 == io_wb_in_rd_addr) begin // @[ID.scala 144:27]
        reg_x_1 <= io_wb_in_rd_data; // @[ID.scala 144:27]
      end
    end
    if (reset) begin // @[ID.scala 53:24]
      reg_x_2 <= 32'h0; // @[ID.scala 53:24]
    end else if (io_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 143:65]
      if (5'h2 == io_wb_in_rd_addr) begin // @[ID.scala 144:27]
        reg_x_2 <= io_wb_in_rd_data; // @[ID.scala 144:27]
      end
    end
    if (reset) begin // @[ID.scala 53:24]
      reg_x_3 <= 32'h0; // @[ID.scala 53:24]
    end else if (io_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 143:65]
      if (5'h3 == io_wb_in_rd_addr) begin // @[ID.scala 144:27]
        reg_x_3 <= io_wb_in_rd_data; // @[ID.scala 144:27]
      end
    end
    if (reset) begin // @[ID.scala 53:24]
      reg_x_4 <= 32'h0; // @[ID.scala 53:24]
    end else if (io_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 143:65]
      if (5'h4 == io_wb_in_rd_addr) begin // @[ID.scala 144:27]
        reg_x_4 <= io_wb_in_rd_data; // @[ID.scala 144:27]
      end
    end
    if (reset) begin // @[ID.scala 53:24]
      reg_x_5 <= 32'h0; // @[ID.scala 53:24]
    end else if (io_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 143:65]
      if (5'h5 == io_wb_in_rd_addr) begin // @[ID.scala 144:27]
        reg_x_5 <= io_wb_in_rd_data; // @[ID.scala 144:27]
      end
    end
    if (reset) begin // @[ID.scala 53:24]
      reg_x_6 <= 32'h0; // @[ID.scala 53:24]
    end else if (io_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 143:65]
      if (5'h6 == io_wb_in_rd_addr) begin // @[ID.scala 144:27]
        reg_x_6 <= io_wb_in_rd_data; // @[ID.scala 144:27]
      end
    end
    if (reset) begin // @[ID.scala 53:24]
      reg_x_7 <= 32'h0; // @[ID.scala 53:24]
    end else if (io_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 143:65]
      if (5'h7 == io_wb_in_rd_addr) begin // @[ID.scala 144:27]
        reg_x_7 <= io_wb_in_rd_data; // @[ID.scala 144:27]
      end
    end
    if (reset) begin // @[ID.scala 53:24]
      reg_x_8 <= 32'h0; // @[ID.scala 53:24]
    end else if (io_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 143:65]
      if (5'h8 == io_wb_in_rd_addr) begin // @[ID.scala 144:27]
        reg_x_8 <= io_wb_in_rd_data; // @[ID.scala 144:27]
      end
    end
    if (reset) begin // @[ID.scala 53:24]
      reg_x_9 <= 32'h0; // @[ID.scala 53:24]
    end else if (io_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 143:65]
      if (5'h9 == io_wb_in_rd_addr) begin // @[ID.scala 144:27]
        reg_x_9 <= io_wb_in_rd_data; // @[ID.scala 144:27]
      end
    end
    if (reset) begin // @[ID.scala 53:24]
      reg_x_10 <= 32'h0; // @[ID.scala 53:24]
    end else if (io_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 143:65]
      if (5'ha == io_wb_in_rd_addr) begin // @[ID.scala 144:27]
        reg_x_10 <= io_wb_in_rd_data; // @[ID.scala 144:27]
      end
    end
    if (reset) begin // @[ID.scala 53:24]
      reg_x_11 <= 32'h0; // @[ID.scala 53:24]
    end else if (io_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 143:65]
      if (5'hb == io_wb_in_rd_addr) begin // @[ID.scala 144:27]
        reg_x_11 <= io_wb_in_rd_data; // @[ID.scala 144:27]
      end
    end
    if (reset) begin // @[ID.scala 53:24]
      reg_x_12 <= 32'h0; // @[ID.scala 53:24]
    end else if (io_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 143:65]
      if (5'hc == io_wb_in_rd_addr) begin // @[ID.scala 144:27]
        reg_x_12 <= io_wb_in_rd_data; // @[ID.scala 144:27]
      end
    end
    if (reset) begin // @[ID.scala 53:24]
      reg_x_13 <= 32'h0; // @[ID.scala 53:24]
    end else if (io_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 143:65]
      if (5'hd == io_wb_in_rd_addr) begin // @[ID.scala 144:27]
        reg_x_13 <= io_wb_in_rd_data; // @[ID.scala 144:27]
      end
    end
    if (reset) begin // @[ID.scala 53:24]
      reg_x_14 <= 32'h0; // @[ID.scala 53:24]
    end else if (io_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 143:65]
      if (5'he == io_wb_in_rd_addr) begin // @[ID.scala 144:27]
        reg_x_14 <= io_wb_in_rd_data; // @[ID.scala 144:27]
      end
    end
    if (reset) begin // @[ID.scala 53:24]
      reg_x_15 <= 32'h0; // @[ID.scala 53:24]
    end else if (io_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 143:65]
      if (5'hf == io_wb_in_rd_addr) begin // @[ID.scala 144:27]
        reg_x_15 <= io_wb_in_rd_data; // @[ID.scala 144:27]
      end
    end
    if (reset) begin // @[ID.scala 53:24]
      reg_x_16 <= 32'h0; // @[ID.scala 53:24]
    end else if (io_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 143:65]
      if (5'h10 == io_wb_in_rd_addr) begin // @[ID.scala 144:27]
        reg_x_16 <= io_wb_in_rd_data; // @[ID.scala 144:27]
      end
    end
    if (reset) begin // @[ID.scala 53:24]
      reg_x_17 <= 32'h0; // @[ID.scala 53:24]
    end else if (io_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 143:65]
      if (5'h11 == io_wb_in_rd_addr) begin // @[ID.scala 144:27]
        reg_x_17 <= io_wb_in_rd_data; // @[ID.scala 144:27]
      end
    end
    if (reset) begin // @[ID.scala 53:24]
      reg_x_18 <= 32'h0; // @[ID.scala 53:24]
    end else if (io_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 143:65]
      if (5'h12 == io_wb_in_rd_addr) begin // @[ID.scala 144:27]
        reg_x_18 <= io_wb_in_rd_data; // @[ID.scala 144:27]
      end
    end
    if (reset) begin // @[ID.scala 53:24]
      reg_x_19 <= 32'h0; // @[ID.scala 53:24]
    end else if (io_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 143:65]
      if (5'h13 == io_wb_in_rd_addr) begin // @[ID.scala 144:27]
        reg_x_19 <= io_wb_in_rd_data; // @[ID.scala 144:27]
      end
    end
    if (reset) begin // @[ID.scala 53:24]
      reg_x_20 <= 32'h0; // @[ID.scala 53:24]
    end else if (io_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 143:65]
      if (5'h14 == io_wb_in_rd_addr) begin // @[ID.scala 144:27]
        reg_x_20 <= io_wb_in_rd_data; // @[ID.scala 144:27]
      end
    end
    if (reset) begin // @[ID.scala 53:24]
      reg_x_21 <= 32'h0; // @[ID.scala 53:24]
    end else if (io_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 143:65]
      if (5'h15 == io_wb_in_rd_addr) begin // @[ID.scala 144:27]
        reg_x_21 <= io_wb_in_rd_data; // @[ID.scala 144:27]
      end
    end
    if (reset) begin // @[ID.scala 53:24]
      reg_x_22 <= 32'h0; // @[ID.scala 53:24]
    end else if (io_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 143:65]
      if (5'h16 == io_wb_in_rd_addr) begin // @[ID.scala 144:27]
        reg_x_22 <= io_wb_in_rd_data; // @[ID.scala 144:27]
      end
    end
    if (reset) begin // @[ID.scala 53:24]
      reg_x_23 <= 32'h0; // @[ID.scala 53:24]
    end else if (io_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 143:65]
      if (5'h17 == io_wb_in_rd_addr) begin // @[ID.scala 144:27]
        reg_x_23 <= io_wb_in_rd_data; // @[ID.scala 144:27]
      end
    end
    if (reset) begin // @[ID.scala 53:24]
      reg_x_24 <= 32'h0; // @[ID.scala 53:24]
    end else if (io_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 143:65]
      if (5'h18 == io_wb_in_rd_addr) begin // @[ID.scala 144:27]
        reg_x_24 <= io_wb_in_rd_data; // @[ID.scala 144:27]
      end
    end
    if (reset) begin // @[ID.scala 53:24]
      reg_x_25 <= 32'h0; // @[ID.scala 53:24]
    end else if (io_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 143:65]
      if (5'h19 == io_wb_in_rd_addr) begin // @[ID.scala 144:27]
        reg_x_25 <= io_wb_in_rd_data; // @[ID.scala 144:27]
      end
    end
    if (reset) begin // @[ID.scala 53:24]
      reg_x_26 <= 32'h0; // @[ID.scala 53:24]
    end else if (io_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 143:65]
      if (5'h1a == io_wb_in_rd_addr) begin // @[ID.scala 144:27]
        reg_x_26 <= io_wb_in_rd_data; // @[ID.scala 144:27]
      end
    end
    if (reset) begin // @[ID.scala 53:24]
      reg_x_27 <= 32'h0; // @[ID.scala 53:24]
    end else if (io_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 143:65]
      if (5'h1b == io_wb_in_rd_addr) begin // @[ID.scala 144:27]
        reg_x_27 <= io_wb_in_rd_data; // @[ID.scala 144:27]
      end
    end
    if (reset) begin // @[ID.scala 53:24]
      reg_x_28 <= 32'h0; // @[ID.scala 53:24]
    end else if (io_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 143:65]
      if (5'h1c == io_wb_in_rd_addr) begin // @[ID.scala 144:27]
        reg_x_28 <= io_wb_in_rd_data; // @[ID.scala 144:27]
      end
    end
    if (reset) begin // @[ID.scala 53:24]
      reg_x_29 <= 32'h0; // @[ID.scala 53:24]
    end else if (io_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 143:65]
      if (5'h1d == io_wb_in_rd_addr) begin // @[ID.scala 144:27]
        reg_x_29 <= io_wb_in_rd_data; // @[ID.scala 144:27]
      end
    end
    if (reset) begin // @[ID.scala 53:24]
      reg_x_30 <= 32'h0; // @[ID.scala 53:24]
    end else if (io_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 143:65]
      if (5'h1e == io_wb_in_rd_addr) begin // @[ID.scala 144:27]
        reg_x_30 <= io_wb_in_rd_data; // @[ID.scala 144:27]
      end
    end
    if (reset) begin // @[ID.scala 53:24]
      reg_x_31 <= 32'h0; // @[ID.scala 53:24]
    end else if (io_wb_in_rd_wen & _GEN_128 != 32'h0) begin // @[ID.scala 143:65]
      if (5'h1f == io_wb_in_rd_addr) begin // @[ID.scala 144:27]
        reg_x_31 <= io_wb_in_rd_data; // @[ID.scala 144:27]
      end
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
  input  [31:0] io_id_in_op1_data,
  input  [31:0] io_id_in_op2_data,
  input  [4:0]  io_id_in_exe_fun,
  input  [2:0]  io_id_in_rd_sel,
  output [31:0] io_out_alu_out,
  output        io_out_jump_flag
);
  wire  _alu_out_T = io_id_in_exe_fun == 5'h1; // @[ALU.scala 37:18]
  wire [31:0] _alu_out_T_2 = io_id_in_op1_data + io_id_in_op2_data; // @[ALU.scala 37:46]
  wire  _alu_out_T_3 = io_id_in_exe_fun == 5'h2; // @[ALU.scala 38:18]
  wire [31:0] _alu_out_T_5 = io_id_in_op1_data - io_id_in_op2_data; // @[ALU.scala 38:46]
  wire  _alu_out_T_6 = io_id_in_exe_fun == 5'h3; // @[ALU.scala 39:18]
  wire [31:0] _alu_out_T_7 = io_id_in_op1_data & io_id_in_op2_data; // @[ALU.scala 39:46]
  wire  _alu_out_T_8 = io_id_in_exe_fun == 5'h4; // @[ALU.scala 40:18]
  wire [31:0] _alu_out_T_9 = io_id_in_op1_data | io_id_in_op2_data; // @[ALU.scala 40:46]
  wire  _alu_out_T_10 = io_id_in_exe_fun == 5'h5; // @[ALU.scala 41:18]
  wire [31:0] _alu_out_T_11 = io_id_in_op1_data ^ io_id_in_op2_data; // @[ALU.scala 41:46]
  wire  _alu_out_T_12 = io_id_in_exe_fun == 5'h6; // @[ALU.scala 42:18]
  wire [62:0] _GEN_0 = {{31'd0}, io_id_in_op1_data}; // @[ALU.scala 42:46]
  wire [62:0] _alu_out_T_14 = _GEN_0 << io_id_in_op2_data[4:0]; // @[ALU.scala 42:46]
  wire  _alu_out_T_16 = io_id_in_exe_fun == 5'h7; // @[ALU.scala 43:18]
  wire [31:0] _alu_out_T_18 = io_id_in_op1_data >> io_id_in_op2_data[4:0]; // @[ALU.scala 43:46]
  wire  _alu_out_T_19 = io_id_in_exe_fun == 5'h8; // @[ALU.scala 44:18]
  wire [31:0] _alu_out_T_23 = $signed(io_id_in_op1_data) >>> io_id_in_op2_data[4:0]; // @[ALU.scala 44:80]
  wire  _alu_out_T_24 = io_id_in_exe_fun == 5'h9; // @[ALU.scala 45:18]
  wire  _alu_out_T_27 = $signed(io_id_in_op1_data) < $signed(io_id_in_op2_data); // @[ALU.scala 45:55]
  wire  _alu_out_T_28 = io_id_in_exe_fun == 5'ha; // @[ALU.scala 46:18]
  wire  _alu_out_T_29 = io_id_in_op1_data < io_id_in_op2_data; // @[ALU.scala 46:46]
  wire  _alu_out_T_30 = io_id_in_exe_fun == 5'h11; // @[ALU.scala 47:18]
  wire [31:0] _alu_out_T_34 = _alu_out_T_2 & 32'hfffffffe; // @[ALU.scala 47:59]
  wire  _alu_out_T_35 = io_id_in_exe_fun == 5'h12; // @[ALU.scala 48:18]
  wire [31:0] _alu_out_T_36 = _alu_out_T_35 ? io_id_in_op1_data : 32'h0; // @[Mux.scala 98:16]
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
  assign io_out_alu_out = _alu_out_T ? _alu_out_T_2 : _alu_out_T_46; // @[Mux.scala 98:16]
  assign io_out_jump_flag = io_id_in_rd_sel == 3'h2; // @[ALU.scala 51:29]
endmodule
module BR(
  input  [31:0] io_if_in_reg_pc,
  input  [31:0] io_id_in_op1_data,
  input  [31:0] io_id_in_op2_data,
  input  [4:0]  io_id_in_exe_fun,
  input  [31:0] io_id_in_imm_b_sext,
  output        io_out_br_flag,
  output [31:0] io_out_br_target
);
  wire  _br_flag_T = io_id_in_exe_fun == 5'hb; // @[BR.scala 40:18]
  wire  _br_flag_T_1 = io_id_in_op1_data == io_id_in_op2_data; // @[BR.scala 40:45]
  wire  _br_flag_T_2 = io_id_in_exe_fun == 5'hc; // @[BR.scala 41:18]
  wire  _br_flag_T_4 = ~_br_flag_T_1; // @[BR.scala 41:34]
  wire  _br_flag_T_5 = io_id_in_exe_fun == 5'hd; // @[BR.scala 42:18]
  wire  _br_flag_T_8 = $signed(io_id_in_op1_data) < $signed(io_id_in_op2_data); // @[BR.scala 42:54]
  wire  _br_flag_T_9 = io_id_in_exe_fun == 5'he; // @[BR.scala 43:18]
  wire  _br_flag_T_13 = ~_br_flag_T_8; // @[BR.scala 43:34]
  wire  _br_flag_T_14 = io_id_in_exe_fun == 5'hf; // @[BR.scala 44:18]
  wire  _br_flag_T_15 = io_id_in_op1_data < io_id_in_op2_data; // @[BR.scala 44:45]
  wire  _br_flag_T_16 = io_id_in_exe_fun == 5'h10; // @[BR.scala 45:18]
  wire  _br_flag_T_18 = ~_br_flag_T_15; // @[BR.scala 45:34]
  wire  _br_flag_T_20 = _br_flag_T_14 ? _br_flag_T_15 : _br_flag_T_16 & _br_flag_T_18; // @[Mux.scala 98:16]
  wire  _br_flag_T_21 = _br_flag_T_9 ? _br_flag_T_13 : _br_flag_T_20; // @[Mux.scala 98:16]
  wire  _br_flag_T_22 = _br_flag_T_5 ? _br_flag_T_8 : _br_flag_T_21; // @[Mux.scala 98:16]
  wire  _br_flag_T_23 = _br_flag_T_2 ? _br_flag_T_4 : _br_flag_T_22; // @[Mux.scala 98:16]
  assign io_out_br_flag = _br_flag_T ? _br_flag_T_1 : _br_flag_T_23; // @[Mux.scala 98:16]
  assign io_out_br_target = io_if_in_reg_pc + io_id_in_imm_b_sext; // @[BR.scala 38:28]
endmodule
module MEM(
  input         clock,
  input         reset,
  input  [31:0] io_id_in_op1_data,
  input  [31:0] io_id_in_csr_addr_default,
  input         io_id_in_mem_wen,
  input  [2:0]  io_id_in_csr_cmd,
  input  [31:0] io_id_in_rs2_data,
  input  [31:0] io_ex_in_alu_out,
  output [31:0] io_out_datamem_rdata,
  output [31:0] io_out_csr_rdata,
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
  reg [31:0] reg_csr_0; // @[MEM.scala 22:26]
  reg [31:0] reg_csr_1; // @[MEM.scala 22:26]
  reg [31:0] reg_csr_2; // @[MEM.scala 22:26]
  reg [31:0] reg_csr_3; // @[MEM.scala 22:26]
  reg [31:0] reg_csr_4; // @[MEM.scala 22:26]
  reg [31:0] reg_csr_5; // @[MEM.scala 22:26]
  reg [31:0] reg_csr_6; // @[MEM.scala 22:26]
  reg [31:0] reg_csr_7; // @[MEM.scala 22:26]
  reg [31:0] reg_csr_8; // @[MEM.scala 22:26]
  reg [31:0] reg_csr_9; // @[MEM.scala 22:26]
  reg [31:0] reg_csr_10; // @[MEM.scala 22:26]
  reg [31:0] reg_csr_11; // @[MEM.scala 22:26]
  reg [31:0] reg_csr_12; // @[MEM.scala 22:26]
  reg [31:0] reg_csr_13; // @[MEM.scala 22:26]
  reg [31:0] reg_csr_14; // @[MEM.scala 22:26]
  reg [31:0] reg_csr_15; // @[MEM.scala 22:26]
  reg [31:0] reg_csr_16; // @[MEM.scala 22:26]
  reg [31:0] reg_csr_17; // @[MEM.scala 22:26]
  reg [31:0] reg_csr_18; // @[MEM.scala 22:26]
  reg [31:0] reg_csr_19; // @[MEM.scala 22:26]
  reg [31:0] reg_csr_20; // @[MEM.scala 22:26]
  reg [31:0] reg_csr_21; // @[MEM.scala 22:26]
  reg [31:0] reg_csr_22; // @[MEM.scala 22:26]
  reg [31:0] reg_csr_23; // @[MEM.scala 22:26]
  reg [31:0] reg_csr_24; // @[MEM.scala 22:26]
  reg [31:0] reg_csr_25; // @[MEM.scala 22:26]
  reg [31:0] reg_csr_26; // @[MEM.scala 22:26]
  reg [31:0] reg_csr_27; // @[MEM.scala 22:26]
  reg [31:0] reg_csr_28; // @[MEM.scala 22:26]
  reg [31:0] reg_csr_29; // @[MEM.scala 22:26]
  reg [31:0] reg_csr_30; // @[MEM.scala 22:26]
  reg [31:0] reg_csr_31; // @[MEM.scala 22:26]
  wire  _csr_addr_T = io_id_in_csr_cmd == 3'h4; // @[MEM.scala 38:18]
  wire [31:0] csr_addr = _csr_addr_T ? 32'h342 : io_id_in_csr_addr_default; // @[Mux.scala 98:16]
  wire  _csr_wdata_T = io_id_in_csr_cmd == 3'h1; // @[MEM.scala 42:18]
  wire  _csr_wdata_T_1 = io_id_in_csr_cmd == 3'h2; // @[MEM.scala 43:18]
  wire [31:0] _GEN_1 = 5'h1 == csr_addr[4:0] ? reg_csr_1 : reg_csr_0; // @[MEM.scala 43:43 MEM.scala 43:43]
  wire [31:0] _GEN_2 = 5'h2 == csr_addr[4:0] ? reg_csr_2 : _GEN_1; // @[MEM.scala 43:43 MEM.scala 43:43]
  wire [31:0] _GEN_3 = 5'h3 == csr_addr[4:0] ? reg_csr_3 : _GEN_2; // @[MEM.scala 43:43 MEM.scala 43:43]
  wire [31:0] _GEN_4 = 5'h4 == csr_addr[4:0] ? reg_csr_4 : _GEN_3; // @[MEM.scala 43:43 MEM.scala 43:43]
  wire [31:0] _GEN_5 = 5'h5 == csr_addr[4:0] ? reg_csr_5 : _GEN_4; // @[MEM.scala 43:43 MEM.scala 43:43]
  wire [31:0] _GEN_6 = 5'h6 == csr_addr[4:0] ? reg_csr_6 : _GEN_5; // @[MEM.scala 43:43 MEM.scala 43:43]
  wire [31:0] _GEN_7 = 5'h7 == csr_addr[4:0] ? reg_csr_7 : _GEN_6; // @[MEM.scala 43:43 MEM.scala 43:43]
  wire [31:0] _GEN_8 = 5'h8 == csr_addr[4:0] ? reg_csr_8 : _GEN_7; // @[MEM.scala 43:43 MEM.scala 43:43]
  wire [31:0] _GEN_9 = 5'h9 == csr_addr[4:0] ? reg_csr_9 : _GEN_8; // @[MEM.scala 43:43 MEM.scala 43:43]
  wire [31:0] _GEN_10 = 5'ha == csr_addr[4:0] ? reg_csr_10 : _GEN_9; // @[MEM.scala 43:43 MEM.scala 43:43]
  wire [31:0] _GEN_11 = 5'hb == csr_addr[4:0] ? reg_csr_11 : _GEN_10; // @[MEM.scala 43:43 MEM.scala 43:43]
  wire [31:0] _GEN_12 = 5'hc == csr_addr[4:0] ? reg_csr_12 : _GEN_11; // @[MEM.scala 43:43 MEM.scala 43:43]
  wire [31:0] _GEN_13 = 5'hd == csr_addr[4:0] ? reg_csr_13 : _GEN_12; // @[MEM.scala 43:43 MEM.scala 43:43]
  wire [31:0] _GEN_14 = 5'he == csr_addr[4:0] ? reg_csr_14 : _GEN_13; // @[MEM.scala 43:43 MEM.scala 43:43]
  wire [31:0] _GEN_15 = 5'hf == csr_addr[4:0] ? reg_csr_15 : _GEN_14; // @[MEM.scala 43:43 MEM.scala 43:43]
  wire [31:0] _GEN_16 = 5'h10 == csr_addr[4:0] ? reg_csr_16 : _GEN_15; // @[MEM.scala 43:43 MEM.scala 43:43]
  wire [31:0] _GEN_17 = 5'h11 == csr_addr[4:0] ? reg_csr_17 : _GEN_16; // @[MEM.scala 43:43 MEM.scala 43:43]
  wire [31:0] _GEN_18 = 5'h12 == csr_addr[4:0] ? reg_csr_18 : _GEN_17; // @[MEM.scala 43:43 MEM.scala 43:43]
  wire [31:0] _GEN_19 = 5'h13 == csr_addr[4:0] ? reg_csr_19 : _GEN_18; // @[MEM.scala 43:43 MEM.scala 43:43]
  wire [31:0] _GEN_20 = 5'h14 == csr_addr[4:0] ? reg_csr_20 : _GEN_19; // @[MEM.scala 43:43 MEM.scala 43:43]
  wire [31:0] _GEN_21 = 5'h15 == csr_addr[4:0] ? reg_csr_21 : _GEN_20; // @[MEM.scala 43:43 MEM.scala 43:43]
  wire [31:0] _GEN_22 = 5'h16 == csr_addr[4:0] ? reg_csr_22 : _GEN_21; // @[MEM.scala 43:43 MEM.scala 43:43]
  wire [31:0] _GEN_23 = 5'h17 == csr_addr[4:0] ? reg_csr_23 : _GEN_22; // @[MEM.scala 43:43 MEM.scala 43:43]
  wire [31:0] _GEN_24 = 5'h18 == csr_addr[4:0] ? reg_csr_24 : _GEN_23; // @[MEM.scala 43:43 MEM.scala 43:43]
  wire [31:0] _GEN_25 = 5'h19 == csr_addr[4:0] ? reg_csr_25 : _GEN_24; // @[MEM.scala 43:43 MEM.scala 43:43]
  wire [31:0] _GEN_26 = 5'h1a == csr_addr[4:0] ? reg_csr_26 : _GEN_25; // @[MEM.scala 43:43 MEM.scala 43:43]
  wire [31:0] _GEN_27 = 5'h1b == csr_addr[4:0] ? reg_csr_27 : _GEN_26; // @[MEM.scala 43:43 MEM.scala 43:43]
  wire [31:0] _GEN_28 = 5'h1c == csr_addr[4:0] ? reg_csr_28 : _GEN_27; // @[MEM.scala 43:43 MEM.scala 43:43]
  wire [31:0] _GEN_29 = 5'h1d == csr_addr[4:0] ? reg_csr_29 : _GEN_28; // @[MEM.scala 43:43 MEM.scala 43:43]
  wire [31:0] _GEN_30 = 5'h1e == csr_addr[4:0] ? reg_csr_30 : _GEN_29; // @[MEM.scala 43:43 MEM.scala 43:43]
  wire [31:0] _GEN_31 = 5'h1f == csr_addr[4:0] ? reg_csr_31 : _GEN_30; // @[MEM.scala 43:43 MEM.scala 43:43]
  wire [31:0] _csr_wdata_T_2 = _GEN_31 | io_id_in_op1_data; // @[MEM.scala 43:43]
  wire  _csr_wdata_T_3 = io_id_in_csr_cmd == 3'h3; // @[MEM.scala 44:18]
  wire [31:0] _csr_wdata_T_4 = ~io_id_in_op1_data; // @[MEM.scala 44:45]
  wire [31:0] _csr_wdata_T_5 = _GEN_31 & _csr_wdata_T_4; // @[MEM.scala 44:43]
  wire [31:0] _csr_wdata_T_7 = _csr_addr_T ? 32'hb : 32'h0; // @[Mux.scala 98:16]
  wire [31:0] _csr_wdata_T_8 = _csr_wdata_T_3 ? _csr_wdata_T_5 : _csr_wdata_T_7; // @[Mux.scala 98:16]
  wire [31:0] _csr_wdata_T_9 = _csr_wdata_T_1 ? _csr_wdata_T_2 : _csr_wdata_T_8; // @[Mux.scala 98:16]
  assign io_out_datamem_rdata = io_datamem_rdata; // @[MEM.scala 52:26]
  assign io_out_csr_rdata = 5'h1f == csr_addr[4:0] ? reg_csr_31 : _GEN_30; // @[MEM.scala 43:43 MEM.scala 43:43]
  assign io_datamem_addr = io_ex_in_alu_out; // @[MEM.scala 32:22]
  assign io_datamem_wen = io_id_in_mem_wen; // @[MEM.scala 33:39]
  assign io_datamem_wdata = io_id_in_rs2_data; // @[MEM.scala 34:22]
  always @(posedge clock) begin
    if (reset) begin // @[MEM.scala 22:26]
      reg_csr_0 <= 32'h0; // @[MEM.scala 22:26]
    end else if (io_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 47:31]
      if (5'h0 == csr_addr[4:0]) begin // @[MEM.scala 48:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_0 <= io_id_in_op1_data;
        end else begin
          reg_csr_0 <= _csr_wdata_T_9;
        end
      end
    end
    if (reset) begin // @[MEM.scala 22:26]
      reg_csr_1 <= 32'h0; // @[MEM.scala 22:26]
    end else if (io_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 47:31]
      if (5'h1 == csr_addr[4:0]) begin // @[MEM.scala 48:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_1 <= io_id_in_op1_data;
        end else begin
          reg_csr_1 <= _csr_wdata_T_9;
        end
      end
    end
    if (reset) begin // @[MEM.scala 22:26]
      reg_csr_2 <= 32'h0; // @[MEM.scala 22:26]
    end else if (io_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 47:31]
      if (5'h2 == csr_addr[4:0]) begin // @[MEM.scala 48:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_2 <= io_id_in_op1_data;
        end else begin
          reg_csr_2 <= _csr_wdata_T_9;
        end
      end
    end
    if (reset) begin // @[MEM.scala 22:26]
      reg_csr_3 <= 32'h0; // @[MEM.scala 22:26]
    end else if (io_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 47:31]
      if (5'h3 == csr_addr[4:0]) begin // @[MEM.scala 48:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_3 <= io_id_in_op1_data;
        end else begin
          reg_csr_3 <= _csr_wdata_T_9;
        end
      end
    end
    if (reset) begin // @[MEM.scala 22:26]
      reg_csr_4 <= 32'h0; // @[MEM.scala 22:26]
    end else if (io_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 47:31]
      if (5'h4 == csr_addr[4:0]) begin // @[MEM.scala 48:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_4 <= io_id_in_op1_data;
        end else begin
          reg_csr_4 <= _csr_wdata_T_9;
        end
      end
    end
    if (reset) begin // @[MEM.scala 22:26]
      reg_csr_5 <= 32'h0; // @[MEM.scala 22:26]
    end else if (io_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 47:31]
      if (5'h5 == csr_addr[4:0]) begin // @[MEM.scala 48:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_5 <= io_id_in_op1_data;
        end else begin
          reg_csr_5 <= _csr_wdata_T_9;
        end
      end
    end
    if (reset) begin // @[MEM.scala 22:26]
      reg_csr_6 <= 32'h0; // @[MEM.scala 22:26]
    end else if (io_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 47:31]
      if (5'h6 == csr_addr[4:0]) begin // @[MEM.scala 48:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_6 <= io_id_in_op1_data;
        end else begin
          reg_csr_6 <= _csr_wdata_T_9;
        end
      end
    end
    if (reset) begin // @[MEM.scala 22:26]
      reg_csr_7 <= 32'h0; // @[MEM.scala 22:26]
    end else if (io_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 47:31]
      if (5'h7 == csr_addr[4:0]) begin // @[MEM.scala 48:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_7 <= io_id_in_op1_data;
        end else begin
          reg_csr_7 <= _csr_wdata_T_9;
        end
      end
    end
    if (reset) begin // @[MEM.scala 22:26]
      reg_csr_8 <= 32'h0; // @[MEM.scala 22:26]
    end else if (io_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 47:31]
      if (5'h8 == csr_addr[4:0]) begin // @[MEM.scala 48:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_8 <= io_id_in_op1_data;
        end else begin
          reg_csr_8 <= _csr_wdata_T_9;
        end
      end
    end
    if (reset) begin // @[MEM.scala 22:26]
      reg_csr_9 <= 32'h0; // @[MEM.scala 22:26]
    end else if (io_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 47:31]
      if (5'h9 == csr_addr[4:0]) begin // @[MEM.scala 48:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_9 <= io_id_in_op1_data;
        end else begin
          reg_csr_9 <= _csr_wdata_T_9;
        end
      end
    end
    if (reset) begin // @[MEM.scala 22:26]
      reg_csr_10 <= 32'h0; // @[MEM.scala 22:26]
    end else if (io_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 47:31]
      if (5'ha == csr_addr[4:0]) begin // @[MEM.scala 48:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_10 <= io_id_in_op1_data;
        end else begin
          reg_csr_10 <= _csr_wdata_T_9;
        end
      end
    end
    if (reset) begin // @[MEM.scala 22:26]
      reg_csr_11 <= 32'h0; // @[MEM.scala 22:26]
    end else if (io_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 47:31]
      if (5'hb == csr_addr[4:0]) begin // @[MEM.scala 48:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_11 <= io_id_in_op1_data;
        end else begin
          reg_csr_11 <= _csr_wdata_T_9;
        end
      end
    end
    if (reset) begin // @[MEM.scala 22:26]
      reg_csr_12 <= 32'h0; // @[MEM.scala 22:26]
    end else if (io_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 47:31]
      if (5'hc == csr_addr[4:0]) begin // @[MEM.scala 48:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_12 <= io_id_in_op1_data;
        end else begin
          reg_csr_12 <= _csr_wdata_T_9;
        end
      end
    end
    if (reset) begin // @[MEM.scala 22:26]
      reg_csr_13 <= 32'h0; // @[MEM.scala 22:26]
    end else if (io_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 47:31]
      if (5'hd == csr_addr[4:0]) begin // @[MEM.scala 48:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_13 <= io_id_in_op1_data;
        end else begin
          reg_csr_13 <= _csr_wdata_T_9;
        end
      end
    end
    if (reset) begin // @[MEM.scala 22:26]
      reg_csr_14 <= 32'h0; // @[MEM.scala 22:26]
    end else if (io_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 47:31]
      if (5'he == csr_addr[4:0]) begin // @[MEM.scala 48:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_14 <= io_id_in_op1_data;
        end else begin
          reg_csr_14 <= _csr_wdata_T_9;
        end
      end
    end
    if (reset) begin // @[MEM.scala 22:26]
      reg_csr_15 <= 32'h0; // @[MEM.scala 22:26]
    end else if (io_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 47:31]
      if (5'hf == csr_addr[4:0]) begin // @[MEM.scala 48:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_15 <= io_id_in_op1_data;
        end else begin
          reg_csr_15 <= _csr_wdata_T_9;
        end
      end
    end
    if (reset) begin // @[MEM.scala 22:26]
      reg_csr_16 <= 32'h0; // @[MEM.scala 22:26]
    end else if (io_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 47:31]
      if (5'h10 == csr_addr[4:0]) begin // @[MEM.scala 48:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_16 <= io_id_in_op1_data;
        end else begin
          reg_csr_16 <= _csr_wdata_T_9;
        end
      end
    end
    if (reset) begin // @[MEM.scala 22:26]
      reg_csr_17 <= 32'h0; // @[MEM.scala 22:26]
    end else if (io_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 47:31]
      if (5'h11 == csr_addr[4:0]) begin // @[MEM.scala 48:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_17 <= io_id_in_op1_data;
        end else begin
          reg_csr_17 <= _csr_wdata_T_9;
        end
      end
    end
    if (reset) begin // @[MEM.scala 22:26]
      reg_csr_18 <= 32'h0; // @[MEM.scala 22:26]
    end else if (io_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 47:31]
      if (5'h12 == csr_addr[4:0]) begin // @[MEM.scala 48:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_18 <= io_id_in_op1_data;
        end else begin
          reg_csr_18 <= _csr_wdata_T_9;
        end
      end
    end
    if (reset) begin // @[MEM.scala 22:26]
      reg_csr_19 <= 32'h0; // @[MEM.scala 22:26]
    end else if (io_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 47:31]
      if (5'h13 == csr_addr[4:0]) begin // @[MEM.scala 48:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_19 <= io_id_in_op1_data;
        end else begin
          reg_csr_19 <= _csr_wdata_T_9;
        end
      end
    end
    if (reset) begin // @[MEM.scala 22:26]
      reg_csr_20 <= 32'h0; // @[MEM.scala 22:26]
    end else if (io_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 47:31]
      if (5'h14 == csr_addr[4:0]) begin // @[MEM.scala 48:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_20 <= io_id_in_op1_data;
        end else begin
          reg_csr_20 <= _csr_wdata_T_9;
        end
      end
    end
    if (reset) begin // @[MEM.scala 22:26]
      reg_csr_21 <= 32'h0; // @[MEM.scala 22:26]
    end else if (io_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 47:31]
      if (5'h15 == csr_addr[4:0]) begin // @[MEM.scala 48:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_21 <= io_id_in_op1_data;
        end else begin
          reg_csr_21 <= _csr_wdata_T_9;
        end
      end
    end
    if (reset) begin // @[MEM.scala 22:26]
      reg_csr_22 <= 32'h0; // @[MEM.scala 22:26]
    end else if (io_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 47:31]
      if (5'h16 == csr_addr[4:0]) begin // @[MEM.scala 48:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_22 <= io_id_in_op1_data;
        end else begin
          reg_csr_22 <= _csr_wdata_T_9;
        end
      end
    end
    if (reset) begin // @[MEM.scala 22:26]
      reg_csr_23 <= 32'h0; // @[MEM.scala 22:26]
    end else if (io_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 47:31]
      if (5'h17 == csr_addr[4:0]) begin // @[MEM.scala 48:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_23 <= io_id_in_op1_data;
        end else begin
          reg_csr_23 <= _csr_wdata_T_9;
        end
      end
    end
    if (reset) begin // @[MEM.scala 22:26]
      reg_csr_24 <= 32'h0; // @[MEM.scala 22:26]
    end else if (io_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 47:31]
      if (5'h18 == csr_addr[4:0]) begin // @[MEM.scala 48:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_24 <= io_id_in_op1_data;
        end else begin
          reg_csr_24 <= _csr_wdata_T_9;
        end
      end
    end
    if (reset) begin // @[MEM.scala 22:26]
      reg_csr_25 <= 32'h0; // @[MEM.scala 22:26]
    end else if (io_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 47:31]
      if (5'h19 == csr_addr[4:0]) begin // @[MEM.scala 48:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_25 <= io_id_in_op1_data;
        end else begin
          reg_csr_25 <= _csr_wdata_T_9;
        end
      end
    end
    if (reset) begin // @[MEM.scala 22:26]
      reg_csr_26 <= 32'h0; // @[MEM.scala 22:26]
    end else if (io_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 47:31]
      if (5'h1a == csr_addr[4:0]) begin // @[MEM.scala 48:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_26 <= io_id_in_op1_data;
        end else begin
          reg_csr_26 <= _csr_wdata_T_9;
        end
      end
    end
    if (reset) begin // @[MEM.scala 22:26]
      reg_csr_27 <= 32'h0; // @[MEM.scala 22:26]
    end else if (io_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 47:31]
      if (5'h1b == csr_addr[4:0]) begin // @[MEM.scala 48:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_27 <= io_id_in_op1_data;
        end else begin
          reg_csr_27 <= _csr_wdata_T_9;
        end
      end
    end
    if (reset) begin // @[MEM.scala 22:26]
      reg_csr_28 <= 32'h0; // @[MEM.scala 22:26]
    end else if (io_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 47:31]
      if (5'h1c == csr_addr[4:0]) begin // @[MEM.scala 48:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_28 <= io_id_in_op1_data;
        end else begin
          reg_csr_28 <= _csr_wdata_T_9;
        end
      end
    end
    if (reset) begin // @[MEM.scala 22:26]
      reg_csr_29 <= 32'h0; // @[MEM.scala 22:26]
    end else if (io_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 47:31]
      if (5'h1d == csr_addr[4:0]) begin // @[MEM.scala 48:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_29 <= io_id_in_op1_data;
        end else begin
          reg_csr_29 <= _csr_wdata_T_9;
        end
      end
    end
    if (reset) begin // @[MEM.scala 22:26]
      reg_csr_30 <= 32'h0; // @[MEM.scala 22:26]
    end else if (io_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 47:31]
      if (5'h1e == csr_addr[4:0]) begin // @[MEM.scala 48:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_30 <= io_id_in_op1_data;
        end else begin
          reg_csr_30 <= _csr_wdata_T_9;
        end
      end
    end
    if (reset) begin // @[MEM.scala 22:26]
      reg_csr_31 <= 32'h0; // @[MEM.scala 22:26]
    end else if (io_id_in_csr_cmd != 3'h0) begin // @[MEM.scala 47:31]
      if (5'h1f == csr_addr[4:0]) begin // @[MEM.scala 48:27]
        if (_csr_wdata_T) begin // @[Mux.scala 98:16]
          reg_csr_31 <= io_id_in_op1_data;
        end else begin
          reg_csr_31 <= _csr_wdata_T_9;
        end
      end
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
  input  [31:0] io_if_in_reg_pc,
  input  [4:0]  io_id_in_rd_addr,
  input         io_id_in_rd_wen,
  input  [2:0]  io_id_in_rd_sel,
  input  [31:0] io_ex_in_alu_out,
  input  [31:0] io_mem_in_datamem_rdata,
  input  [31:0] io_mem_in_csr_rdata,
  output        io_out_rd_wen,
  output [4:0]  io_out_rd_addr,
  output [31:0] io_out_rd_data
);
  wire  _rd_data_T = io_id_in_rd_sel == 3'h1; // @[WB.scala 32:17]
  wire  _rd_data_T_1 = io_id_in_rd_sel == 3'h2; // @[WB.scala 33:17]
  wire [31:0] _rd_data_T_3 = io_if_in_reg_pc + 32'h4; // @[WB.scala 33:40]
  wire  _rd_data_T_4 = io_id_in_rd_sel == 3'h3; // @[WB.scala 34:17]
  wire [31:0] _rd_data_T_5 = _rd_data_T_4 ? io_mem_in_csr_rdata : io_ex_in_alu_out; // @[Mux.scala 98:16]
  wire [31:0] _rd_data_T_6 = _rd_data_T_1 ? _rd_data_T_3 : _rd_data_T_5; // @[Mux.scala 98:16]
  assign io_out_rd_wen = io_id_in_rd_wen; // @[WB.scala 38:19]
  assign io_out_rd_addr = io_id_in_rd_addr; // @[WB.scala 39:20]
  assign io_out_rd_data = _rd_data_T ? io_mem_in_datamem_rdata : _rd_data_T_6; // @[Mux.scala 98:16]
endmodule
module Top(
  input   clock,
  input   reset,
  output  io_exit
);
  wire  memory_clock; // @[Top.scala 14:24]
  wire [31:0] memory_io_instmem_addr; // @[Top.scala 14:24]
  wire [31:0] memory_io_instmem_inst; // @[Top.scala 14:24]
  wire [31:0] memory_io_datamem_addr; // @[Top.scala 14:24]
  wire [31:0] memory_io_datamem_rdata; // @[Top.scala 14:24]
  wire  memory_io_datamem_wen; // @[Top.scala 14:24]
  wire [31:0] memory_io_datamem_wdata; // @[Top.scala 14:24]
  wire  pc_clock; // @[Top.scala 15:20]
  wire  pc_reset; // @[Top.scala 15:20]
  wire [31:0] pc_io_ex_in_alu_out; // @[Top.scala 15:20]
  wire  pc_io_ex_in_jump_flag; // @[Top.scala 15:20]
  wire  pc_io_br_in_br_flag; // @[Top.scala 15:20]
  wire [31:0] pc_io_br_in_br_target; // @[Top.scala 15:20]
  wire [31:0] pc_io_out_reg_pc; // @[Top.scala 15:20]
  wire [31:0] pc_io_out_inst; // @[Top.scala 15:20]
  wire [31:0] pc_io_instmem_addr; // @[Top.scala 15:20]
  wire [31:0] pc_io_instmem_inst; // @[Top.scala 15:20]
  wire  id_clock; // @[Top.scala 16:20]
  wire  id_reset; // @[Top.scala 16:20]
  wire [31:0] id_io_if_in_reg_pc; // @[Top.scala 16:20]
  wire [31:0] id_io_if_in_inst; // @[Top.scala 16:20]
  wire  id_io_wb_in_rd_wen; // @[Top.scala 16:20]
  wire [4:0] id_io_wb_in_rd_addr; // @[Top.scala 16:20]
  wire [31:0] id_io_wb_in_rd_data; // @[Top.scala 16:20]
  wire [31:0] id_io_out_op1_data; // @[Top.scala 16:20]
  wire [31:0] id_io_out_op2_data; // @[Top.scala 16:20]
  wire [4:0] id_io_out_rd_addr; // @[Top.scala 16:20]
  wire [31:0] id_io_out_csr_addr_default; // @[Top.scala 16:20]
  wire [4:0] id_io_out_exe_fun; // @[Top.scala 16:20]
  wire  id_io_out_mem_wen; // @[Top.scala 16:20]
  wire  id_io_out_rd_wen; // @[Top.scala 16:20]
  wire [2:0] id_io_out_rd_sel; // @[Top.scala 16:20]
  wire [2:0] id_io_out_csr_cmd; // @[Top.scala 16:20]
  wire [31:0] id_io_out_rs2_data; // @[Top.scala 16:20]
  wire [31:0] id_io_out_imm_b_sext; // @[Top.scala 16:20]
  wire [31:0] alu_io_id_in_op1_data; // @[Top.scala 17:21]
  wire [31:0] alu_io_id_in_op2_data; // @[Top.scala 17:21]
  wire [4:0] alu_io_id_in_exe_fun; // @[Top.scala 17:21]
  wire [2:0] alu_io_id_in_rd_sel; // @[Top.scala 17:21]
  wire [31:0] alu_io_out_alu_out; // @[Top.scala 17:21]
  wire  alu_io_out_jump_flag; // @[Top.scala 17:21]
  wire [31:0] br_io_if_in_reg_pc; // @[Top.scala 18:20]
  wire [31:0] br_io_id_in_op1_data; // @[Top.scala 18:20]
  wire [31:0] br_io_id_in_op2_data; // @[Top.scala 18:20]
  wire [4:0] br_io_id_in_exe_fun; // @[Top.scala 18:20]
  wire [31:0] br_io_id_in_imm_b_sext; // @[Top.scala 18:20]
  wire  br_io_out_br_flag; // @[Top.scala 18:20]
  wire [31:0] br_io_out_br_target; // @[Top.scala 18:20]
  wire  mem_clock; // @[Top.scala 19:21]
  wire  mem_reset; // @[Top.scala 19:21]
  wire [31:0] mem_io_id_in_op1_data; // @[Top.scala 19:21]
  wire [31:0] mem_io_id_in_csr_addr_default; // @[Top.scala 19:21]
  wire  mem_io_id_in_mem_wen; // @[Top.scala 19:21]
  wire [2:0] mem_io_id_in_csr_cmd; // @[Top.scala 19:21]
  wire [31:0] mem_io_id_in_rs2_data; // @[Top.scala 19:21]
  wire [31:0] mem_io_ex_in_alu_out; // @[Top.scala 19:21]
  wire [31:0] mem_io_out_datamem_rdata; // @[Top.scala 19:21]
  wire [31:0] mem_io_out_csr_rdata; // @[Top.scala 19:21]
  wire [31:0] mem_io_datamem_addr; // @[Top.scala 19:21]
  wire [31:0] mem_io_datamem_rdata; // @[Top.scala 19:21]
  wire  mem_io_datamem_wen; // @[Top.scala 19:21]
  wire [31:0] mem_io_datamem_wdata; // @[Top.scala 19:21]
  wire [31:0] wb_io_if_in_reg_pc; // @[Top.scala 20:20]
  wire [4:0] wb_io_id_in_rd_addr; // @[Top.scala 20:20]
  wire  wb_io_id_in_rd_wen; // @[Top.scala 20:20]
  wire [2:0] wb_io_id_in_rd_sel; // @[Top.scala 20:20]
  wire [31:0] wb_io_ex_in_alu_out; // @[Top.scala 20:20]
  wire [31:0] wb_io_mem_in_datamem_rdata; // @[Top.scala 20:20]
  wire [31:0] wb_io_mem_in_csr_rdata; // @[Top.scala 20:20]
  wire  wb_io_out_rd_wen; // @[Top.scala 20:20]
  wire [4:0] wb_io_out_rd_addr; // @[Top.scala 20:20]
  wire [31:0] wb_io_out_rd_data; // @[Top.scala 20:20]
  wire [31:0] _io_exit_T = pc_io_out_inst; // @[Top.scala 42:15]
  wire  _io_exit_T_1 = 32'hc0001073 == _io_exit_T; // @[Top.scala 42:15]
  wire  _io_exit_T_2 = pc_io_out_inst == 32'h0; // @[Top.scala 43:15]
  wire  _io_exit_T_3 = pc_io_out_reg_pc == 32'h44; // @[Top.scala 44:17]
  Memory memory ( // @[Top.scala 14:24]
    .clock(memory_clock),
    .io_instmem_addr(memory_io_instmem_addr),
    .io_instmem_inst(memory_io_instmem_inst),
    .io_datamem_addr(memory_io_datamem_addr),
    .io_datamem_rdata(memory_io_datamem_rdata),
    .io_datamem_wen(memory_io_datamem_wen),
    .io_datamem_wdata(memory_io_datamem_wdata)
  );
  PC pc ( // @[Top.scala 15:20]
    .clock(pc_clock),
    .reset(pc_reset),
    .io_ex_in_alu_out(pc_io_ex_in_alu_out),
    .io_ex_in_jump_flag(pc_io_ex_in_jump_flag),
    .io_br_in_br_flag(pc_io_br_in_br_flag),
    .io_br_in_br_target(pc_io_br_in_br_target),
    .io_out_reg_pc(pc_io_out_reg_pc),
    .io_out_inst(pc_io_out_inst),
    .io_instmem_addr(pc_io_instmem_addr),
    .io_instmem_inst(pc_io_instmem_inst)
  );
  ID id ( // @[Top.scala 16:20]
    .clock(id_clock),
    .reset(id_reset),
    .io_if_in_reg_pc(id_io_if_in_reg_pc),
    .io_if_in_inst(id_io_if_in_inst),
    .io_wb_in_rd_wen(id_io_wb_in_rd_wen),
    .io_wb_in_rd_addr(id_io_wb_in_rd_addr),
    .io_wb_in_rd_data(id_io_wb_in_rd_data),
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
    .io_out_imm_b_sext(id_io_out_imm_b_sext)
  );
  ALU alu ( // @[Top.scala 17:21]
    .io_id_in_op1_data(alu_io_id_in_op1_data),
    .io_id_in_op2_data(alu_io_id_in_op2_data),
    .io_id_in_exe_fun(alu_io_id_in_exe_fun),
    .io_id_in_rd_sel(alu_io_id_in_rd_sel),
    .io_out_alu_out(alu_io_out_alu_out),
    .io_out_jump_flag(alu_io_out_jump_flag)
  );
  BR br ( // @[Top.scala 18:20]
    .io_if_in_reg_pc(br_io_if_in_reg_pc),
    .io_id_in_op1_data(br_io_id_in_op1_data),
    .io_id_in_op2_data(br_io_id_in_op2_data),
    .io_id_in_exe_fun(br_io_id_in_exe_fun),
    .io_id_in_imm_b_sext(br_io_id_in_imm_b_sext),
    .io_out_br_flag(br_io_out_br_flag),
    .io_out_br_target(br_io_out_br_target)
  );
  MEM mem ( // @[Top.scala 19:21]
    .clock(mem_clock),
    .reset(mem_reset),
    .io_id_in_op1_data(mem_io_id_in_op1_data),
    .io_id_in_csr_addr_default(mem_io_id_in_csr_addr_default),
    .io_id_in_mem_wen(mem_io_id_in_mem_wen),
    .io_id_in_csr_cmd(mem_io_id_in_csr_cmd),
    .io_id_in_rs2_data(mem_io_id_in_rs2_data),
    .io_ex_in_alu_out(mem_io_ex_in_alu_out),
    .io_out_datamem_rdata(mem_io_out_datamem_rdata),
    .io_out_csr_rdata(mem_io_out_csr_rdata),
    .io_datamem_addr(mem_io_datamem_addr),
    .io_datamem_rdata(mem_io_datamem_rdata),
    .io_datamem_wen(mem_io_datamem_wen),
    .io_datamem_wdata(mem_io_datamem_wdata)
  );
  WB wb ( // @[Top.scala 20:20]
    .io_if_in_reg_pc(wb_io_if_in_reg_pc),
    .io_id_in_rd_addr(wb_io_id_in_rd_addr),
    .io_id_in_rd_wen(wb_io_id_in_rd_wen),
    .io_id_in_rd_sel(wb_io_id_in_rd_sel),
    .io_ex_in_alu_out(wb_io_ex_in_alu_out),
    .io_mem_in_datamem_rdata(wb_io_mem_in_datamem_rdata),
    .io_mem_in_csr_rdata(wb_io_mem_in_csr_rdata),
    .io_out_rd_wen(wb_io_out_rd_wen),
    .io_out_rd_addr(wb_io_out_rd_addr),
    .io_out_rd_data(wb_io_out_rd_data)
  );
  assign io_exit = _io_exit_T_1 | (_io_exit_T_2 | _io_exit_T_3); // @[Mux.scala 98:16]
  assign memory_clock = clock;
  assign memory_io_instmem_addr = pc_io_instmem_addr; // @[Top.scala 24:21]
  assign memory_io_datamem_addr = mem_io_datamem_addr; // @[Top.scala 33:21]
  assign memory_io_datamem_wen = mem_io_datamem_wen; // @[Top.scala 33:21]
  assign memory_io_datamem_wdata = mem_io_datamem_wdata; // @[Top.scala 33:21]
  assign pc_clock = clock;
  assign pc_reset = reset;
  assign pc_io_ex_in_alu_out = alu_io_out_alu_out; // @[Top.scala 22:21]
  assign pc_io_ex_in_jump_flag = alu_io_out_jump_flag; // @[Top.scala 22:21]
  assign pc_io_br_in_br_flag = br_io_out_br_flag; // @[Top.scala 23:21]
  assign pc_io_br_in_br_target = br_io_out_br_target; // @[Top.scala 23:21]
  assign pc_io_instmem_inst = memory_io_instmem_inst; // @[Top.scala 24:21]
  assign id_clock = clock;
  assign id_reset = reset;
  assign id_io_if_in_reg_pc = pc_io_out_reg_pc; // @[Top.scala 25:21]
  assign id_io_if_in_inst = pc_io_out_inst; // @[Top.scala 25:21]
  assign id_io_wb_in_rd_wen = wb_io_out_rd_wen; // @[Top.scala 26:21]
  assign id_io_wb_in_rd_addr = wb_io_out_rd_addr; // @[Top.scala 26:21]
  assign id_io_wb_in_rd_data = wb_io_out_rd_data; // @[Top.scala 26:21]
  assign alu_io_id_in_op1_data = id_io_out_op1_data; // @[Top.scala 27:21]
  assign alu_io_id_in_op2_data = id_io_out_op2_data; // @[Top.scala 27:21]
  assign alu_io_id_in_exe_fun = id_io_out_exe_fun; // @[Top.scala 27:21]
  assign alu_io_id_in_rd_sel = id_io_out_rd_sel; // @[Top.scala 27:21]
  assign br_io_if_in_reg_pc = pc_io_out_reg_pc; // @[Top.scala 28:21]
  assign br_io_id_in_op1_data = id_io_out_op1_data; // @[Top.scala 29:21]
  assign br_io_id_in_op2_data = id_io_out_op2_data; // @[Top.scala 29:21]
  assign br_io_id_in_exe_fun = id_io_out_exe_fun; // @[Top.scala 29:21]
  assign br_io_id_in_imm_b_sext = id_io_out_imm_b_sext; // @[Top.scala 29:21]
  assign mem_clock = clock;
  assign mem_reset = reset;
  assign mem_io_id_in_op1_data = id_io_out_op1_data; // @[Top.scala 31:21]
  assign mem_io_id_in_csr_addr_default = id_io_out_csr_addr_default; // @[Top.scala 31:21]
  assign mem_io_id_in_mem_wen = id_io_out_mem_wen; // @[Top.scala 31:21]
  assign mem_io_id_in_csr_cmd = id_io_out_csr_cmd; // @[Top.scala 31:21]
  assign mem_io_id_in_rs2_data = id_io_out_rs2_data; // @[Top.scala 31:21]
  assign mem_io_ex_in_alu_out = alu_io_out_alu_out; // @[Top.scala 32:21]
  assign mem_io_datamem_rdata = memory_io_datamem_rdata; // @[Top.scala 33:21]
  assign wb_io_if_in_reg_pc = pc_io_out_reg_pc; // @[Top.scala 34:21]
  assign wb_io_id_in_rd_addr = id_io_out_rd_addr; // @[Top.scala 35:21]
  assign wb_io_id_in_rd_wen = id_io_out_rd_wen; // @[Top.scala 35:21]
  assign wb_io_id_in_rd_sel = id_io_out_rd_sel; // @[Top.scala 35:21]
  assign wb_io_ex_in_alu_out = alu_io_out_alu_out; // @[Top.scala 36:21]
  assign wb_io_mem_in_datamem_rdata = mem_io_out_datamem_rdata; // @[Top.scala 37:21]
  assign wb_io_mem_in_csr_rdata = mem_io_out_csr_rdata; // @[Top.scala 37:21]
endmodule
