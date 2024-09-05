----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Andrea Evangelisti
-- 
-- Create Date:    11:46:01 06/08/2018 
-- Design Name: 
-- Module Name:    raccolta_canali - Behavioral 
-- Project Name: 
-- Target Devices: 	Artix 7 200-T
-- Tool versions: 
-- Description: TDC
--
-- Dependencies: 
--
-- Revision: 
-- Revision 1.0 - Definitiva
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.std_logic_unsigned.all;
use work.instruction_buffer_type.all;

entity raccolta_canali is
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
          data_out 		: out  STD_LOGIC_VECTOR (95 downto 0));       
          
          --attribute keep_hierarchy : string;
          --attribute keep_hierarchy of raccolta_canali : entity is "yes";
           
end raccolta_canali;

architecture Behavioral of raccolta_canali is

--===================================================================================
-- 						COSTANTI & SEGNALI
--===================================================================================
--signal corse_counter_sig : STD_LOGIC_VECTOR (27 downto 0):=x"0000000";
signal canale 			: STD_LOGIC_VECTOR (4 downto 0):="00000";
signal EV : D_ARRAY_61BIT :=((others=> (others=>'0'))) ;
signal flag_event 	: STD_LOGIC_VECTOR (numerodicanali -1 downto 0):=(others=>'0');
signal clean_event 	: STD_LOGIC_VECTOR (numerodicanali -1 downto 0):=(others=>'0');
signal ch_enable 		: STD_LOGIC_VECTOR (numerodicanali -2 downto 0):=(others=>'0');
signal Tempo_Morto 	: STD_LOGIC_VECTOR (15 downto 0);
signal Tempo_Morto_int 	: STD_LOGIC_VECTOR (15 downto 0);
signal HF_Fifo_int : STD_LOGIC;
signal FREQ_METER_int   :   F_ARRAY_Type;
--signal PPS_di_emergenza : STD_LOGIC;

--ATTRIBUTE keep_hierarchy 					: string;
--ATTRIBUTE keep_hierarchy OF Behavioral	: ARCHITECTURE IS "true";
attribute keep : string;
attribute keep of Tempo_Morto : signal is "true";
attribute keep of COUNTER200M : signal is "true";



begin

ch_enable<= ch_disable;
HF_Fifo_int <= Fifo_HFull;
eventi_freq <= FREQ_METER_int;
--===================================================================================
-- 						Dichiarazione canali
--===================================================================================

pp1: for i in 0 to (numerodicanali -2) generate
begin
Inst_single_channel : entity work.single_channel
	GENERIC MAP(
	add=>CONV_STD_LOGIC_VECTOR(i,5) )
--	posizione_x=>2+10*I,
--	posizione_y=>118)
	PORT MAP(
		CLK_OUT 			=> CLK_OUT,
		channel_event 	=> EV(i),
		flag_event 		=> flag_event(i),
		flag_clean 		=> clean_event(i),
		RESET 			=> RESET,
		time_p 			=> time_p(i),
		time_n 			=> time_n(i),
		massimo 			=> massimo,
		eventi_contati => FREQ_METER_int(i),
		Pulser 			=> Pulser,
		set_ritardo		=>RITARDO,
		ch_enable		=>ch_enable(i),
		corse 			=> COUNTER200M,
		Time_16bit      => COUNTA_sec(15 downto 0),
		pps				=> PPS,
		calibrazione 	=> calibrazione,
		channel_miso 	=> miso(i),
		channel_sclk 	=> sclk(i),
		channel_cs 		=> chip_select(i)
	);

end generate;
------------------------------------
--  Canale Secondi 
------------------------------------
	Inst_Canale_secondi: entity work.Canale_secondi 
	PORT MAP(
		CLK200M 		=> CLK_OUT(0),
		RESET 		=> RESET,
		RC_EvSecEn 	=> RC_EvSecEn,
		PPS 			=> PPS,
		Conta_Sec 	=> COUNTA_sec,
		Dead_Time   => Tempo_Morto_int,
		Dati_OUT 	=> EV(19),
		eventi_freq => FREQ_METER_int,
		Flg_Ev 		=> flag_event(19),
		Flg_clean 	=> clean_event(19)
	);

--===================================================================================
-- 						Shift register dati
--===================================================================================
Inst_raccolta_dati : entity work.raccolta_dati
	GENERIC MAP(
	numerodicanali=>numerodicanali)
PORT MAP(
		EVENT_IN 	=> EV,
		CLK 			=> CLK_OUT(0),
		reset 		=> RESET,
		clean 		=> clean_event,
		valid 		=> flag_event,
		Fifo_HFULL	=> HF_Fifo_int,
		write_en 	=> wr_enable,
		EVENT_OUT 	=> data_out
	);
	
--==================================================================
--  					Misura tempo morto
--==================================================================
Proc_T_Morto : process(CLK_OUT(0),reset)
begin
	if(reset='1')then
		--eventi_freq(19)		<= ( others => '0');
		FREQ_METER_int(19)		<= ( others => '0');
		Tempo_Morto				<= ( others => '0');
		Tempo_Morto_int   <= ( others => '0');
	elsif(rising_edge(CLK_OUT(0)))then
	
			if(pps='1')then
				--eventi_freq(19) 	<= Tempo_Morto;
				FREQ_METER_int(19) 	<= Tempo_Morto;
				Tempo_Morto_int     <= Tempo_Morto;
				Tempo_Morto			<= ( others => '0');
			elsif ((COUNTER200M(11 downto 0) = 0 )and (Tempo_Morto < X"FFFF") and HF_Fifo_int = '0') then
				Tempo_Morto		<=	Tempo_Morto+1;
		    
			end if;				
		
	end if;
end process;
-------------------------------------------------------------------------


end Behavioral;