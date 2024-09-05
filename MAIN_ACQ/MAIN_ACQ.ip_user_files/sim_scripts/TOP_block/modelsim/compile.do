vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xilinx_vip
vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/lib_cdc_v1_0_2
vlib modelsim_lib/msim/proc_sys_reset_v5_0_13
vlib modelsim_lib/msim/axi_lite_ipif_v3_0_4
vlib modelsim_lib/msim/lib_pkg_v1_0_2
vlib modelsim_lib/msim/lib_srl_fifo_v1_0_2
vlib modelsim_lib/msim/axi_uartlite_v2_0_24

vmap xilinx_vip modelsim_lib/msim/xilinx_vip
vmap xpm modelsim_lib/msim/xpm
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap lib_cdc_v1_0_2 modelsim_lib/msim/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 modelsim_lib/msim/proc_sys_reset_v5_0_13
vmap axi_lite_ipif_v3_0_4 modelsim_lib/msim/axi_lite_ipif_v3_0_4
vmap lib_pkg_v1_0_2 modelsim_lib/msim/lib_pkg_v1_0_2
vmap lib_srl_fifo_v1_0_2 modelsim_lib/msim/lib_srl_fifo_v1_0_2
vmap axi_uartlite_v2_0_24 modelsim_lib/msim/axi_uartlite_v2_0_24

vlog -work xilinx_vip -64 -incr -sv -L axi_vip_v1_1_6 -L processing_system7_vip_v1_0_8 -L xilinx_vip "+incdir+C:/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"C:/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"C:/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"C:/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"C:/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"C:/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"C:/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"C:/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"C:/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"C:/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm -64 -incr -sv -L axi_vip_v1_1_6 -L processing_system7_vip_v1_0_8 -L xilinx_vip "+incdir+../../../../MAIN_ACQ.srcs/sources_1/bd/TOP_block/ipshared/ec67/hdl" "+incdir+../../../../MAIN_ACQ.srcs/sources_1/bd/TOP_block/ipshared/2d50/hdl" "+incdir+../../../../MAIN_ACQ.srcs/sources_1/bd/TOP_block/ip/TOP_block_processing_system7_0_0" "+incdir+../../../../MAIN_ACQ.srcs/sources_1/bd/TOP_block/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"C:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"C:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"C:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/TOP_block/ip/TOP_block_processing_system7_0_0/TOP_block_processing_system7_0_0_sim_netlist.vhdl" \

vcom -work lib_cdc_v1_0_2 -64 -93 \
"../../../../MAIN_ACQ.srcs/sources_1/bd/TOP_block/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13 -64 -93 \
"../../../../MAIN_ACQ.srcs/sources_1/bd/TOP_block/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/TOP_block/ip/TOP_block_rst_ps7_0_200M_0/sim/TOP_block_rst_ps7_0_200M_0.vhd" \
"../../../bd/TOP_block/ip/TOP_block_RunControl_AXI_0_0/sim/TOP_block_RunControl_AXI_0_0.vhd" \
"../../../bd/TOP_block/ip/TOP_block_xbar_0/TOP_block_xbar_0_sim_netlist.vhdl" \

vcom -work axi_lite_ipif_v3_0_4 -64 -93 \
"../../../../MAIN_ACQ.srcs/sources_1/bd/TOP_block/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work lib_pkg_v1_0_2 -64 -93 \
"../../../../MAIN_ACQ.srcs/sources_1/bd/TOP_block/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \

vcom -work lib_srl_fifo_v1_0_2 -64 -93 \
"../../../../MAIN_ACQ.srcs/sources_1/bd/TOP_block/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vcom -work axi_uartlite_v2_0_24 -64 -93 \
"../../../../MAIN_ACQ.srcs/sources_1/bd/TOP_block/ipshared/d8db/hdl/axi_uartlite_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/TOP_block/ip/TOP_block_axi_uartlite_1_0/sim/TOP_block_axi_uartlite_1_0.vhd" \
"../../../bd/TOP_block/sim/TOP_block.vhd" \
"../../../bd/TOP_block/ip/TOP_block_auto_pc_0/TOP_block_auto_pc_0_sim_netlist.vhdl" \
"../../../../MAIN_ACQ.srcs/sources_1/bd/TOP_block/ip/TOP_block_axi_dma_0_0/TOP_block_axi_dma_0_0_sim_netlist.vhdl" \
"../../../../MAIN_ACQ.srcs/sources_1/bd/TOP_block/ip/TOP_block_xbar_1/TOP_block_xbar_1_sim_netlist.vhdl" \
"../../../../MAIN_ACQ.srcs/sources_1/bd/TOP_block/ip/TOP_block_auto_us_0/TOP_block_auto_us_0_sim_netlist.vhdl" \
"../../../../MAIN_ACQ.srcs/sources_1/bd/TOP_block/ip/TOP_block_auto_us_1/TOP_block_auto_us_1_sim_netlist.vhdl" \
"../../../../MAIN_ACQ.srcs/sources_1/bd/TOP_block/ip/TOP_block_auto_pc_1/TOP_block_auto_pc_1_sim_netlist.vhdl" \
"../../../../MAIN_ACQ.srcs/sources_1/bd/TOP_block/ip/TOP_block_rst_ps7_0_200M_1_0/sim/TOP_block_rst_ps7_0_200M_1_0.vhd" \
"../../../../MAIN_ACQ.srcs/sources_1/bd/TOP_block/ip/TOP_block_axis_data_fifo_0_1/TOP_block_axis_data_fifo_0_1_sim_netlist.vhdl" \

vlog -work xil_defaultlib \
"glbl.v"

