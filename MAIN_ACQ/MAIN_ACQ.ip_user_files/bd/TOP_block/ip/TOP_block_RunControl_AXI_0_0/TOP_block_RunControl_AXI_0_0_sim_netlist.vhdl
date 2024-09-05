-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
-- Date        : Mon Jun 21 16:30:06 2021
-- Host        : PC-SER-DELL-1 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim {C:/Users/SER/Desktop/T2K/mPMT/MAIN_ACQ_ZYNQ
--               _v1/MAIN_ACQ/MAIN_ACQ.srcs/sources_1/bd/TOP_block/ip/TOP_block_RunControl_AXI_0_0/TOP_block_RunControl_AXI_0_0_sim_netlist.vhdl}
-- Design      : TOP_block_RunControl_AXI_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z014sclg484-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity TOP_block_RunControl_AXI_0_0_RunControl_AXI is
  port (
    Clock_register_out : out STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_AWREADY : out STD_LOGIC;
    S_AXI_WREADY : out STD_LOGIC;
    CS_ENABLE : out STD_LOGIC_VECTOR ( 18 downto 0 );
    PWR_EN : out STD_LOGIC_VECTOR ( 18 downto 0 );
    S_AXI_ARREADY : out STD_LOGIC;
    S_AXI_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_RVALID : out STD_LOGIC;
    S_AXI_BVALID : out STD_LOGIC;
    S_AXI_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_ACLK : in STD_LOGIC;
    S_AXI_AWADDR : in STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_ARADDR : in STD_LOGIC_VECTOR ( 5 downto 0 );
    S_AXI_WVALID : in STD_LOGIC;
    S_AXI_AWVALID : in STD_LOGIC;
    S_AXI_ARESETN : in STD_LOGIC;
    S_AXI_ARVALID : in STD_LOGIC;
    Clock_register : in STD_LOGIC_VECTOR ( 10 downto 0 );
    OVC_CH : in STD_LOGIC_VECTOR ( 18 downto 0 );
    S_AXI_BREADY : in STD_LOGIC;
    S_AXI_RREADY : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of TOP_block_RunControl_AXI_0_0_RunControl_AXI : entity is "RunControl_AXI";
end TOP_block_RunControl_AXI_0_0_RunControl_AXI;

architecture STRUCTURE of TOP_block_RunControl_AXI_0_0_RunControl_AXI is
  signal \^cs_enable\ : STD_LOGIC_VECTOR ( 18 downto 0 );
  signal \^clock_register_out\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \^pwr_en\ : STD_LOGIC_VECTOR ( 18 downto 0 );
  signal \^s_axi_arready\ : STD_LOGIC;
  signal \^s_axi_awready\ : STD_LOGIC;
  signal \^s_axi_bvalid\ : STD_LOGIC;
  signal \^s_axi_rvalid\ : STD_LOGIC;
  signal \^s_axi_wready\ : STD_LOGIC;
  signal aw_en_i_1_n_0 : STD_LOGIC;
  signal aw_en_reg_n_0 : STD_LOGIC;
  signal \axi_araddr_reg_n_0_[7]\ : STD_LOGIC;
  signal axi_arready0 : STD_LOGIC;
  signal axi_awaddr : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal axi_awready0 : STD_LOGIC;
  signal axi_bvalid_i_1_n_0 : STD_LOGIC;
  signal \axi_rdata[0]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[0]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[0]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[0]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[0]_i_8_n_0\ : STD_LOGIC;
  signal \axi_rdata[10]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[10]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[10]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[10]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[10]_i_8_n_0\ : STD_LOGIC;
  signal \axi_rdata[11]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[11]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[11]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[11]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[11]_i_8_n_0\ : STD_LOGIC;
  signal \axi_rdata[12]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[12]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[12]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[12]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[12]_i_8_n_0\ : STD_LOGIC;
  signal \axi_rdata[13]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[13]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[13]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[13]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[13]_i_8_n_0\ : STD_LOGIC;
  signal \axi_rdata[14]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[14]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[14]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[14]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[14]_i_8_n_0\ : STD_LOGIC;
  signal \axi_rdata[15]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[15]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[15]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[15]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[15]_i_8_n_0\ : STD_LOGIC;
  signal \axi_rdata[16]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[16]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[16]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[16]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[16]_i_8_n_0\ : STD_LOGIC;
  signal \axi_rdata[17]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[17]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[17]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[17]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[17]_i_8_n_0\ : STD_LOGIC;
  signal \axi_rdata[18]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[18]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[18]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[18]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[18]_i_8_n_0\ : STD_LOGIC;
  signal \axi_rdata[19]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[19]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[19]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[19]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[19]_i_8_n_0\ : STD_LOGIC;
  signal \axi_rdata[1]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[1]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[1]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[1]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[1]_i_8_n_0\ : STD_LOGIC;
  signal \axi_rdata[20]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[20]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[20]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[20]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[20]_i_8_n_0\ : STD_LOGIC;
  signal \axi_rdata[21]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[21]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[21]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[21]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[21]_i_8_n_0\ : STD_LOGIC;
  signal \axi_rdata[22]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[22]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[22]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[22]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[22]_i_8_n_0\ : STD_LOGIC;
  signal \axi_rdata[23]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[23]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[23]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[23]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[23]_i_8_n_0\ : STD_LOGIC;
  signal \axi_rdata[24]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[24]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[24]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[24]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[24]_i_8_n_0\ : STD_LOGIC;
  signal \axi_rdata[25]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[25]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[25]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[25]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[25]_i_8_n_0\ : STD_LOGIC;
  signal \axi_rdata[26]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[26]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[26]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[26]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[26]_i_8_n_0\ : STD_LOGIC;
  signal \axi_rdata[27]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[27]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[27]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[27]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[27]_i_8_n_0\ : STD_LOGIC;
  signal \axi_rdata[28]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[28]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[28]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[28]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[28]_i_8_n_0\ : STD_LOGIC;
  signal \axi_rdata[29]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[29]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[29]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[29]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[29]_i_8_n_0\ : STD_LOGIC;
  signal \axi_rdata[2]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[2]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[2]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[2]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[2]_i_8_n_0\ : STD_LOGIC;
  signal \axi_rdata[30]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[30]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[30]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[30]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[30]_i_8_n_0\ : STD_LOGIC;
  signal \axi_rdata[31]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[31]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[31]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[31]_i_8_n_0\ : STD_LOGIC;
  signal \axi_rdata[31]_i_9_n_0\ : STD_LOGIC;
  signal \axi_rdata[3]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[3]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[3]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[3]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[3]_i_8_n_0\ : STD_LOGIC;
  signal \axi_rdata[4]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[4]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[4]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[4]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[4]_i_8_n_0\ : STD_LOGIC;
  signal \axi_rdata[5]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[5]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[5]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[5]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[5]_i_8_n_0\ : STD_LOGIC;
  signal \axi_rdata[6]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[6]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[6]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[6]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[6]_i_8_n_0\ : STD_LOGIC;
  signal \axi_rdata[7]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[7]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[7]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[7]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[7]_i_8_n_0\ : STD_LOGIC;
  signal \axi_rdata[8]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[8]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[8]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[8]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[8]_i_8_n_0\ : STD_LOGIC;
  signal \axi_rdata[9]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata[9]_i_5_n_0\ : STD_LOGIC;
  signal \axi_rdata[9]_i_6_n_0\ : STD_LOGIC;
  signal \axi_rdata[9]_i_7_n_0\ : STD_LOGIC;
  signal \axi_rdata[9]_i_8_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[0]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[10]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[10]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[11]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[11]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[12]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[12]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[13]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[13]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[14]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[14]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[15]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[15]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[16]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[16]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[17]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[17]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[18]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[18]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[19]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[19]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[1]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[1]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[20]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[20]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[21]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[21]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[22]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[22]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[23]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[23]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[24]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[24]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[25]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[25]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[26]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[26]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[27]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[27]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[28]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[28]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[29]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[29]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[2]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[2]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[30]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[30]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[31]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[31]_i_4_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[3]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[3]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[4]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[4]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[5]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[5]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[6]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[6]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[7]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[7]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[8]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[8]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[9]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata_reg[9]_i_3_n_0\ : STD_LOGIC;
  signal axi_rvalid_i_1_n_0 : STD_LOGIC;
  signal axi_wready0 : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal p_1_in : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal sel0 : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal slv_reg0 : STD_LOGIC_VECTOR ( 31 downto 19 );
  signal \slv_reg0[18]_i_3_n_0\ : STD_LOGIC;
  signal slv_reg0_14 : STD_LOGIC;
  signal slv_reg1 : STD_LOGIC_VECTOR ( 31 downto 19 );
  signal slv_reg10 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slv_reg10_10 : STD_LOGIC;
  signal slv_reg11 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slv_reg11_3 : STD_LOGIC;
  signal slv_reg12 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slv_reg12_9 : STD_LOGIC;
  signal slv_reg13 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slv_reg13_2 : STD_LOGIC;
  signal slv_reg14 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slv_reg14_8 : STD_LOGIC;
  signal slv_reg15 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slv_reg15_1 : STD_LOGIC;
  signal slv_reg16 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \slv_reg16[31]_i_2_n_0\ : STD_LOGIC;
  signal slv_reg16_0 : STD_LOGIC;
  signal slv_reg1_7 : STD_LOGIC;
  signal \slv_reg3[10]_i_1_n_0\ : STD_LOGIC;
  signal slv_reg4 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slv_reg4_13 : STD_LOGIC;
  signal slv_reg5 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slv_reg5_6 : STD_LOGIC;
  signal slv_reg6 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slv_reg6_12 : STD_LOGIC;
  signal slv_reg7 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slv_reg7_5 : STD_LOGIC;
  signal slv_reg8 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slv_reg8_11 : STD_LOGIC;
  signal slv_reg9 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slv_reg9_4 : STD_LOGIC;
  signal slv_reg_rden : STD_LOGIC;
begin
  CS_ENABLE(18 downto 0) <= \^cs_enable\(18 downto 0);
  Clock_register_out(3 downto 0) <= \^clock_register_out\(3 downto 0);
  PWR_EN(18 downto 0) <= \^pwr_en\(18 downto 0);
  S_AXI_ARREADY <= \^s_axi_arready\;
  S_AXI_AWREADY <= \^s_axi_awready\;
  S_AXI_BVALID <= \^s_axi_bvalid\;
  S_AXI_RVALID <= \^s_axi_rvalid\;
  S_AXI_WREADY <= \^s_axi_wready\;
aw_en_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0FFFFFF88888888"
    )
        port map (
      I0 => \^s_axi_bvalid\,
      I1 => S_AXI_BREADY,
      I2 => \^s_axi_awready\,
      I3 => S_AXI_WVALID,
      I4 => S_AXI_AWVALID,
      I5 => aw_en_reg_n_0,
      O => aw_en_i_1_n_0
    );
aw_en_reg: unisim.vcomponents.FDSE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => aw_en_i_1_n_0,
      Q => aw_en_reg_n_0,
      S => p_0_in
    );
\axi_araddr_reg[2]\: unisim.vcomponents.FDSE
     port map (
      C => S_AXI_ACLK,
      CE => axi_arready0,
      D => S_AXI_ARADDR(0),
      Q => sel0(0),
      S => p_0_in
    );
\axi_araddr_reg[3]\: unisim.vcomponents.FDSE
     port map (
      C => S_AXI_ACLK,
      CE => axi_arready0,
      D => S_AXI_ARADDR(1),
      Q => sel0(1),
      S => p_0_in
    );
\axi_araddr_reg[4]\: unisim.vcomponents.FDSE
     port map (
      C => S_AXI_ACLK,
      CE => axi_arready0,
      D => S_AXI_ARADDR(2),
      Q => sel0(2),
      S => p_0_in
    );
\axi_araddr_reg[5]\: unisim.vcomponents.FDSE
     port map (
      C => S_AXI_ACLK,
      CE => axi_arready0,
      D => S_AXI_ARADDR(3),
      Q => sel0(3),
      S => p_0_in
    );
\axi_araddr_reg[6]\: unisim.vcomponents.FDSE
     port map (
      C => S_AXI_ACLK,
      CE => axi_arready0,
      D => S_AXI_ARADDR(4),
      Q => sel0(4),
      S => p_0_in
    );
\axi_araddr_reg[7]\: unisim.vcomponents.FDSE
     port map (
      C => S_AXI_ACLK,
      CE => axi_arready0,
      D => S_AXI_ARADDR(5),
      Q => \axi_araddr_reg_n_0_[7]\,
      S => p_0_in
    );
axi_arready_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => S_AXI_ARVALID,
      I1 => \^s_axi_arready\,
      O => axi_arready0
    );
axi_arready_reg: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => axi_arready0,
      Q => \^s_axi_arready\,
      R => p_0_in
    );
\axi_awaddr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => axi_awready0,
      D => S_AXI_AWADDR(0),
      Q => axi_awaddr(2),
      R => p_0_in
    );
\axi_awaddr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => axi_awready0,
      D => S_AXI_AWADDR(1),
      Q => axi_awaddr(3),
      R => p_0_in
    );
\axi_awaddr_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => axi_awready0,
      D => S_AXI_AWADDR(2),
      Q => axi_awaddr(4),
      R => p_0_in
    );
\axi_awaddr_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => axi_awready0,
      D => S_AXI_AWADDR(3),
      Q => axi_awaddr(5),
      R => p_0_in
    );
\axi_awaddr_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => axi_awready0,
      D => S_AXI_AWADDR(4),
      Q => axi_awaddr(6),
      R => p_0_in
    );
\axi_awaddr_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => axi_awready0,
      D => S_AXI_AWADDR(5),
      Q => axi_awaddr(7),
      R => p_0_in
    );
axi_awready_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => \^s_axi_awready\,
      I1 => S_AXI_WVALID,
      I2 => S_AXI_AWVALID,
      I3 => aw_en_reg_n_0,
      O => axi_awready0
    );
axi_awready_reg: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => axi_awready0,
      Q => \^s_axi_awready\,
      R => p_0_in
    );
axi_bvalid_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7444444444444444"
    )
        port map (
      I0 => S_AXI_BREADY,
      I1 => \^s_axi_bvalid\,
      I2 => \^s_axi_wready\,
      I3 => \^s_axi_awready\,
      I4 => S_AXI_WVALID,
      I5 => S_AXI_AWVALID,
      O => axi_bvalid_i_1_n_0
    );
axi_bvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => axi_bvalid_i_1_n_0,
      Q => \^s_axi_bvalid\,
      R => p_0_in
    );
\axi_rdata[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFE200E2"
    )
        port map (
      I0 => \axi_rdata_reg[0]_i_2_n_0\,
      I1 => sel0(3),
      I2 => \axi_rdata_reg[0]_i_3_n_0\,
      I3 => sel0(4),
      I4 => \axi_rdata[0]_i_4_n_0\,
      I5 => \axi_araddr_reg_n_0_[7]\,
      O => p_1_in(0)
    );
\axi_rdata[0]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000010"
    )
        port map (
      I0 => sel0(1),
      I1 => sel0(2),
      I2 => slv_reg16(0),
      I3 => sel0(0),
      I4 => sel0(3),
      O => \axi_rdata[0]_i_4_n_0\
    );
\axi_rdata[0]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => Clock_register(0),
      I1 => OVC_CH(0),
      I2 => sel0(1),
      I3 => \^pwr_en\(0),
      I4 => sel0(0),
      I5 => \^cs_enable\(0),
      O => \axi_rdata[0]_i_5_n_0\
    );
\axi_rdata[0]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg7(0),
      I1 => slv_reg6(0),
      I2 => sel0(1),
      I3 => slv_reg5(0),
      I4 => sel0(0),
      I5 => slv_reg4(0),
      O => \axi_rdata[0]_i_6_n_0\
    );
\axi_rdata[0]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg11(0),
      I1 => slv_reg10(0),
      I2 => sel0(1),
      I3 => slv_reg9(0),
      I4 => sel0(0),
      I5 => slv_reg8(0),
      O => \axi_rdata[0]_i_7_n_0\
    );
\axi_rdata[0]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(0),
      I1 => slv_reg14(0),
      I2 => sel0(1),
      I3 => slv_reg13(0),
      I4 => sel0(0),
      I5 => slv_reg12(0),
      O => \axi_rdata[0]_i_8_n_0\
    );
\axi_rdata[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFE200E2"
    )
        port map (
      I0 => \axi_rdata_reg[10]_i_2_n_0\,
      I1 => sel0(3),
      I2 => \axi_rdata_reg[10]_i_3_n_0\,
      I3 => sel0(4),
      I4 => \axi_rdata[10]_i_4_n_0\,
      I5 => \axi_araddr_reg_n_0_[7]\,
      O => p_1_in(10)
    );
\axi_rdata[10]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000010"
    )
        port map (
      I0 => sel0(1),
      I1 => sel0(2),
      I2 => slv_reg16(10),
      I3 => sel0(0),
      I4 => sel0(3),
      O => \axi_rdata[10]_i_4_n_0\
    );
\axi_rdata[10]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^clock_register_out\(3),
      I1 => OVC_CH(10),
      I2 => sel0(1),
      I3 => \^pwr_en\(10),
      I4 => sel0(0),
      I5 => \^cs_enable\(10),
      O => \axi_rdata[10]_i_5_n_0\
    );
\axi_rdata[10]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg7(10),
      I1 => slv_reg6(10),
      I2 => sel0(1),
      I3 => slv_reg5(10),
      I4 => sel0(0),
      I5 => slv_reg4(10),
      O => \axi_rdata[10]_i_6_n_0\
    );
\axi_rdata[10]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg11(10),
      I1 => slv_reg10(10),
      I2 => sel0(1),
      I3 => slv_reg9(10),
      I4 => sel0(0),
      I5 => slv_reg8(10),
      O => \axi_rdata[10]_i_7_n_0\
    );
\axi_rdata[10]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(10),
      I1 => slv_reg14(10),
      I2 => sel0(1),
      I3 => slv_reg13(10),
      I4 => sel0(0),
      I5 => slv_reg12(10),
      O => \axi_rdata[10]_i_8_n_0\
    );
\axi_rdata[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFE200E2"
    )
        port map (
      I0 => \axi_rdata_reg[11]_i_2_n_0\,
      I1 => sel0(3),
      I2 => \axi_rdata_reg[11]_i_3_n_0\,
      I3 => sel0(4),
      I4 => \axi_rdata[11]_i_4_n_0\,
      I5 => \axi_araddr_reg_n_0_[7]\,
      O => p_1_in(11)
    );
\axi_rdata[11]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000010"
    )
        port map (
      I0 => sel0(1),
      I1 => sel0(2),
      I2 => slv_reg16(11),
      I3 => sel0(0),
      I4 => sel0(3),
      O => \axi_rdata[11]_i_4_n_0\
    );
\axi_rdata[11]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => Clock_register(7),
      I1 => OVC_CH(11),
      I2 => sel0(1),
      I3 => \^pwr_en\(11),
      I4 => sel0(0),
      I5 => \^cs_enable\(11),
      O => \axi_rdata[11]_i_5_n_0\
    );
\axi_rdata[11]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg7(11),
      I1 => slv_reg6(11),
      I2 => sel0(1),
      I3 => slv_reg5(11),
      I4 => sel0(0),
      I5 => slv_reg4(11),
      O => \axi_rdata[11]_i_6_n_0\
    );
\axi_rdata[11]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg11(11),
      I1 => slv_reg10(11),
      I2 => sel0(1),
      I3 => slv_reg9(11),
      I4 => sel0(0),
      I5 => slv_reg8(11),
      O => \axi_rdata[11]_i_7_n_0\
    );
\axi_rdata[11]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(11),
      I1 => slv_reg14(11),
      I2 => sel0(1),
      I3 => slv_reg13(11),
      I4 => sel0(0),
      I5 => slv_reg12(11),
      O => \axi_rdata[11]_i_8_n_0\
    );
\axi_rdata[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFE200E2"
    )
        port map (
      I0 => \axi_rdata_reg[12]_i_2_n_0\,
      I1 => sel0(3),
      I2 => \axi_rdata_reg[12]_i_3_n_0\,
      I3 => sel0(4),
      I4 => \axi_rdata[12]_i_4_n_0\,
      I5 => \axi_araddr_reg_n_0_[7]\,
      O => p_1_in(12)
    );
\axi_rdata[12]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000010"
    )
        port map (
      I0 => sel0(1),
      I1 => sel0(2),
      I2 => slv_reg16(12),
      I3 => sel0(0),
      I4 => sel0(3),
      O => \axi_rdata[12]_i_4_n_0\
    );
\axi_rdata[12]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => Clock_register(8),
      I1 => OVC_CH(12),
      I2 => sel0(1),
      I3 => \^pwr_en\(12),
      I4 => sel0(0),
      I5 => \^cs_enable\(12),
      O => \axi_rdata[12]_i_5_n_0\
    );
\axi_rdata[12]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg7(12),
      I1 => slv_reg6(12),
      I2 => sel0(1),
      I3 => slv_reg5(12),
      I4 => sel0(0),
      I5 => slv_reg4(12),
      O => \axi_rdata[12]_i_6_n_0\
    );
\axi_rdata[12]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg11(12),
      I1 => slv_reg10(12),
      I2 => sel0(1),
      I3 => slv_reg9(12),
      I4 => sel0(0),
      I5 => slv_reg8(12),
      O => \axi_rdata[12]_i_7_n_0\
    );
\axi_rdata[12]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(12),
      I1 => slv_reg14(12),
      I2 => sel0(1),
      I3 => slv_reg13(12),
      I4 => sel0(0),
      I5 => slv_reg12(12),
      O => \axi_rdata[12]_i_8_n_0\
    );
