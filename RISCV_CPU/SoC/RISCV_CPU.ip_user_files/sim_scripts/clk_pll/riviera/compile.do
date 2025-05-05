transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vmap -link {C:/Users/SWQ2003/Desktop/RISCV_CPU/pipeline_advance/RISCV_CPU.cache/compile_simlib/riviera}
vlib riviera/xpm
vlib riviera/xil_defaultlib

vlog -work xpm  -incr "+incdir+../../../ipstatic" -l xpm -l xil_defaultlib \
"E:/software/work/xilinx/Vivado/2023.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"E:/software/work/xilinx/Vivado/2023.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  -incr \
"E:/software/work/xilinx/Vivado/2023.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../ipstatic" -l xpm -l xil_defaultlib \
"../../../../RISCV_CPU.gen/sources_1/ip/clk_pll/clk_pll_clk_wiz.v" \
"../../../../RISCV_CPU.gen/sources_1/ip/clk_pll/clk_pll.v" \

vlog -work xil_defaultlib \
"glbl.v"

