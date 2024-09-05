----------------------------------------------------------------------------------
-- Company:     INFN
-- Engineer:    Luigi Lavitola
-- 
-- Create Date: 23.03.2021 19:25:47
-- Design Name: MAIN_ACQ_ZYNQ
-- Module Name: TOP - Behavioral
-- Project Name: MAIN_ACQ_ZYNQ
-- Target Devices: Zc7z014sclg484-2
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.instruction_buffer_type.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity TOP is
  generic (
    G_TIME_CODE : std_logic_vector(31 downto 0) := x"7133c0de"; -- Simulation Values
    G_DATE_CODE : std_logic_vector(31 downto 0) := x"da73c0de"; -- Simulation Values
    G_HASH_CODE : std_logic_vector(31 downto 0) := x"4a54c0de"; -- Simulation Values
    G_VERS_CODE : std_logic_vector(31 downto 0) := x"FFFFFFFF" -- Simulation Values
);
  Port ( 
    -----------------------------------------------------------------------
    --PS PORTS TOP MODULE
    -----------------------------------------------------------------------
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
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    
    -----------------------------------------------------------------------
    -----------------------------------------------------------------------
    --PL PORTS TOP MODULE FOR LOGIC
    -----------------------------------------------------------------------
    -----------------------------------------------------------------------
    
    -----------------------------------------------------------------------
    --TRG from channels SECTION
    -----------------------------------------------------------------------
    OUT_TIME_P          :in      STD_LOGIC_VECTOR(18 downto 0);
    OUT_TIME_N          :in      STD_LOGIC_VECTOR(18 downto 0);
    
    -----------------------------------------------------------------------
    --CLK SECTION
    -----------------------------------------------------------------------
    -- Oscillator CLOCK
    CLK_25MHZ           :       in      STD_LOGIC;
    CLK_25_OUT          :       out     STD_LOGIC;
    --CABLE CLOCK 25 MHZ
    REF_CLK_P           :       in      STD_LOGIC;
    REF_CLK_N           :       in      STD_LOGIC;
    REF_CLK2_P          :       in      STD_LOGIC;
    REF_CLK2_N          :       in      STD_LOGIC;
    
    -----------------------------------------------------------------------
    --TRIGGER from CABLE SECTION
    -----------------------------------------------------------------------
    EXT_TRG_P           :       out      STD_LOGIC;
    EXT_TRG_N           :       out      STD_LOGIC;
    EXT_TRG2_P          :       out      STD_LOGIC;
    EXT_TRG2_N          :       out      STD_LOGIC;
    
    -----------------------------------------------------------------------
    --UART TO CHANNELs SECTION
    -----------------------------------------------------------------------    
    TX_OUT              :       out     STD_LOGIC;
    RX_IN               :       in      STD_LOGIC_VECTOR(18 downto 0);
    
    -----------------------------------------------------------------------
    --ADC and POWER, OVC for CHANNELS SECTION
    -----------------------------------------------------------------------
    --ADC
    ADC_SCL              :       out     STD_LOGIC_VECTOR(18 downto 0);
    ADC_CS               :       out     STD_LOGIC_VECTOR(18 downto 0);
    ADC_SDATA            :       in      STD_LOGIC_VECTOR(18 downto 0);
    
    --PowerEnable
    PWR_EN               :       out     STD_LOGIC_VECTOR(18 downto 0);
    
    --OverCurrent
    OVC_CH               :       in      STD_LOGIC_VECTOR(18 downto 0);
    
    -----------------------------------------------------------------------
    --I2C for system monitoring to EMIO SECTION
    -----------------------------------------------------------------------    
    I2C_SDA              :      inout       STD_LOGIC;
    I2C_SCL              :      inout       STD_LOGIC;
    
    -----------------------------------------------------------------------
    --UART for SAMA5D27 boot monitoring to EMIO SECTION
    -----------------------------------------------------------------------    
    SAMA_RX             :       in          STD_LOGIC;
    SAMA_TX             :       out         STD_LOGIC
    -----------------------------------------------------------------------
    --UART FOR DAQ
    -----------------------------------------------------------------------
    --UART_RX_ACQ         :       in          STD_LOGIC;
    --UART_TX_ACQ         :       out         STD_LOGIC
  );
end TOP;

architecture Behavioral of TOP is

component TOP_block_wrapper is
  port (
    AXI_STR_RXD_0_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    AXI_STR_RXD_0_tlast : in STD_LOGIC;
    AXI_STR_RXD_0_tready : out STD_LOGIC;
    AXI_STR_RXD_0_tvalid : in STD_LOGIC;
    peripheral_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 );
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
    CLK_200_main : in STD_LOGIC;
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
    peripheral_aresetn_0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    time_in_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    uart_Sama_boot_rxd : in STD_LOGIC;
    uart_Sama_boot_txd : out STD_LOGIC;
    version_in_0 : in STD_LOGIC_VECTOR ( 31 downto 0 )

  );
end component;

