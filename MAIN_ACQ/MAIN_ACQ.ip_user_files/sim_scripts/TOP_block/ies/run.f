-makelib ies_lib/xilinx_vip -sv \
  "C:/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
  "C:/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
  "C:/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
  "C:/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
  "C:/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
  "C:/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
  "C:/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
  "C:/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
  "C:/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/rst_vip_if.sv" \
-endlib
-makelib ies_lib/xpm -sv \
  "C:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "C:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
  "C:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies_lib/xpm \
  "C:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/TOP_block/ip/TOP_block_processing_system7_0_0/TOP_block_processing_system7_0_0_sim_netlist.vhdl" \
-endlib
-makelib ies_lib/lib_cdc_v1_0_2 \
  "../../../../MAIN_ACQ.srcs/sources_1/bd/TOP_block/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \
-endlib
-makelib ies_lib/proc_sys_reset_v5_0_13 \
  "../../../../MAIN_ACQ.srcs/sources_1/bd/TOP_block/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/TOP_block/ip/TOP_block_rst_ps7_0_200M_0/sim/TOP_block_rst_ps7_0_200M_0.vhd" \
  "../../../bd/TOP_block/ip/TOP_block_RunControl_AXI_0_0/sim/TOP_block_RunControl_AXI_0_0.vhd" \
  "../../../bd/TOP_block/ip/TOP_block_xbar_0/TOP_block_xbar_0_sim_netlist.vhdl" \
-endlib
-makelib ies_lib/axi_lite_ipif_v3_0_4 \
  "../../../../MAIN_ACQ.srcs/sources_1/bd/TOP_block/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \
-endlib
-makelib ies_lib/lib_pkg_v1_0_2 \
  "../../../../MAIN_ACQ.srcs/sources_1/bd/TOP_block/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \
-endlib
-makelib ies_lib/lib_srl_fifo_v1_0_2 \
  "../../../../MAIN_ACQ.srcs/sources_1/bd/TOP_block/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \
-endlib
-makelib ies_lib/axi_uartlite_v2_0_24 \
  "../../../../MAIN_ACQ.srcs/sources_1/bd/TOP_block/ipshared/d8db/hdl/axi_uartlite_v2_0_vh_rfs.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
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
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

