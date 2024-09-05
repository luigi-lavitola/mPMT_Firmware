----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:40:39 06/13/2018 
-- Design Name: 
-- Module Name:    RESET_MODULE - Behavioral 
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

entity RESET_MODULE is
    Port ( reset_in 		: in  STD_LOGIC;--
           reset_out 	: out  STD_LOGIC;--
           locked_fasi 	: in  STD_LOGIC;--
           CLK_IN_USB 	: in  STD_LOGIC;--
			  clk_failed 	: out  STD_LOGIC;
           clk_is_not_wrk : in  STD_LOGIC);
end RESET_MODULE;

architecture Behavioral of RESET_MODULE is

-----fsm--------
type stato is (wrk0,wrk1,reset0,reset1);
signal state, next_state : stato;
----------------
signal clk_fail : std_logic :='0';
signal reset_pll_fasi_sig : std_logic :='0';



begin
reset_out <= reset_in or (not locked_fasi);

clk : process(CLK_IN_USB,reset_in)
begin
if reset_in='1' then
clk_fail<='0';
elsif(rising_edge(CLK_IN_USB))then
	 if(clk_is_not_wrk ='1')then
	 clk_fail<='1';
	 elsif(locked_fasi ='1')then
	 clk_fail<='0';
	 end if;
end if;	 
end process;
clk_failed<=clk_fail;

end Behavioral;

