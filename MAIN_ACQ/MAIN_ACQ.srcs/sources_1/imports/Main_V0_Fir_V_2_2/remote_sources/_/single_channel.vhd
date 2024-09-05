----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:24:07 03/21/2018 
-- Design Name: 
-- Module Name:    single_channel - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.std_logic_unsigned.all;
library UNISIM;
use UNISIM.VComponents.all;

entity single_channel is
generic (add : STD_LOGIC_vector(4 downto 0) := "00000";
		   posizione_y       : integer:=0;
		   posizione_x       : integer:=0
);
    Port ( CLK_OUT 			: in  STD_LOGIC_vector(6 downto 0);
           channel_event 	: out  STD_LOGIC_vector(76 downto 0);
           flag_event 		: out  STD_LOGIC;
		   flag_clean 		: in  STD_LOGIC;
           RESET 				: in  STD_LOGIC;
		   set_ritardo 		: in STD_LOGIC_VECTOR (7 downto 0):=x"f0";
		   time_p 			: in STD_LOGIC;
		   time_n 			: in STD_LOGIC;
		   massimo 			: in STD_LOGIC_vector(10 downto 0);
           corse 				: in  STD_LOGIC_vector(27 downto 0);
           Time_16bit 				: in  STD_LOGIC_vector(15 downto 0);
		   pps					: in STD_LOGIC;
           eventi_contati 	: out  STD_LOGIC_vector(15 downto 0);
		   calibrazione		: in  STD_LOGIC;
		   Pulser				: in  STD_LOGIC;
           channel_miso 	: in  STD_LOGIC;
           ch_enable 		: in  STD_LOGIC:='0';
           channel_sclk 	: out  STD_LOGIC;
           channel_cs 		: out  STD_LOGIC);
           
           attribute dont_touch : string;
           attribute dont_touch of single_channel : entity is "true";

end single_channel;

architecture Behavioral of single_channel is

--===================================================================================
-- 						COSTANTI & SEGNALI
--===================================================================================
signal time_t : std_logic :='0';
signal timeandtime_ready : std_logic :='0';
signal time_ready : std_logic :='0';
signal DATO_ENERGIA : std_logic_vector(11 downto 0) ;	
signal DATO_TEMPO : std_logic_vector(59 downto 0) ;
signal valid_energia : std_logic ;
signal valid_time : std_logic ;
signal Trg_INr 	: std_logic ;
signal Time_o_Pulser 	: std_logic ;
signal eventi_letti : std_logic_vector(15 downto 0) ;
signal Durata_H_TRG : std_logic_vector(7 downto 0) ;
signal CH_Disable  :   std_logic;
signal RESET_EN : std_logic;

attribute keep : string;
attribute keep of time_t : signal is "true";
attribute keep of Time_o_Pulser : signal is "true";


-----fsm--------
type stato is (aspetta, unosudue,valida);
signal state, next_state : stato;
----------------
begin

--===================================================================================
-- 						Buffer differenziale
--===================================================================================
   IBUFDS_IBUFDISABLE_inst : IBUFDS_IBUFDISABLE
   generic map (
      DIFF_TERM => "TRUE", -- Differential Termination 
      IBUF_LOW_PWR => "FALSE", -- Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards
      --IOSTANDARD => "DIFF_HSTL_II_18", -- Specify the input I/O standard
      USE_IBUFDISABLE => "FALSE") -- Set to "TRUE" to enable IBUFDISABLE feature
   port map (
      O => time_t,  -- Buffer output
      I => time_p,  -- Diff_p buffer input (connect directly to top-level port)
      IB => time_n, -- Diff_n buffer input (connect directly to top-level port)
      IBUFDISABLE => '0'--CH_Disable -- Buffer disable input, high=disable
   );

RESET_EN <= RESET or CH_Disable;--(not ch_enable); -- provare
--   IBUFDS_inst : IBUFDS
--   generic map (
--      DIFF_TERM => TRUE, -- Differential Termination 
--      IBUF_LOW_PWR => FALSE) -- Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards
--      --IOSTANDARD => "DEFAULT")
--   port map (
--      O => time_t,  -- Buffer output
--      I => time_p,  -- Diff_p buffer input (connect directly to top-level port)
--      IB => time_n -- Diff_n buffer input (connect directly to top-level port)
--   );
--===================================================================================
-- 						Energia
--===================================================================================
Time_o_Pulser <= (time_t or Pulser);-- when (ch_enable = '1') else '0';   --provare
--Time_o_Pulser <= (time_t or Pulser) and  ch_enable;
timeandtime_ready<= Time_o_Pulser and time_ready;