component raccolta_canali is
generic (numerodicanali       : integer:= 20);
    Port ( CLK_OUT 		: in  STD_LOGIC_VECTOR (6 downto 0); --Multifase		   
           RESET 			: in  STD_LOGIC;
			  COUNTER200M 	: IN  STD_LOGIC_VECTOR (27 downto 0); -- Step 5ns
-- PPS x Canale tempo 1sec			  
			  PPS				: in  STD_LOGIC;
			  COUNTA_sec	: IN  STD_LOGIC_VECTOR (31 downto 0); -- Conta Secondi
-- Dal RunC ecc.		  
			   massimo 		: in  STD_LOGIC_VECTOR (10 downto 0);
			   RITARDO 		: IN  STD_LOGIC_VECTOR (7 downto 0);
				ch_disable 	: in  STD_LOGIC_VECTOR (numerodicanali -2 downto 0);
           calibrazione : in  STD_LOGIC;
           RC_EvSecEn 	: in  STD_LOGIC;
			  eventi_freq 	: OUT F_ARRAY_Type;
			  
			  Pulser 		: in  STD_LOGIC;
	-- Al CANALE		  
           time_p 		: in  STD_LOGIC_VECTOR (numerodicanali -2 downto 0);
           time_n 		: in  STD_LOGIC_VECTOR (numerodicanali -2 downto 0);
			  miso 			: in  STD_LOGIC_VECTOR (numerodicanali -2 downto 0);
           sclk 			: out  STD_LOGIC_VECTOR (numerodicanali -2 downto 0);	
           chip_select 	: out  STD_LOGIC_VECTOR (numerodicanali -2 downto 0);
	-- To FIFO	
		  Fifo_HFull	: in   STD_LOGIC;
		  wr_enable 	: out  STD_LOGIC;
          data_out 		: out  STD_LOGIC_VECTOR (79 downto 0)
          );  
end component;

component clk_wiz_0
port
 (-- Clock in ports
  -- Clock out ports
  clk_out1          : out    std_logic;
  clk_out2          : out    std_logic;
  clk_out3          : out    std_logic;
  clk_out4          : out    std_logic;
  clk_out5          : out    std_logic;
  clk_out6          : out    std_logic;
  clk_out7          : out    std_logic;
  -- Status and control signals
  reset             : in     std_logic;
  locked            : out    std_logic;
  CLK_IN           : in     std_logic
 );
end component;

COMPONENT fifo_generator_0
  PORT (
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    din : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
    wr_en : IN STD_LOGIC;
    rd_en : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    full : OUT STD_LOGIC;
    empty : OUT STD_LOGIC;
    valid : OUT STD_LOGIC;
    wr_data_count : OUT STD_LOGIC_VECTOR(14 DOWNTO 0);
    prog_full : OUT STD_LOGIC
  );
  END COMPONENT;

COMPONENT FIFO_DATA
  PORT (
    rst : IN STD_LOGIC;
    wr_clk : IN STD_LOGIC;
    rd_clk : IN STD_LOGIC;
    din : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
    wr_en : IN STD_LOGIC;
    rd_en : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    full : OUT STD_LOGIC;
    empty : OUT STD_LOGIC;
    prog_full : OUT STD_LOGIC
  );
END COMPONENT;

COMPONENT fifo_generator_1
  PORT (
    clk : IN STD_LOGIC;
    srst : IN STD_LOGIC;
    din : IN STD_LOGIC_VECTOR(95 DOWNTO 0);
    wr_en : IN STD_LOGIC;
    rd_en : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(95 DOWNTO 0);
    full : OUT STD_LOGIC;
    empty : OUT STD_LOGIC;
    prog_full : OUT STD_LOGIC
  );
END COMPONENT;

signal RX_IN_ps     :   std_logic;

--signal for EMIO I2C tristate buffer
signal I2C_SCL_I    :   std_logic;
signal I2C_SCL_O    :   std_logic;
signal I2C_SCL_T    :   std_logic;
signal I2C_SDA_I    :   std_logic;
signal I2C_SDA_O    :   std_logic;
signal I2C_SDA_T    :   std_logic;



signal FCLK_200    :   std_logic;
signal FCLK_50    :   std_logic;
signal FCLK_25    :   std_logic;

signal CLK_OUT      :   STD_LOGIC_VECTOR(6 downto 0);
signal PWR_EN_int      :   STD_LOGIC_VECTOR(18 downto 0);

signal valid        :   std_logic;


SIGNAL massimo 					: STD_LOGIC_VECTOR (10 downto 0);
SIGNAL set_ritardo 				: STD_LOGIC_VECTOR (7 downto 0):=X"20";
SIGNAL DATA_event 				: std_logic_vector(95 downto 0);
SIGNAL CHIP_SELECT_sig			: std_logic_vector(18 downto 0);
SIGNAL CHIP_SELECT_ENABLE		: std_logic_vector(18 downto 0);
SIGNAL DATA_event_complete 	: std_logic_vector(127 downto 0);
SIGNAL DATA_event_96bits 	: std_logic_vector(95 downto 0);
SIGNAL DATA_event_splitting 	: std_logic_vector(95 downto 0);
SIGNAL DATA_event_32bits 	: std_logic_vector(31 downto 0);

constant PKT_SIZE : positive := 8192;
SIGNAL tlast_cnt 	: natural range 0 to PKT_SIZE-1 := 0;

