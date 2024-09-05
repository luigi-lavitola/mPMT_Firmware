----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.03.2021 17:41:52
-- Design Name: 
-- Module Name: Package_type - Behavioral
-- Project Name: 
-- Target Devices: 
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

package Package_TYPE is

     TYPE D_ARRAY_61BIT 	is array	(0 to 19) 	of std_logic_vector 	(60 downto 0);
	 TYPE D_ARRAY_Type 	IS array (0 to 7) 	of std_logic_vector	(15 downto 0);
	 TYPE F_ARRAY_Type 	IS array (0 to 19) 	of std_logic_vector	(15 downto 0);

end package Package_TYPE;