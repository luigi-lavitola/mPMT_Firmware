--Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
--Date        : Thu Sep  5 19:18:50 2024
--Host        : PC-SER-DELL-1 running 64-bit major release  (build 9200)
--Command     : generate_target TOP_block_wrapper.bd
--Design      : TOP_block_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity TOP_block_wrapper is
  port (
    AXI_STR_RXD_0_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    AXI_STR_RXD_0_tlast : in STD_LOGIC;
    AXI_STR_RXD_0_tready : out STD_LOGIC;
    AXI_STR_RXD_0_tvalid : in STD_LOGIC;
    CLK_200_main : in STD_LOGIC;
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_cas_n : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    FCLK_25 : out STD_LOGIC;
    FCLK_50 : out STD_LOGIC;
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    I2C_SCL_I : in STD_LOGIC;
    I2C_SCL_O : out STD_LOGIC;
    I2C_SCL_T : out STD_LOGIC;
    I2C_SDA_I : in STD_LOGIC;
    I2C_SDA_O : out STD_LOGIC;
    I2C_SDA_T : out STD_LOGIC;
    M00_AXI_0_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_0_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_0_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_0_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_0_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_0_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_0_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_0_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_0_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_0_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_0_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_0_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_0_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_0_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_0_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_0_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_0_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_0_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_0_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    UART1_RX : in STD_LOGIC;
    UART1_TX : out STD_LOGIC;
    date_in_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    hash_in_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    peripheral_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_aresetn_0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    time_in_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    uart_Sama_boot_rxd : in STD_LOGIC;
    uart_Sama_boot_txd : out STD_LOGIC;
    version_in_0 : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );
end TOP_block_wrapper;