signal FIFO_32_WR_EN_int    :   std_logic;
signal FIFO_96_RD_EN_int    :   std_logic;
signal AXI_STR_RXD_0_tlast_int    :   std_logic;


SIGNAL CRC_8bit 	           : std_logic_vector(7 downto 0);


SIGNAL wr_en_fifo 		 		: std_logic;
SIGNAL RESET		 		 		: std_logic:='0';
SIGNAL CLK_SEL_out	 		 	: std_logic:='0';
SIGNAL clk_failed	 		 		: std_logic;

signal FIFO_nEmpty		 		: STD_LOGIC;
signal FIFO_nEmpty_32		 		: STD_LOGIC;
signal FIFO_Empty		    		: STD_LOGIC;
signal FIFO_Empty_32		    		: STD_LOGIC;
signal pk_ack				 		: STD_LOGIC;		
signal din_to_usb			 		: STD_LOGIC_VECTOR (15 downto 0);
signal din_to_AXI			 		: STD_LOGIC_VECTOR (31 downto 0);
signal din_to_AXI_le			 		: STD_LOGIC_VECTOR (31 downto 0);
signal BD_in				 		: STD_LOGIC_VECTOR (15 downto 0);
signal BD_out				 		: STD_LOGIC_VECTOR (15 downto 0);
signal BD_dir				 		: STD_LOGIC;
signal reset_out			 		: STD_LOGIC;
signal runc_rd				 		: STD_LOGIC;
signal RunC_WR				 		: STD_LOGIC;
signal RunC_ADDR			 		: STD_LOGIC_VECTOR (15 downto 0):=X"0000";
signal nreset			    		: STD_LOGIC;
signal PPS					 		: STD_LOGIC:='0';
signal calibrazione		 		: STD_LOGIC:='0';
CONSTANT CODA				 		: STD_LOGIC_VECTOR (15 downto 0):=X"FEEF";--
CONSTANT TESTA				 		: STD_LOGIC_VECTOR (15 downto 0):=X"BAAB";--
signal CRC					 		: STD_LOGIC_VECTOR (15 downto 0):=X"0000";
signal PPS_contati		 		: STD_LOGIC_VECTOR (31 downto 0);
signal UnixTime_ARM		 		: STD_LOGIC_VECTOR (31 downto 0);
--signal FREQ_EVENTI		 	   : F_ARRAY_Type:=((others=> (others=>'0')));
--signal FREQ_EVENTI48		 	   : F_ARRAY_Type:=((others=> (others=>'0')));
signal RunC_DATA_IN		 		: STD_LOGIC_VECTOR (15 downto 0):=X"0000";
signal RunC_DATA_OUT		 		: STD_LOGIC_VECTOR (15 downto 0):=X"0000";
signal PEN_CH_sig			 		: STD_LOGIC_VECTOR (25 downto 0):=X"ffffff"&"11";
signal Mast_CLK25MHz				: STD_LOGIC;
signal RunC_CLK_OK 				: STD_LOGIC;
signal Runc_CLK_Lost 			: STD_LOGIC;
signal Runc_CLK_Found 			: STD_LOGIC;
signal Runc_CLK_ResFlg 			: STD_LOGIC;
--signal CLK_OUT 					:  STD_LOGIC_VECTOR (6 downto 0); --Multifase
signal INPUT_CLK_STOPPED		: STD_LOGIC;
signal LOCKED_fasi				: STD_LOGIC;
signal CLK_IN_Cavo				: STD_LOGIC;
signal CLK_IN_Cavo_2				: STD_LOGIC;
SIGNAL UCLK		 					: std_logic;  --_vector(0 downto 0);
signal PSINCDEC			 		: STD_LOGIC;
signal PSEN					 		: STD_LOGIC;
signal PSDONE				 		: STD_LOGIC;
signal COUNTER200M				: STD_LOGIC_VECTOR (27 downto 0);
signal COUNTA_sec					: STD_LOGIC_VECTOR (31 downto 0);
signal PULSER_Out					: STD_LOGIC;
signal Res_TagFlg				 	: STD_LOGIC;
signal RC_EvSecEn				 	: STD_LOGIC;
signal RC_Tag_OK					: STD_LOGIC_VECTOR (2 downto 0);
signal RC_Puls_1ms				: STD_LOGIC_VECTOR (13 downto 0);
signal Fifo_HFull_int					: STD_LOGIC;
signal Fifo_HFULL_32					: STD_LOGIC;
signal Rc_CLK_est_int			: STD_LOGIC;
signal FLAG_WR_Unix_Time			: STD_LOGIC;
signal Runc_Val_Tag0				: STD_LOGIC_VECTOR (15 downto 0);

signal Conta_reset				:	std_logic_vector(13 downto 0);
signal RESET_after_prog			:	std_logic;
signal RESET_or					:	std_logic;
signal CLK_USB_bufg_in			:	std_logic;
signal PLL_USB_locked			:	std_logic;
signal AXI_STR_RXD_0_tready			:	std_logic;