\axi_rdata[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFE200E2"
    )
        port map (
      I0 => \axi_rdata_reg[13]_i_2_n_0\,
      I1 => sel0(3),
      I2 => \axi_rdata_reg[13]_i_3_n_0\,
      I3 => sel0(4),
      I4 => \axi_rdata[13]_i_4_n_0\,
      I5 => \axi_araddr_reg_n_0_[7]\,
      O => p_1_in(13)
    );
\axi_rdata[13]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000010"
    )
        port map (
      I0 => sel0(1),
      I1 => sel0(2),
      I2 => slv_reg16(13),
      I3 => sel0(0),
      I4 => sel0(3),
      O => \axi_rdata[13]_i_4_n_0\
    );
\axi_rdata[13]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => Clock_register(9),
      I1 => OVC_CH(13),
      I2 => sel0(1),
      I3 => \^pwr_en\(13),
      I4 => sel0(0),
      I5 => \^cs_enable\(13),
      O => \axi_rdata[13]_i_5_n_0\
    );
\axi_rdata[13]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg7(13),
      I1 => slv_reg6(13),
      I2 => sel0(1),
      I3 => slv_reg5(13),
      I4 => sel0(0),
      I5 => slv_reg4(13),
      O => \axi_rdata[13]_i_6_n_0\
    );
\axi_rdata[13]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg11(13),
      I1 => slv_reg10(13),
      I2 => sel0(1),
      I3 => slv_reg9(13),
      I4 => sel0(0),
      I5 => slv_reg8(13),
      O => \axi_rdata[13]_i_7_n_0\
    );
\axi_rdata[13]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(13),
      I1 => slv_reg14(13),
      I2 => sel0(1),
      I3 => slv_reg13(13),
      I4 => sel0(0),
      I5 => slv_reg12(13),
      O => \axi_rdata[13]_i_8_n_0\
    );
\axi_rdata[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFE200E2"
    )
        port map (
      I0 => \axi_rdata_reg[14]_i_2_n_0\,
      I1 => sel0(3),
      I2 => \axi_rdata_reg[14]_i_3_n_0\,
      I3 => sel0(4),
      I4 => \axi_rdata[14]_i_4_n_0\,
      I5 => \axi_araddr_reg_n_0_[7]\,
      O => p_1_in(14)
    );
\axi_rdata[14]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000010"
    )
        port map (
      I0 => sel0(1),
      I1 => sel0(2),
      I2 => slv_reg16(14),
      I3 => sel0(0),
      I4 => sel0(3),
      O => \axi_rdata[14]_i_4_n_0\
    );
\axi_rdata[14]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => Clock_register(10),
      I1 => OVC_CH(14),
      I2 => sel0(1),
      I3 => \^pwr_en\(14),
      I4 => sel0(0),
      I5 => \^cs_enable\(14),
      O => \axi_rdata[14]_i_5_n_0\
    );
\axi_rdata[14]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg7(14),
      I1 => slv_reg6(14),
      I2 => sel0(1),
      I3 => slv_reg5(14),
      I4 => sel0(0),
      I5 => slv_reg4(14),
      O => \axi_rdata[14]_i_6_n_0\
    );
\axi_rdata[14]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg11(14),
      I1 => slv_reg10(14),
      I2 => sel0(1),
      I3 => slv_reg9(14),
      I4 => sel0(0),
      I5 => slv_reg8(14),
      O => \axi_rdata[14]_i_7_n_0\
    );
\axi_rdata[14]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(14),
      I1 => slv_reg14(14),
      I2 => sel0(1),
      I3 => slv_reg13(14),
      I4 => sel0(0),
      I5 => slv_reg12(14),
      O => \axi_rdata[14]_i_8_n_0\
    );
\axi_rdata[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFE200E2"
    )
        port map (
      I0 => \axi_rdata_reg[15]_i_2_n_0\,
      I1 => sel0(3),
      I2 => \axi_rdata_reg[15]_i_3_n_0\,
      I3 => sel0(4),
      I4 => \axi_rdata[15]_i_4_n_0\,
      I5 => \axi_araddr_reg_n_0_[7]\,
      O => p_1_in(15)
    );
\axi_rdata[15]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000010"
    )
        port map (
      I0 => sel0(1),
      I1 => sel0(2),
      I2 => slv_reg16(15),
      I3 => sel0(0),
      I4 => sel0(3),
      O => \axi_rdata[15]_i_4_n_0\
    );
\axi_rdata[15]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => OVC_CH(15),
      I1 => sel0(1),
      I2 => \^pwr_en\(15),
      I3 => sel0(0),
      I4 => \^cs_enable\(15),
      O => \axi_rdata[15]_i_5_n_0\
    );
\axi_rdata[15]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg7(15),
      I1 => slv_reg6(15),
      I2 => sel0(1),
      I3 => slv_reg5(15),
      I4 => sel0(0),
      I5 => slv_reg4(15),
      O => \axi_rdata[15]_i_6_n_0\
    );
\axi_rdata[15]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg11(15),
      I1 => slv_reg10(15),
      I2 => sel0(1),
      I3 => slv_reg9(15),
      I4 => sel0(0),
      I5 => slv_reg8(15),
      O => \axi_rdata[15]_i_7_n_0\
    );
\axi_rdata[15]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(15),
      I1 => slv_reg14(15),
      I2 => sel0(1),
      I3 => slv_reg13(15),
      I4 => sel0(0),
      I5 => slv_reg12(15),
      O => \axi_rdata[15]_i_8_n_0\
    );
\axi_rdata[16]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFE200E2"
    )
        port map (
      I0 => \axi_rdata_reg[16]_i_2_n_0\,
      I1 => sel0(3),
      I2 => \axi_rdata_reg[16]_i_3_n_0\,
      I3 => sel0(4),
      I4 => \axi_rdata[16]_i_4_n_0\,
      I5 => \axi_araddr_reg_n_0_[7]\,
      O => p_1_in(16)
    );
\axi_rdata[16]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000010"
    )
        port map (
      I0 => sel0(1),
      I1 => sel0(2),
      I2 => slv_reg16(16),
      I3 => sel0(0),
      I4 => sel0(3),
      O => \axi_rdata[16]_i_4_n_0\
    );
\axi_rdata[16]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => OVC_CH(16),
      I1 => sel0(1),
      I2 => \^pwr_en\(16),
      I3 => sel0(0),
      I4 => \^cs_enable\(16),
      O => \axi_rdata[16]_i_5_n_0\
    );
\axi_rdata[16]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg7(16),
      I1 => slv_reg6(16),
      I2 => sel0(1),
      I3 => slv_reg5(16),
      I4 => sel0(0),
      I5 => slv_reg4(16),
      O => \axi_rdata[16]_i_6_n_0\
    );
\axi_rdata[16]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg11(16),
      I1 => slv_reg10(16),
      I2 => sel0(1),
      I3 => slv_reg9(16),
      I4 => sel0(0),
      I5 => slv_reg8(16),
      O => \axi_rdata[16]_i_7_n_0\
    );
\axi_rdata[16]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(16),
      I1 => slv_reg14(16),
      I2 => sel0(1),
      I3 => slv_reg13(16),
      I4 => sel0(0),
      I5 => slv_reg12(16),
      O => \axi_rdata[16]_i_8_n_0\
    );
\axi_rdata[17]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFE200E2"
    )
        port map (
      I0 => \axi_rdata_reg[17]_i_2_n_0\,
      I1 => sel0(3),
      I2 => \axi_rdata_reg[17]_i_3_n_0\,
      I3 => sel0(4),
      I4 => \axi_rdata[17]_i_4_n_0\,
      I5 => \axi_araddr_reg_n_0_[7]\,
      O => p_1_in(17)
    );
\axi_rdata[17]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000010"
    )
        port map (
      I0 => sel0(1),
      I1 => sel0(2),
      I2 => slv_reg16(17),
      I3 => sel0(0),
      I4 => sel0(3),
      O => \axi_rdata[17]_i_4_n_0\
    );
\axi_rdata[17]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => OVC_CH(17),
      I1 => sel0(1),
      I2 => \^pwr_en\(17),
      I3 => sel0(0),
      I4 => \^cs_enable\(17),
      O => \axi_rdata[17]_i_5_n_0\
    );
\axi_rdata[17]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg7(17),
      I1 => slv_reg6(17),
      I2 => sel0(1),
      I3 => slv_reg5(17),
      I4 => sel0(0),
      I5 => slv_reg4(17),
      O => \axi_rdata[17]_i_6_n_0\
    );
\axi_rdata[17]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg11(17),
      I1 => slv_reg10(17),
      I2 => sel0(1),
      I3 => slv_reg9(17),
      I4 => sel0(0),
      I5 => slv_reg8(17),
      O => \axi_rdata[17]_i_7_n_0\
    );
\axi_rdata[17]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(17),
      I1 => slv_reg14(17),
      I2 => sel0(1),
      I3 => slv_reg13(17),
      I4 => sel0(0),
      I5 => slv_reg12(17),
      O => \axi_rdata[17]_i_8_n_0\
    );
\axi_rdata[18]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFE200E2"
    )
        port map (
      I0 => \axi_rdata_reg[18]_i_2_n_0\,
      I1 => sel0(3),
      I2 => \axi_rdata_reg[18]_i_3_n_0\,
      I3 => sel0(4),
      I4 => \axi_rdata[18]_i_4_n_0\,
      I5 => \axi_araddr_reg_n_0_[7]\,
      O => p_1_in(18)
    );
\axi_rdata[18]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000010"
    )
        port map (
      I0 => sel0(1),
      I1 => sel0(2),
      I2 => slv_reg16(18),
      I3 => sel0(0),
      I4 => sel0(3),
      O => \axi_rdata[18]_i_4_n_0\
    );
\axi_rdata[18]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => OVC_CH(18),
      I1 => sel0(1),
      I2 => \^pwr_en\(18),
      I3 => sel0(0),
      I4 => \^cs_enable\(18),
      O => \axi_rdata[18]_i_5_n_0\
    );
\axi_rdata[18]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg7(18),
      I1 => slv_reg6(18),
      I2 => sel0(1),
      I3 => slv_reg5(18),
      I4 => sel0(0),
      I5 => slv_reg4(18),
      O => \axi_rdata[18]_i_6_n_0\
    );
\axi_rdata[18]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg11(18),
      I1 => slv_reg10(18),
      I2 => sel0(1),
      I3 => slv_reg9(18),
      I4 => sel0(0),
      I5 => slv_reg8(18),
      O => \axi_rdata[18]_i_7_n_0\
    );
\axi_rdata[18]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(18),
      I1 => slv_reg14(18),
      I2 => sel0(1),
      I3 => slv_reg13(18),
      I4 => sel0(0),
      I5 => slv_reg12(18),
      O => \axi_rdata[18]_i_8_n_0\
    );
\axi_rdata[19]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFE200E2"
    )
        port map (
      I0 => \axi_rdata_reg[19]_i_2_n_0\,
      I1 => sel0(3),
      I2 => \axi_rdata_reg[19]_i_3_n_0\,
      I3 => sel0(4),
      I4 => \axi_rdata[19]_i_4_n_0\,
      I5 => \axi_araddr_reg_n_0_[7]\,
      O => p_1_in(19)
    );
\axi_rdata[19]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000010"
    )
        port map (
      I0 => sel0(1),
      I1 => sel0(2),
      I2 => slv_reg16(19),
      I3 => sel0(0),
      I4 => sel0(3),
      O => \axi_rdata[19]_i_4_n_0\
    );
\axi_rdata[19]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => slv_reg0(19),
      I1 => sel0(0),
      I2 => slv_reg1(19),
      I3 => sel0(1),
      O => \axi_rdata[19]_i_5_n_0\
    );
\axi_rdata[19]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg7(19),
      I1 => slv_reg6(19),
      I2 => sel0(1),
      I3 => slv_reg5(19),
      I4 => sel0(0),
      I5 => slv_reg4(19),
      O => \axi_rdata[19]_i_6_n_0\
    );
\axi_rdata[19]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg11(19),
      I1 => slv_reg10(19),
      I2 => sel0(1),
      I3 => slv_reg9(19),
      I4 => sel0(0),
      I5 => slv_reg8(19),
      O => \axi_rdata[19]_i_7_n_0\
    );
\axi_rdata[19]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(19),
      I1 => slv_reg14(19),
      I2 => sel0(1),
      I3 => slv_reg13(19),
      I4 => sel0(0),
      I5 => slv_reg12(19),
      O => \axi_rdata[19]_i_8_n_0\
    );
\axi_rdata[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFE200E2"
    )
        port map (
      I0 => \axi_rdata_reg[1]_i_2_n_0\,
      I1 => sel0(3),
      I2 => \axi_rdata_reg[1]_i_3_n_0\,
      I3 => sel0(4),
      I4 => \axi_rdata[1]_i_4_n_0\,
      I5 => \axi_araddr_reg_n_0_[7]\,
      O => p_1_in(1)
    );
\axi_rdata[1]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000010"
    )
        port map (
      I0 => sel0(1),
      I1 => sel0(2),
      I2 => slv_reg16(1),
      I3 => sel0(0),
      I4 => sel0(3),
      O => \axi_rdata[1]_i_4_n_0\
    );
\axi_rdata[1]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => Clock_register(1),
      I1 => OVC_CH(1),
      I2 => sel0(1),
      I3 => \^pwr_en\(1),
      I4 => sel0(0),
      I5 => \^cs_enable\(1),
      O => \axi_rdata[1]_i_5_n_0\
    );
\axi_rdata[1]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg7(1),
      I1 => slv_reg6(1),
      I2 => sel0(1),
      I3 => slv_reg5(1),
      I4 => sel0(0),
      I5 => slv_reg4(1),
      O => \axi_rdata[1]_i_6_n_0\
    );
\axi_rdata[1]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg11(1),
      I1 => slv_reg10(1),
      I2 => sel0(1),
      I3 => slv_reg9(1),
      I4 => sel0(0),
      I5 => slv_reg8(1),
      O => \axi_rdata[1]_i_7_n_0\
    );
\axi_rdata[1]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(1),
      I1 => slv_reg14(1),
      I2 => sel0(1),
      I3 => slv_reg13(1),
      I4 => sel0(0),
      I5 => slv_reg12(1),
      O => \axi_rdata[1]_i_8_n_0\
    );
\axi_rdata[20]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFE200E2"
    )
        port map (
      I0 => \axi_rdata_reg[20]_i_2_n_0\,
      I1 => sel0(3),
      I2 => \axi_rdata_reg[20]_i_3_n_0\,
      I3 => sel0(4),
      I4 => \axi_rdata[20]_i_4_n_0\,
      I5 => \axi_araddr_reg_n_0_[7]\,
      O => p_1_in(20)
    );
\axi_rdata[20]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000010"
    )
        port map (
      I0 => sel0(1),
      I1 => sel0(2),
      I2 => slv_reg16(20),
      I3 => sel0(0),
      I4 => sel0(3),
      O => \axi_rdata[20]_i_4_n_0\
    );
\axi_rdata[20]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => slv_reg0(20),
      I1 => sel0(0),
      I2 => slv_reg1(20),
      I3 => sel0(1),
      O => \axi_rdata[20]_i_5_n_0\
    );
\axi_rdata[20]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg7(20),
      I1 => slv_reg6(20),
      I2 => sel0(1),
      I3 => slv_reg5(20),
      I4 => sel0(0),
      I5 => slv_reg4(20),
      O => \axi_rdata[20]_i_6_n_0\
    );
\axi_rdata[20]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg11(20),
      I1 => slv_reg10(20),
      I2 => sel0(1),
      I3 => slv_reg9(20),
      I4 => sel0(0),
      I5 => slv_reg8(20),
      O => \axi_rdata[20]_i_7_n_0\
    );
\axi_rdata[20]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(20),
      I1 => slv_reg14(20),
      I2 => sel0(1),
      I3 => slv_reg13(20),
      I4 => sel0(0),
      I5 => slv_reg12(20),
      O => \axi_rdata[20]_i_8_n_0\
    );
\axi_rdata[21]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFE200E2"
    )
        port map (
      I0 => \axi_rdata_reg[21]_i_2_n_0\,
      I1 => sel0(3),
      I2 => \axi_rdata_reg[21]_i_3_n_0\,
      I3 => sel0(4),
      I4 => \axi_rdata[21]_i_4_n_0\,
      I5 => \axi_araddr_reg_n_0_[7]\,
      O => p_1_in(21)
    );
\axi_rdata[21]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000010"
    )
        port map (
      I0 => sel0(1),
      I1 => sel0(2),
      I2 => slv_reg16(21),
      I3 => sel0(0),
      I4 => sel0(3),
      O => \axi_rdata[21]_i_4_n_0\
    );
\axi_rdata[21]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => slv_reg0(21),
      I1 => sel0(0),
      I2 => slv_reg1(21),
      I3 => sel0(1),
      O => \axi_rdata[21]_i_5_n_0\
    );
\axi_rdata[21]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg7(21),
      I1 => slv_reg6(21),
      I2 => sel0(1),
      I3 => slv_reg5(21),
      I4 => sel0(0),
      I5 => slv_reg4(21),
      O => \axi_rdata[21]_i_6_n_0\
    );
\axi_rdata[21]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg11(21),
      I1 => slv_reg10(21),
      I2 => sel0(1),
      I3 => slv_reg9(21),
      I4 => sel0(0),
      I5 => slv_reg8(21),
      O => \axi_rdata[21]_i_7_n_0\
    );
\axi_rdata[21]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(21),
      I1 => slv_reg14(21),
      I2 => sel0(1),
      I3 => slv_reg13(21),
      I4 => sel0(0),
      I5 => slv_reg12(21),
      O => \axi_rdata[21]_i_8_n_0\
    );
\axi_rdata[22]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFE200E2"
    )
        port map (
      I0 => \axi_rdata_reg[22]_i_2_n_0\,
      I1 => sel0(3),
      I2 => \axi_rdata_reg[22]_i_3_n_0\,
      I3 => sel0(4),
      I4 => \axi_rdata[22]_i_4_n_0\,
      I5 => \axi_araddr_reg_n_0_[7]\,
      O => p_1_in(22)
    );
\axi_rdata[22]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000010"
    )
        port map (
      I0 => sel0(1),
      I1 => sel0(2),
      I2 => slv_reg16(22),
      I3 => sel0(0),
      I4 => sel0(3),
      O => \axi_rdata[22]_i_4_n_0\
    );
\axi_rdata[22]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => slv_reg0(22),
      I1 => sel0(0),
      I2 => slv_reg1(22),
      I3 => sel0(1),
      O => \axi_rdata[22]_i_5_n_0\
    );
\axi_rdata[22]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg7(22),
      I1 => slv_reg6(22),
      I2 => sel0(1),
      I3 => slv_reg5(22),
      I4 => sel0(0),
      I5 => slv_reg4(22),
      O => \axi_rdata[22]_i_6_n_0\
    );
\axi_rdata[22]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg11(22),
      I1 => slv_reg10(22),
      I2 => sel0(1),
      I3 => slv_reg9(22),
      I4 => sel0(0),
      I5 => slv_reg8(22),
      O => \axi_rdata[22]_i_7_n_0\
    );
\axi_rdata[22]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(22),
      I1 => slv_reg14(22),
      I2 => sel0(1),
      I3 => slv_reg13(22),
      I4 => sel0(0),
      I5 => slv_reg12(22),
      O => \axi_rdata[22]_i_8_n_0\
    );
\axi_rdata[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFE200E2"
    )
        port map (
      I0 => \axi_rdata_reg[23]_i_2_n_0\,
      I1 => sel0(3),
      I2 => \axi_rdata_reg[23]_i_3_n_0\,
      I3 => sel0(4),
      I4 => \axi_rdata[23]_i_4_n_0\,
      I5 => \axi_araddr_reg_n_0_[7]\,
      O => p_1_in(23)
    );
\axi_rdata[23]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000010"
    )
        port map (
      I0 => sel0(1),
      I1 => sel0(2),
      I2 => slv_reg16(23),
      I3 => sel0(0),
      I4 => sel0(3),
      O => \axi_rdata[23]_i_4_n_0\
    );
\axi_rdata[23]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => slv_reg0(23),
      I1 => sel0(0),
      I2 => slv_reg1(23),
      I3 => sel0(1),
      O => \axi_rdata[23]_i_5_n_0\
    );
\axi_rdata[23]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg7(23),
      I1 => slv_reg6(23),
      I2 => sel0(1),
      I3 => slv_reg5(23),
      I4 => sel0(0),
      I5 => slv_reg4(23),
      O => \axi_rdata[23]_i_6_n_0\
    );
\axi_rdata[23]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg11(23),
      I1 => slv_reg10(23),
      I2 => sel0(1),
      I3 => slv_reg9(23),
      I4 => sel0(0),
      I5 => slv_reg8(23),
      O => \axi_rdata[23]_i_7_n_0\
    );
\axi_rdata[23]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(23),
      I1 => slv_reg14(23),
      I2 => sel0(1),
      I3 => slv_reg13(23),
      I4 => sel0(0),
      I5 => slv_reg12(23),
      O => \axi_rdata[23]_i_8_n_0\
    );
\axi_rdata[24]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFE200E2"
    )
        port map (
      I0 => \axi_rdata_reg[24]_i_2_n_0\,
      I1 => sel0(3),
      I2 => \axi_rdata_reg[24]_i_3_n_0\,
      I3 => sel0(4),
      I4 => \axi_rdata[24]_i_4_n_0\,
      I5 => \axi_araddr_reg_n_0_[7]\,
      O => p_1_in(24)
    );
