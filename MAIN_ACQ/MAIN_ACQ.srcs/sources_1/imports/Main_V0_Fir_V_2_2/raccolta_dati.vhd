----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Andrea Evangelisti
-- 
-- Create Date:    11:46:01 06/08/2018 
-- Design Name: 
-- Module Name:    shift_register - Behavioral 
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

entity raccolta_dati is
generic (
		   numerodicanali       : integer:= 20
);
    Port ( 
			  EVENT_IN 		: in  D_ARRAY_61BIT;
			  CLK 			: in  STD_LOGIC;
           reset 			: in  STD_LOGIC;
           clean 			: out  STD_LOGIC_VECTOR (numerodicanali -1 downto 0);
           valid 			: in  STD_LOGIC_VECTOR (numerodicanali -1 downto 0);
			  Fifo_HFULL	: in  STD_LOGIC;
           write_en 		: out  STD_LOGIC;
           EVENT_OUT 	: out  STD_LOGIC_VECTOR (95 downto 0));
end raccolta_dati;

architecture Behavioral of raccolta_dati is

--===================================================================================
-- 						COSTANTI & SEGNALI
--===================================================================================
signal EV : D_ARRAY_61BIT := ((others=> (others=>'0'))) ;
signal contatore : std_logic_vector(4 downto 0):="00000";
signal falg_valid : std_logic_vector(numerodicanali -1 downto 0):=(others=>'0');
signal load : std_logic :='0';
signal write_en_sig : std_logic :='0';
signal EVENT_OUT_sig : STD_LOGIC_VECTOR (95 downto 0);

attribute keep : string;
attribute keep of load : signal is "true";
attribute keep of falg_valid : signal is "true";
attribute keep of write_en_sig : signal is "true";
attribute keep of EVENT_OUT_sig : signal is "true";
attribute keep of contatore : signal is "true";

begin

--===================================================================================
-- 						Shift
--===================================================================================
clockedp : process (CLK,reset) 
begin
	if(reset='1')then
			EV<=((others=> (others=>'0'))) ;
			falg_valid<=(others=>'0');
			clean<=(others=>'0');
			EVENT_OUT_sig<=(others=>'0');
	elsif(rising_edge(clk))then
		if(load='1') and (Fifo_HFULL = '0' )then
			EV<=EVENT_IN;
			falg_valid<=valid;
			clean<=valid;
		else		
			for i in 0 to numerodicanali -2 loop
				EV(i)<=EV(i+1);
				clean<=(others=>'0');
				falg_valid(i)<=falg_valid(i+1);
			end loop;
			 falg_valid(numerodicanali -1) <= '0'; -- ( Provare ))))))
		end if;
	--EVENT_OUT<="00" & contatore & EV(0)(55) & '0' & EV(0)(54 downto 40) & '0' & EV(0)(39 downto 25) & "000" & EV(0)(24 downto 12) & "0000" & EV(0)(11 downto 0);
	EVENT_OUT_sig(95 downto 80)<=  EV(0)(76 downto 61);--Time_16bit
	EVENT_OUT_sig(79 downto 64)<=  x"00" & "000" & EV(0)(60 downto 56);--canale
	EVENT_OUT_sig(63 downto 48)<=	'0' & EV(0)(55 downto 41);--primi 15 bit tdc
	EVENT_OUT_sig(47 downto 32)<=	'0' & EV(0)(40 downto 26);--ultimi 13 bit tdc + 2 bit fini
	EVENT_OUT_sig(31 downto 16)<=	"00" & EV(0)(25 downto 12);--3 bit fini + 6 bit alti + 5 bit alto fine
	EVENT_OUT_sig(15 downto 0)<=	"0000" & EV(0)(11 downto 0);--energia
	write_en_sig<=falg_valid(0);	
	end if;
end process;

--===================================================================================
-- 						Write enable generation
--===================================================================================
loadp : process (CLK,reset) 
begin

	if(reset='1')then
		load<='0';
		contatore<="00000";
		EVENT_OUT<=(others=>'0');
		write_en<='0';
	elsif(rising_edge(clk))then
		if(write_en_sig='1')then
			EVENT_OUT<=EVENT_OUT_sig;
			write_en<='1';
		else
			EVENT_OUT<=(others=>'0');
			write_en<='0';			
		end if;	
		if(contatore="10011")then
			load<='1';
			contatore<="00000";
		else
			contatore<=contatore+1;
			load<='0';
   end if;
end if;
end process;

end Behavioral;
