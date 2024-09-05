----------------------------------------------------------------------------------
-- Company:     INFN Naples
-- Engineer:    Luigi Lavitola
-- 
-- Create Date: 24.03.2021 12:24:41
-- Design Name: 
-- Module Name: RunControl_AXI - Behavioral
-- Project Name:    MAIN_ACQ_ZYNQ
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
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.instruction_buffer_type.all; -- 

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RunControl_AXI is
generic (
		-- Users to add parameters here

		-- User parameters ends
		-- Do not modify the parameters beyond this line

		-- Width of S_AXI data bus
		C_S_AXI_DATA_WIDTH	: integer	:= 32;
		-- Width of S_AXI address bus
		C_S_AXI_ADDR_WIDTH	: integer	:= 8
	);
	port (
		-- Users to add ports here
		RESET_IN            :     in  std_logic;    
        CS_ENABLE           :   out     std_logic_vector(18 downto 0);
        PWR_EN              :   out     std_logic_vector(18 downto 0);
        OVC_CH              :   in     std_logic_vector(18 downto 0);
        CALIBRAZIONE	    :   out  	STD_LOGIC;
	    CLK_SEL_out	        :  out  	STD_LOGIC;
	    Rc_CLK_est_int      :  out		STD_LOGIC;
	    CLK_failed	        :   in  	STD_LOGIC;
		PSDONE			    :    in  	STD_LOGIC;
	    locked			    :     in  	STD_LOGIC;
	    ENERGY_MAX	        :   out  	STD_LOGIC_VECTOR (10 downto 0); --RITARDO ENERGIA
		RITARDO 		    :   out  	STD_LOGIC_VECTOR (7 downto 0); --RITARDO TIME
        PPS_contati 	    :       IN  	STD_LOGIC_VECTOR (31 downto 0); 
        COUNTER200M 	    :       IN  	STD_LOGIC_VECTOR (27 downto 0); 
        UnixTime_ARM 	    :       OUT 	STD_LOGIC_VECTOR (31 downto 0); 
        FLAG_WR_Unix_Time   :   OUT  STD_LOGIC;
        Clock_register      :   in STD_LOGIC_VECTOR(14 downto 0);
        Clock_register_out  :   out STD_LOGIC_VECTOR(3 downto 0);
        RunC_CLK_OK 	    :      in  	STD_LOGIC;
		Runc_CLK_Lost       :      in  	STD_LOGIC; 
		Runc_CLK_Found      :     in  	STD_LOGIC;
		Runc_CLK_ResFlg     :     out STD_LOGIC;
		Letto_CLK_res_flag  :     in  STD_LOGIC;    
		Res_TagFlg	        :      out 	STD_LOGIC;  -- Resetta i flag Tag
		RC_Tag_OK		    :      IN  	STD_LOGIC_VECTOR (2 downto 0); --b0=Tag0OK, b1= TagResOK -- b2 = unic time aligned 
		RC_Puls_1ms	        :     OUT  	STD_LOGIC_VECTOR (13 downto 0); --PULSER
		RC_EvSecEn	        :      out 	STD_LOGIC; -- Abilita l'evento secondi
		Fifo_HF		        :        in		STD_LOGIC;
		Runc_Val_Tag0       :     out 	   STD_LOGIC_VECTOR (15 downto 0); -- Valore Contatore tempo @200Mhz al TAG0
		Dead_Time           :     in       STD_LOGIC_VECTOR (31 downto 0);
		FREQ_EVENTI_0	    :       in      std_logic_vector(15 downto 0);
		FREQ_EVENTI_1	    :       in      std_logic_vector(15 downto 0);
		FREQ_EVENTI_2	    :       in      std_logic_vector(15 downto 0);
		FREQ_EVENTI_3	    :       in      std_logic_vector(15 downto 0);
		FREQ_EVENTI_4	    :       in      std_logic_vector(15 downto 0);
		FREQ_EVENTI_5	    :       in      std_logic_vector(15 downto 0);
		FREQ_EVENTI_6	    :       in      std_logic_vector(15 downto 0);
		FREQ_EVENTI_7	    :       in      std_logic_vector(15 downto 0);
		FREQ_EVENTI_8	    :       in      std_logic_vector(15 downto 0);
		FREQ_EVENTI_9	    :       in      std_logic_vector(15 downto 0);
		FREQ_EVENTI_10	    :       in      std_logic_vector(15 downto 0);
		FREQ_EVENTI_11	    :       in      std_logic_vector(15 downto 0);
		FREQ_EVENTI_12	    :       in      std_logic_vector(15 downto 0);
		FREQ_EVENTI_13	    :       in      std_logic_vector(15 downto 0);
		FREQ_EVENTI_14	    :       in      std_logic_vector(15 downto 0);
		FREQ_EVENTI_15	    :       in      std_logic_vector(15 downto 0);
		FREQ_EVENTI_16	    :       in      std_logic_vector(15 downto 0);
		FREQ_EVENTI_17	    :       in      std_logic_vector(15 downto 0);
		FREQ_EVENTI_18	    :       in      std_logic_vector(15 downto 0);
		FIFO_DATA_COUNT     :       in      std_logic_vector(14 downto 0);  
		-- User ports ends
		-- Do not modify the ports beyond this line

		-- Global Clock Signal
		S_AXI_ACLK	: in std_logic;
		-- Global Reset Signal. This Signal is Active LOW
		S_AXI_ARESETN	: in std_logic;
		-- Write address (issued by master, acceped by Slave)
		S_AXI_AWADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		-- Write channel Protection type. This signal indicates the
    		-- privilege and security level of the transaction, and whether
    		-- the transaction is a data access or an instruction access.
		S_AXI_AWPROT	: in std_logic_vector(2 downto 0);
		-- Write address valid. This signal indicates that the master signaling
    		-- valid write address and control information.
		S_AXI_AWVALID	: in std_logic;
		-- Write address ready. This signal indicates that the slave is ready
    		-- to accept an address and associated control signals.
		S_AXI_AWREADY	: out std_logic;
		-- Write data (issued by master, acceped by Slave) 
		S_AXI_WDATA	: in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		-- Write strobes. This signal indicates which byte lanes hold
    		-- valid data. There is one write strobe bit for each eight
    		-- bits of the write data bus.    
		S_AXI_WSTRB	: in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
		-- Write valid. This signal indicates that valid write
    		-- data and strobes are available.
		S_AXI_WVALID	: in std_logic;
		-- Write ready. This signal indicates that the slave
    		-- can accept the write data.
		S_AXI_WREADY	: out std_logic;
		-- Write response. This signal indicates the status
    		-- of the write transaction.
		S_AXI_BRESP	: out std_logic_vector(1 downto 0);
		-- Write response valid. This signal indicates that the channel
    		-- is signaling a valid write response.
		S_AXI_BVALID	: out std_logic;
		-- Response ready. This signal indicates that the master
    		-- can accept a write response.
		S_AXI_BREADY	: in std_logic;
		-- Read address (issued by master, acceped by Slave)
		S_AXI_ARADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		-- Protection type. This signal indicates the privilege
    		-- and security level of the transaction, and whether the
    		-- transaction is a data access or an instruction access.
		S_AXI_ARPROT	: in std_logic_vector(2 downto 0);
		-- Read address valid. This signal indicates that the channel
    		-- is signaling valid read address and control information.
		S_AXI_ARVALID	: in std_logic;
		-- Read address ready. This signal indicates that the slave is
    		-- ready to accept an address and associated control signals.
		S_AXI_ARREADY	: out std_logic;
		-- Read data (issued by slave)
		S_AXI_RDATA	: out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		-- Read response. This signal indicates the status of the
    		-- read transfer.
		S_AXI_RRESP	: out std_logic_vector(1 downto 0);
		-- Read valid. This signal indicates that the channel is
    		-- signaling the required read data.
		S_AXI_RVALID	: out std_logic;
		-- Read ready. This signal indicates that the master can
    		-- accept the read data and response information.
		S_AXI_RREADY	: in std_logic
	);