\axi_rdata[24]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000010"
    )
        port map (
      I0 => sel0(1),
      I1 => sel0(2),
      I2 => slv_reg16(24),
      I3 => sel0(0),
      I4 => sel0(3),
      O => \axi_rdata[24]_i_4_n_0\
    );
\axi_rdata[24]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => slv_reg0(24),
      I1 => sel0(0),
      I2 => slv_reg1(24),
      I3 => sel0(1),
      O => \axi_rdata[24]_i_5_n_0\
    );
\axi_rdata[24]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg7(24),
      I1 => slv_reg6(24),
      I2 => sel0(1),
      I3 => slv_reg5(24),
      I4 => sel0(0),
      I5 => slv_reg4(24),
      O => \axi_rdata[24]_i_6_n_0\
    );
\axi_rdata[24]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg11(24),
      I1 => slv_reg10(24),
      I2 => sel0(1),
      I3 => slv_reg9(24),
      I4 => sel0(0),
      I5 => slv_reg8(24),
      O => \axi_rdata[24]_i_7_n_0\
    );
\axi_rdata[24]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(24),
      I1 => slv_reg14(24),
      I2 => sel0(1),
      I3 => slv_reg13(24),
      I4 => sel0(0),
      I5 => slv_reg12(24),
      O => \axi_rdata[24]_i_8_n_0\
    );
\axi_rdata[25]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFE200E2"
    )
        port map (
      I0 => \axi_rdata_reg[25]_i_2_n_0\,
      I1 => sel0(3),
      I2 => \axi_rdata_reg[25]_i_3_n_0\,
      I3 => sel0(4),
      I4 => \axi_rdata[25]_i_4_n_0\,
      I5 => \axi_araddr_reg_n_0_[7]\,
      O => p_1_in(25)
    );
\axi_rdata[25]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000010"
    )
        port map (
      I0 => sel0(1),
      I1 => sel0(2),
      I2 => slv_reg16(25),
      I3 => sel0(0),
      I4 => sel0(3),
      O => \axi_rdata[25]_i_4_n_0\
    );
\axi_rdata[25]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => slv_reg0(25),
      I1 => sel0(0),
      I2 => slv_reg1(25),
      I3 => sel0(1),
      O => \axi_rdata[25]_i_5_n_0\
    );
\axi_rdata[25]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg7(25),
      I1 => slv_reg6(25),
      I2 => sel0(1),
      I3 => slv_reg5(25),
      I4 => sel0(0),
      I5 => slv_reg4(25),
      O => \axi_rdata[25]_i_6_n_0\
    );
\axi_rdata[25]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg11(25),
      I1 => slv_reg10(25),
      I2 => sel0(1),
      I3 => slv_reg9(25),
      I4 => sel0(0),
      I5 => slv_reg8(25),
      O => \axi_rdata[25]_i_7_n_0\
    );
\axi_rdata[25]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(25),
      I1 => slv_reg14(25),
      I2 => sel0(1),
      I3 => slv_reg13(25),
      I4 => sel0(0),
      I5 => slv_reg12(25),
      O => \axi_rdata[25]_i_8_n_0\
    );
\axi_rdata[26]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFE200E2"
    )
        port map (
      I0 => \axi_rdata_reg[26]_i_2_n_0\,
      I1 => sel0(3),
      I2 => \axi_rdata_reg[26]_i_3_n_0\,
      I3 => sel0(4),
      I4 => \axi_rdata[26]_i_4_n_0\,
      I5 => \axi_araddr_reg_n_0_[7]\,
      O => p_1_in(26)
    );
\axi_rdata[26]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000010"
    )
        port map (
      I0 => sel0(1),
      I1 => sel0(2),
      I2 => slv_reg16(26),
      I3 => sel0(0),
      I4 => sel0(3),
      O => \axi_rdata[26]_i_4_n_0\
    );
\axi_rdata[26]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => slv_reg0(26),
      I1 => sel0(0),
      I2 => slv_reg1(26),
      I3 => sel0(1),
      O => \axi_rdata[26]_i_5_n_0\
    );
\axi_rdata[26]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg7(26),
      I1 => slv_reg6(26),
      I2 => sel0(1),
      I3 => slv_reg5(26),
      I4 => sel0(0),
      I5 => slv_reg4(26),
      O => \axi_rdata[26]_i_6_n_0\
    );
\axi_rdata[26]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg11(26),
      I1 => slv_reg10(26),
      I2 => sel0(1),
      I3 => slv_reg9(26),
      I4 => sel0(0),
      I5 => slv_reg8(26),
      O => \axi_rdata[26]_i_7_n_0\
    );
\axi_rdata[26]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(26),
      I1 => slv_reg14(26),
      I2 => sel0(1),
      I3 => slv_reg13(26),
      I4 => sel0(0),
      I5 => slv_reg12(26),
      O => \axi_rdata[26]_i_8_n_0\
    );
\axi_rdata[27]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFE200E2"
    )
        port map (
      I0 => \axi_rdata_reg[27]_i_2_n_0\,
      I1 => sel0(3),
      I2 => \axi_rdata_reg[27]_i_3_n_0\,
      I3 => sel0(4),
      I4 => \axi_rdata[27]_i_4_n_0\,
      I5 => \axi_araddr_reg_n_0_[7]\,
      O => p_1_in(27)
    );
\axi_rdata[27]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000010"
    )
        port map (
      I0 => sel0(1),
      I1 => sel0(2),
      I2 => slv_reg16(27),
      I3 => sel0(0),
      I4 => sel0(3),
      O => \axi_rdata[27]_i_4_n_0\
    );
\axi_rdata[27]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => slv_reg0(27),
      I1 => sel0(0),
      I2 => slv_reg1(27),
      I3 => sel0(1),
      O => \axi_rdata[27]_i_5_n_0\
    );
\axi_rdata[27]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg7(27),
      I1 => slv_reg6(27),
      I2 => sel0(1),
      I3 => slv_reg5(27),
      I4 => sel0(0),
      I5 => slv_reg4(27),
      O => \axi_rdata[27]_i_6_n_0\
    );
\axi_rdata[27]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg11(27),
      I1 => slv_reg10(27),
      I2 => sel0(1),
      I3 => slv_reg9(27),
      I4 => sel0(0),
      I5 => slv_reg8(27),
      O => \axi_rdata[27]_i_7_n_0\
    );
\axi_rdata[27]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(27),
      I1 => slv_reg14(27),
      I2 => sel0(1),
      I3 => slv_reg13(27),
      I4 => sel0(0),
      I5 => slv_reg12(27),
      O => \axi_rdata[27]_i_8_n_0\
    );
\axi_rdata[28]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFE200E2"
    )
        port map (
      I0 => \axi_rdata_reg[28]_i_2_n_0\,
      I1 => sel0(3),
      I2 => \axi_rdata_reg[28]_i_3_n_0\,
      I3 => sel0(4),
      I4 => \axi_rdata[28]_i_4_n_0\,
      I5 => \axi_araddr_reg_n_0_[7]\,
      O => p_1_in(28)
    );
\axi_rdata[28]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000010"
    )
        port map (
      I0 => sel0(1),
      I1 => sel0(2),
      I2 => slv_reg16(28),
      I3 => sel0(0),
      I4 => sel0(3),
      O => \axi_rdata[28]_i_4_n_0\
    );
\axi_rdata[28]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => slv_reg0(28),
      I1 => sel0(0),
      I2 => slv_reg1(28),
      I3 => sel0(1),
      O => \axi_rdata[28]_i_5_n_0\
    );
\axi_rdata[28]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg7(28),
      I1 => slv_reg6(28),
      I2 => sel0(1),
      I3 => slv_reg5(28),
      I4 => sel0(0),
      I5 => slv_reg4(28),
      O => \axi_rdata[28]_i_6_n_0\
    );
\axi_rdata[28]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg11(28),
      I1 => slv_reg10(28),
      I2 => sel0(1),
      I3 => slv_reg9(28),
      I4 => sel0(0),
      I5 => slv_reg8(28),
      O => \axi_rdata[28]_i_7_n_0\
    );
\axi_rdata[28]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(28),
      I1 => slv_reg14(28),
      I2 => sel0(1),
      I3 => slv_reg13(28),
      I4 => sel0(0),
      I5 => slv_reg12(28),
      O => \axi_rdata[28]_i_8_n_0\
    );
\axi_rdata[29]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFE200E2"
    )
        port map (
      I0 => \axi_rdata_reg[29]_i_2_n_0\,
      I1 => sel0(3),
      I2 => \axi_rdata_reg[29]_i_3_n_0\,
      I3 => sel0(4),
      I4 => \axi_rdata[29]_i_4_n_0\,
      I5 => \axi_araddr_reg_n_0_[7]\,
      O => p_1_in(29)
    );
\axi_rdata[29]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000010"
    )
        port map (
      I0 => sel0(1),
      I1 => sel0(2),
      I2 => slv_reg16(29),
      I3 => sel0(0),
      I4 => sel0(3),
      O => \axi_rdata[29]_i_4_n_0\
    );
\axi_rdata[29]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => slv_reg0(29),
      I1 => sel0(0),
      I2 => slv_reg1(29),
      I3 => sel0(1),
      O => \axi_rdata[29]_i_5_n_0\
    );
\axi_rdata[29]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg7(29),
      I1 => slv_reg6(29),
      I2 => sel0(1),
      I3 => slv_reg5(29),
      I4 => sel0(0),
      I5 => slv_reg4(29),
      O => \axi_rdata[29]_i_6_n_0\
    );
\axi_rdata[29]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg11(29),
      I1 => slv_reg10(29),
      I2 => sel0(1),
      I3 => slv_reg9(29),
      I4 => sel0(0),
      I5 => slv_reg8(29),
      O => \axi_rdata[29]_i_7_n_0\
    );
\axi_rdata[29]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(29),
      I1 => slv_reg14(29),
      I2 => sel0(1),
      I3 => slv_reg13(29),
      I4 => sel0(0),
      I5 => slv_reg12(29),
      O => \axi_rdata[29]_i_8_n_0\
    );
\axi_rdata[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFE200E2"
    )
        port map (
      I0 => \axi_rdata_reg[2]_i_2_n_0\,
      I1 => sel0(3),
      I2 => \axi_rdata_reg[2]_i_3_n_0\,
      I3 => sel0(4),
      I4 => \axi_rdata[2]_i_4_n_0\,
      I5 => \axi_araddr_reg_n_0_[7]\,
      O => p_1_in(2)
    );
\axi_rdata[2]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000010"
    )
        port map (
      I0 => sel0(1),
      I1 => sel0(2),
      I2 => slv_reg16(2),
      I3 => sel0(0),
      I4 => sel0(3),
      O => \axi_rdata[2]_i_4_n_0\
    );
\axi_rdata[2]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => Clock_register(2),
      I1 => OVC_CH(2),
      I2 => sel0(1),
      I3 => \^pwr_en\(2),
      I4 => sel0(0),
      I5 => \^cs_enable\(2),
      O => \axi_rdata[2]_i_5_n_0\
    );
\axi_rdata[2]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg7(2),
      I1 => slv_reg6(2),
      I2 => sel0(1),
      I3 => slv_reg5(2),
      I4 => sel0(0),
      I5 => slv_reg4(2),
      O => \axi_rdata[2]_i_6_n_0\
    );
\axi_rdata[2]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg11(2),
      I1 => slv_reg10(2),
      I2 => sel0(1),
      I3 => slv_reg9(2),
      I4 => sel0(0),
      I5 => slv_reg8(2),
      O => \axi_rdata[2]_i_7_n_0\
    );
\axi_rdata[2]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(2),
      I1 => slv_reg14(2),
      I2 => sel0(1),
      I3 => slv_reg13(2),
      I4 => sel0(0),
      I5 => slv_reg12(2),
      O => \axi_rdata[2]_i_8_n_0\
    );
\axi_rdata[30]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFE200E2"
    )
        port map (
      I0 => \axi_rdata_reg[30]_i_2_n_0\,
      I1 => sel0(3),
      I2 => \axi_rdata_reg[30]_i_3_n_0\,
      I3 => sel0(4),
      I4 => \axi_rdata[30]_i_4_n_0\,
      I5 => \axi_araddr_reg_n_0_[7]\,
      O => p_1_in(30)
    );
\axi_rdata[30]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000010"
    )
        port map (
      I0 => sel0(1),
      I1 => sel0(2),
      I2 => slv_reg16(30),
      I3 => sel0(0),
      I4 => sel0(3),
      O => \axi_rdata[30]_i_4_n_0\
    );
\axi_rdata[30]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => slv_reg0(30),
      I1 => sel0(0),
      I2 => slv_reg1(30),
      I3 => sel0(1),
      O => \axi_rdata[30]_i_5_n_0\
    );
\axi_rdata[30]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg7(30),
      I1 => slv_reg6(30),
      I2 => sel0(1),
      I3 => slv_reg5(30),
      I4 => sel0(0),
      I5 => slv_reg4(30),
      O => \axi_rdata[30]_i_6_n_0\
    );
\axi_rdata[30]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg11(30),
      I1 => slv_reg10(30),
      I2 => sel0(1),
      I3 => slv_reg9(30),
      I4 => sel0(0),
      I5 => slv_reg8(30),
      O => \axi_rdata[30]_i_7_n_0\
    );
\axi_rdata[30]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(30),
      I1 => slv_reg14(30),
      I2 => sel0(1),
      I3 => slv_reg13(30),
      I4 => sel0(0),
      I5 => slv_reg12(30),
      O => \axi_rdata[30]_i_8_n_0\
    );
\axi_rdata[31]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \^s_axi_arready\,
      I1 => S_AXI_ARVALID,
      I2 => \^s_axi_rvalid\,
      O => slv_reg_rden
    );
\axi_rdata[31]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFE200E2"
    )
        port map (
      I0 => \axi_rdata_reg[31]_i_3_n_0\,
      I1 => sel0(3),
      I2 => \axi_rdata_reg[31]_i_4_n_0\,
      I3 => sel0(4),
      I4 => \axi_rdata[31]_i_5_n_0\,
      I5 => \axi_araddr_reg_n_0_[7]\,
      O => p_1_in(31)
    );
\axi_rdata[31]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000010"
    )
        port map (
      I0 => sel0(1),
      I1 => sel0(2),
      I2 => slv_reg16(31),
      I3 => sel0(0),
      I4 => sel0(3),
      O => \axi_rdata[31]_i_5_n_0\
    );
\axi_rdata[31]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => slv_reg0(31),
      I1 => sel0(0),
      I2 => slv_reg1(31),
      I3 => sel0(1),
      O => \axi_rdata[31]_i_6_n_0\
    );
\axi_rdata[31]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg7(31),
      I1 => slv_reg6(31),
      I2 => sel0(1),
      I3 => slv_reg5(31),
      I4 => sel0(0),
      I5 => slv_reg4(31),
      O => \axi_rdata[31]_i_7_n_0\
    );
\axi_rdata[31]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg11(31),
      I1 => slv_reg10(31),
      I2 => sel0(1),
      I3 => slv_reg9(31),
      I4 => sel0(0),
      I5 => slv_reg8(31),
      O => \axi_rdata[31]_i_8_n_0\
    );
\axi_rdata[31]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(31),
      I1 => slv_reg14(31),
      I2 => sel0(1),
      I3 => slv_reg13(31),
      I4 => sel0(0),
      I5 => slv_reg12(31),
      O => \axi_rdata[31]_i_9_n_0\
    );
\axi_rdata[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFE200E2"
    )
        port map (
      I0 => \axi_rdata_reg[3]_i_2_n_0\,
      I1 => sel0(3),
      I2 => \axi_rdata_reg[3]_i_3_n_0\,
      I3 => sel0(4),
      I4 => \axi_rdata[3]_i_4_n_0\,
      I5 => \axi_araddr_reg_n_0_[7]\,
      O => p_1_in(3)
    );
\axi_rdata[3]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000010"
    )
        port map (
      I0 => sel0(1),
      I1 => sel0(2),
      I2 => slv_reg16(3),
      I3 => sel0(0),
      I4 => sel0(3),
      O => \axi_rdata[3]_i_4_n_0\
    );
\axi_rdata[3]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => Clock_register(3),
      I1 => OVC_CH(3),
      I2 => sel0(1),
      I3 => \^pwr_en\(3),
      I4 => sel0(0),
      I5 => \^cs_enable\(3),
      O => \axi_rdata[3]_i_5_n_0\
    );
\axi_rdata[3]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg7(3),
      I1 => slv_reg6(3),
      I2 => sel0(1),
      I3 => slv_reg5(3),
      I4 => sel0(0),
      I5 => slv_reg4(3),
      O => \axi_rdata[3]_i_6_n_0\
    );
\axi_rdata[3]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg11(3),
      I1 => slv_reg10(3),
      I2 => sel0(1),
      I3 => slv_reg9(3),
      I4 => sel0(0),
      I5 => slv_reg8(3),
      O => \axi_rdata[3]_i_7_n_0\
    );
\axi_rdata[3]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(3),
      I1 => slv_reg14(3),
      I2 => sel0(1),
      I3 => slv_reg13(3),
      I4 => sel0(0),
      I5 => slv_reg12(3),
      O => \axi_rdata[3]_i_8_n_0\
    );
\axi_rdata[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFE200E2"
    )
        port map (
      I0 => \axi_rdata_reg[4]_i_2_n_0\,
      I1 => sel0(3),
      I2 => \axi_rdata_reg[4]_i_3_n_0\,
      I3 => sel0(4),
      I4 => \axi_rdata[4]_i_4_n_0\,
      I5 => \axi_araddr_reg_n_0_[7]\,
      O => p_1_in(4)
    );
\axi_rdata[4]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000010"
    )
        port map (
      I0 => sel0(1),
      I1 => sel0(2),
      I2 => slv_reg16(4),
      I3 => sel0(0),
      I4 => sel0(3),
      O => \axi_rdata[4]_i_4_n_0\
    );
\axi_rdata[4]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => Clock_register(4),
      I1 => OVC_CH(4),
      I2 => sel0(1),
      I3 => \^pwr_en\(4),
      I4 => sel0(0),
      I5 => \^cs_enable\(4),
      O => \axi_rdata[4]_i_5_n_0\
    );
\axi_rdata[4]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg7(4),
      I1 => slv_reg6(4),
      I2 => sel0(1),
      I3 => slv_reg5(4),
      I4 => sel0(0),
      I5 => slv_reg4(4),
      O => \axi_rdata[4]_i_6_n_0\
    );
\axi_rdata[4]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg11(4),
      I1 => slv_reg10(4),
      I2 => sel0(1),
      I3 => slv_reg9(4),
      I4 => sel0(0),
      I5 => slv_reg8(4),
      O => \axi_rdata[4]_i_7_n_0\
    );
\axi_rdata[4]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(4),
      I1 => slv_reg14(4),
      I2 => sel0(1),
      I3 => slv_reg13(4),
      I4 => sel0(0),
      I5 => slv_reg12(4),
      O => \axi_rdata[4]_i_8_n_0\
    );
\axi_rdata[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFE200E2"
    )
        port map (
      I0 => \axi_rdata_reg[5]_i_2_n_0\,
      I1 => sel0(3),
      I2 => \axi_rdata_reg[5]_i_3_n_0\,
      I3 => sel0(4),
      I4 => \axi_rdata[5]_i_4_n_0\,
      I5 => \axi_araddr_reg_n_0_[7]\,
      O => p_1_in(5)
    );
\axi_rdata[5]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000010"
    )
        port map (
      I0 => sel0(1),
      I1 => sel0(2),
      I2 => slv_reg16(5),
      I3 => sel0(0),
      I4 => sel0(3),
      O => \axi_rdata[5]_i_4_n_0\
    );
\axi_rdata[5]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => Clock_register(5),
      I1 => OVC_CH(5),
      I2 => sel0(1),
      I3 => \^pwr_en\(5),
      I4 => sel0(0),
      I5 => \^cs_enable\(5),
      O => \axi_rdata[5]_i_5_n_0\
    );
\axi_rdata[5]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg7(5),
      I1 => slv_reg6(5),
      I2 => sel0(1),
      I3 => slv_reg5(5),
      I4 => sel0(0),
      I5 => slv_reg4(5),
      O => \axi_rdata[5]_i_6_n_0\
    );
\axi_rdata[5]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg11(5),
      I1 => slv_reg10(5),
      I2 => sel0(1),
      I3 => slv_reg9(5),
      I4 => sel0(0),
      I5 => slv_reg8(5),
      O => \axi_rdata[5]_i_7_n_0\
    );
\axi_rdata[5]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(5),
      I1 => slv_reg14(5),
      I2 => sel0(1),
      I3 => slv_reg13(5),
      I4 => sel0(0),
      I5 => slv_reg12(5),
      O => \axi_rdata[5]_i_8_n_0\
    );
\axi_rdata[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFE200E2"
    )
        port map (
      I0 => \axi_rdata_reg[6]_i_2_n_0\,
      I1 => sel0(3),
      I2 => \axi_rdata_reg[6]_i_3_n_0\,
      I3 => sel0(4),
      I4 => \axi_rdata[6]_i_4_n_0\,
      I5 => \axi_araddr_reg_n_0_[7]\,
      O => p_1_in(6)
    );
\axi_rdata[6]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000010"
    )
        port map (
      I0 => sel0(1),
      I1 => sel0(2),
      I2 => slv_reg16(6),
      I3 => sel0(0),
      I4 => sel0(3),
      O => \axi_rdata[6]_i_4_n_0\
    );