signal CLK_Register_int         :   std_logic_vector(11 downto 0);
signal CLK_Register_RC          :   std_logic_vector(14 downto 0);
signal Clock_register_out_int       :   STD_LOGIC_VECTOR(3 downto 0);
signal flag_reset_finto       :   STD_LOGIC_VECTOR(0 downto 0);
signal wr_data_count       :   STD_LOGIC_VECTOR(14 downto 0);
signal Letto_CLK_res_flag_0       :   STD_LOGIC;

signal FREQ_METER   :   F_ARRAY_Type;
signal Dead_Time    :   STD_LOGIC_VECTOR(31 downto 0);
signal EOS_Reset    :   std_logic;
signal FIFO_32_HF   :   std_logic;

signal DATA_128bit  :   std_logic_vector(127 downto 0);

signal M00_AXI_0_araddr : STD_LOGIC_VECTOR(31 downto 0);
signal M00_AXI_0_arprot  : STD_LOGIC_VECTOR(2 downto 0);
signal M00_AXI_0_arready          : STD_LOGIC_VECTOR(0 downto 0);
signal M00_AXI_0_arvalid          : STD_LOGIC_VECTOR(0 downto 0);
signal M00_AXI_0_awaddr : STD_LOGIC_VECTOR(31 downto 0);
signal M00_AXI_0_awprot  : STD_LOGIC_VECTOR(2 downto 0);
signal M00_AXI_0_awready          : STD_LOGIC_VECTOR(0 downto 0);
signal M00_AXI_0_awvalid          : STD_LOGIC_VECTOR(0 downto 0);
signal M00_AXI_0_bready           : STD_LOGIC_VECTOR(0 downto 0);
signal M00_AXI_0_bresp   : STD_LOGIC_VECTOR(1 downto 0);
signal M00_AXI_0_bvalid          : STD_LOGIC_VECTOR(0 downto 0);
signal M00_AXI_0_rdata  : STD_LOGIC_VECTOR(31 downto 0);
signal M00_AXI_0_rready           : STD_LOGIC_VECTOR(0 downto 0);
signal M00_AXI_0_rresp   : STD_LOGIC_VECTOR(1 downto 0);
signal M00_AXI_0_rvalid           : STD_LOGIC_VECTOR(0 downto 0);
signal M00_AXI_0_wdata  : STD_LOGIC_VECTOR(31 downto 0);
signal M00_AXI_0_wready           : STD_LOGIC_VECTOR(0 downto 0);
signal M00_AXI_0_wstrb   : STD_LOGIC_VECTOR(3 downto 0);
signal M00_AXI_0_wvalid           : STD_LOGIC_VECTOR(0 downto 0);
signal peripheral_aresetn           : STD_LOGIC_VECTOR(0 downto 0);
signal AXI_Reset                :   STD_LOGIC;
signal AXI_Reset1                :   STD_LOGIC_VECTOR(0 downto 0);
signal RD_EN_FIFO               :   std_logic;

signal time_code : std_logic_vector(31 downto 0);
signal date_code : std_logic_vector(31 downto 0);
signal hash_code : std_logic_vector(31 downto 0);
signal vers_code : std_logic_vector(31 downto 0);

attribute keep : string;
attribute keep of PULSER_Out : signal is "true";
attribute keep of Fifo_HFull_int : signal is "true";
attribute keep of tlast_cnt : signal is "true";

begin
------------------------------------------------------------------------------------
--Wrapper instantiation! Do not modify!
------------------------------------------------------------------------------------
TOP_block_i: component TOP_block_wrapper
     port map (
     -------------------------------------------
     --Stream AXI FIFO
     ----------------------------------------------
      AXI_STR_RXD_0_tdata(31 downto 0) => din_to_AXI_le,
      AXI_STR_RXD_0_tlast => AXI_STR_RXD_0_tlast_int,
      AXI_STR_RXD_0_tready => AXI_STR_RXD_0_tready,
      AXI_STR_RXD_0_tvalid => FIFO_nEmpty_32,
      ------------------------------------------------
      --PS PORTS
      -------------------------------------------------
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
      CLK_200_main => CLK_OUT(0),
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
      peripheral_aresetn => peripheral_aresetn,
      M00_AXI_0_araddr(31 downto 0)     => M00_AXI_0_araddr(31 downto 0),
      M00_AXI_0_arprot(2 downto 0)      => M00_AXI_0_arprot(2 downto 0),
      M00_AXI_0_arready(0)              => M00_AXI_0_arready(0),
      M00_AXI_0_arvalid(0)              => M00_AXI_0_arvalid(0),
      M00_AXI_0_awaddr(31 downto 0)     => M00_AXI_0_awaddr(31 downto 0),
      M00_AXI_0_awprot(2 downto 0)      => M00_AXI_0_awprot(2 downto 0),
      M00_AXI_0_awready(0)              => M00_AXI_0_awready(0),
      M00_AXI_0_awvalid(0)              => M00_AXI_0_awvalid(0),
      M00_AXI_0_bready(0)               => M00_AXI_0_bready(0),
      M00_AXI_0_bresp(1 downto 0)       => M00_AXI_0_bresp(1 downto 0),
      M00_AXI_0_bvalid(0)               => M00_AXI_0_bvalid(0),
      M00_AXI_0_rdata(31 downto 0)      => M00_AXI_0_rdata(31 downto 0),
      M00_AXI_0_rready(0)               => M00_AXI_0_rready(0),
      M00_AXI_0_rresp(1 downto 0)       => M00_AXI_0_rresp(1 downto 0),
      M00_AXI_0_rvalid(0)               => M00_AXI_0_rvalid(0),
      M00_AXI_0_wdata(31 downto 0)      => M00_AXI_0_wdata(31 downto 0),
      M00_AXI_0_wready(0)               => M00_AXI_0_wready(0),
      M00_AXI_0_wstrb(3 downto 0)       => M00_AXI_0_wstrb(3 downto 0),
      M00_AXI_0_wvalid(0)               => M00_AXI_0_wvalid(0),
      UART1_RX => RX_IN_ps,  
      UART1_TX => TX_OUT,
      uart_Sama_boot_rxd => SAMA_RX, 
      uart_Sama_boot_txd => SAMA_TX,
        time_in_0 => time_code,
        date_in_0 => date_code,
        hash_in_0 => hash_code,
        version_in_0 => vers_code
      ----------------------------------------------
      --Run Control ports
      --------------------------------------------
    );
    
    RX_IN_ps <= '1' when (RX_IN or not PWR_EN_int)=(X"FFFF" & "111") else '0';
    
    I2C_SCL <= I2C_SCL_O when (I2C_SCL_T = '0') else 'Z';
    I2C_SCL_I <= I2C_SCL; 
    I2C_SDA <= I2C_SDA_O when (I2C_SDA_T = '0') else 'Z';
    I2C_SDA_I <= I2C_SDA;
