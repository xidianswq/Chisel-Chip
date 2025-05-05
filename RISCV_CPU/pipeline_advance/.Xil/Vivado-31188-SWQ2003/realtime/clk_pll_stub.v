// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_pll(clk_out, reset, clk_in);
  output clk_out /* synthesis syn_isclock = 1 */;
  input reset;
  input clk_in;
endmodule