\axi_rdata[6]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^clock_register_out\(0),
      I1 => OVC_CH(6),
      I2 => sel0(1),
      I3 => \^pwr_en\(6),
      I4 => sel0(0),
      I5 => \^cs_enable\(6),
      O => \axi_rdata[6]_i_5_n_0\
    );
\axi_rdata[6]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg7(6),
      I1 => slv_reg6(6),
      I2 => sel0(1),
      I3 => slv_reg5(6),
      I4 => sel0(0),
      I5 => slv_reg4(6),
      O => \axi_rdata[6]_i_6_n_0\
    );
\axi_rdata[6]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg11(6),
      I1 => slv_reg10(6),
      I2 => sel0(1),
      I3 => slv_reg9(6),
      I4 => sel0(0),
      I5 => slv_reg8(6),
      O => \axi_rdata[6]_i_7_n_0\
    );
\axi_rdata[6]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(6),
      I1 => slv_reg14(6),
      I2 => sel0(1),
      I3 => slv_reg13(6),
      I4 => sel0(0),
      I5 => slv_reg12(6),
      O => \axi_rdata[6]_i_8_n_0\
    );
\axi_rdata[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFE200E2"
    )
        port map (
      I0 => \axi_rdata_reg[7]_i_2_n_0\,
      I1 => sel0(3),
      I2 => \axi_rdata_reg[7]_i_3_n_0\,
      I3 => sel0(4),
      I4 => \axi_rdata[7]_i_4_n_0\,
      I5 => \axi_araddr_reg_n_0_[7]\,
      O => p_1_in(7)
    );
\axi_rdata[7]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000010"
    )
        port map (
      I0 => sel0(1),
      I1 => sel0(2),
      I2 => slv_reg16(7),
      I3 => sel0(0),
      I4 => sel0(3),
      O => \axi_rdata[7]_i_4_n_0\
    );
\axi_rdata[7]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^clock_register_out\(1),
      I1 => OVC_CH(7),
      I2 => sel0(1),
      I3 => \^pwr_en\(7),
      I4 => sel0(0),
      I5 => \^cs_enable\(7),
      O => \axi_rdata[7]_i_5_n_0\
    );
\axi_rdata[7]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg7(7),
      I1 => slv_reg6(7),
      I2 => sel0(1),
      I3 => slv_reg5(7),
      I4 => sel0(0),
      I5 => slv_reg4(7),
      O => \axi_rdata[7]_i_6_n_0\
    );
\axi_rdata[7]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg11(7),
      I1 => slv_reg10(7),
      I2 => sel0(1),
      I3 => slv_reg9(7),
      I4 => sel0(0),
      I5 => slv_reg8(7),
      O => \axi_rdata[7]_i_7_n_0\
    );
\axi_rdata[7]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(7),
      I1 => slv_reg14(7),
      I2 => sel0(1),
      I3 => slv_reg13(7),
      I4 => sel0(0),
      I5 => slv_reg12(7),
      O => \axi_rdata[7]_i_8_n_0\
    );
\axi_rdata[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFE200E2"
    )
        port map (
      I0 => \axi_rdata_reg[8]_i_2_n_0\,
      I1 => sel0(3),
      I2 => \axi_rdata_reg[8]_i_3_n_0\,
      I3 => sel0(4),
      I4 => \axi_rdata[8]_i_4_n_0\,
      I5 => \axi_araddr_reg_n_0_[7]\,
      O => p_1_in(8)
    );
\axi_rdata[8]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000010"
    )
        port map (
      I0 => sel0(1),
      I1 => sel0(2),
      I2 => slv_reg16(8),
      I3 => sel0(0),
      I4 => sel0(3),
      O => \axi_rdata[8]_i_4_n_0\
    );
\axi_rdata[8]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => Clock_register(6),
      I1 => OVC_CH(8),
      I2 => sel0(1),
      I3 => \^pwr_en\(8),
      I4 => sel0(0),
      I5 => \^cs_enable\(8),
      O => \axi_rdata[8]_i_5_n_0\
    );
\axi_rdata[8]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg7(8),
      I1 => slv_reg6(8),
      I2 => sel0(1),
      I3 => slv_reg5(8),
      I4 => sel0(0),
      I5 => slv_reg4(8),
      O => \axi_rdata[8]_i_6_n_0\
    );
\axi_rdata[8]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg11(8),
      I1 => slv_reg10(8),
      I2 => sel0(1),
      I3 => slv_reg9(8),
      I4 => sel0(0),
      I5 => slv_reg8(8),
      O => \axi_rdata[8]_i_7_n_0\
    );
\axi_rdata[8]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(8),
      I1 => slv_reg14(8),
      I2 => sel0(1),
      I3 => slv_reg13(8),
      I4 => sel0(0),
      I5 => slv_reg12(8),
      O => \axi_rdata[8]_i_8_n_0\
    );
\axi_rdata[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFE200E2"
    )
        port map (
      I0 => \axi_rdata_reg[9]_i_2_n_0\,
      I1 => sel0(3),
      I2 => \axi_rdata_reg[9]_i_3_n_0\,
      I3 => sel0(4),
      I4 => \axi_rdata[9]_i_4_n_0\,
      I5 => \axi_araddr_reg_n_0_[7]\,
      O => p_1_in(9)
    );
\axi_rdata[9]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000010"
    )
        port map (
      I0 => sel0(1),
      I1 => sel0(2),
      I2 => slv_reg16(9),
      I3 => sel0(0),
      I4 => sel0(3),
      O => \axi_rdata[9]_i_4_n_0\
    );
\axi_rdata[9]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^clock_register_out\(2),
      I1 => OVC_CH(9),
      I2 => sel0(1),
      I3 => \^pwr_en\(9),
      I4 => sel0(0),
      I5 => \^cs_enable\(9),
      O => \axi_rdata[9]_i_5_n_0\
    );
\axi_rdata[9]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg7(9),
      I1 => slv_reg6(9),
      I2 => sel0(1),
      I3 => slv_reg5(9),
      I4 => sel0(0),
      I5 => slv_reg4(9),
      O => \axi_rdata[9]_i_6_n_0\
    );
\axi_rdata[9]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg11(9),
      I1 => slv_reg10(9),
      I2 => sel0(1),
      I3 => slv_reg9(9),
      I4 => sel0(0),
      I5 => slv_reg8(9),
      O => \axi_rdata[9]_i_7_n_0\
    );
\axi_rdata[9]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => slv_reg15(9),
      I1 => slv_reg14(9),
      I2 => sel0(1),
      I3 => slv_reg13(9),
      I4 => sel0(0),
      I5 => slv_reg12(9),
      O => \axi_rdata[9]_i_8_n_0\
    );
\axi_rdata_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg_rden,
      D => p_1_in(0),
      Q => S_AXI_RDATA(0),
      R => p_0_in
    );
\axi_rdata_reg[0]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[0]_i_5_n_0\,
      I1 => \axi_rdata[0]_i_6_n_0\,
      O => \axi_rdata_reg[0]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[0]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[0]_i_7_n_0\,
      I1 => \axi_rdata[0]_i_8_n_0\,
      O => \axi_rdata_reg[0]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg_rden,
      D => p_1_in(10),
      Q => S_AXI_RDATA(10),
      R => p_0_in
    );
\axi_rdata_reg[10]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[10]_i_5_n_0\,
      I1 => \axi_rdata[10]_i_6_n_0\,
      O => \axi_rdata_reg[10]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[10]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[10]_i_7_n_0\,
      I1 => \axi_rdata[10]_i_8_n_0\,
      O => \axi_rdata_reg[10]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg_rden,
      D => p_1_in(11),
      Q => S_AXI_RDATA(11),
      R => p_0_in
    );
\axi_rdata_reg[11]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[11]_i_5_n_0\,
      I1 => \axi_rdata[11]_i_6_n_0\,
      O => \axi_rdata_reg[11]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[11]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[11]_i_7_n_0\,
      I1 => \axi_rdata[11]_i_8_n_0\,
      O => \axi_rdata_reg[11]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg_rden,
      D => p_1_in(12),
      Q => S_AXI_RDATA(12),
      R => p_0_in
    );
\axi_rdata_reg[12]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[12]_i_5_n_0\,
      I1 => \axi_rdata[12]_i_6_n_0\,
      O => \axi_rdata_reg[12]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[12]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[12]_i_7_n_0\,
      I1 => \axi_rdata[12]_i_8_n_0\,
      O => \axi_rdata_reg[12]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg_rden,
      D => p_1_in(13),
      Q => S_AXI_RDATA(13),
      R => p_0_in
    );
\axi_rdata_reg[13]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[13]_i_5_n_0\,
      I1 => \axi_rdata[13]_i_6_n_0\,
      O => \axi_rdata_reg[13]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[13]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[13]_i_7_n_0\,
      I1 => \axi_rdata[13]_i_8_n_0\,
      O => \axi_rdata_reg[13]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg_rden,
      D => p_1_in(14),
      Q => S_AXI_RDATA(14),
      R => p_0_in
    );
\axi_rdata_reg[14]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[14]_i_5_n_0\,
      I1 => \axi_rdata[14]_i_6_n_0\,
      O => \axi_rdata_reg[14]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[14]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[14]_i_7_n_0\,
      I1 => \axi_rdata[14]_i_8_n_0\,
      O => \axi_rdata_reg[14]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg_rden,
      D => p_1_in(15),
      Q => S_AXI_RDATA(15),
      R => p_0_in
    );
\axi_rdata_reg[15]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[15]_i_5_n_0\,
      I1 => \axi_rdata[15]_i_6_n_0\,
      O => \axi_rdata_reg[15]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[15]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[15]_i_7_n_0\,
      I1 => \axi_rdata[15]_i_8_n_0\,
      O => \axi_rdata_reg[15]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg_rden,
      D => p_1_in(16),
      Q => S_AXI_RDATA(16),
      R => p_0_in
    );
\axi_rdata_reg[16]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[16]_i_5_n_0\,
      I1 => \axi_rdata[16]_i_6_n_0\,
      O => \axi_rdata_reg[16]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[16]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[16]_i_7_n_0\,
      I1 => \axi_rdata[16]_i_8_n_0\,
      O => \axi_rdata_reg[16]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg_rden,
      D => p_1_in(17),
      Q => S_AXI_RDATA(17),
      R => p_0_in
    );
\axi_rdata_reg[17]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[17]_i_5_n_0\,
      I1 => \axi_rdata[17]_i_6_n_0\,
      O => \axi_rdata_reg[17]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[17]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[17]_i_7_n_0\,
      I1 => \axi_rdata[17]_i_8_n_0\,
      O => \axi_rdata_reg[17]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg_rden,
      D => p_1_in(18),
      Q => S_AXI_RDATA(18),
      R => p_0_in
    );
\axi_rdata_reg[18]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[18]_i_5_n_0\,
      I1 => \axi_rdata[18]_i_6_n_0\,
      O => \axi_rdata_reg[18]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[18]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[18]_i_7_n_0\,
      I1 => \axi_rdata[18]_i_8_n_0\,
      O => \axi_rdata_reg[18]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg_rden,
      D => p_1_in(19),
      Q => S_AXI_RDATA(19),
      R => p_0_in
    );
\axi_rdata_reg[19]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[19]_i_5_n_0\,
      I1 => \axi_rdata[19]_i_6_n_0\,
      O => \axi_rdata_reg[19]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[19]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[19]_i_7_n_0\,
      I1 => \axi_rdata[19]_i_8_n_0\,
      O => \axi_rdata_reg[19]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg_rden,
      D => p_1_in(1),
      Q => S_AXI_RDATA(1),
      R => p_0_in
    );
\axi_rdata_reg[1]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[1]_i_5_n_0\,
      I1 => \axi_rdata[1]_i_6_n_0\,
      O => \axi_rdata_reg[1]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[1]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[1]_i_7_n_0\,
      I1 => \axi_rdata[1]_i_8_n_0\,
      O => \axi_rdata_reg[1]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg_rden,
      D => p_1_in(20),
      Q => S_AXI_RDATA(20),
      R => p_0_in
    );
\axi_rdata_reg[20]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[20]_i_5_n_0\,
      I1 => \axi_rdata[20]_i_6_n_0\,
      O => \axi_rdata_reg[20]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[20]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[20]_i_7_n_0\,
      I1 => \axi_rdata[20]_i_8_n_0\,
      O => \axi_rdata_reg[20]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg_rden,
      D => p_1_in(21),
      Q => S_AXI_RDATA(21),
      R => p_0_in
    );
\axi_rdata_reg[21]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[21]_i_5_n_0\,
      I1 => \axi_rdata[21]_i_6_n_0\,
      O => \axi_rdata_reg[21]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[21]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[21]_i_7_n_0\,
      I1 => \axi_rdata[21]_i_8_n_0\,
      O => \axi_rdata_reg[21]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg_rden,
      D => p_1_in(22),
      Q => S_AXI_RDATA(22),
      R => p_0_in
    );
\axi_rdata_reg[22]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[22]_i_5_n_0\,
      I1 => \axi_rdata[22]_i_6_n_0\,
      O => \axi_rdata_reg[22]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[22]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[22]_i_7_n_0\,
      I1 => \axi_rdata[22]_i_8_n_0\,
      O => \axi_rdata_reg[22]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg_rden,
      D => p_1_in(23),
      Q => S_AXI_RDATA(23),
      R => p_0_in
    );
\axi_rdata_reg[23]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[23]_i_5_n_0\,
      I1 => \axi_rdata[23]_i_6_n_0\,
      O => \axi_rdata_reg[23]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[23]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[23]_i_7_n_0\,
      I1 => \axi_rdata[23]_i_8_n_0\,
      O => \axi_rdata_reg[23]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg_rden,
      D => p_1_in(24),
      Q => S_AXI_RDATA(24),
      R => p_0_in
    );
\axi_rdata_reg[24]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[24]_i_5_n_0\,
      I1 => \axi_rdata[24]_i_6_n_0\,
      O => \axi_rdata_reg[24]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[24]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[24]_i_7_n_0\,
      I1 => \axi_rdata[24]_i_8_n_0\,
      O => \axi_rdata_reg[24]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg_rden,
      D => p_1_in(25),
      Q => S_AXI_RDATA(25),
      R => p_0_in
    );
\axi_rdata_reg[25]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[25]_i_5_n_0\,
      I1 => \axi_rdata[25]_i_6_n_0\,
      O => \axi_rdata_reg[25]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[25]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[25]_i_7_n_0\,
      I1 => \axi_rdata[25]_i_8_n_0\,
      O => \axi_rdata_reg[25]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg_rden,
      D => p_1_in(26),
      Q => S_AXI_RDATA(26),
      R => p_0_in
    );
\axi_rdata_reg[26]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[26]_i_5_n_0\,
      I1 => \axi_rdata[26]_i_6_n_0\,
      O => \axi_rdata_reg[26]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[26]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[26]_i_7_n_0\,
      I1 => \axi_rdata[26]_i_8_n_0\,
      O => \axi_rdata_reg[26]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg_rden,
      D => p_1_in(27),
      Q => S_AXI_RDATA(27),
      R => p_0_in
    );
\axi_rdata_reg[27]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[27]_i_5_n_0\,
      I1 => \axi_rdata[27]_i_6_n_0\,
      O => \axi_rdata_reg[27]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[27]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[27]_i_7_n_0\,
      I1 => \axi_rdata[27]_i_8_n_0\,
      O => \axi_rdata_reg[27]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg_rden,
      D => p_1_in(28),
      Q => S_AXI_RDATA(28),
      R => p_0_in
    );
\axi_rdata_reg[28]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[28]_i_5_n_0\,
      I1 => \axi_rdata[28]_i_6_n_0\,
      O => \axi_rdata_reg[28]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[28]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[28]_i_7_n_0\,
      I1 => \axi_rdata[28]_i_8_n_0\,
      O => \axi_rdata_reg[28]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg_rden,
      D => p_1_in(29),
      Q => S_AXI_RDATA(29),
      R => p_0_in
    );
\axi_rdata_reg[29]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[29]_i_5_n_0\,
      I1 => \axi_rdata[29]_i_6_n_0\,
      O => \axi_rdata_reg[29]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[29]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[29]_i_7_n_0\,
      I1 => \axi_rdata[29]_i_8_n_0\,
      O => \axi_rdata_reg[29]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg_rden,
      D => p_1_in(2),
      Q => S_AXI_RDATA(2),
      R => p_0_in
    );
\axi_rdata_reg[2]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[2]_i_5_n_0\,
      I1 => \axi_rdata[2]_i_6_n_0\,
      O => \axi_rdata_reg[2]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[2]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[2]_i_7_n_0\,
      I1 => \axi_rdata[2]_i_8_n_0\,
      O => \axi_rdata_reg[2]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg_rden,
      D => p_1_in(30),
      Q => S_AXI_RDATA(30),
      R => p_0_in
    );
\axi_rdata_reg[30]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[30]_i_5_n_0\,
      I1 => \axi_rdata[30]_i_6_n_0\,
      O => \axi_rdata_reg[30]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[30]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[30]_i_7_n_0\,
      I1 => \axi_rdata[30]_i_8_n_0\,
      O => \axi_rdata_reg[30]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg_rden,
      D => p_1_in(31),
      Q => S_AXI_RDATA(31),
      R => p_0_in
    );
\axi_rdata_reg[31]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[31]_i_6_n_0\,
      I1 => \axi_rdata[31]_i_7_n_0\,
      O => \axi_rdata_reg[31]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[31]_i_4\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[31]_i_8_n_0\,
      I1 => \axi_rdata[31]_i_9_n_0\,
      O => \axi_rdata_reg[31]_i_4_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg_rden,
      D => p_1_in(3),
      Q => S_AXI_RDATA(3),
      R => p_0_in
    );
\axi_rdata_reg[3]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[3]_i_5_n_0\,
      I1 => \axi_rdata[3]_i_6_n_0\,
      O => \axi_rdata_reg[3]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[3]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[3]_i_7_n_0\,
      I1 => \axi_rdata[3]_i_8_n_0\,
      O => \axi_rdata_reg[3]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg_rden,
      D => p_1_in(4),
      Q => S_AXI_RDATA(4),
      R => p_0_in
    );
\axi_rdata_reg[4]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[4]_i_5_n_0\,
      I1 => \axi_rdata[4]_i_6_n_0\,
      O => \axi_rdata_reg[4]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[4]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[4]_i_7_n_0\,
      I1 => \axi_rdata[4]_i_8_n_0\,
      O => \axi_rdata_reg[4]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg_rden,
      D => p_1_in(5),
      Q => S_AXI_RDATA(5),
      R => p_0_in
    );
\axi_rdata_reg[5]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[5]_i_5_n_0\,
      I1 => \axi_rdata[5]_i_6_n_0\,
      O => \axi_rdata_reg[5]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[5]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[5]_i_7_n_0\,
      I1 => \axi_rdata[5]_i_8_n_0\,
      O => \axi_rdata_reg[5]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg_rden,
      D => p_1_in(6),
      Q => S_AXI_RDATA(6),
      R => p_0_in
    );
\axi_rdata_reg[6]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[6]_i_5_n_0\,
      I1 => \axi_rdata[6]_i_6_n_0\,
      O => \axi_rdata_reg[6]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[6]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[6]_i_7_n_0\,
      I1 => \axi_rdata[6]_i_8_n_0\,
      O => \axi_rdata_reg[6]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg_rden,
      D => p_1_in(7),
      Q => S_AXI_RDATA(7),
      R => p_0_in
    );
\axi_rdata_reg[7]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[7]_i_5_n_0\,
      I1 => \axi_rdata[7]_i_6_n_0\,
      O => \axi_rdata_reg[7]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[7]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[7]_i_7_n_0\,
      I1 => \axi_rdata[7]_i_8_n_0\,
      O => \axi_rdata_reg[7]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg_rden,
      D => p_1_in(8),
      Q => S_AXI_RDATA(8),
      R => p_0_in
    );
\axi_rdata_reg[8]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[8]_i_5_n_0\,
      I1 => \axi_rdata[8]_i_6_n_0\,
      O => \axi_rdata_reg[8]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[8]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[8]_i_7_n_0\,
      I1 => \axi_rdata[8]_i_8_n_0\,
      O => \axi_rdata_reg[8]_i_3_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg_rden,
      D => p_1_in(9),
      Q => S_AXI_RDATA(9),
      R => p_0_in
    );
\axi_rdata_reg[9]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[9]_i_5_n_0\,
      I1 => \axi_rdata[9]_i_6_n_0\,
      O => \axi_rdata_reg[9]_i_2_n_0\,
      S => sel0(2)
    );
\axi_rdata_reg[9]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \axi_rdata[9]_i_7_n_0\,
      I1 => \axi_rdata[9]_i_8_n_0\,
      O => \axi_rdata_reg[9]_i_3_n_0\,
      S => sel0(2)
    );
axi_rvalid_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"08F8"
    )
        port map (
      I0 => S_AXI_ARVALID,
      I1 => \^s_axi_arready\,
      I2 => \^s_axi_rvalid\,
      I3 => S_AXI_RREADY,
      O => axi_rvalid_i_1_n_0
    );
axi_rvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => axi_rvalid_i_1_n_0,
      Q => \^s_axi_rvalid\,
      R => p_0_in
    );
axi_wready_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => aw_en_reg_n_0,
      I1 => S_AXI_AWVALID,
      I2 => S_AXI_WVALID,
      I3 => \^s_axi_wready\,
      O => axi_wready0
    );
axi_wready_reg: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => axi_wready0,
      Q => \^s_axi_wready\,
      R => p_0_in
    );
