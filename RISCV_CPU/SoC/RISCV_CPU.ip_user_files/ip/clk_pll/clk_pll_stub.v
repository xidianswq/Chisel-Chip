// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Wed Apr 23 10:33:34 2025
// Host        : SWQ2003 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/SWQ2003/Desktop/RISCV_CPU/pipeline_advance/RISCV_CPU.gen/sources_1/ip/clk_pll/clk_pll_stub.v
// Design      : clk_pll
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k160tfbg676-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_pll(clk_out, reset, clk_in)
/* synthesis syn_black_box black_box_pad_pin="reset,clk_in" */
/* synthesis syn_force_seq_prim="clk_out" */;
  output clk_out /* synthesis syn_isclock = 1 */;
  input reset;
  input clk_in;
endmodule
