vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib

vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../ipstatic" \
"../../../../RISCV_CPU.gen/sources_1/ip/clk_pll/clk_pll_clk_wiz.v" \
"../../../../RISCV_CPU.gen/sources_1/ip/clk_pll/clk_pll.v" \


vlog -work xil_defaultlib \
"glbl.v"