\slv_reg0[18]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => S_AXI_ARESETN,
      O => p_0_in
    );
\slv_reg0[18]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00010000"
    )
        port map (
      I0 => axi_awaddr(5),
      I1 => axi_awaddr(3),
      I2 => axi_awaddr(4),
      I3 => axi_awaddr(2),
      I4 => \slv_reg0[18]_i_3_n_0\,
      O => slv_reg0_14
    );
\slv_reg0[18]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000040000000"
    )
        port map (
      I0 => axi_awaddr(7),
      I1 => \^s_axi_wready\,
      I2 => \^s_axi_awready\,
      I3 => S_AXI_WVALID,
      I4 => S_AXI_AWVALID,
      I5 => axi_awaddr(6),
      O => \slv_reg0[18]_i_3_n_0\
    );
\slv_reg0_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg0_14,
      D => S_AXI_WDATA(0),
      Q => \^cs_enable\(0),
      R => p_0_in
    );
\slv_reg0_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg0_14,
      D => S_AXI_WDATA(10),
      Q => \^cs_enable\(10),
      R => p_0_in
    );
\slv_reg0_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg0_14,
      D => S_AXI_WDATA(11),
      Q => \^cs_enable\(11),
      R => p_0_in
    );
\slv_reg0_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg0_14,
      D => S_AXI_WDATA(12),
      Q => \^cs_enable\(12),
      R => p_0_in
    );
\slv_reg0_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg0_14,
      D => S_AXI_WDATA(13),
      Q => \^cs_enable\(13),
      R => p_0_in
    );
\slv_reg0_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg0_14,
      D => S_AXI_WDATA(14),
      Q => \^cs_enable\(14),
      R => p_0_in
    );
\slv_reg0_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg0_14,
      D => S_AXI_WDATA(15),
      Q => \^cs_enable\(15),
      R => p_0_in
    );
\slv_reg0_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg0_14,
      D => S_AXI_WDATA(16),
      Q => \^cs_enable\(16),
      R => p_0_in
    );
\slv_reg0_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg0_14,
      D => S_AXI_WDATA(17),
      Q => \^cs_enable\(17),
      R => p_0_in
    );
\slv_reg0_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg0_14,
      D => S_AXI_WDATA(18),
      Q => \^cs_enable\(18),
      R => p_0_in
    );
\slv_reg0_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg0_14,
      D => S_AXI_WDATA(19),
      Q => slv_reg0(19),
      R => p_0_in
    );
\slv_reg0_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg0_14,
      D => S_AXI_WDATA(1),
      Q => \^cs_enable\(1),
      R => p_0_in
    );
\slv_reg0_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg0_14,
      D => S_AXI_WDATA(20),
      Q => slv_reg0(20),
      R => p_0_in
    );
\slv_reg0_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg0_14,
      D => S_AXI_WDATA(21),
      Q => slv_reg0(21),
      R => p_0_in
    );
\slv_reg0_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg0_14,
      D => S_AXI_WDATA(22),
      Q => slv_reg0(22),
      R => p_0_in
    );
\slv_reg0_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg0_14,
      D => S_AXI_WDATA(23),
      Q => slv_reg0(23),
      R => p_0_in
    );
\slv_reg0_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg0_14,
      D => S_AXI_WDATA(24),
      Q => slv_reg0(24),
      R => p_0_in
    );
\slv_reg0_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg0_14,
      D => S_AXI_WDATA(25),
      Q => slv_reg0(25),
      R => p_0_in
    );
\slv_reg0_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg0_14,
      D => S_AXI_WDATA(26),
      Q => slv_reg0(26),
      R => p_0_in
    );
\slv_reg0_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg0_14,
      D => S_AXI_WDATA(27),
      Q => slv_reg0(27),
      R => p_0_in
    );
\slv_reg0_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg0_14,
      D => S_AXI_WDATA(28),
      Q => slv_reg0(28),
      R => p_0_in
    );
\slv_reg0_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg0_14,
      D => S_AXI_WDATA(29),
      Q => slv_reg0(29),
      R => p_0_in
    );
\slv_reg0_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg0_14,
      D => S_AXI_WDATA(2),
      Q => \^cs_enable\(2),
      R => p_0_in
    );
\slv_reg0_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg0_14,
      D => S_AXI_WDATA(30),
      Q => slv_reg0(30),
      R => p_0_in
    );
\slv_reg0_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg0_14,
      D => S_AXI_WDATA(31),
      Q => slv_reg0(31),
      R => p_0_in
    );
\slv_reg0_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg0_14,
      D => S_AXI_WDATA(3),
      Q => \^cs_enable\(3),
      R => p_0_in
    );
\slv_reg0_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg0_14,
      D => S_AXI_WDATA(4),
      Q => \^cs_enable\(4),
      R => p_0_in
    );
\slv_reg0_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg0_14,
      D => S_AXI_WDATA(5),
      Q => \^cs_enable\(5),
      R => p_0_in
    );
\slv_reg0_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg0_14,
      D => S_AXI_WDATA(6),
      Q => \^cs_enable\(6),
      R => p_0_in
    );
\slv_reg0_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg0_14,
      D => S_AXI_WDATA(7),
      Q => \^cs_enable\(7),
      R => p_0_in
    );
\slv_reg0_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg0_14,
      D => S_AXI_WDATA(8),
      Q => \^cs_enable\(8),
      R => p_0_in
    );
\slv_reg0_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg0_14,
      D => S_AXI_WDATA(9),
      Q => \^cs_enable\(9),
      R => p_0_in
    );
\slv_reg10[31]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00004000"
    )
        port map (
      I0 => axi_awaddr(4),
      I1 => axi_awaddr(3),
      I2 => axi_awaddr(5),
      I3 => \slv_reg0[18]_i_3_n_0\,
      I4 => axi_awaddr(2),
      O => slv_reg10_10
    );
\slv_reg10_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg10_10,
      D => S_AXI_WDATA(0),
      Q => slv_reg10(0),
      R => p_0_in
    );
\slv_reg10_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg10_10,
      D => S_AXI_WDATA(10),
      Q => slv_reg10(10),
      R => p_0_in
    );
\slv_reg10_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg10_10,
      D => S_AXI_WDATA(11),
      Q => slv_reg10(11),
      R => p_0_in
    );
\slv_reg10_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg10_10,
      D => S_AXI_WDATA(12),
      Q => slv_reg10(12),
      R => p_0_in
    );
\slv_reg10_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg10_10,
      D => S_AXI_WDATA(13),
      Q => slv_reg10(13),
      R => p_0_in
    );
\slv_reg10_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg10_10,
      D => S_AXI_WDATA(14),
      Q => slv_reg10(14),
      R => p_0_in
    );
\slv_reg10_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg10_10,
      D => S_AXI_WDATA(15),
      Q => slv_reg10(15),
      R => p_0_in
    );
\slv_reg10_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg10_10,
      D => S_AXI_WDATA(16),
      Q => slv_reg10(16),
      R => p_0_in
    );
\slv_reg10_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg10_10,
      D => S_AXI_WDATA(17),
      Q => slv_reg10(17),
      R => p_0_in
    );
\slv_reg10_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg10_10,
      D => S_AXI_WDATA(18),
      Q => slv_reg10(18),
      R => p_0_in
    );
\slv_reg10_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg10_10,
      D => S_AXI_WDATA(19),
      Q => slv_reg10(19),
      R => p_0_in
    );
\slv_reg10_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg10_10,
      D => S_AXI_WDATA(1),
      Q => slv_reg10(1),
      R => p_0_in
    );
\slv_reg10_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg10_10,
      D => S_AXI_WDATA(20),
      Q => slv_reg10(20),
      R => p_0_in
    );
\slv_reg10_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg10_10,
      D => S_AXI_WDATA(21),
      Q => slv_reg10(21),
      R => p_0_in
    );
\slv_reg10_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg10_10,
      D => S_AXI_WDATA(22),
      Q => slv_reg10(22),
      R => p_0_in
    );
\slv_reg10_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg10_10,
      D => S_AXI_WDATA(23),
      Q => slv_reg10(23),
      R => p_0_in
    );
\slv_reg10_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg10_10,
      D => S_AXI_WDATA(24),
      Q => slv_reg10(24),
      R => p_0_in
    );
\slv_reg10_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg10_10,
      D => S_AXI_WDATA(25),
      Q => slv_reg10(25),
      R => p_0_in
    );
\slv_reg10_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg10_10,
      D => S_AXI_WDATA(26),
      Q => slv_reg10(26),
      R => p_0_in
    );
\slv_reg10_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg10_10,
      D => S_AXI_WDATA(27),
      Q => slv_reg10(27),
      R => p_0_in
    );
\slv_reg10_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg10_10,
      D => S_AXI_WDATA(28),
      Q => slv_reg10(28),
      R => p_0_in
    );
\slv_reg10_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg10_10,
      D => S_AXI_WDATA(29),
      Q => slv_reg10(29),
      R => p_0_in
    );
\slv_reg10_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg10_10,
      D => S_AXI_WDATA(2),
      Q => slv_reg10(2),
      R => p_0_in
    );
\slv_reg10_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg10_10,
      D => S_AXI_WDATA(30),
      Q => slv_reg10(30),
      R => p_0_in
    );
\slv_reg10_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg10_10,
      D => S_AXI_WDATA(31),
      Q => slv_reg10(31),
      R => p_0_in
    );
\slv_reg10_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg10_10,
      D => S_AXI_WDATA(3),
      Q => slv_reg10(3),
      R => p_0_in
    );
\slv_reg10_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg10_10,
      D => S_AXI_WDATA(4),
      Q => slv_reg10(4),
      R => p_0_in
    );
\slv_reg10_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg10_10,
      D => S_AXI_WDATA(5),
      Q => slv_reg10(5),
      R => p_0_in
    );
\slv_reg10_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg10_10,
      D => S_AXI_WDATA(6),
      Q => slv_reg10(6),
      R => p_0_in
    );
\slv_reg10_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg10_10,
      D => S_AXI_WDATA(7),
      Q => slv_reg10(7),
      R => p_0_in
    );
\slv_reg10_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg10_10,
      D => S_AXI_WDATA(8),
      Q => slv_reg10(8),
      R => p_0_in
    );
\slv_reg10_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg10_10,
      D => S_AXI_WDATA(9),
      Q => slv_reg10(9),
      R => p_0_in
    );
\slv_reg11[31]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40000000"
    )
        port map (
      I0 => axi_awaddr(4),
      I1 => axi_awaddr(3),
      I2 => axi_awaddr(5),
      I3 => \slv_reg0[18]_i_3_n_0\,
      I4 => axi_awaddr(2),
      O => slv_reg11_3
    );
\slv_reg11_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg11_3,
      D => S_AXI_WDATA(0),
      Q => slv_reg11(0),
      R => p_0_in
    );
\slv_reg11_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg11_3,
      D => S_AXI_WDATA(10),
      Q => slv_reg11(10),
      R => p_0_in
    );
\slv_reg11_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg11_3,
      D => S_AXI_WDATA(11),
      Q => slv_reg11(11),
      R => p_0_in
    );
\slv_reg11_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg11_3,
      D => S_AXI_WDATA(12),
      Q => slv_reg11(12),
      R => p_0_in
    );
\slv_reg11_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg11_3,
      D => S_AXI_WDATA(13),
      Q => slv_reg11(13),
      R => p_0_in
    );
\slv_reg11_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg11_3,
      D => S_AXI_WDATA(14),
      Q => slv_reg11(14),
      R => p_0_in
    );
\slv_reg11_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg11_3,
      D => S_AXI_WDATA(15),
      Q => slv_reg11(15),
      R => p_0_in
    );
\slv_reg11_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg11_3,
      D => S_AXI_WDATA(16),
      Q => slv_reg11(16),
      R => p_0_in
    );
\slv_reg11_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg11_3,
      D => S_AXI_WDATA(17),
      Q => slv_reg11(17),
      R => p_0_in
    );
\slv_reg11_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg11_3,
      D => S_AXI_WDATA(18),
      Q => slv_reg11(18),
      R => p_0_in
    );
\slv_reg11_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg11_3,
      D => S_AXI_WDATA(19),
      Q => slv_reg11(19),
      R => p_0_in
    );
\slv_reg11_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg11_3,
      D => S_AXI_WDATA(1),
      Q => slv_reg11(1),
      R => p_0_in
    );
\slv_reg11_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg11_3,
      D => S_AXI_WDATA(20),
      Q => slv_reg11(20),
      R => p_0_in
    );
\slv_reg11_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg11_3,
      D => S_AXI_WDATA(21),
      Q => slv_reg11(21),
      R => p_0_in
    );
\slv_reg11_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg11_3,
      D => S_AXI_WDATA(22),
      Q => slv_reg11(22),
      R => p_0_in
    );
\slv_reg11_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg11_3,
      D => S_AXI_WDATA(23),
      Q => slv_reg11(23),
      R => p_0_in
    );
\slv_reg11_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg11_3,
      D => S_AXI_WDATA(24),
      Q => slv_reg11(24),
      R => p_0_in
    );
\slv_reg11_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg11_3,
      D => S_AXI_WDATA(25),
      Q => slv_reg11(25),
      R => p_0_in
    );
\slv_reg11_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg11_3,
      D => S_AXI_WDATA(26),
      Q => slv_reg11(26),
      R => p_0_in
    );
\slv_reg11_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg11_3,
      D => S_AXI_WDATA(27),
      Q => slv_reg11(27),
      R => p_0_in
    );
\slv_reg11_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg11_3,
      D => S_AXI_WDATA(28),
      Q => slv_reg11(28),
      R => p_0_in
    );
\slv_reg11_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg11_3,
      D => S_AXI_WDATA(29),
      Q => slv_reg11(29),
      R => p_0_in
    );
\slv_reg11_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg11_3,
      D => S_AXI_WDATA(2),
      Q => slv_reg11(2),
      R => p_0_in
    );
\slv_reg11_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg11_3,
      D => S_AXI_WDATA(30),
      Q => slv_reg11(30),
      R => p_0_in
    );
\slv_reg11_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg11_3,
      D => S_AXI_WDATA(31),
      Q => slv_reg11(31),
      R => p_0_in
    );
\slv_reg11_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg11_3,
      D => S_AXI_WDATA(3),
      Q => slv_reg11(3),
      R => p_0_in
    );
\slv_reg11_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg11_3,
      D => S_AXI_WDATA(4),
      Q => slv_reg11(4),
      R => p_0_in
    );
\slv_reg11_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg11_3,
      D => S_AXI_WDATA(5),
      Q => slv_reg11(5),
      R => p_0_in
    );
\slv_reg11_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg11_3,
      D => S_AXI_WDATA(6),
      Q => slv_reg11(6),
      R => p_0_in
    );
\slv_reg11_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg11_3,
      D => S_AXI_WDATA(7),
      Q => slv_reg11(7),
      R => p_0_in
    );
\slv_reg11_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg11_3,
      D => S_AXI_WDATA(8),
      Q => slv_reg11(8),
      R => p_0_in
    );
\slv_reg11_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg11_3,
      D => S_AXI_WDATA(9),
      Q => slv_reg11(9),
      R => p_0_in
    );
\slv_reg12[31]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00080000"
    )
        port map (
      I0 => axi_awaddr(5),
      I1 => \slv_reg0[18]_i_3_n_0\,
      I2 => axi_awaddr(2),
      I3 => axi_awaddr(3),
      I4 => axi_awaddr(4),
      O => slv_reg12_9
    );
\slv_reg12_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg12_9,
      D => S_AXI_WDATA(0),
      Q => slv_reg12(0),
      R => p_0_in
    );
\slv_reg12_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg12_9,
      D => S_AXI_WDATA(10),
      Q => slv_reg12(10),
      R => p_0_in
    );
\slv_reg12_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg12_9,
      D => S_AXI_WDATA(11),
      Q => slv_reg12(11),
      R => p_0_in
    );
\slv_reg12_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg12_9,
      D => S_AXI_WDATA(12),
      Q => slv_reg12(12),
      R => p_0_in
    );
\slv_reg12_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg12_9,
      D => S_AXI_WDATA(13),
      Q => slv_reg12(13),
      R => p_0_in
    );
\slv_reg12_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg12_9,
      D => S_AXI_WDATA(14),
      Q => slv_reg12(14),
      R => p_0_in
    );
\slv_reg12_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg12_9,
      D => S_AXI_WDATA(15),
      Q => slv_reg12(15),
      R => p_0_in
    );
\slv_reg12_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg12_9,
      D => S_AXI_WDATA(16),
      Q => slv_reg12(16),
      R => p_0_in
    );
\slv_reg12_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg12_9,
      D => S_AXI_WDATA(17),
      Q => slv_reg12(17),
      R => p_0_in
    );
\slv_reg12_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg12_9,
      D => S_AXI_WDATA(18),
      Q => slv_reg12(18),
      R => p_0_in
    );
\slv_reg12_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg12_9,
      D => S_AXI_WDATA(19),
      Q => slv_reg12(19),
      R => p_0_in
    );
\slv_reg12_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg12_9,
      D => S_AXI_WDATA(1),
      Q => slv_reg12(1),
      R => p_0_in
    );
\slv_reg12_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg12_9,
      D => S_AXI_WDATA(20),
      Q => slv_reg12(20),
      R => p_0_in
    );
\slv_reg12_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg12_9,
      D => S_AXI_WDATA(21),
      Q => slv_reg12(21),
      R => p_0_in
    );
\slv_reg12_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg12_9,
      D => S_AXI_WDATA(22),
      Q => slv_reg12(22),
      R => p_0_in
    );
\slv_reg12_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg12_9,
      D => S_AXI_WDATA(23),
      Q => slv_reg12(23),
      R => p_0_in
    );
\slv_reg12_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg12_9,
      D => S_AXI_WDATA(24),
      Q => slv_reg12(24),
      R => p_0_in
    );
\slv_reg12_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg12_9,
      D => S_AXI_WDATA(25),
      Q => slv_reg12(25),
      R => p_0_in
    );
\slv_reg12_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg12_9,
      D => S_AXI_WDATA(26),
      Q => slv_reg12(26),
      R => p_0_in
    );
\slv_reg12_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg12_9,
      D => S_AXI_WDATA(27),
      Q => slv_reg12(27),
      R => p_0_in
    );
\slv_reg12_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg12_9,
      D => S_AXI_WDATA(28),
      Q => slv_reg12(28),
      R => p_0_in
    );
\slv_reg12_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg12_9,
      D => S_AXI_WDATA(29),
      Q => slv_reg12(29),
      R => p_0_in
    );
\slv_reg12_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg12_9,
      D => S_AXI_WDATA(2),
      Q => slv_reg12(2),
      R => p_0_in
    );
\slv_reg12_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg12_9,
      D => S_AXI_WDATA(30),
      Q => slv_reg12(30),
      R => p_0_in
    );
\slv_reg12_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg12_9,
      D => S_AXI_WDATA(31),
      Q => slv_reg12(31),
      R => p_0_in
    );
\slv_reg12_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg12_9,
      D => S_AXI_WDATA(3),
      Q => slv_reg12(3),
      R => p_0_in
    );
\slv_reg12_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg12_9,
      D => S_AXI_WDATA(4),
      Q => slv_reg12(4),
      R => p_0_in
    );
\slv_reg12_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg12_9,
      D => S_AXI_WDATA(5),
      Q => slv_reg12(5),
      R => p_0_in
    );
\slv_reg12_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg12_9,
      D => S_AXI_WDATA(6),
      Q => slv_reg12(6),
      R => p_0_in
    );
\slv_reg12_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg12_9,
      D => S_AXI_WDATA(7),
      Q => slv_reg12(7),
      R => p_0_in
    );
\slv_reg12_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg12_9,
      D => S_AXI_WDATA(8),
      Q => slv_reg12(8),
      R => p_0_in
    );
\slv_reg12_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg12_9,
      D => S_AXI_WDATA(9),
      Q => slv_reg12(9),
      R => p_0_in
    );
\slv_reg13[31]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00800000"
    )
        port map (
      I0 => axi_awaddr(5),
      I1 => \slv_reg0[18]_i_3_n_0\,
      I2 => axi_awaddr(2),
      I3 => axi_awaddr(3),
      I4 => axi_awaddr(4),
      O => slv_reg13_2
    );
\slv_reg13_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg13_2,
      D => S_AXI_WDATA(0),
      Q => slv_reg13(0),
      R => p_0_in
    );
\slv_reg13_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg13_2,
      D => S_AXI_WDATA(10),
      Q => slv_reg13(10),
      R => p_0_in
    );
\slv_reg13_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg13_2,
      D => S_AXI_WDATA(11),
      Q => slv_reg13(11),
      R => p_0_in
    );
\slv_reg13_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg13_2,
      D => S_AXI_WDATA(12),
      Q => slv_reg13(12),
      R => p_0_in
    );
\slv_reg13_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg13_2,
      D => S_AXI_WDATA(13),
      Q => slv_reg13(13),
      R => p_0_in
    );
\slv_reg13_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg13_2,
      D => S_AXI_WDATA(14),
      Q => slv_reg13(14),
      R => p_0_in
    );
\slv_reg13_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg13_2,
      D => S_AXI_WDATA(15),
      Q => slv_reg13(15),
      R => p_0_in
    );
\slv_reg13_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg13_2,
      D => S_AXI_WDATA(16),
      Q => slv_reg13(16),
      R => p_0_in
    );
\slv_reg13_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg13_2,
      D => S_AXI_WDATA(17),
      Q => slv_reg13(17),
      R => p_0_in
    );
\slv_reg13_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg13_2,
      D => S_AXI_WDATA(18),
      Q => slv_reg13(18),
      R => p_0_in
    );