end RunControl_AXI;

architecture Behavioral of RunControl_AXI is
    
    COMPONENT blk_mem_gen_0 
  PORT (
    clka : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END COMPONENT;
    
    	-- AXI4LITE signals
	signal axi_awaddr	: std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
	signal axi_awready	: std_logic;
	signal axi_wready	: std_logic;
	signal axi_bresp	: std_logic_vector(1 downto 0);
	signal axi_bvalid	: std_logic;
	signal axi_araddr	: std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
	signal axi_arready	: std_logic;
	signal axi_rdata	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal axi_rresp	: std_logic_vector(1 downto 0);
	signal axi_rvalid	: std_logic;

	-- Example-specific design signals
	-- local parameter for addressing 32 bit / 64 bit C_S_AXI_DATA_WIDTH
	-- ADDR_LSB is used for addressing 32/64 bit registers/memories
	-- ADDR_LSB = 2 for 32 bits (n downto 2)
	-- ADDR_LSB = 3 for 64 bits (n downto 3)
	constant ADDR_LSB  : integer := (C_S_AXI_DATA_WIDTH/32)+ 1;
	constant OPT_MEM_ADDR_BITS : integer := 5;
	------------------------------------------------
	---- Signals for user logic register space example
	--------------------------------------------------
    signal slv_reg0	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal slv_reg1	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal slv_reg2	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg3	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg4	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg5	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg6	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg7	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg8	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg9	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg10	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg11	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg12	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg13	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg14	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg15	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg16	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg17	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg18	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg19	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg20	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg21	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg22	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg23	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg24	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg25	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg26	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg27	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg28	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg29	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg30	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg31	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg32	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg33	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg34	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg35	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg36	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg37	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg38	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg39	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg40	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	
	signal PEN_int	    :  STD_LOGIC_VECTOR (31 downto 0);
    signal Res_clk_reg_letto_int    :   std_logic;
    
    signal Flag_WR_UnixTime :   std_logic;
    
    signal COSTANTE : STD_LOGIC_VECTOR(1 downto 0);
    
	signal slv_reg_rden	: std_logic;
	signal slv_reg_wren	: std_logic;
	signal reg_data_out	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal byte_index	: integer;
	signal aw_en	: std_logic;
	
	signal Res_TagFlg_int	: std_logic;


begin
	-- I/O Connections assignments

	S_AXI_AWREADY	<= axi_awready;
	S_AXI_WREADY	<= axi_wready;
	S_AXI_BRESP	<= axi_bresp;
	S_AXI_BVALID	<= axi_bvalid;
	S_AXI_ARREADY	<= axi_arready;
	S_AXI_RDATA	<= axi_rdata;
	S_AXI_RRESP	<= axi_rresp;
	S_AXI_RVALID	<= axi_rvalid;
	-- Implement axi_awready generation
	-- axi_awready is asserted for one S_AXI_ACLK clock cycle when both
	-- S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_awready is
	-- de-asserted when reset is low.

	process (S_AXI_ACLK)
	begin
	  if rising_edge(S_AXI_ACLK) then 
	    if S_AXI_ARESETN = '0' then
	      axi_awready <= '0';
	      aw_en <= '1';
	    else
	      if (axi_awready = '0' and S_AXI_AWVALID = '1' and S_AXI_WVALID = '1' and aw_en = '1') then
	        -- slave is ready to accept write address when
	        -- there is a valid write address and write data
	        -- on the write address and data bus. This design 
	        -- expects no outstanding transactions. 
	           axi_awready <= '1';
	           aw_en <= '0';
	        elsif (S_AXI_BREADY = '1' and axi_bvalid = '1') then
	           aw_en <= '1';
	           axi_awready <= '0';
	      else
	        axi_awready <= '0';
	      end if;
	    end if;
	  end if;
	end process;

	-- Implement axi_awaddr latching
	-- This process is used to latch the address when both 
	-- S_AXI_AWVALID and S_AXI_WVALID are valid. 

	process (S_AXI_ACLK)
	begin
	  if rising_edge(S_AXI_ACLK) then 
	    if S_AXI_ARESETN = '0' then
	      axi_awaddr <= (others => '0');
	    else
	      if (axi_awready = '0' and S_AXI_AWVALID = '1' and S_AXI_WVALID = '1' and aw_en = '1') then
	        -- Write Address latching
	        axi_awaddr <= S_AXI_AWADDR;
	      end if;
	    end if;
	  end if;                   
	end process; 

	-- Implement axi_wready generation
	-- axi_wready is asserted for one S_AXI_ACLK clock cycle when both
	-- S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_wready is 
	-- de-asserted when reset is low. 
    --
    
	process (S_AXI_ACLK)
	begin
	  if rising_edge(S_AXI_ACLK) then 
	    if S_AXI_ARESETN = '0' then
	      axi_wready <= '0';
	    else
	      if (axi_wready = '0' and S_AXI_WVALID = '1' and S_AXI_AWVALID = '1' and aw_en = '1') then
	          -- slave is ready to accept write data when 
	          -- there is a valid write address and write data
	          -- on the write address and data bus. This design 
	          -- expects no outstanding transactions.           
	          axi_wready <= '1';
	      else
	        axi_wready <= '0';
	      end if;
	    end if;
	  end if;
	end process; 

	-- Implement memory mapped register select and write logic generation
	-- The write data is accepted and written to memory mapped registers when
	-- axi_awready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted. Write strobes are used to
	-- select byte enables of slave registers while writing.
	-- These registers are cleared when reset (active low) is applied.
	-- Slave register write enable is asserted when valid address and data are available
	-- and the slave is ready to accept the write address and write data.
	slv_reg_wren <= axi_wready and S_AXI_WVALID and axi_awready and S_AXI_AWVALID ;


    -- insert mux for write and read registers
    process (S_AXI_ACLK)
	variable loc_addr :std_logic_vector(OPT_MEM_ADDR_BITS downto 0); 
	begin
	  if rising_edge(S_AXI_ACLK) then 
	    
	    for I in 0 to 18 loop
                    if (OVC_CH(I)= '0') then
                         slv_reg1(I) <= '0';
                    end if;
         end loop;
	   
         
	    
	    if S_AXI_ARESETN = '0' then
	      slv_reg0 <= (others => '0');         --EN_ACQ
	      slv_reg1 <= (others => '0');         -- PWR_EN
	      --slv_reg2 <= (others => '0');
	      slv_reg3(10 downto 9) <= "10";       
	      slv_reg3(7 downto 6) <= "10";
	      --slv_reg4 <= (others => '0');
	      slv_reg5 <= (others => '0');         --UnixTime from ARM
	      slv_reg6 <= (others => '0');
	      --slv_reg7 <= (others => '0');
	      slv_reg8 <=  X"00000002";  
	      slv_reg9 <= (others => '0');
	      slv_reg10 <= X"000000" & "00011000";  --ENERGY MAX
	      slv_reg11 <= x"000000f0";             --tempo morto ACQ
	      slv_reg12 <= (others => '0');
	      
	      --slv_reg14 <= (others => '0');
	      slv_reg15 <= (others => '0');
	      slv_reg16 <= (others => '0');
	      slv_reg17 <= (others => '0');
	      slv_reg18 <= (others => '0');
	      slv_reg19 <= (others => '0');
	      
	      Flag_WR_UnixTime <= '0'; 
	      
      else
	      loc_addr := axi_awaddr(ADDR_LSB + OPT_MEM_ADDR_BITS downto ADDR_LSB);
	      if (slv_reg_wren = '1') then
	        case loc_addr is
	          when b"000000" =>
	              slv_reg0 <= S_AXI_WDATA;
	          when b"000001" =>
	              slv_reg1 <= S_AXI_WDATA;
--	          when b"000010" =>
--	              slv_reg2 <= S_AXI_WDATA;
	          when b"000011" =>
	              slv_reg3(10 downto 9) <= S_AXI_WDATA(10 downto 9); 
	              slv_reg3(7 downto 6) <= S_AXI_WDATA(7 downto 6);    
	          --when b"000100" =>
	            --  slv_reg4 <= S_AXI_WDATA;
	          when b"000101" =>
	              slv_reg5 <= S_AXI_WDATA;  
	              Flag_WR_UnixTime <= '1';  
	          when b"000110" =>
	              slv_reg6 <= S_AXI_WDATA;    
--	          when b"000111" =>
--	              slv_reg7 <= S_AXI_WDATA;    
	          when b"001000" =>
	              slv_reg8 <= S_AXI_WDATA;    
	          when b"001001" =>
	              slv_reg9 <= S_AXI_WDATA;    
	          when b"001010" =>
	              slv_reg10 <= S_AXI_WDATA;  --ENERGY_MAX
	          when b"001011" =>
	              slv_reg11 <= S_AXI_WDATA;  
	          when b"001100" =>
	              slv_reg12 <= S_AXI_WDATA;
	          
--	          when b"001110" =>
--	              slv_reg14 <= S_AXI_WDATA;
	          when b"001111" =>
	              slv_reg15 <= S_AXI_WDATA;
	          when b"010000" =>
	              slv_reg16 <= S_AXI_WDATA;      

              when others =>
                NULL;
--	            slv_reg0 <= slv_reg0;
--	            slv_reg1 <= slv_reg1;
--	            slv_reg2 <= slv_reg2;
--	            slv_reg3 <= slv_reg3;
--	            slv_reg4 <= slv_reg4;
--	            slv_reg5 <= slv_reg5;
--	            slv_reg6 <= slv_reg6;
--	            slv_reg7 <= slv_reg7;
--	            slv_reg8 <= slv_reg8;
--	            slv_reg9 <= slv_reg9;
--	            slv_reg10 <= slv_reg10;
--	            slv_reg11 <= slv_reg11;
--	            slv_reg12 <= slv_reg12;
--	            slv_reg13 <= slv_reg13;
--	            slv_reg14 <= slv_reg14;
--	            slv_reg15 <= slv_reg15;
--	            slv_reg16 <= slv_reg16;
--	            slv_reg17 <= slv_reg17;
--	            slv_reg18 <= slv_reg18;
--	            slv_reg19 <= slv_reg19;
--	            slv_reg20 <= slv_reg20;
--	            slv_reg21 <= slv_reg21;
--	            slv_reg22 <= slv_reg22;
--	            slv_reg23 <= slv_reg23;
--	            slv_reg24 <= slv_reg24;
--	            slv_reg25 <= slv_reg25;
--	            slv_reg26 <= slv_reg26;
--	            slv_reg27 <= slv_reg27;
--	            slv_reg28 <= slv_reg28;
--	            slv_reg29 <= slv_reg29;
--	            slv_reg30 <= slv_reg30;
--	            slv_reg31 <= slv_reg31;
--	            slv_reg32 <= slv_reg32;
--	            slv_reg33 <= slv_reg33;
--	            slv_reg34 <= slv_reg34;
	          	        end case;
	      end if;
	    end if;
	    
	    if Flag_WR_UnixTime = '1' then
	       Flag_WR_UnixTime <= '0';
	    end  if;
--	    for I in 0 to 18 loop
--				if (OVC_CH(I)= '0') then
--					 slv_reg1(I) <= '0';
--				end if;
--		end loop;
	    
	  end if;                   
	end process; 
	
	
		-- Implement write response logic generation
	-- The write response and response valid signals are asserted by the slave 
	-- when axi_wready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted.  
	-- This marks the acceptance of address and indicates the status of 
	-- write transaction.

	process (S_AXI_ACLK)
	begin
	  if rising_edge(S_AXI_ACLK) then 
	    if S_AXI_ARESETN = '0' then
	      axi_bvalid  <= '0';
	      axi_bresp   <= "00"; --need to work more on the responses
	    else
	      if (axi_awready = '1' and S_AXI_AWVALID = '1' and axi_wready = '1' and S_AXI_WVALID = '1' and axi_bvalid = '0'  ) then
	        axi_bvalid <= '1';
	        axi_bresp  <= "00"; 
	      elsif (S_AXI_BREADY = '1' and axi_bvalid = '1') then   --check if bready is asserted while bvalid is high)
	        axi_bvalid <= '0';                                 -- (there is a possibility that bready is always asserted high)
	      end if;
	    end if;
	  end if;                   
	end process; 
	
		-- Implement axi_arready generation
	-- axi_arready is asserted for one S_AXI_ACLK clock cycle when
	-- S_AXI_ARVALID is asserted. axi_awready is 
	-- de-asserted when reset (active low) is asserted. 
	-- The read address is also latched when S_AXI_ARVALID is 
	-- asserted. axi_araddr is reset to zero on reset assertion.

	process (S_AXI_ACLK)
	begin
	  if rising_edge(S_AXI_ACLK) then 
	    if S_AXI_ARESETN = '0' then
	      axi_arready <= '0';
	      axi_araddr  <= (others => '1');
	    else
	      if (axi_arready = '0' and S_AXI_ARVALID = '1') then
	        -- indicates that the slave has acceped the valid read address
	        axi_arready <= '1';
	        -- Read Address latching 
	        axi_araddr  <= S_AXI_ARADDR;           
	      else
	        axi_arready <= '0';
	      end if;
	    end if;
	  end if;                   
	end process; 
	
	-- Implement axi_arvalid generation
	-- axi_rvalid is asserted for one S_AXI_ACLK clock cycle when both 
	-- S_AXI_ARVALID and axi_arready are asserted. The slave registers 
	-- data are available on the axi_rdata bus at this instance. The 
	-- assertion of axi_rvalid marks the validity of read data on the 
	-- bus and axi_rresp indicates the status of read transaction.axi_rvalid 
	-- is deasserted on reset (active low). axi_rresp and axi_rdata are 
	-- cleared to zero on reset (active low).  
	process (S_AXI_ACLK)
	begin
	  if rising_edge(S_AXI_ACLK) then
	    if S_AXI_ARESETN = '0' then
	      axi_rvalid <= '0';
	      axi_rresp  <= "00";
	    else
	      if (axi_arready = '1' and S_AXI_ARVALID = '1' and axi_rvalid = '0') then
	        -- Valid read data is available at the read data bus
	        axi_rvalid <= '1';
	        axi_rresp  <= "00"; -- 'OKAY' response
	      elsif (axi_rvalid = '1' and S_AXI_RREADY = '1') then
	        -- Read data is accepted by the master
	        axi_rvalid <= '0';
	      end if;            
	    end if;
	  end if;
	end process;

	-- Implement memory mapped register select and read logic generation
	-- Slave register read enable is asserted when valid address is available
	-- and the slave is ready to accept the read address.
	slv_reg_rden <= axi_arready and S_AXI_ARVALID and (not axi_rvalid) ;

	process (axi_araddr, S_AXI_ARESETN, slv_reg_rden, slv_reg0,slv_reg1, slv_reg2, slv_reg3)
	variable loc_addr :std_logic_vector(OPT_MEM_ADDR_BITS downto 0);
	begin
	    -- Address decoding for reading registers
	    loc_addr := axi_araddr(ADDR_LSB + OPT_MEM_ADDR_BITS downto ADDR_LSB);
	    case loc_addr is
	           when b"000000" =>
	               reg_data_out <= slv_reg0;           --ChipSelect
	           when b"000001" =>
	               reg_data_out <= slv_reg1;           -- PowerEnable
	           when b"000010" =>
	               reg_data_out <= slv_reg2;           --OverCurrent
	          when b"000011" =>
	               reg_data_out <= slv_reg3;           -- ClockRegister
	               
	          when b"000100" =>
	               reg_data_out <= slv_reg4;           --PPS contati
	          when b"000101" =>
	               reg_data_out <= slv_reg5;           --UnixTime from ARM
	          when b"000110" =>
	               reg_data_out <= slv_reg6;           --calibrazione ADC e EN evento secondi
	          when b"000111" =>
	               reg_data_out <= slv_reg7;
	          when b"001000" =>
	               reg_data_out <= slv_reg8;
	          when b"001001" =>
	               reg_data_out <= slv_reg9;
	          when b"001010" =>
	               reg_data_out <= slv_reg10;      --ENERGY MAX
	          when b"001011" =>
	               reg_data_out <= slv_reg11;      --tempo morto ACQ
	          when b"001100" =>
	               reg_data_out <= slv_reg12;      --RC_Puls_1ms
	          --when b"001101" =>
	          when X"D" =>
	               reg_data_out <= slv_reg13;      --FREQ EV CH0
	          when X"E" =>
	               reg_data_out <= slv_reg14;      --FIFO DATA WORD
	          when X"F" =>
	               reg_data_out <= slv_reg15;
	          when X"10" =>
	               reg_data_out <= slv_reg16;
	          when X"11" =>
	               reg_data_out <= slv_reg17;
              when X"12" =>
	               reg_data_out <= slv_reg18;
	          when X"13" =>
	               reg_data_out <= slv_reg19;
	          --FREQUENCY METER FROM HERE
	          when X"14" =>
	               reg_data_out <= slv_reg20;
              when X"15" =>
	               reg_data_out <= slv_reg21;
	          when X"16" =>
	               reg_data_out <= slv_reg22;
	          when X"17" =>
	               reg_data_out <= slv_reg23;
	          when X"18" =>
	               reg_data_out <= slv_reg24;
	          when X"19" =>
	               reg_data_out <= slv_reg25;
              when X"1A" =>
	               reg_data_out <= slv_reg26;
	          when X"1B" =>
	               reg_data_out <= slv_reg27;
	          when X"1C" =>
	               reg_data_out <= slv_reg28;
	          when X"1D" =>
	               reg_data_out <= slv_reg29;
	          when X"1E" =>
	               reg_data_out <= slv_reg30;
              when X"1F" =>
	               reg_data_out <= slv_reg31;
	          when X"20" =>
	               reg_data_out <= slv_reg32;
	          when X"21" =>
	               reg_data_out <= slv_reg33;
	          when X"22" =>
	               reg_data_out <= slv_reg34;
	          when X"23" =>
	               reg_data_out <= slv_reg35;
	          when X"24" =>
	               reg_data_out <= slv_reg36;
	          when X"25" =>
	               reg_data_out <= slv_reg37;
	          when X"26" =>
	               reg_data_out <= slv_reg38;
	          --END FREQUENCY METER MAP
	          when X"27" =>
	               reg_data_out <= slv_reg39;
	          when X"28" =>
	               reg_data_out <= slv_reg40;
	          
	      when others =>
	        reg_data_out  <= (others => '0');
	    end case;
	end process; 
    
    
    	-- Output register or memory read data
	process( S_AXI_ACLK ) is
	variable loc_addr :std_logic_vector(OPT_MEM_ADDR_BITS downto 0);
	begin
	   loc_addr := axi_araddr(ADDR_LSB + OPT_MEM_ADDR_BITS downto ADDR_LSB);
	  
	  if (rising_edge (S_AXI_ACLK)) then
	    if ( S_AXI_ARESETN = '0' ) then
	      axi_rdata  <= (others => '0');
	      Runc_CLK_ResFlg <= '0' ;
	      Res_TagFlg_int <= '0' ;
	      Res_clk_reg_letto_int <= '0';
	    else
	      if (slv_reg_rden = '1') then
	        -- When there is a valid read address (S_AXI_ARVALID) with 
	        -- acceptance of read address by the slave (axi_arready), 
	        -- output the read dada 
	        -- Read address mux
	          axi_rdata <= reg_data_out;     -- register read data
	      end if;  
	      
	      Res_clk_reg_letto_int <=  Letto_CLK_res_flag;
	      if  (slv_reg_rden = '1' and loc_addr = b"000011" ) then
	          Runc_CLK_ResFlg <= '1' ;
	          Res_TagFlg_int <= '1' ;
	      end if;
	      if  Res_clk_reg_letto_int = '1' then
	          Runc_CLK_ResFlg <= '0' ;      
	      end if;
	      
	      if Res_TagFlg_int = '1' then
	           Res_TagFlg_int <= '0';
	      end if;
	    end if;
	  end if;
	end process;
	
