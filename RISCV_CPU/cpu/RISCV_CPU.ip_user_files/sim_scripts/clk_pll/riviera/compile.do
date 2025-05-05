transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vmap -link {C:/Users/SWQ2003/Desktop/RISCV_CPU/RISCV_CPU.cache/compile_simlib/riviera}
vlib riviera/xil_defaultlib

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../ipstatic" -l xil_defaultlib \
"../../../../RISCV_CPU.gen/sources_1/ip/clk_pll/clk_pll_clk_wiz.v" \
"../../../../RISCV_CPU.gen/sources_1/ip/clk_pll/clk_pll.v" \


vlog -work xil_defaultlib \
"glbl.v"