\slv_reg13_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg13_2,
      D => S_AXI_WDATA(19),
      Q => slv_reg13(19),
      R => p_0_in
    );
\slv_reg13_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg13_2,
      D => S_AXI_WDATA(1),
      Q => slv_reg13(1),
      R => p_0_in
    );
\slv_reg13_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg13_2,
      D => S_AXI_WDATA(20),
      Q => slv_reg13(20),
      R => p_0_in
    );
\slv_reg13_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg13_2,
      D => S_AXI_WDATA(21),
      Q => slv_reg13(21),
      R => p_0_in
    );
\slv_reg13_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg13_2,
      D => S_AXI_WDATA(22),
      Q => slv_reg13(22),
      R => p_0_in
    );
\slv_reg13_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg13_2,
      D => S_AXI_WDATA(23),
      Q => slv_reg13(23),
      R => p_0_in
    );
\slv_reg13_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg13_2,
      D => S_AXI_WDATA(24),
      Q => slv_reg13(24),
      R => p_0_in
    );
\slv_reg13_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg13_2,
      D => S_AXI_WDATA(25),
      Q => slv_reg13(25),
      R => p_0_in
    );
\slv_reg13_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg13_2,
      D => S_AXI_WDATA(26),
      Q => slv_reg13(26),
      R => p_0_in
    );
\slv_reg13_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg13_2,
      D => S_AXI_WDATA(27),
      Q => slv_reg13(27),
      R => p_0_in
    );
\slv_reg13_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg13_2,
      D => S_AXI_WDATA(28),
      Q => slv_reg13(28),
      R => p_0_in
    );
\slv_reg13_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg13_2,
      D => S_AXI_WDATA(29),
      Q => slv_reg13(29),
      R => p_0_in
    );
\slv_reg13_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg13_2,
      D => S_AXI_WDATA(2),
      Q => slv_reg13(2),
      R => p_0_in
    );
\slv_reg13_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg13_2,
      D => S_AXI_WDATA(30),
      Q => slv_reg13(30),
      R => p_0_in
    );
\slv_reg13_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg13_2,
      D => S_AXI_WDATA(31),
      Q => slv_reg13(31),
      R => p_0_in
    );
\slv_reg13_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg13_2,
      D => S_AXI_WDATA(3),
      Q => slv_reg13(3),
      R => p_0_in
    );
\slv_reg13_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg13_2,
      D => S_AXI_WDATA(4),
      Q => slv_reg13(4),
      R => p_0_in
    );
\slv_reg13_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg13_2,
      D => S_AXI_WDATA(5),
      Q => slv_reg13(5),
      R => p_0_in
    );
\slv_reg13_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg13_2,
      D => S_AXI_WDATA(6),
      Q => slv_reg13(6),
      R => p_0_in
    );
\slv_reg13_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg13_2,
      D => S_AXI_WDATA(7),
      Q => slv_reg13(7),
      R => p_0_in
    );
\slv_reg13_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg13_2,
      D => S_AXI_WDATA(8),
      Q => slv_reg13(8),
      R => p_0_in
    );
\slv_reg13_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg13_2,
      D => S_AXI_WDATA(9),
      Q => slv_reg13(9),
      R => p_0_in
    );
\slv_reg14[31]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"08000000"
    )
        port map (
      I0 => axi_awaddr(5),
      I1 => \slv_reg0[18]_i_3_n_0\,
      I2 => axi_awaddr(2),
      I3 => axi_awaddr(4),
      I4 => axi_awaddr(3),
      O => slv_reg14_8
    );
\slv_reg14_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg14_8,
      D => S_AXI_WDATA(0),
      Q => slv_reg14(0),
      R => p_0_in
    );
\slv_reg14_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg14_8,
      D => S_AXI_WDATA(10),
      Q => slv_reg14(10),
      R => p_0_in
    );
\slv_reg14_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg14_8,
      D => S_AXI_WDATA(11),
      Q => slv_reg14(11),
      R => p_0_in
    );
\slv_reg14_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg14_8,
      D => S_AXI_WDATA(12),
      Q => slv_reg14(12),
      R => p_0_in
    );
\slv_reg14_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg14_8,
      D => S_AXI_WDATA(13),
      Q => slv_reg14(13),
      R => p_0_in
    );
\slv_reg14_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg14_8,
      D => S_AXI_WDATA(14),
      Q => slv_reg14(14),
      R => p_0_in
    );
\slv_reg14_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg14_8,
      D => S_AXI_WDATA(15),
      Q => slv_reg14(15),
      R => p_0_in
    );
\slv_reg14_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg14_8,
      D => S_AXI_WDATA(16),
      Q => slv_reg14(16),
      R => p_0_in
    );
\slv_reg14_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg14_8,
      D => S_AXI_WDATA(17),
      Q => slv_reg14(17),
      R => p_0_in
    );
\slv_reg14_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg14_8,
      D => S_AXI_WDATA(18),
      Q => slv_reg14(18),
      R => p_0_in
    );
\slv_reg14_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg14_8,
      D => S_AXI_WDATA(19),
      Q => slv_reg14(19),
      R => p_0_in
    );
\slv_reg14_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg14_8,
      D => S_AXI_WDATA(1),
      Q => slv_reg14(1),
      R => p_0_in
    );
\slv_reg14_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg14_8,
      D => S_AXI_WDATA(20),
      Q => slv_reg14(20),
      R => p_0_in
    );
\slv_reg14_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg14_8,
      D => S_AXI_WDATA(21),
      Q => slv_reg14(21),
      R => p_0_in
    );
\slv_reg14_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg14_8,
      D => S_AXI_WDATA(22),
      Q => slv_reg14(22),
      R => p_0_in
    );
\slv_reg14_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg14_8,
      D => S_AXI_WDATA(23),
      Q => slv_reg14(23),
      R => p_0_in
    );
\slv_reg14_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg14_8,
      D => S_AXI_WDATA(24),
      Q => slv_reg14(24),
      R => p_0_in
    );
\slv_reg14_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg14_8,
      D => S_AXI_WDATA(25),
      Q => slv_reg14(25),
      R => p_0_in
    );
\slv_reg14_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg14_8,
      D => S_AXI_WDATA(26),
      Q => slv_reg14(26),
      R => p_0_in
    );
\slv_reg14_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg14_8,
      D => S_AXI_WDATA(27),
      Q => slv_reg14(27),
      R => p_0_in
    );
\slv_reg14_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg14_8,
      D => S_AXI_WDATA(28),
      Q => slv_reg14(28),
      R => p_0_in
    );
\slv_reg14_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg14_8,
      D => S_AXI_WDATA(29),
      Q => slv_reg14(29),
      R => p_0_in
    );
\slv_reg14_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg14_8,
      D => S_AXI_WDATA(2),
      Q => slv_reg14(2),
      R => p_0_in
    );
\slv_reg14_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg14_8,
      D => S_AXI_WDATA(30),
      Q => slv_reg14(30),
      R => p_0_in
    );
\slv_reg14_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg14_8,
      D => S_AXI_WDATA(31),
      Q => slv_reg14(31),
      R => p_0_in
    );
\slv_reg14_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg14_8,
      D => S_AXI_WDATA(3),
      Q => slv_reg14(3),
      R => p_0_in
    );
\slv_reg14_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg14_8,
      D => S_AXI_WDATA(4),
      Q => slv_reg14(4),
      R => p_0_in
    );
\slv_reg14_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg14_8,
      D => S_AXI_WDATA(5),
      Q => slv_reg14(5),
      R => p_0_in
    );
\slv_reg14_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg14_8,
      D => S_AXI_WDATA(6),
      Q => slv_reg14(6),
      R => p_0_in
    );
\slv_reg14_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg14_8,
      D => S_AXI_WDATA(7),
      Q => slv_reg14(7),
      R => p_0_in
    );
\slv_reg14_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg14_8,
      D => S_AXI_WDATA(8),
      Q => slv_reg14(8),
      R => p_0_in
    );
\slv_reg14_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg14_8,
      D => S_AXI_WDATA(9),
      Q => slv_reg14(9),
      R => p_0_in
    );
\slv_reg15[31]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => axi_awaddr(5),
      I1 => \slv_reg0[18]_i_3_n_0\,
      I2 => axi_awaddr(2),
      I3 => axi_awaddr(4),
      I4 => axi_awaddr(3),
      O => slv_reg15_1
    );
\slv_reg15_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg15_1,
      D => S_AXI_WDATA(0),
      Q => slv_reg15(0),
      R => p_0_in
    );
\slv_reg15_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg15_1,
      D => S_AXI_WDATA(10),
      Q => slv_reg15(10),
      R => p_0_in
    );
\slv_reg15_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg15_1,
      D => S_AXI_WDATA(11),
      Q => slv_reg15(11),
      R => p_0_in
    );
\slv_reg15_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg15_1,
      D => S_AXI_WDATA(12),
      Q => slv_reg15(12),
      R => p_0_in
    );
\slv_reg15_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg15_1,
      D => S_AXI_WDATA(13),
      Q => slv_reg15(13),
      R => p_0_in
    );
\slv_reg15_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg15_1,
      D => S_AXI_WDATA(14),
      Q => slv_reg15(14),
      R => p_0_in
    );
\slv_reg15_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg15_1,
      D => S_AXI_WDATA(15),
      Q => slv_reg15(15),
      R => p_0_in
    );
\slv_reg15_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg15_1,
      D => S_AXI_WDATA(16),
      Q => slv_reg15(16),
      R => p_0_in
    );
\slv_reg15_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg15_1,
      D => S_AXI_WDATA(17),
      Q => slv_reg15(17),
      R => p_0_in
    );
\slv_reg15_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg15_1,
      D => S_AXI_WDATA(18),
      Q => slv_reg15(18),
      R => p_0_in
    );
\slv_reg15_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg15_1,
      D => S_AXI_WDATA(19),
      Q => slv_reg15(19),
      R => p_0_in
    );
\slv_reg15_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg15_1,
      D => S_AXI_WDATA(1),
      Q => slv_reg15(1),
      R => p_0_in
    );
\slv_reg15_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg15_1,
      D => S_AXI_WDATA(20),
      Q => slv_reg15(20),
      R => p_0_in
    );
\slv_reg15_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg15_1,
      D => S_AXI_WDATA(21),
      Q => slv_reg15(21),
      R => p_0_in
    );
\slv_reg15_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg15_1,
      D => S_AXI_WDATA(22),
      Q => slv_reg15(22),
      R => p_0_in
    );
\slv_reg15_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg15_1,
      D => S_AXI_WDATA(23),
      Q => slv_reg15(23),
      R => p_0_in
    );
\slv_reg15_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg15_1,
      D => S_AXI_WDATA(24),
      Q => slv_reg15(24),
      R => p_0_in
    );
\slv_reg15_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg15_1,
      D => S_AXI_WDATA(25),
      Q => slv_reg15(25),
      R => p_0_in
    );
\slv_reg15_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg15_1,
      D => S_AXI_WDATA(26),
      Q => slv_reg15(26),
      R => p_0_in
    );
\slv_reg15_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg15_1,
      D => S_AXI_WDATA(27),
      Q => slv_reg15(27),
      R => p_0_in
    );
\slv_reg15_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg15_1,
      D => S_AXI_WDATA(28),
      Q => slv_reg15(28),
      R => p_0_in
    );
\slv_reg15_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg15_1,
      D => S_AXI_WDATA(29),
      Q => slv_reg15(29),
      R => p_0_in
    );
\slv_reg15_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg15_1,
      D => S_AXI_WDATA(2),
      Q => slv_reg15(2),
      R => p_0_in
    );
\slv_reg15_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg15_1,
      D => S_AXI_WDATA(30),
      Q => slv_reg15(30),
      R => p_0_in
    );
\slv_reg15_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg15_1,
      D => S_AXI_WDATA(31),
      Q => slv_reg15(31),
      R => p_0_in
    );
\slv_reg15_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg15_1,
      D => S_AXI_WDATA(3),
      Q => slv_reg15(3),
      R => p_0_in
    );
\slv_reg15_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg15_1,
      D => S_AXI_WDATA(4),
      Q => slv_reg15(4),
      R => p_0_in
    );
\slv_reg15_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg15_1,
      D => S_AXI_WDATA(5),
      Q => slv_reg15(5),
      R => p_0_in
    );
\slv_reg15_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg15_1,
      D => S_AXI_WDATA(6),
      Q => slv_reg15(6),
      R => p_0_in
    );
\slv_reg15_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg15_1,
      D => S_AXI_WDATA(7),
      Q => slv_reg15(7),
      R => p_0_in
    );
\slv_reg15_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg15_1,
      D => S_AXI_WDATA(8),
      Q => slv_reg15(8),
      R => p_0_in
    );
\slv_reg15_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg15_1,
      D => S_AXI_WDATA(9),
      Q => slv_reg15(9),
      R => p_0_in
    );
\slv_reg16[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000010000000000"
    )
        port map (
      I0 => axi_awaddr(3),
      I1 => axi_awaddr(4),
      I2 => axi_awaddr(5),
      I3 => axi_awaddr(6),
      I4 => axi_awaddr(2),
      I5 => \slv_reg16[31]_i_2_n_0\,
      O => slv_reg16_0
    );
\slv_reg16[31]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00008000"
    )
        port map (
      I0 => S_AXI_AWVALID,
      I1 => S_AXI_WVALID,
      I2 => \^s_axi_awready\,
      I3 => \^s_axi_wready\,
      I4 => axi_awaddr(7),
      O => \slv_reg16[31]_i_2_n_0\
    );
\slv_reg16_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg16_0,
      D => S_AXI_WDATA(0),
      Q => slv_reg16(0),
      R => p_0_in
    );
\slv_reg16_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg16_0,
      D => S_AXI_WDATA(10),
      Q => slv_reg16(10),
      R => p_0_in
    );
\slv_reg16_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg16_0,
      D => S_AXI_WDATA(11),
      Q => slv_reg16(11),
      R => p_0_in
    );
\slv_reg16_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg16_0,
      D => S_AXI_WDATA(12),
      Q => slv_reg16(12),
      R => p_0_in
    );
\slv_reg16_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg16_0,
      D => S_AXI_WDATA(13),
      Q => slv_reg16(13),
      R => p_0_in
    );
\slv_reg16_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg16_0,
      D => S_AXI_WDATA(14),
      Q => slv_reg16(14),
      R => p_0_in
    );
\slv_reg16_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg16_0,
      D => S_AXI_WDATA(15),
      Q => slv_reg16(15),
      R => p_0_in
    );
\slv_reg16_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg16_0,
      D => S_AXI_WDATA(16),
      Q => slv_reg16(16),
      R => p_0_in
    );
\slv_reg16_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg16_0,
      D => S_AXI_WDATA(17),
      Q => slv_reg16(17),
      R => p_0_in
    );
\slv_reg16_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg16_0,
      D => S_AXI_WDATA(18),
      Q => slv_reg16(18),
      R => p_0_in
    );
\slv_reg16_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg16_0,
      D => S_AXI_WDATA(19),
      Q => slv_reg16(19),
      R => p_0_in
    );
\slv_reg16_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg16_0,
      D => S_AXI_WDATA(1),
      Q => slv_reg16(1),
      R => p_0_in
    );
\slv_reg16_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg16_0,
      D => S_AXI_WDATA(20),
      Q => slv_reg16(20),
      R => p_0_in
    );
\slv_reg16_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg16_0,
      D => S_AXI_WDATA(21),
      Q => slv_reg16(21),
      R => p_0_in
    );
\slv_reg16_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg16_0,
      D => S_AXI_WDATA(22),
      Q => slv_reg16(22),
      R => p_0_in
    );
\slv_reg16_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg16_0,
      D => S_AXI_WDATA(23),
      Q => slv_reg16(23),
      R => p_0_in
    );
\slv_reg16_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg16_0,
      D => S_AXI_WDATA(24),
      Q => slv_reg16(24),
      R => p_0_in
    );
\slv_reg16_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg16_0,
      D => S_AXI_WDATA(25),
      Q => slv_reg16(25),
      R => p_0_in
    );
\slv_reg16_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg16_0,
      D => S_AXI_WDATA(26),
      Q => slv_reg16(26),
      R => p_0_in
    );
\slv_reg16_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg16_0,
      D => S_AXI_WDATA(27),
      Q => slv_reg16(27),
      R => p_0_in
    );
\slv_reg16_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg16_0,
      D => S_AXI_WDATA(28),
      Q => slv_reg16(28),
      R => p_0_in
    );
\slv_reg16_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg16_0,
      D => S_AXI_WDATA(29),
      Q => slv_reg16(29),
      R => p_0_in
    );
\slv_reg16_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg16_0,
      D => S_AXI_WDATA(2),
      Q => slv_reg16(2),
      R => p_0_in
    );
\slv_reg16_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg16_0,
      D => S_AXI_WDATA(30),
      Q => slv_reg16(30),
      R => p_0_in
    );
\slv_reg16_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg16_0,
      D => S_AXI_WDATA(31),
      Q => slv_reg16(31),
      R => p_0_in
    );
\slv_reg16_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg16_0,
      D => S_AXI_WDATA(3),
      Q => slv_reg16(3),
      R => p_0_in
    );
\slv_reg16_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg16_0,
      D => S_AXI_WDATA(4),
      Q => slv_reg16(4),
      R => p_0_in
    );
\slv_reg16_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg16_0,
      D => S_AXI_WDATA(5),
      Q => slv_reg16(5),
      R => p_0_in
    );
\slv_reg16_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg16_0,
      D => S_AXI_WDATA(6),
      Q => slv_reg16(6),
      R => p_0_in
    );
\slv_reg16_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg16_0,
      D => S_AXI_WDATA(7),
      Q => slv_reg16(7),
      R => p_0_in
    );
\slv_reg16_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg16_0,
      D => S_AXI_WDATA(8),
      Q => slv_reg16(8),
      R => p_0_in
    );
\slv_reg16_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg16_0,
      D => S_AXI_WDATA(9),
      Q => slv_reg16(9),
      R => p_0_in
    );
\slv_reg1[18]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000040"
    )
        port map (
      I0 => axi_awaddr(5),
      I1 => \slv_reg0[18]_i_3_n_0\,
      I2 => axi_awaddr(2),
      I3 => axi_awaddr(4),
      I4 => axi_awaddr(3),
      O => slv_reg1_7
    );
\slv_reg1_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg1_7,
      D => S_AXI_WDATA(0),
      Q => \^pwr_en\(0),
      R => p_0_in
    );
\slv_reg1_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg1_7,
      D => S_AXI_WDATA(10),
      Q => \^pwr_en\(10),
      R => p_0_in
    );
\slv_reg1_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg1_7,
      D => S_AXI_WDATA(11),
      Q => \^pwr_en\(11),
      R => p_0_in
    );
\slv_reg1_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg1_7,
      D => S_AXI_WDATA(12),
      Q => \^pwr_en\(12),
      R => p_0_in
    );
\slv_reg1_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg1_7,
      D => S_AXI_WDATA(13),
      Q => \^pwr_en\(13),
      R => p_0_in
    );
\slv_reg1_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg1_7,
      D => S_AXI_WDATA(14),
      Q => \^pwr_en\(14),
      R => p_0_in
    );
\slv_reg1_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg1_7,
      D => S_AXI_WDATA(15),
      Q => \^pwr_en\(15),
      R => p_0_in
    );
\slv_reg1_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg1_7,
      D => S_AXI_WDATA(16),
      Q => \^pwr_en\(16),
      R => p_0_in
    );
\slv_reg1_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg1_7,
      D => S_AXI_WDATA(17),
      Q => \^pwr_en\(17),
      R => p_0_in
    );
\slv_reg1_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg1_7,
      D => S_AXI_WDATA(18),
      Q => \^pwr_en\(18),
      R => p_0_in
    );
\slv_reg1_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg1_7,
      D => S_AXI_WDATA(19),
      Q => slv_reg1(19),
      R => p_0_in
    );
\slv_reg1_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg1_7,
      D => S_AXI_WDATA(1),
      Q => \^pwr_en\(1),
      R => p_0_in
    );
\slv_reg1_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg1_7,
      D => S_AXI_WDATA(20),
      Q => slv_reg1(20),
      R => p_0_in
    );
\slv_reg1_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg1_7,
      D => S_AXI_WDATA(21),
      Q => slv_reg1(21),
      R => p_0_in
    );
\slv_reg1_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg1_7,
      D => S_AXI_WDATA(22),
      Q => slv_reg1(22),
      R => p_0_in
    );
\slv_reg1_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg1_7,
      D => S_AXI_WDATA(23),
      Q => slv_reg1(23),
      R => p_0_in
    );
\slv_reg1_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg1_7,
      D => S_AXI_WDATA(24),
      Q => slv_reg1(24),
      R => p_0_in
    );
\slv_reg1_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg1_7,
      D => S_AXI_WDATA(25),
      Q => slv_reg1(25),
      R => p_0_in
    );
\slv_reg1_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg1_7,
      D => S_AXI_WDATA(26),
      Q => slv_reg1(26),
      R => p_0_in
    );
\slv_reg1_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg1_7,
      D => S_AXI_WDATA(27),
      Q => slv_reg1(27),
      R => p_0_in
    );
\slv_reg1_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg1_7,
      D => S_AXI_WDATA(28),
      Q => slv_reg1(28),
      R => p_0_in
    );
\slv_reg1_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg1_7,
      D => S_AXI_WDATA(29),
      Q => slv_reg1(29),
      R => p_0_in
    );