--    -- Funz Power Protection
--    process( S_AXI_ACLK ) is
--	begin
--	  if (rising_edge (S_AXI_ACLK)) then
--	    for I in 0 to 18 loop
--				if (OVC_CH(I)= '0') then
--					 PEN_int(I) <= '0';
--				end if;
--			end loop;

--	  end if;
--	end process;
    
    COSTANTE <= "10";
    RAM_PWR_EN : blk_mem_gen_0
    PORT MAP (
        clka => S_AXI_ACLK,
        wea => COSTANTE(1 downto 1),
        addra => COSTANTE(0 downto 0),
        dina => slv_reg1,
        douta => PEN_int
  );
	    
    process( S_AXI_ACLK ) is
	begin
	  if (rising_edge (S_AXI_ACLK)) then
	       PWR_EN <= PEN_int(18 downto 0);
	  end if;
	  
	end process;
	
	
			
    --output
    CS_ENABLE <= slv_reg0(18 downto 0);
    --PWR_EN <= slv_reg1(18 downto 0);
    
    ENERGY_MAX <= slv_reg10(10 downto 0);
    RITARDO <=  slv_reg11(7 downto 0);
    RC_Puls_1ms <=  slv_reg12(13 downto 0);
    RC_EvSecEn  <=  slv_reg6(0);
    CALIBRAZIONE  <=  slv_reg6(1);
    
    UnixTime_ARM    <= slv_reg5;
    FLAG_WR_Unix_Time <= Flag_WR_UnixTime;
    Runc_Val_Tag0 <= slv_reg8(15 downto 0);
    --input
    slv_reg2(18 downto 0) <= OVC_CH;
    --slv_reg7(0) <= Fifo_HF;
    slv_reg3(15) <= RC_Tag_OK(0);
    slv_reg3(16) <= RC_Tag_OK(2);
    slv_reg3(17) <= RC_Tag_OK(1);
    slv_reg3(14 downto 11) <= Clock_register(14 downto 11);
    slv_reg3(8) <= Clock_register(8);
    slv_reg3(5 downto 0) <= Clock_register(5 downto 0);
    Clock_register_out <= slv_reg3(10 downto 9) & slv_reg3(7 downto 6);
    
    slv_reg4 <= PPS_contati;
    slv_reg7(27 downto 0) <= COUNTER200M;
    
    slv_reg13 <=Dead_Time;  --tempo morto
    
    slv_reg14(14 downto 0) <=FIFO_DATA_COUNT;
    
    Res_TagFlg <= Res_TagFlg_int;
    
    --FREQUENCY METER FROM REG 0x14 (20) to 0x27 (38)
    
    slv_reg20(15 downto 0) <=FREQ_EVENTI_0;
    slv_reg21(15 downto 0) <=FREQ_EVENTI_1;
    slv_reg22(15 downto 0) <=FREQ_EVENTI_2;
    slv_reg23(15 downto 0) <=FREQ_EVENTI_3;
    slv_reg24(15 downto 0) <=FREQ_EVENTI_4;
    slv_reg25(15 downto 0) <=FREQ_EVENTI_5;
    slv_reg26(15 downto 0) <=FREQ_EVENTI_6;
    slv_reg27(15 downto 0) <=FREQ_EVENTI_7;
    slv_reg28(15 downto 0) <=FREQ_EVENTI_8;
    slv_reg29(15 downto 0) <=FREQ_EVENTI_9;
    slv_reg30(15 downto 0) <=FREQ_EVENTI_10;
    slv_reg31(15 downto 0) <=FREQ_EVENTI_11;
    slv_reg32(15 downto 0) <=FREQ_EVENTI_12;
    slv_reg33(15 downto 0) <=FREQ_EVENTI_13;
    slv_reg34(15 downto 0) <=FREQ_EVENTI_14;
    slv_reg35(15 downto 0) <=FREQ_EVENTI_15;
    slv_reg36(15 downto 0) <=FREQ_EVENTI_16;
    slv_reg37(15 downto 0) <=FREQ_EVENTI_17;
    slv_reg38(15 downto 0) <=FREQ_EVENTI_18;

    
    end Behavioral;