--------------------------------------------------------------------------
    
    RunControl_AXI_inst : entity work.RunControl_AXI
	generic map (
		C_S_AXI_DATA_WIDTH	=> 32,
		C_S_AXI_ADDR_WIDTH	=> 32
	)
	port map (
	    
        RESET_IN          => '0',
        OVC_CH            => OVC_CH,
        CALIBRAZIONE      => CALIBRAZIONE,
        CLK_SEL_out	      => CLK_SEL_out,
        Rc_CLK_est_int    => Rc_CLK_est_int,
        CLK_failed	      => CLK_failed,
        PSDONE			  => PSDONE,      
        locked			  => '0', --not used 
        ENERGY_MAX	      => massimo,
        RITARDO 		  => set_ritardo,     
        PPS_contati       => PPS_contati,
        COUNTER200M       => COUNTER200M,
        UnixTime_ARM      => UnixTime_ARM,
        FLAG_WR_Unix_Time => FLAG_WR_Unix_Time,
        Clock_register      => CLK_Register_RC,
        Clock_register_out      => Clock_register_out_int       ,
        RunC_CLK_OK       => RunC_CLK_OK        ,
        Runc_CLK_Lost     => Runc_CLK_Lost      ,
        Runc_CLK_Found    => Runc_CLK_Found     ,
        Runc_CLK_ResFlg   => Runc_CLK_ResFlg    ,
        Letto_CLK_res_flag => Letto_CLK_res_flag_0 ,
        Res_TagFlg	      => Res_TagFlg	       , 
        RC_Tag_OK		  => RC_Tag_OK		   ,   
        RC_Puls_1ms	      => RC_Puls_1ms	       ,
        RC_EvSecEn	      => RC_EvSecEn	      , 
        Fifo_HF		      => Fifo_HFull_int, --not used  
        Runc_Val_Tag0     => Runc_Val_Tag0      ,
        Dead_Time         => Dead_Time,
        FREQ_EVENTI_0	  => FREQ_METER(0),  
        FREQ_EVENTI_1	  => FREQ_METER(1)	   ,  
        FREQ_EVENTI_2	  => FREQ_METER(2)	  ,  
        FREQ_EVENTI_3	  => FREQ_METER(3)	  ,  
        FREQ_EVENTI_4	  => FREQ_METER(4)	  ,  
        FREQ_EVENTI_5	  => FREQ_METER(5)	  ,  
        FREQ_EVENTI_6	  => FREQ_METER(6)	  ,  
        FREQ_EVENTI_7	  => FREQ_METER(7)	  ,  
        FREQ_EVENTI_8	  => FREQ_METER(8)	  ,  
        FREQ_EVENTI_9	  => FREQ_METER(9)	  ,  
        FREQ_EVENTI_10	  => FREQ_METER(10)	   , 
        FREQ_EVENTI_11	  => FREQ_METER(11)	   , 
        FREQ_EVENTI_12	  => FREQ_METER(12)	   , 
        FREQ_EVENTI_13	  => FREQ_METER(13)	   , 
        FREQ_EVENTI_14	  => FREQ_METER(14)	   , 
        FREQ_EVENTI_15	  => FREQ_METER(15)	   , 
        FREQ_EVENTI_16	  => FREQ_METER(16)	   , 
        FREQ_EVENTI_17	  => FREQ_METER(17)	   , 
        FREQ_EVENTI_18	  => FREQ_METER(18)	   , 
        FIFO_DATA_COUNT   => wr_data_count,
	    CS_ENABLE  => CHIP_SELECT_ENABLE,
	    PWR_EN  => PWR_EN_int,
	    
		S_AXI_ACLK	    => CLK_OUT(0),
		S_AXI_ARESETN	=> peripheral_aresetn(0),
		S_AXI_AWADDR	=> M00_AXI_0_awaddr,
		S_AXI_AWPROT	=> M00_AXI_0_awprot,
		S_AXI_AWVALID	=> M00_AXI_0_awvalid(0),
		S_AXI_AWREADY	=> M00_AXI_0_awready(0),
		S_AXI_WDATA	    => M00_AXI_0_wdata,
		S_AXI_WSTRB	    => M00_AXI_0_wstrb,--(others => '1'),
		S_AXI_WVALID	=> M00_AXI_0_wvalid(0),
		S_AXI_WREADY	=> M00_AXI_0_wready(0),
		S_AXI_BRESP	    => M00_AXI_0_bresp,
		S_AXI_BVALID	=> M00_AXI_0_bvalid(0),
		S_AXI_BREADY	=> M00_AXI_0_bready(0),
		S_AXI_ARADDR	=> M00_AXI_0_araddr,
		S_AXI_ARPROT	=> M00_AXI_0_arprot,
		S_AXI_ARVALID	=> M00_AXI_0_arvalid(0),
		S_AXI_ARREADY	=> M00_AXI_0_arready(0),
		S_AXI_RDATA	    => M00_AXI_0_rdata,
		S_AXI_RRESP	    => M00_AXI_0_rresp,
		S_AXI_RVALID	=> M00_AXI_0_rvalid(0),
		S_AXI_RREADY	=> M00_AXI_0_rready(0)
	);
    
    Dead_Time(15 downto 0) <= FREQ_METER(19);
    ---------------------------------------------------------------------
    --200M clock generation and Reset--
    ---------------------------------------------------------------------