\slv_reg1_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg1_7,
      D => S_AXI_WDATA(2),
      Q => \^pwr_en\(2),
      R => p_0_in
    );
\slv_reg1_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg1_7,
      D => S_AXI_WDATA(30),
      Q => slv_reg1(30),
      R => p_0_in
    );
\slv_reg1_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg1_7,
      D => S_AXI_WDATA(31),
      Q => slv_reg1(31),
      R => p_0_in
    );
\slv_reg1_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg1_7,
      D => S_AXI_WDATA(3),
      Q => \^pwr_en\(3),
      R => p_0_in
    );
\slv_reg1_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg1_7,
      D => S_AXI_WDATA(4),
      Q => \^pwr_en\(4),
      R => p_0_in
    );
\slv_reg1_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg1_7,
      D => S_AXI_WDATA(5),
      Q => \^pwr_en\(5),
      R => p_0_in
    );
\slv_reg1_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg1_7,
      D => S_AXI_WDATA(6),
      Q => \^pwr_en\(6),
      R => p_0_in
    );
\slv_reg1_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg1_7,
      D => S_AXI_WDATA(7),
      Q => \^pwr_en\(7),
      R => p_0_in
    );
\slv_reg1_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg1_7,
      D => S_AXI_WDATA(8),
      Q => \^pwr_en\(8),
      R => p_0_in
    );
\slv_reg1_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg1_7,
      D => S_AXI_WDATA(9),
      Q => \^pwr_en\(9),
      R => p_0_in
    );
\slv_reg3[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"02000000"
    )
        port map (
      I0 => axi_awaddr(3),
      I1 => axi_awaddr(4),
      I2 => axi_awaddr(5),
      I3 => \slv_reg0[18]_i_3_n_0\,
      I4 => axi_awaddr(2),
      O => \slv_reg3[10]_i_1_n_0\
    );
\slv_reg3_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \slv_reg3[10]_i_1_n_0\,
      D => S_AXI_WDATA(10),
      Q => \^clock_register_out\(3),
      R => p_0_in
    );
\slv_reg3_reg[6]\: unisim.vcomponents.FDSE
     port map (
      C => S_AXI_ACLK,
      CE => \slv_reg3[10]_i_1_n_0\,
      D => S_AXI_WDATA(6),
      Q => \^clock_register_out\(0),
      S => p_0_in
    );
\slv_reg3_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => \slv_reg3[10]_i_1_n_0\,
      D => S_AXI_WDATA(7),
      Q => \^clock_register_out\(1),
      R => p_0_in
    );
\slv_reg3_reg[9]\: unisim.vcomponents.FDSE
     port map (
      C => S_AXI_ACLK,
      CE => \slv_reg3[10]_i_1_n_0\,
      D => S_AXI_WDATA(9),
      Q => \^clock_register_out\(2),
      S => p_0_in
    );
\slv_reg4[31]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00040000"
    )
        port map (
      I0 => axi_awaddr(5),
      I1 => axi_awaddr(4),
      I2 => axi_awaddr(3),
      I3 => axi_awaddr(2),
      I4 => \slv_reg0[18]_i_3_n_0\,
      O => slv_reg4_13
    );
\slv_reg4_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg4_13,
      D => S_AXI_WDATA(0),
      Q => slv_reg4(0),
      R => p_0_in
    );
\slv_reg4_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg4_13,
      D => S_AXI_WDATA(10),
      Q => slv_reg4(10),
      R => p_0_in
    );
\slv_reg4_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg4_13,
      D => S_AXI_WDATA(11),
      Q => slv_reg4(11),
      R => p_0_in
    );
\slv_reg4_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg4_13,
      D => S_AXI_WDATA(12),
      Q => slv_reg4(12),
      R => p_0_in
    );
\slv_reg4_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg4_13,
      D => S_AXI_WDATA(13),
      Q => slv_reg4(13),
      R => p_0_in
    );
\slv_reg4_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg4_13,
      D => S_AXI_WDATA(14),
      Q => slv_reg4(14),
      R => p_0_in
    );
\slv_reg4_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg4_13,
      D => S_AXI_WDATA(15),
      Q => slv_reg4(15),
      R => p_0_in
    );
\slv_reg4_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg4_13,
      D => S_AXI_WDATA(16),
      Q => slv_reg4(16),
      R => p_0_in
    );
\slv_reg4_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg4_13,
      D => S_AXI_WDATA(17),
      Q => slv_reg4(17),
      R => p_0_in
    );
\slv_reg4_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg4_13,
      D => S_AXI_WDATA(18),
      Q => slv_reg4(18),
      R => p_0_in
    );
\slv_reg4_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg4_13,
      D => S_AXI_WDATA(19),
      Q => slv_reg4(19),
      R => p_0_in
    );
\slv_reg4_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg4_13,
      D => S_AXI_WDATA(1),
      Q => slv_reg4(1),
      R => p_0_in
    );
\slv_reg4_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg4_13,
      D => S_AXI_WDATA(20),
      Q => slv_reg4(20),
      R => p_0_in
    );
\slv_reg4_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg4_13,
      D => S_AXI_WDATA(21),
      Q => slv_reg4(21),
      R => p_0_in
    );
\slv_reg4_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg4_13,
      D => S_AXI_WDATA(22),
      Q => slv_reg4(22),
      R => p_0_in
    );
\slv_reg4_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg4_13,
      D => S_AXI_WDATA(23),
      Q => slv_reg4(23),
      R => p_0_in
    );
\slv_reg4_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg4_13,
      D => S_AXI_WDATA(24),
      Q => slv_reg4(24),
      R => p_0_in
    );
\slv_reg4_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg4_13,
      D => S_AXI_WDATA(25),
      Q => slv_reg4(25),
      R => p_0_in
    );
\slv_reg4_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg4_13,
      D => S_AXI_WDATA(26),
      Q => slv_reg4(26),
      R => p_0_in
    );
\slv_reg4_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg4_13,
      D => S_AXI_WDATA(27),
      Q => slv_reg4(27),
      R => p_0_in
    );
\slv_reg4_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg4_13,
      D => S_AXI_WDATA(28),
      Q => slv_reg4(28),
      R => p_0_in
    );
\slv_reg4_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg4_13,
      D => S_AXI_WDATA(29),
      Q => slv_reg4(29),
      R => p_0_in
    );
\slv_reg4_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg4_13,
      D => S_AXI_WDATA(2),
      Q => slv_reg4(2),
      R => p_0_in
    );
\slv_reg4_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg4_13,
      D => S_AXI_WDATA(30),
      Q => slv_reg4(30),
      R => p_0_in
    );
\slv_reg4_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg4_13,
      D => S_AXI_WDATA(31),
      Q => slv_reg4(31),
      R => p_0_in
    );
\slv_reg4_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg4_13,
      D => S_AXI_WDATA(3),
      Q => slv_reg4(3),
      R => p_0_in
    );
\slv_reg4_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg4_13,
      D => S_AXI_WDATA(4),
      Q => slv_reg4(4),
      R => p_0_in
    );
\slv_reg4_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg4_13,
      D => S_AXI_WDATA(5),
      Q => slv_reg4(5),
      R => p_0_in
    );
\slv_reg4_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg4_13,
      D => S_AXI_WDATA(6),
      Q => slv_reg4(6),
      R => p_0_in
    );
\slv_reg4_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg4_13,
      D => S_AXI_WDATA(7),
      Q => slv_reg4(7),
      R => p_0_in
    );
\slv_reg4_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg4_13,
      D => S_AXI_WDATA(8),
      Q => slv_reg4(8),
      R => p_0_in
    );
\slv_reg4_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg4_13,
      D => S_AXI_WDATA(9),
      Q => slv_reg4(9),
      R => p_0_in
    );
\slv_reg5[31]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00400000"
    )
        port map (
      I0 => axi_awaddr(5),
      I1 => \slv_reg0[18]_i_3_n_0\,
      I2 => axi_awaddr(2),
      I3 => axi_awaddr(3),
      I4 => axi_awaddr(4),
      O => slv_reg5_6
    );
\slv_reg5_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg5_6,
      D => S_AXI_WDATA(0),
      Q => slv_reg5(0),
      R => p_0_in
    );
\slv_reg5_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg5_6,
      D => S_AXI_WDATA(10),
      Q => slv_reg5(10),
      R => p_0_in
    );
\slv_reg5_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg5_6,
      D => S_AXI_WDATA(11),
      Q => slv_reg5(11),
      R => p_0_in
    );
\slv_reg5_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg5_6,
      D => S_AXI_WDATA(12),
      Q => slv_reg5(12),
      R => p_0_in
    );
\slv_reg5_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg5_6,
      D => S_AXI_WDATA(13),
      Q => slv_reg5(13),
      R => p_0_in
    );
\slv_reg5_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg5_6,
      D => S_AXI_WDATA(14),
      Q => slv_reg5(14),
      R => p_0_in
    );
\slv_reg5_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg5_6,
      D => S_AXI_WDATA(15),
      Q => slv_reg5(15),
      R => p_0_in
    );
\slv_reg5_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg5_6,
      D => S_AXI_WDATA(16),
      Q => slv_reg5(16),
      R => p_0_in
    );
\slv_reg5_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg5_6,
      D => S_AXI_WDATA(17),
      Q => slv_reg5(17),
      R => p_0_in
    );
\slv_reg5_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg5_6,
      D => S_AXI_WDATA(18),
      Q => slv_reg5(18),
      R => p_0_in
    );
\slv_reg5_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg5_6,
      D => S_AXI_WDATA(19),
      Q => slv_reg5(19),
      R => p_0_in
    );
\slv_reg5_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg5_6,
      D => S_AXI_WDATA(1),
      Q => slv_reg5(1),
      R => p_0_in
    );
\slv_reg5_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg5_6,
      D => S_AXI_WDATA(20),
      Q => slv_reg5(20),
      R => p_0_in
    );
\slv_reg5_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg5_6,
      D => S_AXI_WDATA(21),
      Q => slv_reg5(21),
      R => p_0_in
    );
\slv_reg5_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg5_6,
      D => S_AXI_WDATA(22),
      Q => slv_reg5(22),
      R => p_0_in
    );
\slv_reg5_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg5_6,
      D => S_AXI_WDATA(23),
      Q => slv_reg5(23),
      R => p_0_in
    );
\slv_reg5_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg5_6,
      D => S_AXI_WDATA(24),
      Q => slv_reg5(24),
      R => p_0_in
    );
\slv_reg5_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg5_6,
      D => S_AXI_WDATA(25),
      Q => slv_reg5(25),
      R => p_0_in
    );
\slv_reg5_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg5_6,
      D => S_AXI_WDATA(26),
      Q => slv_reg5(26),
      R => p_0_in
    );
\slv_reg5_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg5_6,
      D => S_AXI_WDATA(27),
      Q => slv_reg5(27),
      R => p_0_in
    );
\slv_reg5_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg5_6,
      D => S_AXI_WDATA(28),
      Q => slv_reg5(28),
      R => p_0_in
    );
\slv_reg5_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg5_6,
      D => S_AXI_WDATA(29),
      Q => slv_reg5(29),
      R => p_0_in
    );
\slv_reg5_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg5_6,
      D => S_AXI_WDATA(2),
      Q => slv_reg5(2),
      R => p_0_in
    );
\slv_reg5_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg5_6,
      D => S_AXI_WDATA(30),
      Q => slv_reg5(30),
      R => p_0_in
    );
\slv_reg5_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg5_6,
      D => S_AXI_WDATA(31),
      Q => slv_reg5(31),
      R => p_0_in
    );
\slv_reg5_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg5_6,
      D => S_AXI_WDATA(3),
      Q => slv_reg5(3),
      R => p_0_in
    );
\slv_reg5_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg5_6,
      D => S_AXI_WDATA(4),
      Q => slv_reg5(4),
      R => p_0_in
    );
\slv_reg5_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg5_6,
      D => S_AXI_WDATA(5),
      Q => slv_reg5(5),
      R => p_0_in
    );
\slv_reg5_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg5_6,
      D => S_AXI_WDATA(6),
      Q => slv_reg5(6),
      R => p_0_in
    );
\slv_reg5_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg5_6,
      D => S_AXI_WDATA(7),
      Q => slv_reg5(7),
      R => p_0_in
    );
\slv_reg5_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg5_6,
      D => S_AXI_WDATA(8),
      Q => slv_reg5(8),
      R => p_0_in
    );
\slv_reg5_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg5_6,
      D => S_AXI_WDATA(9),
      Q => slv_reg5(9),
      R => p_0_in
    );
\slv_reg6[31]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00400000"
    )
        port map (
      I0 => axi_awaddr(5),
      I1 => axi_awaddr(3),
      I2 => axi_awaddr(4),
      I3 => axi_awaddr(2),
      I4 => \slv_reg0[18]_i_3_n_0\,
      O => slv_reg6_12
    );
\slv_reg6_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg6_12,
      D => S_AXI_WDATA(0),
      Q => slv_reg6(0),
      R => p_0_in
    );
\slv_reg6_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg6_12,
      D => S_AXI_WDATA(10),
      Q => slv_reg6(10),
      R => p_0_in
    );
\slv_reg6_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg6_12,
      D => S_AXI_WDATA(11),
      Q => slv_reg6(11),
      R => p_0_in
    );
\slv_reg6_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg6_12,
      D => S_AXI_WDATA(12),
      Q => slv_reg6(12),
      R => p_0_in
    );
\slv_reg6_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg6_12,
      D => S_AXI_WDATA(13),
      Q => slv_reg6(13),
      R => p_0_in
    );
\slv_reg6_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg6_12,
      D => S_AXI_WDATA(14),
      Q => slv_reg6(14),
      R => p_0_in
    );
\slv_reg6_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg6_12,
      D => S_AXI_WDATA(15),
      Q => slv_reg6(15),
      R => p_0_in
    );
\slv_reg6_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg6_12,
      D => S_AXI_WDATA(16),
      Q => slv_reg6(16),
      R => p_0_in
    );
\slv_reg6_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg6_12,
      D => S_AXI_WDATA(17),
      Q => slv_reg6(17),
      R => p_0_in
    );
\slv_reg6_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg6_12,
      D => S_AXI_WDATA(18),
      Q => slv_reg6(18),
      R => p_0_in
    );
\slv_reg6_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg6_12,
      D => S_AXI_WDATA(19),
      Q => slv_reg6(19),
      R => p_0_in
    );
\slv_reg6_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg6_12,
      D => S_AXI_WDATA(1),
      Q => slv_reg6(1),
      R => p_0_in
    );
\slv_reg6_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg6_12,
      D => S_AXI_WDATA(20),
      Q => slv_reg6(20),
      R => p_0_in
    );
\slv_reg6_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg6_12,
      D => S_AXI_WDATA(21),
      Q => slv_reg6(21),
      R => p_0_in
    );
\slv_reg6_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg6_12,
      D => S_AXI_WDATA(22),
      Q => slv_reg6(22),
      R => p_0_in
    );
\slv_reg6_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg6_12,
      D => S_AXI_WDATA(23),
      Q => slv_reg6(23),
      R => p_0_in
    );
\slv_reg6_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg6_12,
      D => S_AXI_WDATA(24),
      Q => slv_reg6(24),
      R => p_0_in
    );
\slv_reg6_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg6_12,
      D => S_AXI_WDATA(25),
      Q => slv_reg6(25),
      R => p_0_in
    );
\slv_reg6_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg6_12,
      D => S_AXI_WDATA(26),
      Q => slv_reg6(26),
      R => p_0_in
    );
\slv_reg6_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg6_12,
      D => S_AXI_WDATA(27),
      Q => slv_reg6(27),
      R => p_0_in
    );
\slv_reg6_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg6_12,
      D => S_AXI_WDATA(28),
      Q => slv_reg6(28),
      R => p_0_in
    );
\slv_reg6_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg6_12,
      D => S_AXI_WDATA(29),
      Q => slv_reg6(29),
      R => p_0_in
    );
\slv_reg6_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg6_12,
      D => S_AXI_WDATA(2),
      Q => slv_reg6(2),
      R => p_0_in
    );
\slv_reg6_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg6_12,
      D => S_AXI_WDATA(30),
      Q => slv_reg6(30),
      R => p_0_in
    );
\slv_reg6_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg6_12,
      D => S_AXI_WDATA(31),
      Q => slv_reg6(31),
      R => p_0_in
    );
\slv_reg6_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg6_12,
      D => S_AXI_WDATA(3),
      Q => slv_reg6(3),
      R => p_0_in
    );
\slv_reg6_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg6_12,
      D => S_AXI_WDATA(4),
      Q => slv_reg6(4),
      R => p_0_in
    );
\slv_reg6_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg6_12,
      D => S_AXI_WDATA(5),
      Q => slv_reg6(5),
      R => p_0_in
    );
\slv_reg6_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg6_12,
      D => S_AXI_WDATA(6),
      Q => slv_reg6(6),
      R => p_0_in
    );
\slv_reg6_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg6_12,
      D => S_AXI_WDATA(7),
      Q => slv_reg6(7),
      R => p_0_in
    );
\slv_reg6_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg6_12,
      D => S_AXI_WDATA(8),
      Q => slv_reg6(8),
      R => p_0_in
    );
\slv_reg6_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg6_12,
      D => S_AXI_WDATA(9),
      Q => slv_reg6(9),
      R => p_0_in
    );
\slv_reg7[31]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40000000"
    )
        port map (
      I0 => axi_awaddr(5),
      I1 => \slv_reg0[18]_i_3_n_0\,
      I2 => axi_awaddr(2),
      I3 => axi_awaddr(4),
      I4 => axi_awaddr(3),
      O => slv_reg7_5
    );
\slv_reg7_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg7_5,
      D => S_AXI_WDATA(0),
      Q => slv_reg7(0),
      R => p_0_in
    );
\slv_reg7_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg7_5,
      D => S_AXI_WDATA(10),
      Q => slv_reg7(10),
      R => p_0_in
    );
\slv_reg7_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg7_5,
      D => S_AXI_WDATA(11),
      Q => slv_reg7(11),
      R => p_0_in
    );
\slv_reg7_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg7_5,
      D => S_AXI_WDATA(12),
      Q => slv_reg7(12),
      R => p_0_in
    );
\slv_reg7_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg7_5,
      D => S_AXI_WDATA(13),
      Q => slv_reg7(13),
      R => p_0_in
    );
\slv_reg7_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg7_5,
      D => S_AXI_WDATA(14),
      Q => slv_reg7(14),
      R => p_0_in
    );
\slv_reg7_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg7_5,
      D => S_AXI_WDATA(15),
      Q => slv_reg7(15),
      R => p_0_in
    );
\slv_reg7_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg7_5,
      D => S_AXI_WDATA(16),
      Q => slv_reg7(16),
      R => p_0_in
    );
\slv_reg7_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg7_5,
      D => S_AXI_WDATA(17),
      Q => slv_reg7(17),
      R => p_0_in
    );
\slv_reg7_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg7_5,
      D => S_AXI_WDATA(18),
      Q => slv_reg7(18),
      R => p_0_in
    );
\slv_reg7_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg7_5,
      D => S_AXI_WDATA(19),
      Q => slv_reg7(19),
      R => p_0_in
    );
\slv_reg7_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg7_5,
      D => S_AXI_WDATA(1),
      Q => slv_reg7(1),
      R => p_0_in
    );
\slv_reg7_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg7_5,
      D => S_AXI_WDATA(20),
      Q => slv_reg7(20),
      R => p_0_in
    );
\slv_reg7_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg7_5,
      D => S_AXI_WDATA(21),
      Q => slv_reg7(21),
      R => p_0_in
    );
\slv_reg7_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg7_5,
      D => S_AXI_WDATA(22),
      Q => slv_reg7(22),
      R => p_0_in
    );
\slv_reg7_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg7_5,
      D => S_AXI_WDATA(23),
      Q => slv_reg7(23),
      R => p_0_in
    );
\slv_reg7_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg7_5,
      D => S_AXI_WDATA(24),
      Q => slv_reg7(24),
      R => p_0_in
    );
\slv_reg7_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg7_5,
      D => S_AXI_WDATA(25),
      Q => slv_reg7(25),
      R => p_0_in
    );
\slv_reg7_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg7_5,
      D => S_AXI_WDATA(26),
      Q => slv_reg7(26),
      R => p_0_in
    );
\slv_reg7_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg7_5,
      D => S_AXI_WDATA(27),
      Q => slv_reg7(27),
      R => p_0_in
    );
\slv_reg7_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg7_5,
      D => S_AXI_WDATA(28),
      Q => slv_reg7(28),
      R => p_0_in
    );
\slv_reg7_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg7_5,
      D => S_AXI_WDATA(29),
      Q => slv_reg7(29),
      R => p_0_in
    );
\slv_reg7_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg7_5,
      D => S_AXI_WDATA(2),
      Q => slv_reg7(2),
      R => p_0_in
    );
\slv_reg7_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg7_5,
      D => S_AXI_WDATA(30),
      Q => slv_reg7(30),
      R => p_0_in
    );
\slv_reg7_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg7_5,
      D => S_AXI_WDATA(31),
      Q => slv_reg7(31),
      R => p_0_in
    );
\slv_reg7_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg7_5,
      D => S_AXI_WDATA(3),
      Q => slv_reg7(3),
      R => p_0_in
    );
\slv_reg7_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg7_5,
      D => S_AXI_WDATA(4),
      Q => slv_reg7(4),
      R => p_0_in
    );
\slv_reg7_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg7_5,
      D => S_AXI_WDATA(5),
      Q => slv_reg7(5),
      R => p_0_in
    );
\slv_reg7_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg7_5,
      D => S_AXI_WDATA(6),
      Q => slv_reg7(6),
      R => p_0_in
    );
