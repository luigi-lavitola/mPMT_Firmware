----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:58:44 10/06/2017 
-- Design Name: 
-- Module Name:    rom_tdc - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity rom_tdc is
    Port ( inp : in  STD_LOGIC_VECTOR (17 downto 0);
           usc : out  STD_LOGIC_VECTOR (4 downto 0));
end rom_tdc;

architecture Behavioral of rom_tdc is

begin


process(inp)
begin
--
--case inp is

--	when x"0000" & "00" => usc<='0'&x"0";
--	when x"8000" & "00" => usc<='0'&x"1";
--	when x"C000" & "00" => usc<='0'&x"2";
--	when x"E000" & "00" => usc<='0'&x"3";
--	when x"F000" & "00" => usc<='0'&x"4";
--	when x"F800" & "00" => usc<='0'&x"5";
--	when x"FC00" & "00" => usc<='0'&x"6";
--	when x"FE00" & "00" => usc<='0'&x"7";
--	when x"FF00" & "00" => usc<='0'&x"8";
--	when x"FF80" & "00" => usc<='0'&x"9";
--	when x"FFC0" & "00" => usc<='0'&x"A";
--	when x"FFE0" & "00" => usc<='0'&x"B";
--	when x"FFF0" & "00" => usc<='0'&x"C";
--	when x"FFF8" & "00" => usc<='0'&x"D";
--	when x"FFFC" & "00" => usc<='0'&x"E";
--	when x"FFFE" & "00" => usc<='0'&x"F";
--	when x"FFFF" & "00" => usc<='1'&x"0";
--	when x"FFFF" & "10" => usc<='1'&x"1";
--	when x"FFFF" & "11" => usc<='1'&x"2";
--
--when	"000000000000000000" => usc <= "00000";
--when	"100000000000000000" => usc <= "00001";
--when	"-10000000000000000" => usc <= "00010";
--when	"--1000000000000000" => usc <= "00011";
--when	"---100000000000000" => usc <= "00100";
--when	"----10000000000000" => usc <= "00101";
--when	"-----1000000000000" => usc <= "00110";
--when	"------100000000000" => usc <= "00111";
--when	"-------10000000000" => usc <= "01000";
--when	"--------1000000000" => usc <= "01001";
--when	"---------100000000" => usc <= "01010";
--when	"----------10000000" => usc <= "01011";
--when	"-----------1000000" => usc <= "01100";
--when	"------------100000" => usc <= "01101";
--when	"-------------10000" => usc <= "01110";
--when	"--------------1000" => usc <= "01111";
--when	"---------------100" => usc <= "10000";
--when	"----------------10" => usc <= "10001";
--when	"----------------11" => usc <= "10010";
--	
--	when others => usc<='1'&x"F";
--end case;

--if(inp = "000000000000000000")then
--	usc <= "00000";
--elsif(inp = "100000000000000000")then
--	usc <= "00001";	
--elsif(inp = "-10000000000000000")then
--	usc <= "00010";	
--elsif(inp = "--1000000000000000")then
--	usc <= "00011";		
--elsif(inp = "---100000000000000")then
--	usc <= "00100";	
--elsif(inp = "----10000000000000")then
--	usc <= "00101";	
--elsif(inp = "-----1000000000000")then
--	usc <= "00110";	
--elsif(inp = "------100000000000")then
--	usc <= "00111";		
--elsif(inp = "-------10000000000")then
--	usc <= "01000";	
--elsif(inp = "--------1000000000")then
--	usc <= "01001";	
--elsif(inp = "---------100000000")then
--	usc <= "01010";
--elsif(inp = "----------10000000")then
--	usc <= "01011";	
--elsif(inp = "-----------1000000")then
--	usc <= "01100";	
--elsif(inp = "------------100000")then
--	usc <= "01101";	
--elsif(inp = "-------------10000")then
--	usc <= "01110";	
--elsif(inp = "--------------1000")then
--	usc <= "01111";	
--elsif(inp = "---------------100")then
--	usc <= "10000";		
--elsif(inp = "----------------10")then
--	usc <= "10001";		
--elsif(inp = "----------------11")then
--	usc <= "10010";		
--else
--	usc <= "11111";
--	end if;
	

if(inp = "000000000000000000")then
	usc <= "00000";
elsif(inp(17 downto 15) = "100")then
	usc <= "00001";
elsif(inp(16 downto 14) = "100")then
	usc <= "00010";
elsif(inp(15 downto 13) = "100")then
	usc <= "00011";		
elsif(inp(14 downto 12) = "100")then
	usc <= "00100";	
elsif(inp(13 downto 11) = "100")then
	usc <= "00101";	
elsif(inp(12 downto 10) = "100")then
	usc <= "00110";	
elsif(inp(11 downto 9) = "100")then
	usc <= "00111";		
elsif(inp(10 downto 8) = "100")then
	usc <= "01000";	
elsif(inp(9 downto 7) = "100")then
	usc <= "01001";	
elsif(inp(8 downto 6) = "100")then
	usc <= "01010";
elsif(inp(7 downto 5) = "100")then
	usc <= "01011";	
elsif(inp(6 downto 4 )= "100")then
	usc <= "01100";	
elsif(inp(5 downto 3) = "100")then
	usc <= "01101";	
elsif(inp(4 downto 2) = "100")then
	usc <= "01110";	
elsif(inp(3 downto 1) = "100")then
	usc <= "01111";	
elsif(inp(2 downto 0) = "100")then
	usc <= "10000";		
elsif(inp(2 downto 0) = "110")then
	usc <= "10001";		
elsif(inp(17 downto 0) = x"FFFF" & "11")then
	usc <= "10011";		
else
	usc <= "11111";
	end if;
end process;


end Behavioral;