--    process ( FCLK_25)
--    begin
--    if rising_edge(FCLK_25) then
--        if Conta_reset < X"ffff" then
--            Conta_reset <= Conta_reset +1;
--            RESET_after_prog <= '1';
--        else 
--            RESET_after_prog <= '0';
--       end if;
--    end if;
--    end process;
    ------------------------------------------------------------------------
	-- STARTUPE2
	------------------------------------------------------------------------
    STARTUPE2_inst : STARTUPE2
   generic map (
      PROG_USR => "FALSE",  -- Activate program event security feature. Requires encrypted bitstreams.
      SIM_CCLK_FREQ => 0.0  -- Set the Configuration Clock Frequency(ns) for simulation.
   )
   port map (
      CFGCLK => open,       -- 1-bit output: Configuration main clock output
      CFGMCLK => open,     -- 1-bit output: Configuration internal oscillator clock output
      EOS => EOS_Reset,             -- 1-bit output: Active high output signal indicating the End Of Startup.
      PREQ => open,           -- 1-bit output: PROGRAM request to fabric output
      CLK => '0',             -- 1-bit input: User start-up clock input
      GSR => '0',             -- 1-bit input: Global Set/Reset input (GSR cannot be used for the port name)
      GTS => '0',             -- 1-bit input: Global 3-state input (GTS cannot be used for the port name)
      KEYCLEARB => '1', -- 1-bit input: Clear AES Decrypter Key input from Battery-Backed RAM (BBRAM)
      PACK => '0',           -- 1-bit input: PROGRAM acknowledge input
      USRCCLKO => '0',   -- 1-bit input: User CCLK input
                              -- For Zynq-7000 devices, this input must be tied to GND
      USRCCLKTS => '1', -- 1-bit input: User CCLK 3-state enable input
                              -- For Zynq-7000 devices, this input must be tied to VCC
      USRDONEO => '1',   -- 1-bit input: User DONE pin output control
      USRDONETS => '1'  -- 1-bit input: User DONE 3-state enable output
   );

    
    RESET_or <= not EOS_Reset;--'0'; --RESET_after_prog;

	Inst_RESET_MODULE: entity work.RESET_MODULE 
	PORT MAP(
		reset_in 		=> RESET_or,--reset_in,--
		reset_out 		=> reset,--
		locked_fasi 	=> LOCKED_fasi,--
		CLK_IN_USB 		=> CLK_25MHZ,--
		clk_failed 		=> clk_failed,--
		clk_is_not_wrk => '0'
	);