\slv_reg7_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg7_5,
      D => S_AXI_WDATA(7),
      Q => slv_reg7(7),
      R => p_0_in
    );
\slv_reg7_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg7_5,
      D => S_AXI_WDATA(8),
      Q => slv_reg7(8),
      R => p_0_in
    );
\slv_reg7_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg7_5,
      D => S_AXI_WDATA(9),
      Q => slv_reg7(9),
      R => p_0_in
    );
\slv_reg8[31]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000008"
    )
        port map (
      I0 => axi_awaddr(5),
      I1 => \slv_reg0[18]_i_3_n_0\,
      I2 => axi_awaddr(2),
      I3 => axi_awaddr(4),
      I4 => axi_awaddr(3),
      O => slv_reg8_11
    );
\slv_reg8_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg8_11,
      D => S_AXI_WDATA(0),
      Q => slv_reg8(0),
      R => p_0_in
    );
\slv_reg8_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg8_11,
      D => S_AXI_WDATA(10),
      Q => slv_reg8(10),
      R => p_0_in
    );
\slv_reg8_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg8_11,
      D => S_AXI_WDATA(11),
      Q => slv_reg8(11),
      R => p_0_in
    );
\slv_reg8_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg8_11,
      D => S_AXI_WDATA(12),
      Q => slv_reg8(12),
      R => p_0_in
    );
\slv_reg8_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg8_11,
      D => S_AXI_WDATA(13),
      Q => slv_reg8(13),
      R => p_0_in
    );
\slv_reg8_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg8_11,
      D => S_AXI_WDATA(14),
      Q => slv_reg8(14),
      R => p_0_in
    );
\slv_reg8_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg8_11,
      D => S_AXI_WDATA(15),
      Q => slv_reg8(15),
      R => p_0_in
    );
\slv_reg8_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg8_11,
      D => S_AXI_WDATA(16),
      Q => slv_reg8(16),
      R => p_0_in
    );
\slv_reg8_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg8_11,
      D => S_AXI_WDATA(17),
      Q => slv_reg8(17),
      R => p_0_in
    );
\slv_reg8_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg8_11,
      D => S_AXI_WDATA(18),
      Q => slv_reg8(18),
      R => p_0_in
    );
\slv_reg8_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg8_11,
      D => S_AXI_WDATA(19),
      Q => slv_reg8(19),
      R => p_0_in
    );
\slv_reg8_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg8_11,
      D => S_AXI_WDATA(1),
      Q => slv_reg8(1),
      R => p_0_in
    );
\slv_reg8_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg8_11,
      D => S_AXI_WDATA(20),
      Q => slv_reg8(20),
      R => p_0_in
    );
\slv_reg8_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg8_11,
      D => S_AXI_WDATA(21),
      Q => slv_reg8(21),
      R => p_0_in
    );
\slv_reg8_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg8_11,
      D => S_AXI_WDATA(22),
      Q => slv_reg8(22),
      R => p_0_in
    );
\slv_reg8_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg8_11,
      D => S_AXI_WDATA(23),
      Q => slv_reg8(23),
      R => p_0_in
    );
\slv_reg8_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg8_11,
      D => S_AXI_WDATA(24),
      Q => slv_reg8(24),
      R => p_0_in
    );
\slv_reg8_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg8_11,
      D => S_AXI_WDATA(25),
      Q => slv_reg8(25),
      R => p_0_in
    );
\slv_reg8_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg8_11,
      D => S_AXI_WDATA(26),
      Q => slv_reg8(26),
      R => p_0_in
    );
\slv_reg8_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg8_11,
      D => S_AXI_WDATA(27),
      Q => slv_reg8(27),
      R => p_0_in
    );
\slv_reg8_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg8_11,
      D => S_AXI_WDATA(28),
      Q => slv_reg8(28),
      R => p_0_in
    );
\slv_reg8_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg8_11,
      D => S_AXI_WDATA(29),
      Q => slv_reg8(29),
      R => p_0_in
    );
\slv_reg8_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg8_11,
      D => S_AXI_WDATA(2),
      Q => slv_reg8(2),
      R => p_0_in
    );
\slv_reg8_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg8_11,
      D => S_AXI_WDATA(30),
      Q => slv_reg8(30),
      R => p_0_in
    );
\slv_reg8_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg8_11,
      D => S_AXI_WDATA(31),
      Q => slv_reg8(31),
      R => p_0_in
    );
\slv_reg8_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg8_11,
      D => S_AXI_WDATA(3),
      Q => slv_reg8(3),
      R => p_0_in
    );
\slv_reg8_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg8_11,
      D => S_AXI_WDATA(4),
      Q => slv_reg8(4),
      R => p_0_in
    );
\slv_reg8_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg8_11,
      D => S_AXI_WDATA(5),
      Q => slv_reg8(5),
      R => p_0_in
    );
\slv_reg8_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg8_11,
      D => S_AXI_WDATA(6),
      Q => slv_reg8(6),
      R => p_0_in
    );
\slv_reg8_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg8_11,
      D => S_AXI_WDATA(7),
      Q => slv_reg8(7),
      R => p_0_in
    );
\slv_reg8_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg8_11,
      D => S_AXI_WDATA(8),
      Q => slv_reg8(8),
      R => p_0_in
    );
\slv_reg8_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg8_11,
      D => S_AXI_WDATA(9),
      Q => slv_reg8(9),
      R => p_0_in
    );
\slv_reg9[31]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000080"
    )
        port map (
      I0 => axi_awaddr(5),
      I1 => \slv_reg0[18]_i_3_n_0\,
      I2 => axi_awaddr(2),
      I3 => axi_awaddr(4),
      I4 => axi_awaddr(3),
      O => slv_reg9_4
    );
\slv_reg9_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg9_4,
      D => S_AXI_WDATA(0),
      Q => slv_reg9(0),
      R => p_0_in
    );
\slv_reg9_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg9_4,
      D => S_AXI_WDATA(10),
      Q => slv_reg9(10),
      R => p_0_in
    );
\slv_reg9_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg9_4,
      D => S_AXI_WDATA(11),
      Q => slv_reg9(11),
      R => p_0_in
    );
\slv_reg9_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg9_4,
      D => S_AXI_WDATA(12),
      Q => slv_reg9(12),
      R => p_0_in
    );
\slv_reg9_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg9_4,
      D => S_AXI_WDATA(13),
      Q => slv_reg9(13),
      R => p_0_in
    );
\slv_reg9_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg9_4,
      D => S_AXI_WDATA(14),
      Q => slv_reg9(14),
      R => p_0_in
    );
\slv_reg9_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg9_4,
      D => S_AXI_WDATA(15),
      Q => slv_reg9(15),
      R => p_0_in
    );
\slv_reg9_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg9_4,
      D => S_AXI_WDATA(16),
      Q => slv_reg9(16),
      R => p_0_in
    );
\slv_reg9_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg9_4,
      D => S_AXI_WDATA(17),
      Q => slv_reg9(17),
      R => p_0_in
    );
\slv_reg9_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg9_4,
      D => S_AXI_WDATA(18),
      Q => slv_reg9(18),
      R => p_0_in
    );
\slv_reg9_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg9_4,
      D => S_AXI_WDATA(19),
      Q => slv_reg9(19),
      R => p_0_in
    );
\slv_reg9_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg9_4,
      D => S_AXI_WDATA(1),
      Q => slv_reg9(1),
      R => p_0_in
    );
\slv_reg9_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg9_4,
      D => S_AXI_WDATA(20),
      Q => slv_reg9(20),
      R => p_0_in
    );
\slv_reg9_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg9_4,
      D => S_AXI_WDATA(21),
      Q => slv_reg9(21),
      R => p_0_in
    );
\slv_reg9_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg9_4,
      D => S_AXI_WDATA(22),
      Q => slv_reg9(22),
      R => p_0_in
    );
\slv_reg9_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg9_4,
      D => S_AXI_WDATA(23),
      Q => slv_reg9(23),
      R => p_0_in
    );
\slv_reg9_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg9_4,
      D => S_AXI_WDATA(24),
      Q => slv_reg9(24),
      R => p_0_in
    );
\slv_reg9_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg9_4,
      D => S_AXI_WDATA(25),
      Q => slv_reg9(25),
      R => p_0_in
    );
\slv_reg9_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg9_4,
      D => S_AXI_WDATA(26),
      Q => slv_reg9(26),
      R => p_0_in
    );
\slv_reg9_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg9_4,
      D => S_AXI_WDATA(27),
      Q => slv_reg9(27),
      R => p_0_in
    );
\slv_reg9_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg9_4,
      D => S_AXI_WDATA(28),
      Q => slv_reg9(28),
      R => p_0_in
    );
\slv_reg9_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg9_4,
      D => S_AXI_WDATA(29),
      Q => slv_reg9(29),
      R => p_0_in
    );
\slv_reg9_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg9_4,
      D => S_AXI_WDATA(2),
      Q => slv_reg9(2),
      R => p_0_in
    );
\slv_reg9_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg9_4,
      D => S_AXI_WDATA(30),
      Q => slv_reg9(30),
      R => p_0_in
    );
\slv_reg9_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg9_4,
      D => S_AXI_WDATA(31),
      Q => slv_reg9(31),
      R => p_0_in
    );
\slv_reg9_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg9_4,
      D => S_AXI_WDATA(3),
      Q => slv_reg9(3),
      R => p_0_in
    );
\slv_reg9_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg9_4,
      D => S_AXI_WDATA(4),
      Q => slv_reg9(4),
      R => p_0_in
    );
\slv_reg9_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg9_4,
      D => S_AXI_WDATA(5),
      Q => slv_reg9(5),
      R => p_0_in
    );
\slv_reg9_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg9_4,
      D => S_AXI_WDATA(6),
      Q => slv_reg9(6),
      R => p_0_in
    );
\slv_reg9_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg9_4,
      D => S_AXI_WDATA(7),
      Q => slv_reg9(7),
      R => p_0_in
    );
\slv_reg9_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg9_4,
      D => S_AXI_WDATA(8),
      Q => slv_reg9(8),
      R => p_0_in
    );
\slv_reg9_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => slv_reg9_4,
      D => S_AXI_WDATA(9),
      Q => slv_reg9(9),
      R => p_0_in
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity TOP_block_RunControl_AXI_0_0 is
  port (
    RESET_IN : in STD_LOGIC;
    CS_ENABLE : out STD_LOGIC_VECTOR ( 18 downto 0 );
    PWR_EN : out STD_LOGIC_VECTOR ( 18 downto 0 );
    OVC_CH : in STD_LOGIC_VECTOR ( 18 downto 0 );
    CALIBRAZIONE : out STD_LOGIC;
    CLK_SEL_out : out STD_LOGIC;
    Rc_CLK_est_int : out STD_LOGIC;
    CLK_failed : in STD_LOGIC;
    PSDONE : in STD_LOGIC;
    locked : in STD_LOGIC;
    ENERGY_MAX : out STD_LOGIC_VECTOR ( 5 downto 0 );
    RITARDO : out STD_LOGIC_VECTOR ( 7 downto 0 );
    PPS_contati : in STD_LOGIC_VECTOR ( 15 downto 0 );
    Clock_register : in STD_LOGIC_VECTOR ( 14 downto 0 );
    Clock_register_out : out STD_LOGIC_VECTOR ( 3 downto 0 );
    RunC_CLK_OK : in STD_LOGIC;
    Runc_CLK_Lost : in STD_LOGIC;
    Runc_CLK_Found : in STD_LOGIC;
    Runc_CLK_ResFlg : out STD_LOGIC;
    Res_TagFlg : out STD_LOGIC;
    RC_Tag_OK : in STD_LOGIC_VECTOR ( 1 downto 0 );
    RC_Puls_1ms : out STD_LOGIC_VECTOR ( 13 downto 0 );
    RC_EvSecEn : out STD_LOGIC;
    Fifo_HF : in STD_LOGIC;
    Runc_Val_Tag0 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    FREQ_EVENTI_0 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    FREQ_EVENTI_1 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    FREQ_EVENTI_2 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    FREQ_EVENTI_3 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    FREQ_EVENTI_4 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    FREQ_EVENTI_5 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    FREQ_EVENTI_6 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    FREQ_EVENTI_7 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    FREQ_EVENTI_8 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    FREQ_EVENTI_9 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    FREQ_EVENTI_10 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    FREQ_EVENTI_11 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    FREQ_EVENTI_12 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    FREQ_EVENTI_13 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    FREQ_EVENTI_14 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    FREQ_EVENTI_15 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    FREQ_EVENTI_16 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    FREQ_EVENTI_17 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    FREQ_EVENTI_18 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    S_AXI_ACLK : in STD_LOGIC;
    S_AXI_ARESETN : in STD_LOGIC;
    S_AXI_AWADDR : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_AWPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_AWVALID : in STD_LOGIC;
    S_AXI_AWREADY : out STD_LOGIC;
    S_AXI_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_WVALID : in STD_LOGIC;
    S_AXI_WREADY : out STD_LOGIC;
    S_AXI_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_BVALID : out STD_LOGIC;
    S_AXI_BREADY : in STD_LOGIC;
    S_AXI_ARADDR : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_ARPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_ARVALID : in STD_LOGIC;
    S_AXI_ARREADY : out STD_LOGIC;
    S_AXI_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_RVALID : out STD_LOGIC;
    S_AXI_RREADY : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of TOP_block_RunControl_AXI_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of TOP_block_RunControl_AXI_0_0 : entity is "TOP_block_RunControl_AXI_0_0,RunControl_AXI,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of TOP_block_RunControl_AXI_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of TOP_block_RunControl_AXI_0_0 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of TOP_block_RunControl_AXI_0_0 : entity is "RunControl_AXI,Vivado 2019.2";
end TOP_block_RunControl_AXI_0_0;

architecture STRUCTURE of TOP_block_RunControl_AXI_0_0 is
  signal \<const0>\ : STD_LOGIC;
  attribute x_interface_info : string;
  attribute x_interface_info of RESET_IN : signal is "xilinx.com:signal:reset:1.0 RESET_IN RST";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of RESET_IN : signal is "XIL_INTERFACENAME RESET_IN, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute x_interface_info of S_AXI_ACLK : signal is "xilinx.com:signal:clock:1.0 S_AXI_ACLK CLK";
  attribute x_interface_parameter of S_AXI_ACLK : signal is "XIL_INTERFACENAME S_AXI_ACLK, ASSOCIATED_BUSIF S_AXI, ASSOCIATED_RESET S_AXI_ARESETN, FREQ_HZ 200000000, PHASE 0.000, CLK_DOMAIN TOP_block_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  attribute x_interface_info of S_AXI_ARESETN : signal is "xilinx.com:signal:reset:1.0 S_AXI_ARESETN RST";
  attribute x_interface_parameter of S_AXI_ARESETN : signal is "XIL_INTERFACENAME S_AXI_ARESETN, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute x_interface_info of S_AXI_ARREADY : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARREADY";
  attribute x_interface_info of S_AXI_ARVALID : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARVALID";
  attribute x_interface_info of S_AXI_AWREADY : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWREADY";
  attribute x_interface_info of S_AXI_AWVALID : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWVALID";
  attribute x_interface_info of S_AXI_BREADY : signal is "xilinx.com:interface:aximm:1.0 S_AXI BREADY";
  attribute x_interface_info of S_AXI_BVALID : signal is "xilinx.com:interface:aximm:1.0 S_AXI BVALID";
  attribute x_interface_info of S_AXI_RREADY : signal is "xilinx.com:interface:aximm:1.0 S_AXI RREADY";
  attribute x_interface_info of S_AXI_RVALID : signal is "xilinx.com:interface:aximm:1.0 S_AXI RVALID";
  attribute x_interface_info of S_AXI_WREADY : signal is "xilinx.com:interface:aximm:1.0 S_AXI WREADY";
  attribute x_interface_info of S_AXI_WVALID : signal is "xilinx.com:interface:aximm:1.0 S_AXI WVALID";
  attribute x_interface_info of S_AXI_ARADDR : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARADDR";
  attribute x_interface_info of S_AXI_ARPROT : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARPROT";
  attribute x_interface_info of S_AXI_AWADDR : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWADDR";
  attribute x_interface_parameter of S_AXI_AWADDR : signal is "XIL_INTERFACENAME S_AXI, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 200000000, ID_WIDTH 0, ADDR_WIDTH 8, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN TOP_block_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute x_interface_info of S_AXI_AWPROT : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWPROT";
  attribute x_interface_info of S_AXI_BRESP : signal is "xilinx.com:interface:aximm:1.0 S_AXI BRESP";
  attribute x_interface_info of S_AXI_RDATA : signal is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute x_interface_info of S_AXI_RRESP : signal is "xilinx.com:interface:aximm:1.0 S_AXI RRESP";
  attribute x_interface_info of S_AXI_WDATA : signal is "xilinx.com:interface:aximm:1.0 S_AXI WDATA";
  attribute x_interface_info of S_AXI_WSTRB : signal is "xilinx.com:interface:aximm:1.0 S_AXI WSTRB";
begin
  S_AXI_BRESP(1) <= \<const0>\;
  S_AXI_BRESP(0) <= \<const0>\;
  S_AXI_RRESP(1) <= \<const0>\;
  S_AXI_RRESP(0) <= \<const0>\;
  CALIBRAZIONE <= 'Z';
  CLK_SEL_out <= 'Z';
  RC_EvSecEn <= 'Z';
  Rc_CLK_est_int <= 'Z';
  Res_TagFlg <= 'Z';
  Runc_CLK_ResFlg <= 'Z';
  ENERGY_MAX(0) <= 'Z';
  ENERGY_MAX(1) <= 'Z';
  ENERGY_MAX(2) <= 'Z';
  ENERGY_MAX(3) <= 'Z';
  ENERGY_MAX(4) <= 'Z';
  ENERGY_MAX(5) <= 'Z';
  RC_Puls_1ms(0) <= 'Z';
  RC_Puls_1ms(1) <= 'Z';
  RC_Puls_1ms(2) <= 'Z';
  RC_Puls_1ms(3) <= 'Z';
  RC_Puls_1ms(4) <= 'Z';
  RC_Puls_1ms(5) <= 'Z';
  RC_Puls_1ms(6) <= 'Z';
  RC_Puls_1ms(7) <= 'Z';
  RC_Puls_1ms(8) <= 'Z';
  RC_Puls_1ms(9) <= 'Z';
  RC_Puls_1ms(10) <= 'Z';
  RC_Puls_1ms(11) <= 'Z';
  RC_Puls_1ms(12) <= 'Z';
  RC_Puls_1ms(13) <= 'Z';
  RITARDO(0) <= 'Z';
  RITARDO(1) <= 'Z';
  RITARDO(2) <= 'Z';
  RITARDO(3) <= 'Z';
  RITARDO(4) <= 'Z';
  RITARDO(5) <= 'Z';
  RITARDO(6) <= 'Z';
  RITARDO(7) <= 'Z';
  Runc_Val_Tag0(0) <= 'Z';
  Runc_Val_Tag0(1) <= 'Z';
  Runc_Val_Tag0(2) <= 'Z';
  Runc_Val_Tag0(3) <= 'Z';
  Runc_Val_Tag0(4) <= 'Z';
  Runc_Val_Tag0(5) <= 'Z';
  Runc_Val_Tag0(6) <= 'Z';
  Runc_Val_Tag0(7) <= 'Z';
  Runc_Val_Tag0(8) <= 'Z';
  Runc_Val_Tag0(9) <= 'Z';
  Runc_Val_Tag0(10) <= 'Z';
  Runc_Val_Tag0(11) <= 'Z';
  Runc_Val_Tag0(12) <= 'Z';
  Runc_Val_Tag0(13) <= 'Z';
  Runc_Val_Tag0(14) <= 'Z';
  Runc_Val_Tag0(15) <= 'Z';
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
U0: entity work.TOP_block_RunControl_AXI_0_0_RunControl_AXI
     port map (
      CS_ENABLE(18 downto 0) => CS_ENABLE(18 downto 0),
      Clock_register(10 downto 7) => Clock_register(14 downto 11),
      Clock_register(6) => Clock_register(8),
      Clock_register(5 downto 0) => Clock_register(5 downto 0),
      Clock_register_out(3 downto 0) => Clock_register_out(3 downto 0),
      OVC_CH(18 downto 0) => OVC_CH(18 downto 0),
      PWR_EN(18 downto 0) => PWR_EN(18 downto 0),
      S_AXI_ACLK => S_AXI_ACLK,
      S_AXI_ARADDR(5 downto 0) => S_AXI_ARADDR(7 downto 2),
      S_AXI_ARESETN => S_AXI_ARESETN,
      S_AXI_ARREADY => S_AXI_ARREADY,
      S_AXI_ARVALID => S_AXI_ARVALID,
      S_AXI_AWADDR(5 downto 0) => S_AXI_AWADDR(7 downto 2),
      S_AXI_AWREADY => S_AXI_AWREADY,
      S_AXI_AWVALID => S_AXI_AWVALID,
      S_AXI_BREADY => S_AXI_BREADY,
      S_AXI_BVALID => S_AXI_BVALID,
      S_AXI_RDATA(31 downto 0) => S_AXI_RDATA(31 downto 0),
      S_AXI_RREADY => S_AXI_RREADY,
      S_AXI_RVALID => S_AXI_RVALID,
      S_AXI_WDATA(31 downto 0) => S_AXI_WDATA(31 downto 0),
      S_AXI_WREADY => S_AXI_WREADY,
      S_AXI_WVALID => S_AXI_WVALID
    );
end STRUCTURE;
