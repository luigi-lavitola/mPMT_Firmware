
################################################################
# This is a generated script based on design: TOP_block
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2019.2
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source TOP_block_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# RunControl_AXI

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7z014sclg484-2
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name TOP_block

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set AXI_STR_RXD_0 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 AXI_STR_RXD_0 ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {200000000} \
   CONFIG.HAS_TKEEP {0} \
   CONFIG.HAS_TLAST {0} \
   CONFIG.HAS_TREADY {1} \
   CONFIG.HAS_TSTRB {0} \
   CONFIG.LAYERED_METADATA {undef} \
   CONFIG.TDATA_NUM_BYTES {4} \
   CONFIG.TDEST_WIDTH {0} \
   CONFIG.TID_WIDTH {0} \
   CONFIG.TUSER_WIDTH {0} \
   ] $AXI_STR_RXD_0

  set DDR [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 DDR ]

  set FIXED_IO [ create_bd_intf_port -mode Master -vlnv xilinx.com:display_processing_system7:fixedio_rtl:1.0 FIXED_IO ]


  # Create ports
  set CALIBRAZIONE_0 [ create_bd_port -dir O CALIBRAZIONE_0 ]
  set CLK_SEL_out_0 [ create_bd_port -dir O CLK_SEL_out_0 ]
  set CLK_failed_0 [ create_bd_port -dir I CLK_failed_0 ]
  set CS_ENABLE_0 [ create_bd_port -dir O -from 18 -to 0 CS_ENABLE_0 ]
  set ENERGY_MAX_0 [ create_bd_port -dir O -from 5 -to 0 ENERGY_MAX_0 ]
  set FCLK_200 [ create_bd_port -dir O -type clk FCLK_200 ]
  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {S_AXI_GP0_0:S_AXI_HP0_0} \
 ] $FCLK_200
  set FREQ_EVENTI_0_0 [ create_bd_port -dir I -from 15 -to 0 FREQ_EVENTI_0_0 ]
  set FREQ_EVENTI_10_0 [ create_bd_port -dir I -from 15 -to 0 FREQ_EVENTI_10_0 ]
  set FREQ_EVENTI_11_0 [ create_bd_port -dir I -from 15 -to 0 FREQ_EVENTI_11_0 ]
  set FREQ_EVENTI_12_0 [ create_bd_port -dir I -from 15 -to 0 FREQ_EVENTI_12_0 ]
  set FREQ_EVENTI_13_0 [ create_bd_port -dir I -from 15 -to 0 FREQ_EVENTI_13_0 ]
  set FREQ_EVENTI_14_0 [ create_bd_port -dir I -from 15 -to 0 FREQ_EVENTI_14_0 ]
  set FREQ_EVENTI_15_0 [ create_bd_port -dir I -from 15 -to 0 FREQ_EVENTI_15_0 ]
  set FREQ_EVENTI_16_0 [ create_bd_port -dir I -from 15 -to 0 FREQ_EVENTI_16_0 ]
  set FREQ_EVENTI_17_0 [ create_bd_port -dir I -from 15 -to 0 FREQ_EVENTI_17_0 ]
  set FREQ_EVENTI_18_0 [ create_bd_port -dir I -from 15 -to 0 FREQ_EVENTI_18_0 ]
  set FREQ_EVENTI_1_0 [ create_bd_port -dir I -from 15 -to 0 FREQ_EVENTI_1_0 ]
  set FREQ_EVENTI_2_0 [ create_bd_port -dir I -from 15 -to 0 FREQ_EVENTI_2_0 ]
  set FREQ_EVENTI_3_0 [ create_bd_port -dir I -from 15 -to 0 FREQ_EVENTI_3_0 ]
  set FREQ_EVENTI_4_0 [ create_bd_port -dir I -from 15 -to 0 FREQ_EVENTI_4_0 ]
  set FREQ_EVENTI_5_0 [ create_bd_port -dir I -from 15 -to 0 FREQ_EVENTI_5_0 ]
  set FREQ_EVENTI_6_0 [ create_bd_port -dir I -from 15 -to 0 FREQ_EVENTI_6_0 ]
  set FREQ_EVENTI_7_0 [ create_bd_port -dir I -from 15 -to 0 FREQ_EVENTI_7_0 ]
  set FREQ_EVENTI_8_0 [ create_bd_port -dir I -from 15 -to 0 FREQ_EVENTI_8_0 ]
  set FREQ_EVENTI_9_0 [ create_bd_port -dir I -from 15 -to 0 FREQ_EVENTI_9_0 ]
  set Fifo_HF_0 [ create_bd_port -dir I Fifo_HF_0 ]
  set I2C_SCL_I [ create_bd_port -dir I I2C_SCL_I ]
  set I2C_SCL_O [ create_bd_port -dir O I2C_SCL_O ]
  set I2C_SCL_T [ create_bd_port -dir O I2C_SCL_T ]
  set I2C_SDA_I [ create_bd_port -dir I I2C_SDA_I ]
  set I2C_SDA_O [ create_bd_port -dir O I2C_SDA_O ]
  set I2C_SDA_T [ create_bd_port -dir O I2C_SDA_T ]
  set OVC_CH_0 [ create_bd_port -dir I -from 18 -to 0 OVC_CH_0 ]
  set PPS_contati_0 [ create_bd_port -dir I -from 15 -to 0 PPS_contati_0 ]
  set PSDONE_0 [ create_bd_port -dir I PSDONE_0 ]
  set PWR_EN_0 [ create_bd_port -dir O -from 18 -to 0 PWR_EN_0 ]
  set RC_EvSecEn_0 [ create_bd_port -dir O RC_EvSecEn_0 ]
  set RC_Puls_1ms_0 [ create_bd_port -dir O -from 13 -to 0 RC_Puls_1ms_0 ]
  set RC_Tag_OK_0 [ create_bd_port -dir I -from 1 -to 0 RC_Tag_OK_0 ]
  set RESET_IN_0 [ create_bd_port -dir I -type rst RESET_IN_0 ]
  set RITARDO_0 [ create_bd_port -dir O -from 7 -to 0 RITARDO_0 ]
  set Rc_CLK_est_int_0 [ create_bd_port -dir O Rc_CLK_est_int_0 ]
  set Res_TagFlg_0 [ create_bd_port -dir O Res_TagFlg_0 ]
  set RunC_CLK_OK_0 [ create_bd_port -dir I RunC_CLK_OK_0 ]
  set Runc_CLK_Found_0 [ create_bd_port -dir I Runc_CLK_Found_0 ]
  set Runc_CLK_Lost_0 [ create_bd_port -dir I Runc_CLK_Lost_0 ]
  set Runc_CLK_ResFlg_0 [ create_bd_port -dir O Runc_CLK_ResFlg_0 ]
  set Runc_Val_Tag0_0 [ create_bd_port -dir O -from 15 -to 0 Runc_Val_Tag0_0 ]
  set UART1_RX [ create_bd_port -dir I UART1_RX ]
  set UART1_TX [ create_bd_port -dir O UART1_TX ]
  set locked_0 [ create_bd_port -dir I locked_0 ]

  # Create instance: RunControl_AXI_0, and set properties
  set block_name RunControl_AXI
  set block_cell_name RunControl_AXI_0
  if { [catch {set RunControl_AXI_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $RunControl_AXI_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: axi_fifo_mm_s_0, and set properties
  set axi_fifo_mm_s_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_fifo_mm_s:4.2 axi_fifo_mm_s_0 ]
  set_property -dict [ list \
   CONFIG.C_DATA_INTERFACE_TYPE {0} \
   CONFIG.C_RX_FIFO_DEPTH {4096} \
   CONFIG.C_RX_FIFO_PE_THRESHOLD {5} \
   CONFIG.C_RX_FIFO_PF_THRESHOLD {4000} \
   CONFIG.C_TX_FIFO_DEPTH {512} \
   CONFIG.C_TX_FIFO_PE_THRESHOLD {5} \
   CONFIG.C_TX_FIFO_PF_THRESHOLD {507} \
   CONFIG.C_USE_RX_DATA {1} \
   CONFIG.C_USE_TX_CTRL {0} \
   CONFIG.C_USE_TX_CUT_THROUGH {0} \
   CONFIG.C_USE_TX_DATA {0} \
 ] $axi_fifo_mm_s_0

  # Create instance: processing_system7_0, and set properties
  set processing_system7_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0 ]
  set_property -dict [ list \
   CONFIG.PCW_ACT_APU_PERIPHERAL_FREQMHZ {400.000000} \
   CONFIG.PCW_ACT_CAN_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_DCI_PERIPHERAL_FREQMHZ {10.062893} \
   CONFIG.PCW_ACT_ENET0_PERIPHERAL_FREQMHZ {125.000000} \
   CONFIG.PCW_ACT_ENET1_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_FPGA0_PERIPHERAL_FREQMHZ {200.000000} \
   CONFIG.PCW_ACT_FPGA1_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_FPGA2_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_FPGA3_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_PCAP_PERIPHERAL_FREQMHZ {200.000000} \
   CONFIG.PCW_ACT_QSPI_PERIPHERAL_FREQMHZ {200.000000} \
   CONFIG.PCW_ACT_SDIO_PERIPHERAL_FREQMHZ {100.000000} \
   CONFIG.PCW_ACT_SMC_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_SPI_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_TPIU_PERIPHERAL_FREQMHZ {200.000000} \
   CONFIG.PCW_ACT_TTC0_CLK0_PERIPHERAL_FREQMHZ {66.666672} \
   CONFIG.PCW_ACT_TTC0_CLK1_PERIPHERAL_FREQMHZ {66.666672} \
   CONFIG.PCW_ACT_TTC0_CLK2_PERIPHERAL_FREQMHZ {66.666672} \
   CONFIG.PCW_ACT_TTC1_CLK0_PERIPHERAL_FREQMHZ {66.666672} \
   CONFIG.PCW_ACT_TTC1_CLK1_PERIPHERAL_FREQMHZ {66.666672} \
   CONFIG.PCW_ACT_TTC1_CLK2_PERIPHERAL_FREQMHZ {66.666672} \
   CONFIG.PCW_ACT_UART_PERIPHERAL_FREQMHZ {100.000000} \
   CONFIG.PCW_ACT_WDT_PERIPHERAL_FREQMHZ {66.666672} \
   CONFIG.PCW_APU_PERIPHERAL_FREQMHZ {400} \
   CONFIG.PCW_ARMPLL_CTRL_FBDIV {32} \
   CONFIG.PCW_CAN_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_CAN_PERIPHERAL_DIVISOR1 {1} \
   CONFIG.PCW_CLK0_FREQ {200000000} \
   CONFIG.PCW_CLK1_FREQ {10000000} \
   CONFIG.PCW_CLK2_FREQ {10000000} \
   CONFIG.PCW_CLK3_FREQ {10000000} \
   CONFIG.PCW_CPU_CPU_PLL_FREQMHZ {1600.000} \
   CONFIG.PCW_CPU_PERIPHERAL_DIVISOR0 {4} \
   CONFIG.PCW_CRYSTAL_PERIPHERAL_FREQMHZ {50} \
   CONFIG.PCW_DCI_PERIPHERAL_DIVISOR0 {53} \
   CONFIG.PCW_DCI_PERIPHERAL_DIVISOR1 {3} \
   CONFIG.PCW_DDRPLL_CTRL_FBDIV {32} \
   CONFIG.PCW_DDR_DDR_PLL_FREQMHZ {1600.000} \
   CONFIG.PCW_DDR_PERIPHERAL_DIVISOR0 {4} \
   CONFIG.PCW_DDR_RAM_HIGHADDR {0x1FFFFFFF} \
   CONFIG.PCW_ENET0_ENET0_IO {MIO 16 .. 27} \
   CONFIG.PCW_ENET0_GRP_MDIO_ENABLE {1} \
   CONFIG.PCW_ENET0_GRP_MDIO_IO {MIO 52 .. 53} \
   CONFIG.PCW_ENET0_PERIPHERAL_CLKSRC {IO PLL} \
   CONFIG.PCW_ENET0_PERIPHERAL_DIVISOR0 {8} \
   CONFIG.PCW_ENET0_PERIPHERAL_DIVISOR1 {1} \
   CONFIG.PCW_ENET0_PERIPHERAL_ENABLE {1} \
   CONFIG.PCW_ENET0_PERIPHERAL_FREQMHZ {1000 Mbps} \
   CONFIG.PCW_ENET0_RESET_ENABLE {0} \
   CONFIG.PCW_ENET1_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_ENET1_PERIPHERAL_DIVISOR1 {1} \
   CONFIG.PCW_ENET1_RESET_ENABLE {0} \
   CONFIG.PCW_ENET_RESET_ENABLE {0} \
   CONFIG.PCW_EN_EMIO_ENET0 {0} \
   CONFIG.PCW_EN_EMIO_I2C0 {0} \
   CONFIG.PCW_EN_EMIO_I2C1 {1} \
   CONFIG.PCW_EN_EMIO_SDIO1 {0} \
   CONFIG.PCW_EN_EMIO_UART0 {0} \
   CONFIG.PCW_EN_EMIO_UART1 {1} \
   CONFIG.PCW_EN_ENET0 {1} \
   CONFIG.PCW_EN_I2C0 {1} \
   CONFIG.PCW_EN_I2C1 {1} \
   CONFIG.PCW_EN_QSPI {1} \
   CONFIG.PCW_EN_SDIO1 {1} \
   CONFIG.PCW_EN_UART0 {1} \
   CONFIG.PCW_EN_UART1 {1} \
   CONFIG.PCW_FCLK0_PERIPHERAL_DIVISOR0 {5} \
   CONFIG.PCW_FCLK0_PERIPHERAL_DIVISOR1 {1} \
   CONFIG.PCW_FCLK1_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_FCLK1_PERIPHERAL_DIVISOR1 {1} \
   CONFIG.PCW_FCLK2_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_FCLK2_PERIPHERAL_DIVISOR1 {1} \
   CONFIG.PCW_FCLK3_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_FCLK3_PERIPHERAL_DIVISOR1 {1} \
   CONFIG.PCW_FPGA0_PERIPHERAL_FREQMHZ {200} \
   CONFIG.PCW_FPGA_FCLK0_ENABLE {1} \
   CONFIG.PCW_FPGA_FCLK1_ENABLE {0} \
   CONFIG.PCW_FPGA_FCLK2_ENABLE {0} \
   CONFIG.PCW_FPGA_FCLK3_ENABLE {0} \
   CONFIG.PCW_I2C0_GRP_INT_ENABLE {0} \
   CONFIG.PCW_I2C0_I2C0_IO {MIO 50 .. 51} \
   CONFIG.PCW_I2C0_PERIPHERAL_ENABLE {1} \
   CONFIG.PCW_I2C0_RESET_ENABLE {0} \
   CONFIG.PCW_I2C1_GRP_INT_ENABLE {1} \
   CONFIG.PCW_I2C1_GRP_INT_IO {EMIO} \
   CONFIG.PCW_I2C1_I2C1_IO {EMIO} \
   CONFIG.PCW_I2C1_PERIPHERAL_ENABLE {1} \
   CONFIG.PCW_I2C1_RESET_ENABLE {0} \
   CONFIG.PCW_I2C_PERIPHERAL_FREQMHZ {66.666664} \
   CONFIG.PCW_IOPLL_CTRL_FBDIV {20} \
   CONFIG.PCW_IO_IO_PLL_FREQMHZ {1000.000} \
   CONFIG.PCW_MIO_10_DIRECTION {inout} \
   CONFIG.PCW_MIO_10_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_10_PULLUP {enabled} \
   CONFIG.PCW_MIO_10_SLEW {slow} \
   CONFIG.PCW_MIO_11_DIRECTION {inout} \
   CONFIG.PCW_MIO_11_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_11_PULLUP {enabled} \
   CONFIG.PCW_MIO_11_SLEW {slow} \
   CONFIG.PCW_MIO_12_DIRECTION {inout} \
   CONFIG.PCW_MIO_12_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_12_PULLUP {enabled} \
   CONFIG.PCW_MIO_12_SLEW {slow} \
   CONFIG.PCW_MIO_13_DIRECTION {inout} \
   CONFIG.PCW_MIO_13_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_13_PULLUP {enabled} \
   CONFIG.PCW_MIO_13_SLEW {slow} \
   CONFIG.PCW_MIO_14_DIRECTION {inout} \
   CONFIG.PCW_MIO_14_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_14_PULLUP {enabled} \
   CONFIG.PCW_MIO_14_SLEW {slow} \
   CONFIG.PCW_MIO_15_DIRECTION {inout} \
   CONFIG.PCW_MIO_15_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_15_PULLUP {enabled} \
   CONFIG.PCW_MIO_15_SLEW {slow} \
   CONFIG.PCW_MIO_16_DIRECTION {out} \
   CONFIG.PCW_MIO_16_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_16_PULLUP {enabled} \
   CONFIG.PCW_MIO_16_SLEW {slow} \
   CONFIG.PCW_MIO_17_DIRECTION {out} \
   CONFIG.PCW_MIO_17_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_17_PULLUP {enabled} \
   CONFIG.PCW_MIO_17_SLEW {slow} \
   CONFIG.PCW_MIO_18_DIRECTION {out} \
   CONFIG.PCW_MIO_18_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_18_PULLUP {enabled} \
   CONFIG.PCW_MIO_18_SLEW {slow} \
   CONFIG.PCW_MIO_19_DIRECTION {out} \
   CONFIG.PCW_MIO_19_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_19_PULLUP {enabled} \
   CONFIG.PCW_MIO_19_SLEW {slow} \
   CONFIG.PCW_MIO_1_DIRECTION {out} \
   CONFIG.PCW_MIO_1_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_1_PULLUP {enabled} \
   CONFIG.PCW_MIO_1_SLEW {slow} \
   CONFIG.PCW_MIO_20_DIRECTION {out} \
   CONFIG.PCW_MIO_20_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_20_PULLUP {enabled} \
   CONFIG.PCW_MIO_20_SLEW {slow} \
   CONFIG.PCW_MIO_21_DIRECTION {out} \
   CONFIG.PCW_MIO_21_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_21_PULLUP {enabled} \
   CONFIG.PCW_MIO_21_SLEW {slow} \
   CONFIG.PCW_MIO_22_DIRECTION {in} \
   CONFIG.PCW_MIO_22_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_22_PULLUP {enabled} \
   CONFIG.PCW_MIO_22_SLEW {slow} \
   CONFIG.PCW_MIO_23_DIRECTION {in} \
   CONFIG.PCW_MIO_23_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_23_PULLUP {enabled} \
   CONFIG.PCW_MIO_23_SLEW {slow} \
   CONFIG.PCW_MIO_24_DIRECTION {in} \
   CONFIG.PCW_MIO_24_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_24_PULLUP {enabled} \
   CONFIG.PCW_MIO_24_SLEW {slow} \
   CONFIG.PCW_MIO_25_DIRECTION {in} \
   CONFIG.PCW_MIO_25_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_25_PULLUP {enabled} \
   CONFIG.PCW_MIO_25_SLEW {slow} \
   CONFIG.PCW_MIO_26_DIRECTION {in} \
   CONFIG.PCW_MIO_26_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_26_PULLUP {enabled} \
   CONFIG.PCW_MIO_26_SLEW {slow} \
   CONFIG.PCW_MIO_27_DIRECTION {in} \
   CONFIG.PCW_MIO_27_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_27_PULLUP {enabled} \
   CONFIG.PCW_MIO_27_SLEW {slow} \
   CONFIG.PCW_MIO_2_DIRECTION {inout} \
   CONFIG.PCW_MIO_2_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_2_PULLUP {disabled} \
   CONFIG.PCW_MIO_2_SLEW {slow} \
   CONFIG.PCW_MIO_3_DIRECTION {inout} \
   CONFIG.PCW_MIO_3_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_3_PULLUP {disabled} \
   CONFIG.PCW_MIO_3_SLEW {slow} \
   CONFIG.PCW_MIO_46_DIRECTION {in} \
   CONFIG.PCW_MIO_46_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_46_PULLUP {enabled} \
   CONFIG.PCW_MIO_46_SLEW {slow} \
   CONFIG.PCW_MIO_47_DIRECTION {out} \
   CONFIG.PCW_MIO_47_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_47_PULLUP {enabled} \
   CONFIG.PCW_MIO_47_SLEW {slow} \
   CONFIG.PCW_MIO_4_DIRECTION {inout} \
   CONFIG.PCW_MIO_4_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_4_PULLUP {disabled} \
   CONFIG.PCW_MIO_4_SLEW {slow} \
   CONFIG.PCW_MIO_50_DIRECTION {inout} \
   CONFIG.PCW_MIO_50_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_50_PULLUP {enabled} \
   CONFIG.PCW_MIO_50_SLEW {slow} \
   CONFIG.PCW_MIO_51_DIRECTION {inout} \
   CONFIG.PCW_MIO_51_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_51_PULLUP {enabled} \
   CONFIG.PCW_MIO_51_SLEW {slow} \
   CONFIG.PCW_MIO_52_DIRECTION {out} \
   CONFIG.PCW_MIO_52_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_52_PULLUP {enabled} \
   CONFIG.PCW_MIO_52_SLEW {slow} \
   CONFIG.PCW_MIO_53_DIRECTION {inout} \
   CONFIG.PCW_MIO_53_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_53_PULLUP {enabled} \
   CONFIG.PCW_MIO_53_SLEW {slow} \
   CONFIG.PCW_MIO_5_DIRECTION {inout} \
   CONFIG.PCW_MIO_5_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_5_PULLUP {disabled} \
   CONFIG.PCW_MIO_5_SLEW {slow} \
   CONFIG.PCW_MIO_6_DIRECTION {out} \
   CONFIG.PCW_MIO_6_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_6_PULLUP {disabled} \
   CONFIG.PCW_MIO_6_SLEW {slow} \
   CONFIG.PCW_MIO_TREE_PERIPHERALS {unassigned#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#unassigned#unassigned#unassigned#SD 1#SD 1#SD 1#SD 1#SD 1#SD 1#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#UART 0#UART 0#unassigned#unassigned#I2C 0#I2C 0#Enet 0#Enet 0} \
   CONFIG.PCW_MIO_TREE_SIGNALS {unassigned#qspi0_ss_b#qspi0_io[0]#qspi0_io[1]#qspi0_io[2]#qspi0_io[3]/HOLD_B#qspi0_sclk#unassigned#unassigned#unassigned#data[0]#cmd#clk#data[1]#data[2]#data[3]#tx_clk#txd[0]#txd[1]#txd[2]#txd[3]#tx_ctl#rx_clk#rxd[0]#rxd[1]#rxd[2]#rxd[3]#rx_ctl#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#rx#tx#unassigned#unassigned#scl#sda#mdc#mdio} \
   CONFIG.PCW_NAND_GRP_D8_ENABLE {0} \
   CONFIG.PCW_NAND_PERIPHERAL_ENABLE {0} \
   CONFIG.PCW_NOR_GRP_A25_ENABLE {0} \
   CONFIG.PCW_NOR_GRP_CS0_ENABLE {0} \
   CONFIG.PCW_NOR_GRP_CS1_ENABLE {0} \
   CONFIG.PCW_NOR_GRP_SRAM_CS0_ENABLE {0} \
   CONFIG.PCW_NOR_GRP_SRAM_CS1_ENABLE {0} \
   CONFIG.PCW_NOR_GRP_SRAM_INT_ENABLE {0} \
   CONFIG.PCW_NOR_PERIPHERAL_ENABLE {0} \
   CONFIG.PCW_PCAP_PERIPHERAL_DIVISOR0 {5} \
   CONFIG.PCW_PRESET_BANK1_VOLTAGE {LVCMOS 1.8V} \
   CONFIG.PCW_QSPI_GRP_FBCLK_ENABLE {0} \
   CONFIG.PCW_QSPI_GRP_IO1_ENABLE {0} \
   CONFIG.PCW_QSPI_GRP_SINGLE_SS_ENABLE {1} \
   CONFIG.PCW_QSPI_GRP_SINGLE_SS_IO {MIO 1 .. 6} \
   CONFIG.PCW_QSPI_GRP_SS1_ENABLE {0} \
   CONFIG.PCW_QSPI_PERIPHERAL_DIVISOR0 {5} \
   CONFIG.PCW_QSPI_PERIPHERAL_ENABLE {1} \
   CONFIG.PCW_QSPI_PERIPHERAL_FREQMHZ {200} \
   CONFIG.PCW_QSPI_QSPI_IO {MIO 1 .. 6} \
   CONFIG.PCW_SD1_GRP_CD_ENABLE {0} \
   CONFIG.PCW_SD1_GRP_POW_ENABLE {0} \
   CONFIG.PCW_SD1_GRP_WP_ENABLE {0} \
   CONFIG.PCW_SD1_PERIPHERAL_ENABLE {1} \
   CONFIG.PCW_SD1_SD1_IO {MIO 10 .. 15} \
   CONFIG.PCW_SDIO_PERIPHERAL_DIVISOR0 {10} \
   CONFIG.PCW_SDIO_PERIPHERAL_FREQMHZ {100} \
   CONFIG.PCW_SDIO_PERIPHERAL_VALID {1} \
   CONFIG.PCW_SINGLE_QSPI_DATA_MODE {x4} \
   CONFIG.PCW_SMC_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_SPI_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_TPIU_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_UART0_GRP_FULL_ENABLE {0} \
   CONFIG.PCW_UART0_PERIPHERAL_ENABLE {1} \
   CONFIG.PCW_UART0_UART0_IO {MIO 46 .. 47} \
   CONFIG.PCW_UART1_GRP_FULL_ENABLE {0} \
   CONFIG.PCW_UART1_PERIPHERAL_ENABLE {1} \
   CONFIG.PCW_UART1_UART1_IO {EMIO} \
   CONFIG.PCW_UART_PERIPHERAL_DIVISOR0 {10} \
   CONFIG.PCW_UART_PERIPHERAL_FREQMHZ {100} \
   CONFIG.PCW_UART_PERIPHERAL_VALID {1} \
   CONFIG.PCW_UIPARAM_ACT_DDR_FREQ_MHZ {400.000000} \
   CONFIG.PCW_UIPARAM_DDR_BANK_ADDR_COUNT {3} \
   CONFIG.PCW_UIPARAM_DDR_BL {8} \
   CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY0 {0.063} \
   CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY1 {0.062} \
   CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY2 {0.065} \
   CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY3 {0.083} \
   CONFIG.PCW_UIPARAM_DDR_BUS_WIDTH {16 Bit} \
   CONFIG.PCW_UIPARAM_DDR_CL {7} \
   CONFIG.PCW_UIPARAM_DDR_COL_ADDR_COUNT {10} \
   CONFIG.PCW_UIPARAM_DDR_CWL {6} \
   CONFIG.PCW_UIPARAM_DDR_DEVICE_CAPACITY {4096 MBits} \
   CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_0 {-0.007} \
   CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_1 {-0.010} \
   CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_2 {-0.006} \
   CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_3 {-0.048} \
   CONFIG.PCW_UIPARAM_DDR_DRAM_WIDTH {16 Bits} \
   CONFIG.PCW_UIPARAM_DDR_ECC {Disabled} \
   CONFIG.PCW_UIPARAM_DDR_FREQ_MHZ {400} \
   CONFIG.PCW_UIPARAM_DDR_MEMORY_TYPE {DDR 3 (Low Voltage)} \
   CONFIG.PCW_UIPARAM_DDR_PARTNO {MT41K256M16 RE-125} \
   CONFIG.PCW_UIPARAM_DDR_ROW_ADDR_COUNT {15} \
   CONFIG.PCW_UIPARAM_DDR_SPEED_BIN {DDR3_1066F} \
   CONFIG.PCW_UIPARAM_DDR_T_FAW {40.0} \
   CONFIG.PCW_UIPARAM_DDR_T_RAS_MIN {35.0} \
   CONFIG.PCW_UIPARAM_DDR_T_RC {48.75} \
   CONFIG.PCW_UIPARAM_DDR_T_RCD {7} \
   CONFIG.PCW_UIPARAM_DDR_T_RP {7} \
   CONFIG.PCW_USE_FABRIC_INTERRUPT {0} \
   CONFIG.PCW_USE_S_AXI_GP0 {0} \
   CONFIG.PCW_USE_S_AXI_GP1 {0} \
   CONFIG.PCW_USE_S_AXI_HP0 {0} \
 ] $processing_system7_0

  # Create instance: ps7_0_axi_periph, and set properties
  set ps7_0_axi_periph [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 ps7_0_axi_periph ]
  set_property -dict [ list \
   CONFIG.NUM_MI {2} \
 ] $ps7_0_axi_periph

  # Create instance: rst_ps7_0_200M, and set properties
  set rst_ps7_0_200M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_ps7_0_200M ]

  # Create interface connections
  connect_bd_intf_net -intf_net AXI_STR_RXD_0_1 [get_bd_intf_ports AXI_STR_RXD_0] [get_bd_intf_pins axi_fifo_mm_s_0/AXI_STR_RXD]
  connect_bd_intf_net -intf_net processing_system7_0_DDR [get_bd_intf_ports DDR] [get_bd_intf_pins processing_system7_0/DDR]
  connect_bd_intf_net -intf_net processing_system7_0_FIXED_IO [get_bd_intf_ports FIXED_IO] [get_bd_intf_pins processing_system7_0/FIXED_IO]
  connect_bd_intf_net -intf_net processing_system7_0_M_AXI_GP0 [get_bd_intf_pins processing_system7_0/M_AXI_GP0] [get_bd_intf_pins ps7_0_axi_periph/S00_AXI]
  connect_bd_intf_net -intf_net ps7_0_axi_periph_M00_AXI [get_bd_intf_pins axi_fifo_mm_s_0/S_AXI] [get_bd_intf_pins ps7_0_axi_periph/M00_AXI]
  connect_bd_intf_net -intf_net ps7_0_axi_periph_M01_AXI [get_bd_intf_pins RunControl_AXI_0/S_AXI] [get_bd_intf_pins ps7_0_axi_periph/M01_AXI]

  # Create port connections
  connect_bd_net -net CLK_failed_0_1 [get_bd_ports CLK_failed_0] [get_bd_pins RunControl_AXI_0/CLK_failed]
  connect_bd_net -net FREQ_EVENTI_0_0_1 [get_bd_ports FREQ_EVENTI_0_0] [get_bd_pins RunControl_AXI_0/FREQ_EVENTI_0]
  connect_bd_net -net FREQ_EVENTI_10_0_1 [get_bd_ports FREQ_EVENTI_10_0] [get_bd_pins RunControl_AXI_0/FREQ_EVENTI_10]
  connect_bd_net -net FREQ_EVENTI_11_0_1 [get_bd_ports FREQ_EVENTI_11_0] [get_bd_pins RunControl_AXI_0/FREQ_EVENTI_11]
  connect_bd_net -net FREQ_EVENTI_12_0_1 [get_bd_ports FREQ_EVENTI_12_0] [get_bd_pins RunControl_AXI_0/FREQ_EVENTI_12]
  connect_bd_net -net FREQ_EVENTI_13_0_1 [get_bd_ports FREQ_EVENTI_13_0] [get_bd_pins RunControl_AXI_0/FREQ_EVENTI_13]
  connect_bd_net -net FREQ_EVENTI_14_0_1 [get_bd_ports FREQ_EVENTI_14_0] [get_bd_pins RunControl_AXI_0/FREQ_EVENTI_14]
  connect_bd_net -net FREQ_EVENTI_15_0_1 [get_bd_ports FREQ_EVENTI_15_0] [get_bd_pins RunControl_AXI_0/FREQ_EVENTI_15]
  connect_bd_net -net FREQ_EVENTI_16_0_1 [get_bd_ports FREQ_EVENTI_16_0] [get_bd_pins RunControl_AXI_0/FREQ_EVENTI_16]
  connect_bd_net -net FREQ_EVENTI_17_0_1 [get_bd_ports FREQ_EVENTI_17_0] [get_bd_pins RunControl_AXI_0/FREQ_EVENTI_17]
  connect_bd_net -net FREQ_EVENTI_18_0_1 [get_bd_ports FREQ_EVENTI_18_0] [get_bd_pins RunControl_AXI_0/FREQ_EVENTI_18]
  connect_bd_net -net FREQ_EVENTI_1_0_1 [get_bd_ports FREQ_EVENTI_1_0] [get_bd_pins RunControl_AXI_0/FREQ_EVENTI_1]
  connect_bd_net -net FREQ_EVENTI_2_0_1 [get_bd_ports FREQ_EVENTI_2_0] [get_bd_pins RunControl_AXI_0/FREQ_EVENTI_2]
  connect_bd_net -net FREQ_EVENTI_3_0_1 [get_bd_ports FREQ_EVENTI_3_0] [get_bd_pins RunControl_AXI_0/FREQ_EVENTI_3]
  connect_bd_net -net FREQ_EVENTI_4_0_1 [get_bd_ports FREQ_EVENTI_4_0] [get_bd_pins RunControl_AXI_0/FREQ_EVENTI_4]
  connect_bd_net -net FREQ_EVENTI_5_0_1 [get_bd_ports FREQ_EVENTI_5_0] [get_bd_pins RunControl_AXI_0/FREQ_EVENTI_5]
  connect_bd_net -net FREQ_EVENTI_6_0_1 [get_bd_ports FREQ_EVENTI_6_0] [get_bd_pins RunControl_AXI_0/FREQ_EVENTI_6]
  connect_bd_net -net FREQ_EVENTI_7_0_1 [get_bd_ports FREQ_EVENTI_7_0] [get_bd_pins RunControl_AXI_0/FREQ_EVENTI_7]
  connect_bd_net -net FREQ_EVENTI_8_0_1 [get_bd_ports FREQ_EVENTI_8_0] [get_bd_pins RunControl_AXI_0/FREQ_EVENTI_8]
  connect_bd_net -net FREQ_EVENTI_9_0_1 [get_bd_ports FREQ_EVENTI_9_0] [get_bd_pins RunControl_AXI_0/FREQ_EVENTI_9]
  connect_bd_net -net Fifo_HF_0_1 [get_bd_ports Fifo_HF_0] [get_bd_pins RunControl_AXI_0/Fifo_HF]
  connect_bd_net -net I2C_SCL_I_1 [get_bd_ports I2C_SCL_I] [get_bd_pins processing_system7_0/I2C1_SCL_I]
  connect_bd_net -net I2C_SDA_I_1 [get_bd_ports I2C_SDA_I] [get_bd_pins processing_system7_0/I2C1_SDA_I]
  connect_bd_net -net OVC_CH_0_1 [get_bd_ports OVC_CH_0] [get_bd_pins RunControl_AXI_0/OVC_CH]
  connect_bd_net -net PPS_contati_0_1 [get_bd_ports PPS_contati_0] [get_bd_pins RunControl_AXI_0/PPS_contati]
  connect_bd_net -net PSDONE_0_1 [get_bd_ports PSDONE_0] [get_bd_pins RunControl_AXI_0/PSDONE]
  connect_bd_net -net RC_Tag_OK_0_1 [get_bd_ports RC_Tag_OK_0] [get_bd_pins RunControl_AXI_0/RC_Tag_OK]
  connect_bd_net -net RESET_IN_0_1 [get_bd_ports RESET_IN_0] [get_bd_pins RunControl_AXI_0/RESET_IN]
  connect_bd_net -net RunC_CLK_OK_0_1 [get_bd_ports RunC_CLK_OK_0] [get_bd_pins RunControl_AXI_0/RunC_CLK_OK]
  connect_bd_net -net RunControl_AXI_0_CALIBRAZIONE [get_bd_ports CALIBRAZIONE_0] [get_bd_pins RunControl_AXI_0/CALIBRAZIONE]
  connect_bd_net -net RunControl_AXI_0_CLK_SEL_out [get_bd_ports CLK_SEL_out_0] [get_bd_pins RunControl_AXI_0/CLK_SEL_out]
  connect_bd_net -net RunControl_AXI_0_CS_ENABLE [get_bd_ports CS_ENABLE_0] [get_bd_pins RunControl_AXI_0/CS_ENABLE]
  connect_bd_net -net RunControl_AXI_0_ENERGY_MAX [get_bd_ports ENERGY_MAX_0] [get_bd_pins RunControl_AXI_0/ENERGY_MAX]
  connect_bd_net -net RunControl_AXI_0_PWR_EN [get_bd_ports PWR_EN_0] [get_bd_pins RunControl_AXI_0/PWR_EN]
  connect_bd_net -net RunControl_AXI_0_RC_EvSecEn [get_bd_ports RC_EvSecEn_0] [get_bd_pins RunControl_AXI_0/RC_EvSecEn]
  connect_bd_net -net RunControl_AXI_0_RC_Puls_1ms [get_bd_ports RC_Puls_1ms_0] [get_bd_pins RunControl_AXI_0/RC_Puls_1ms]
  connect_bd_net -net RunControl_AXI_0_RITARDO [get_bd_ports RITARDO_0] [get_bd_pins RunControl_AXI_0/RITARDO]
  connect_bd_net -net RunControl_AXI_0_Rc_CLK_est_int [get_bd_ports Rc_CLK_est_int_0] [get_bd_pins RunControl_AXI_0/Rc_CLK_est_int]
  connect_bd_net -net RunControl_AXI_0_Res_TagFlg [get_bd_ports Res_TagFlg_0] [get_bd_pins RunControl_AXI_0/Res_TagFlg]
  connect_bd_net -net RunControl_AXI_0_Runc_CLK_ResFlg [get_bd_ports Runc_CLK_ResFlg_0] [get_bd_pins RunControl_AXI_0/Runc_CLK_ResFlg]
  connect_bd_net -net RunControl_AXI_0_Runc_Val_Tag0 [get_bd_ports Runc_Val_Tag0_0] [get_bd_pins RunControl_AXI_0/Runc_Val_Tag0]
  connect_bd_net -net Runc_CLK_Found_0_1 [get_bd_ports Runc_CLK_Found_0] [get_bd_pins RunControl_AXI_0/Runc_CLK_Found]
  connect_bd_net -net Runc_CLK_Lost_0_1 [get_bd_ports Runc_CLK_Lost_0] [get_bd_pins RunControl_AXI_0/Runc_CLK_Lost]
  connect_bd_net -net UART1_RX_1 [get_bd_ports UART1_RX] [get_bd_pins processing_system7_0/UART1_RX]
  connect_bd_net -net locked_0_1 [get_bd_ports locked_0] [get_bd_pins RunControl_AXI_0/locked]
  connect_bd_net -net processing_system7_0_FCLK_CLK0 [get_bd_ports FCLK_200] [get_bd_pins RunControl_AXI_0/S_AXI_ACLK] [get_bd_pins axi_fifo_mm_s_0/s_axi_aclk] [get_bd_pins processing_system7_0/FCLK_CLK0] [get_bd_pins processing_system7_0/M_AXI_GP0_ACLK] [get_bd_pins ps7_0_axi_periph/ACLK] [get_bd_pins ps7_0_axi_periph/M00_ACLK] [get_bd_pins ps7_0_axi_periph/M01_ACLK] [get_bd_pins ps7_0_axi_periph/S00_ACLK] [get_bd_pins rst_ps7_0_200M/slowest_sync_clk]
  connect_bd_net -net processing_system7_0_FCLK_RESET0_N [get_bd_pins processing_system7_0/FCLK_RESET0_N] [get_bd_pins rst_ps7_0_200M/ext_reset_in]
  connect_bd_net -net processing_system7_0_I2C1_SCL_O [get_bd_ports I2C_SCL_O] [get_bd_pins processing_system7_0/I2C1_SCL_O]
  connect_bd_net -net processing_system7_0_I2C1_SCL_T [get_bd_ports I2C_SCL_T] [get_bd_pins processing_system7_0/I2C1_SCL_T]
  connect_bd_net -net processing_system7_0_I2C1_SDA_O [get_bd_ports I2C_SDA_O] [get_bd_pins processing_system7_0/I2C1_SDA_O]
  connect_bd_net -net processing_system7_0_I2C1_SDA_T [get_bd_ports I2C_SDA_T] [get_bd_pins processing_system7_0/I2C1_SDA_T]
  connect_bd_net -net processing_system7_0_UART1_TX [get_bd_ports UART1_TX] [get_bd_pins processing_system7_0/UART1_TX]
  connect_bd_net -net rst_ps7_0_200M_peripheral_aresetn [get_bd_pins RunControl_AXI_0/S_AXI_ARESETN] [get_bd_pins axi_fifo_mm_s_0/s_axi_aresetn] [get_bd_pins ps7_0_axi_periph/ARESETN] [get_bd_pins ps7_0_axi_periph/M00_ARESETN] [get_bd_pins ps7_0_axi_periph/M01_ARESETN] [get_bd_pins ps7_0_axi_periph/S00_ARESETN] [get_bd_pins rst_ps7_0_200M/peripheral_aresetn]

  # Create address segments
  assign_bd_address -offset 0x43D00000 -range 0x00010000 -target_address_space [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs RunControl_AXI_0/S_AXI/reg0] -force
  assign_bd_address -offset 0x43C00000 -range 0x00100000 -target_address_space [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs axi_fifo_mm_s_0/S_AXI/Mem0] -force


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