--------------------------------------------
-- Ricevitore diff del RefCLK dal CAVO
   IBUFGDS_inst : IBUFGDS
   generic map (
      IBUF_LOW_PWR => TRUE) -- Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards")
   port map (
      O 	=> CLK_IN_Cavo,  -- Clock buffer output
      I 	=> REF_CLK_P,  -- Diff_p clock buffer input
      IB => REF_CLK_N -- Diff_n clock buffer input
   );
	
	-- Ricevitore diff del RefCLK dal CAVO
   IBUFGDS_inst_2 : IBUFGDS
   generic map (
      IBUF_LOW_PWR => TRUE) -- Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards")
   port map (
      O 	=> CLK_IN_Cavo_2,  -- Clock buffer output
      I 	=> REF_CLK2_P,  -- Diff_p clock buffer input
      IB => REF_CLK2_N -- Diff_n clock buffer input
   );
 -- CLK SAFE MUX del CLK da Quarzo a cavo	
	Inst_CLK_SAFE: entity work.CLK_SAFE 
	PORT MAP(
		Ref_CLK1 				=> CLK_IN_Cavo,
		Ref_CLK2 				=> CLK_IN_Cavo_2,
		XCLK 					=> CLK_25MHZ,
		FCLK25M 				=> FCLK_25,
		RESET 					=> RESET_or,
		RunC_CLK_est_int		=> Rc_CLK_est_int,
		RunC_CLK_Automat		=> CLK_SEL_out, -- 1= Quarzo interno 0= Automatico
		RunC_Ref_CLK_OK 		=> RunC_CLK_OK ,
		Runc_Ref_CLK_Perso 	    => Runc_CLK_Lost,
		Runc_Ref_CLK_ritrov 	=> Runc_CLK_Found,
		Runc_ClkSafe_Rflag 	    => Runc_CLK_ResFlg,
		Clock_register          => CLK_Register_int,
		Clock_register_out      => Clock_register_out_int,
		Letto_CLK_res_flag      => Letto_CLK_res_flag_0,
		Mast_CLK25MHz 			=> Mast_CLK25MHz --  CLK a 25MHz MASTER 
	);
------------------------------------------
     CLK_Register_RC  <=   clk_failed & reset & LOCKED_fasi & CLK_Register_int;  -- registro RC di clock
    
    ---------------------------------------------------------------------
    --Multiphase clock generation--
    --------------------------------------------------------------------- 
    multiphase_clock : clk_wiz_0
       port map ( 
      -- Clock out ports  
       clk_out1 => CLK_OUT(0),
       clk_out2 => CLK_OUT(1),
       clk_out3 => CLK_OUT(2),
       clk_out4 => CLK_OUT(3),
       clk_out5 => CLK_OUT(4),
       clk_out6 => CLK_OUT(5),
       clk_out7 => CLK_OUT(6),
      -- Status and control signals                
       reset => RESET_or,
       locked => LOCKED_fasi,
       -- Clock in ports
       CLK_IN => Mast_CLK25MHz
     ); 
    
   ODDR_inst : ODDR
   generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE", -- "OPPOSITE_EDGE" or "SAME_EDGE" 
      INIT => '0',   -- Initial value for Q port ('1' or '0')
      SRTYPE => "SYNC") -- Reset Type ("ASYNC" or "SYNC")
   port map (
      Q => CLK_25_OUT,   -- 1-bit DDR output
      C => CLK_OUT(0),    -- 1-bit clock input
      CE => '1',  -- 1-bit clock enable input
      D1 => '1',  -- 1-bit data input (positive edge)
      D2 => '0',  -- 1-bit data input (negative edge)
      R => '0',    -- 1-bit reset input
      S => '0'     -- 1-bit set input
   );
    
    
    --CLK_25_OUT <= COUNTER200M(2);-- Mast_CLK25MHz;

    inst_MULTYCHANNEL : entity work.raccolta_canali
    Port MAP (	CLK_OUT 		=> CLK_OUT,
				RESET 		=> reset,
				COUNTER200M => COUNTER200M,
	-- PPS x Canale tempo 1sec			
				PPS 			=> PPS,
				COUNTA_sec 	=> COUNTA_sec,	
	-- Dal RunC ecc.			
				massimo 		=> massimo,
				RITARDO 		=> set_ritardo,
				ch_disable 	=> PWR_EN_int,
				calibrazione => calibrazione,
				RC_EvSecEn	=> RC_EvSecEn,
				eventi_freq => FREQ_METER,--open,		
	-- Al CANALE			
				Pulser 		=> PULSER_Out,
				time_p 		=> OUT_TIME_P,
				time_n 		=> OUT_TIME_N,
				miso 			=> ADC_SDATA,
				sclk 			=> ADC_SCL,
				chip_select => CHIP_SELECT_sig,-- CHIP_SELECT,
-- To FIFO							
				Fifo_HFull	=> Fifo_HFull_int,
				wr_enable 	=> wr_en_fifo,
				data_out 	=> DATA_event);

    din_to_AXI_le <= din_to_AXI(15 downto 0) & din_to_AXI(31 downto 16);    --conversion to little endian for AXI DMA
    FIFO_DATA_32bit : fifo_generator_0
      PORT MAP (
        clk => CLK_OUT(0),
        rst => AXI_Reset,--peripheral_aresetn(0),
        din => DATA_128bit,--DATA_event_32bits,
        wr_en => wr_en_fifo,--FIFO_32_WR_EN_int,
        rd_en => RD_EN_FIFO,--AXI_STR_RXD_0_tready,
        dout => din_to_AXI,
        full => open,
        valid => valid,
        empty => FIFO_Empty_32,
        wr_data_count => wr_data_count,
        prog_full => Fifo_HFull_int --FIFO_32_HF
      );
      RD_EN_FIFO <= AXI_STR_RXD_0_tready and FIFO_nEmpty_32 and valid;
      AXI_Reset <= not peripheral_aresetn(0);
      FIFO_nEmpty_32 <= not FIFO_Empty_32;
    ---------------------------------------
    --TLAST Generation process 
    ---------------------------------------
    GEN_COUNTER : process (CLK_OUT(0),  peripheral_aresetn)
    begin
        if  peripheral_aresetn(0) = '0' then
            tlast_cnt	<= 0;									   -- Clear counter
            AXI_STR_RXD_0_tlast_int <= '0';
            --RD_EN_FIFO <= '0';
        elsif rising_edge(CLK_OUT(0)) then
             --read only if both valid and ready
            
            if (AXI_STR_RXD_0_tready = '1' and FIFO_nEmpty_32 = '1') then
                  -- Set tlast every word number PKT_SIZE-1, ie every PKT_SIZE DWORD written into the fifo
                
                if (tlast_cnt = PKT_SIZE-2) then
                    AXI_STR_RXD_0_tlast_int	  <= '1';
                else
                    AXI_STR_RXD_0_tlast_int     <= '0';									-- 
                end if; 
                -- Increment tlast counter when tready is '1'
                if (tlast_cnt = PKT_SIZE-1) then
                    tlast_cnt <= 0;
                else
                      tlast_cnt <= tlast_cnt + 1;
