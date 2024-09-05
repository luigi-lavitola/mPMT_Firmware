----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Andrea Evangelisti
-- 
-- Create Date:    14:37:42 10/17/2017 
-- Design Name: 
-- Module Name:    ff_interno - Behavioral 
-- Project Name: 
-- Target Devices: 	Artix 7 200-T
-- Tool versions: 
-- Description: Unità di ritardo per il TDC
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
library UNISIM;
use UNISIM.VComponents.all;

entity ff_interno_fe is
	 generic ( posizione : integer:= 3);
    Port ( i_data : in  STD_LOGIC;
           o_digital : out  STD_LOGIC;
           o_carry : out  STD_LOGIC;
           i_clk : in  STD_LOGIC;
           i_reset : in  STD_LOGIC);
end ff_interno_fe;

architecture Behavioral of ff_interno_fe is

--===================================================================================
-- 						COSTANTI & SEGNALI
--===================================================================================

signal CO :STD_LOGIC_vector(3 downto 0);
constant DI :STD_LOGIC_vector(3 downto 0):="----";
constant S :STD_LOGIC_vector(3 downto 0):=x"F";

begin

--===================================================================================
-- 						Unità di ritardo
--===================================================================================

   CARRY4_inst : CARRY4
   port map (
      CO => CO,         -- 4-bit carry out
      O => open,           -- 4-bit carry chain XOR data out
      CI => i_data,         -- 1-bit carry cascade input
      CYINIT => '0', -- 1-bit carry initialization
      DI => DI,         -- 4-bit carry-MUX data in
      S => S            -- 4-bit carry-MUX select input
   );

--===================================================================================
-- 						Assegnazione uscite
--===================================================================================

o_carry<=CO(3) after 50 ps;

ck_1 : process(i_clk,i_reset)
	begin
	if(i_reset='1')then
		o_digital<='0';
	elsif(falling_edge(i_clk))then
		o_digital<=CO(posizione);
	end if;
end process;

end Behavioral;