process( CLK_OUT(0) ) is
	begin
	  if (rising_edge (CLK_OUT(0))) then
	       CH_Disable <= not ch_enable;
	  end if;
	end process;


Inst_CS_latch : entity work.CS_latch
  GENERIC MAP(
	add=>add )
 PORT MAP(
	time_info => timeandtime_ready,--(PROVA!!!!!!!!!!!!!!)
	reset => RESET_EN,
	miso => channel_miso,
	sclk => channel_sclk,
	CS_out => channel_cs,
	beccailmax => massimo,
	dato_fuori => DATO_ENERGIA,
	cal => calibrazione,
	data_valid => valid_energia,
	clk => CLK_OUT(0)
);

--===================================================================================
-- 						Tempo
--===================================================================================

Inst_blocco_time : entity work.blocco_time
--GENERIC MAP(
--	posizione_x=>posizione_x,
--	posizione_y=>posizione_y)
 PORT MAP(
	 time_sig => Time_o_Pulser,--time_t,
	 CLK_OUT => CLK_OUT,
	 reset => RESET_EN,
	 time_ready => time_ready,
	 set_ritardo=>set_ritardo,
	 corse_in => corse,
	 Time_16bit => Time_16bit,
	 time_out => DATO_TEMPO,
	 out_valid => valid_time
);

--===================================================================================
-- 						Generazione evento
--===================================================================================

comb : process(state,valid_energia,valid_time,flag_clean)
begin
	case state is
		when aspetta =>
				if (valid_time = '1') then
					next_state <= unosudue;
				else
					next_state <= aspetta;
				end if;

		when unosudue =>
				if (valid_energia = '1') then
					next_state <= valida;
				else 
					next_state <= unosudue;
				end if;		
						
		when valida =>
				if (flag_clean = '1') then
					next_state <= aspetta;
				else 
					next_state <= valida;
				end if;
	end case;			
end process;

ck : process(CLK_OUT(0),RESET_EN)
begin
	if(RESET_EN='1')then
		state<=aspetta;
		flag_event<='0';
		channel_event(55 downto 0)<=(others => '0');
		channel_event(76 downto 61)<=(others => '0');
	elsif(rising_edge(CLK_OUT(0)))then	
		if(state=aspetta)then
		flag_event<='0';
			if(valid_time='1')then
				channel_event(55 downto 12)<=DATO_TEMPO(43 downto 0);
				channel_event(76 downto 61)<=DATO_TEMPO(59 downto 44);
			end if;
		
		elsif(state=unosudue)then
		flag_event<='0';
			if(valid_energia='1')then
				channel_event(11 downto 0)<=DATO_ENERGIA;
			end if;
			
		elsif(state=valida)then
			flag_event<='1';	
		end if;
			state<=next_state;
	end if;
end process;	

--===================================================================================
-- 						Contatore eventi
--===================================================================================

contatore_eventi : process(CLK_OUT(0),RESET_EN)
begin
	if(RESET_EN='1')then
		eventi_letti(15 downto 0)<=x"0000";
		eventi_contati<=X"0000";
		Durata_H_TRG <= ( others => '0');
		Trg_INr <='0';
	elsif(rising_edge(CLK_OUT(0)))then
	       Trg_INr <= Time_o_Pulser;--time_t or Pulser;
		
		if(pps='1')then
			eventi_contati<=eventi_letti;
			eventi_letti<=x"0000";
		elsif ((valid_time='1')and (eventi_letti < X"FFFE")) then
			eventi_letti<=eventi_letti+1;
		elsif Durata_H_TRG = 255 then -- Se sempre alto
		    eventi_letti<=x"FFFF";
		end if;	
-- Comparatore Sempre alto pone a FFFF
		if Trg_INr = '0' then
					Durata_H_TRG <=( others => '0');
		elsif  Durata_H_TRG < 255 then 
					Durata_H_TRG <= Durata_H_TRG + 1;
		end if;			
		
	end if;
end process;

--===================================================================================
-- 						Indirizzo del canale
--===================================================================================
channel_event(60 downto 56)<=add;

end Behavioral;