--                    if wr_en_fifo = '1' then
--                        tlast_cnt <= tlast_cnt + 4;
--                    else
--                        tlast_cnt <= tlast_cnt;
--                    end if;
                end if; 
            --AXI_STR_RXD_0_tlast_int <= '1';
            end if;
        end if;
    
    end process;
    
	
	
	--NEW DATA FORMAT 96 bit
	DATA_event_96bits <= "11" & '0' & DATA_event(68 downto 64) & DATA_event(95 downto 80) & DATA_event(62 downto 55) & '0' & DATA_event(54 downto 48) & DATA_event(46 downto 34) & DATA_event(26 downto 16) & "10" & "00000" & DATA_event(33 downto 32) & DATA_event(29 downto 27) & DATA_event(11 downto 0) & CRC_8bit;
	CRC_8bit <= DATA_event_96bits(95 downto 88) XOR DATA_event_96bits(87 downto 80) XOR DATA_event_96bits(79 downto 72) XOR DATA_event_96bits(71 downto 64) XOR DATA_event_96bits(63 downto 56) XOR DATA_event_96bits(55 downto 48) XOR DATA_event_96bits(47 downto 40) XOR DATA_event_96bits(39 downto 32) XOR DATA_event_96bits(31 downto 24) XOR DATA_event_96bits(23 downto 16) XOR DATA_event_96bits(15 downto 8);
	
	DATA_128bit <= TESTA & DATA_event_96bits & CODA;
	
	
	
	--OLD DATA FORMAT 128 bit
	--DATA_event_complete<=TESTA & DATA_event & CRC & CODA;
    --CRC<=DATA_event(15 DOWNTO 0) XOR DATA_event(31 DOWNTO 16) xor DATA_event(47 DOWNTO 32) XOR DATA_event(63 DOWNTO 48) XOR DATA_event(79 DOWNTO 64) XOR TESTA XOR CODA;
	--===================================================================================
-- 						PPS generator
--===================================================================================

	Inst_pps_module2: entity work.pps_module2 
	PORT MAP(
		CLK_25MHZ 	=> Mast_CLK25MHz,
		CLK_200MHZ 	=> CLK_OUT(0),
		CLK_200MHZ_1 => CLK_OUT(6),
		RESET 		=> RESET,
		PPS_OUT 		=> PPS,
		RunC_TAG_OK => RC_TAG_OK, -- B0 = Tag0, B1 = TagRes
		RunC_Res_FLG => Res_TagFlg,
		Runc_Val_Tag0 => Runc_Val_Tag0,       --latenza 3, quindi valore pi� 3
		CONTA 		=> COUNTER200M,
		COUNTA_sec 	=> COUNTA_sec,
		UnixTime_ARM => UnixTime_ARM,
		FLAG_WR_Unix_Time => FLAG_WR_Unix_Time
	);
	
	PPS_contati <= COUNTA_sec;
	
--===========================================
--			PULSER
--===========================================
	Inst_Pulser: entity work.Pulser 
	PORT MAP(
		CLK48M 		=> Mast_CLK25MHz,--CLK_OUT(0),
		RESET 		=> RESET,
		Periodo_ms 	=> RC_Puls_1ms,
		PULSER_OUT 	=> PULSER_Out
	);				
			

ADC_CS <= CHIP_SELECT_sig and CHIP_SELECT_ENABLE;






--output assignements
PWR_EN      <=      PWR_EN_int;

-- Ricevitore diff del RefCLK dal CAVO
   OBUFGDS_inst : OBUFDS
   port map (
      I 	=> CLK_IN_Cavo,  -- Clock buffer output
      O 	=> EXT_TRG_P,  -- Diff_p clock buffer input
      OB => EXT_TRG_N -- Diff_n clock buffer input
   );
   
   OBUFGDS2_inst : OBUFDS
   port map (
      I 	=> CLK_IN_Cavo_2,  -- Clock buffer output
      O 	=> EXT_TRG2_P,  -- Diff_p clock buffer input
      OB => EXT_TRG2_N -- Diff_n clock buffer input
   );

end Behavioral;