architecture STRUCTURE of TOP_block_wrapper is
  component TOP_block is
  port (
    UART1_TX : out STD_LOGIC;
    UART1_RX : in STD_LOGIC;
    I2C_SDA_I : in STD_LOGIC;
    I2C_SDA_O : out STD_LOGIC;
    I2C_SDA_T : out STD_LOGIC;
    I2C_SCL_I : in STD_LOGIC;
    I2C_SCL_O : out STD_LOGIC;
    I2C_SCL_T : out STD_LOGIC;
    FCLK_50 : out STD_LOGIC;
    FCLK_25 : out STD_LOGIC;
    CLK_200_main : in STD_LOGIC;
    peripheral_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_aresetn_0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    AXI_STR_RXD_0_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    AXI_STR_RXD_0_tlast : in STD_LOGIC;
    AXI_STR_RXD_0_tready : out STD_LOGIC;
    AXI_STR_RXD_0_tvalid : in STD_LOGIC;
    M00_AXI_0_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_0_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_0_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_0_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_0_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_0_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_0_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_0_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_0_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_0_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_0_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_0_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_0_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_0_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_0_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_0_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_0_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_0_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_0_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    DDR_cas_n : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    uart_Sama_boot_rxd : in STD_LOGIC;
    uart_Sama_boot_txd : out STD_LOGIC;
    hash_in_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    time_in_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    date_in_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    version_in_0 : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component TOP_block;
begin
TOP_block_i: component TOP_block
     port map (
      AXI_STR_RXD_0_tdata(31 downto 0) => AXI_STR_RXD_0_tdata(31 downto 0),
      AXI_STR_RXD_0_tlast => AXI_STR_RXD_0_tlast,
      AXI_STR_RXD_0_tready => AXI_STR_RXD_0_tready,
      AXI_STR_RXD_0_tvalid => AXI_STR_RXD_0_tvalid,
      CLK_200_main => CLK_200_main,
      DDR_addr(14 downto 0) => DDR_addr(14 downto 0),
      DDR_ba(2 downto 0) => DDR_ba(2 downto 0),
      DDR_cas_n => DDR_cas_n,
      DDR_ck_n => DDR_ck_n,
      DDR_ck_p => DDR_ck_p,
      DDR_cke => DDR_cke,
      DDR_cs_n => DDR_cs_n,
      DDR_dm(3 downto 0) => DDR_dm(3 downto 0),
      DDR_dq(31 downto 0) => DDR_dq(31 downto 0),
      DDR_dqs_n(3 downto 0) => DDR_dqs_n(3 downto 0),
      DDR_dqs_p(3 downto 0) => DDR_dqs_p(3 downto 0),
      DDR_odt => DDR_odt,
      DDR_ras_n => DDR_ras_n,
      DDR_reset_n => DDR_reset_n,
      DDR_we_n => DDR_we_n,
      FCLK_25 => FCLK_25,
      FCLK_50 => FCLK_50,
      FIXED_IO_ddr_vrn => FIXED_IO_ddr_vrn,
      FIXED_IO_ddr_vrp => FIXED_IO_ddr_vrp,
      FIXED_IO_mio(53 downto 0) => FIXED_IO_mio(53 downto 0),
      FIXED_IO_ps_clk => FIXED_IO_ps_clk,
      FIXED_IO_ps_porb => FIXED_IO_ps_porb,
      FIXED_IO_ps_srstb => FIXED_IO_ps_srstb,
      I2C_SCL_I => I2C_SCL_I,
      I2C_SCL_O => I2C_SCL_O,
      I2C_SCL_T => I2C_SCL_T,
      I2C_SDA_I => I2C_SDA_I,
      I2C_SDA_O => I2C_SDA_O,
      I2C_SDA_T => I2C_SDA_T,
      M00_AXI_0_araddr(31 downto 0) => M00_AXI_0_araddr(31 downto 0),
      M00_AXI_0_arprot(2 downto 0) => M00_AXI_0_arprot(2 downto 0),
      M00_AXI_0_arready(0) => M00_AXI_0_arready(0),
      M00_AXI_0_arvalid(0) => M00_AXI_0_arvalid(0),
      M00_AXI_0_awaddr(31 downto 0) => M00_AXI_0_awaddr(31 downto 0),
      M00_AXI_0_awprot(2 downto 0) => M00_AXI_0_awprot(2 downto 0),
      M00_AXI_0_awready(0) => M00_AXI_0_awready(0),
      M00_AXI_0_awvalid(0) => M00_AXI_0_awvalid(0),
      M00_AXI_0_bready(0) => M00_AXI_0_bready(0),
      M00_AXI_0_bresp(1 downto 0) => M00_AXI_0_bresp(1 downto 0),
      M00_AXI_0_bvalid(0) => M00_AXI_0_bvalid(0),
      M00_AXI_0_rdata(31 downto 0) => M00_AXI_0_rdata(31 downto 0),
      M00_AXI_0_rready(0) => M00_AXI_0_rready(0),
      M00_AXI_0_rresp(1 downto 0) => M00_AXI_0_rresp(1 downto 0),
      M00_AXI_0_rvalid(0) => M00_AXI_0_rvalid(0),
      M00_AXI_0_wdata(31 downto 0) => M00_AXI_0_wdata(31 downto 0),
      M00_AXI_0_wready(0) => M00_AXI_0_wready(0),
      M00_AXI_0_wstrb(3 downto 0) => M00_AXI_0_wstrb(3 downto 0),
      M00_AXI_0_wvalid(0) => M00_AXI_0_wvalid(0),
      UART1_RX => UART1_RX,
      UART1_TX => UART1_TX,
      date_in_0(31 downto 0) => date_in_0(31 downto 0),
      hash_in_0(31 downto 0) => hash_in_0(31 downto 0),
      peripheral_aresetn(0) => peripheral_aresetn(0),
      peripheral_aresetn_0(0) => peripheral_aresetn_0(0),
      time_in_0(31 downto 0) => time_in_0(31 downto 0),
      uart_Sama_boot_rxd => uart_Sama_boot_rxd,
      uart_Sama_boot_txd => uart_Sama_boot_txd,
      version_in_0(31 downto 0) => version_in_0(31 downto 0)
    );
end STRUCTURE;
