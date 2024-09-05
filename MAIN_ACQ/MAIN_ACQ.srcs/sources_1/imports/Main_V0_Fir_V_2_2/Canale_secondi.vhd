----------------------------------------------------------------------------------
-- Company: INFN Napoli
-- Engineer: AB
-- 
-- Create Date:    12:41:11 22/08/2020 
-- Design Name: 
-- Module Name:    Canale_Secondi - Behavioral 
-- Project Name: 

-- Description: ogni secondo crea un evento  contatore di secondi

----------------------------------------------------------------------------------
library IEEE;
library UNISIM;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use UNISIM.vcomponents.all;
use work.instruction_buffer_type.all;

entity Canale_secondi is
    Port ( CLK200M 	: in  STD_LOGIC;
           RESET 		: in  STD_LOGIC;
			  RC_EvSecEn: in  STD_LOGIC;
           PPS 		: in  STD_LOGIC;
           Conta_Sec : in  STD_LOGIC_VECTOR (31 downto 0);
           Dead_Time : in   STD_LOGIC_VECTOR (15 downto 0);
	-- OUT		  
           Dati_OUT 	: out STD_LOGIC_VECTOR (76 downto 0);
           Flg_Ev 	: out STD_LOGIC;
           eventi_freq 	: in F_ARRAY_Type;
           Flg_clean : in  STD_LOGIC);
end Canale_secondi;

architecture Behavioral of Canale_secondi is

signal Mem_T_Sec : STD_LOGIC_VECTOR 	(31 downto 0);

signal somma_parziale0_3 : STD_LOGIC_VECTOR(17 downto 0);
signal somma_parziale4_7 : STD_LOGIC_VECTOR(17 downto 0);
signal somma_parziale8_11 : STD_LOGIC_VECTOR(17 downto 0);
signal somma_parziale12_15 : STD_LOGIC_VECTOR(17 downto 0);
signal somma_parziale16_18 : STD_LOGIC_VECTOR(17 downto 0);
signal somma_parziale_a : STD_LOGIC_VECTOR(19 downto 0);
signal somma_parziale_b : STD_LOGIC_VECTOR(19 downto 0);
signal somma_totale : STD_LOGIC_VECTOR(20 downto 0);
signal Shifter : STD_LOGIC_VECTOR(5 downto 0);
signal Flag_int : STD_LOGIC;

attribute keep : string;
attribute keep of somma_parziale0_3 : signal is "true";
attribute keep of somma_parziale4_7 : signal is "true";
attribute keep of somma_parziale8_11 : signal is "true";
attribute keep of somma_parziale12_15 : signal is "true";
attribute keep of somma_parziale16_18 : signal is "true";
attribute keep of somma_parziale_a : signal is "true";
attribute keep of somma_parziale_b : signal is "true";
attribute keep of somma_totale : signal is "true";

begin


ck : process(CLK200M,RESET)
begin
	if(RESET='1')then
		Mem_T_Sec 	<= ( others => '0');
		Shifter 	<= ( others => '0');
		Flg_Ev		<= '0';
		Flag_int		<= '0';
		somma_parziale0_3 <= ( others => '0');
		somma_parziale4_7 <= ( others => '0');
		somma_parziale8_11 <= ( others => '0');
		somma_parziale12_15 <= ( others => '0');
		somma_parziale16_18 <= ( others => '0');
		somma_parziale_a <= ( others => '0');
		somma_parziale_b <= ( others => '0');
		somma_totale <= ( others => '0');
		
	elsif(rising_edge( CLK200M ))then
			if Flg_clean = '1' then
					Flag_int <='0';
					--Flg_Ev <='0';
					Shifter <= (others => '0');
			elsif  PPS = '1' and  RC_EvSecEn  = '1' then
					Mem_T_Sec  	<= Conta_Sec;
					--Flg_Ev 		<='1';
					Flag_int 		<='1';
			end if;	 
            
            --sommatore ratemeter in pipeline
            somma_parziale0_3 <= ("00" & eventi_freq(0)) + ("00" & eventi_freq(1)) + ("00" & eventi_freq(2)) + ("00" & eventi_freq(3));
            somma_parziale4_7 <= ("00" & eventi_freq(4)) + ("00" & eventi_freq(5)) + ("00" & eventi_freq(6)) + ("00" & eventi_freq(7));
            somma_parziale8_11 <= ("00" & eventi_freq(8)) + ("00" & eventi_freq(9)) + ("00" & eventi_freq(10)) + ("00" & eventi_freq(11));
            somma_parziale12_15 <= ("00" & eventi_freq(12)) + ("00" & eventi_freq(13)) + ("00" & eventi_freq(14)) + ("00" & eventi_freq(15));
            somma_parziale16_18 <= ("00" & eventi_freq(16)) + ("00" & eventi_freq(17)) + ("00" & eventi_freq(18));
            somma_parziale_a <= ("00" & somma_parziale0_3) + ("00" & somma_parziale4_7) + ("00" & somma_parziale8_11);
            somma_parziale_b <= ("00" & somma_parziale12_15) + ("00" & somma_parziale16_18);
            somma_totale <= ('0' & somma_parziale_a) + ('0' & somma_parziale_b);
            
            --shifter for delay
            Shifter <= Shifter(4 downto 0) & Flag_int;
            Flg_Ev 		<= Shifter(5);
            
	end if;
end process;


-------------------
-- assegna uscite
-------------------
Dati_OUT(60 downto 56) <= "11111"; 
Dati_OUT(76 downto 61) <= Mem_T_Sec(15 downto 0);
Dati_OUT(55 downto 40) <= Mem_T_Sec(31 downto 16);
Dati_OUT(39 downto 37) <= "000";
Dati_OUT(36 downto 16) <= somma_totale;
Dati_OUT(15 downto 0) <= Dead_Time;
--Dati_OUT(39 downto 16) <= ( others => '0'); 


end Behavioral;

