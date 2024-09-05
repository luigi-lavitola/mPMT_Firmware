----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:17:12 10/20/2017 
-- Design Name: 
-- Module Name:    OSCILLATORE - Behavioral 
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

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

entity OSCILLATORE is
    generic (add : STD_LOGIC_vector(4 downto 0) := "00000");
    Port ( EN 		: in  STD_LOGIC;
           FREQ 	: out  STD_LOGIC);
end OSCILLATORE;

architecture Behavioral of OSCILLATORE is

--===================================================================================
-- 						COSTANTI & SEGNALI
--===================================================================================
signal CA :STD_LOGIC_VECTOR (3 downto 0); --CARRY OUT
signal OAA  :STD_LOGIC_VECTOR (3 downto 0); --CARRY OUT
signal DAA  :STD_LOGIC_VECTOR (3 downto 0); --CARRY OUT

signal OSC_EN : std_logic ;
signal c_in   : std_logic ;

signal intermediate_clk     : std_logic;

ATTRIBUTE keep_hierarchy 	: string;
ATTRIBUTE keep_hierarchy OF Behavioral	: ARCHITECTURE IS "true";
-------------------------------------------------------------------------


begin

--===================================================================================
-- 						Ring oscillator
--===================================================================================

   CARRY4_inst0 : CARRY4
   port map (
      CO 		=> CA,         -- 4-bit carry out
      O 			=> OAA,           -- 4-bit carry chain XOR data out
      CI 		=> '0',         -- 1-bit carry cascade input
      CYINIT 	=> '0' , -- 1-bit carry initialization -- INGRESSO
      DI 		=> DAA ,         -- 4-bit carry-MUX data in
      S 			=> "1000" --  "1010" era prima 4-bit carry-MUX select input !!!!<<<<<< CON "0000" Rallenta 
   );

 --DAA <= OAA(3) & (NOT OAA(2) AND OSC_EN)  & OAA(1) & c_in ;         -- 4-bit carry-MUX select input
     --S    <= "1010";
    --DAA   <= '0' & (not OAA(2) and OSC_EN) & '0' & c_in after 1 ns ;         -- 4-bit carry-MUX select input
    DAA <= OAA(3) & (NOT OAA(2) AND OSC_EN)  & OAA(1) & c_in ;         -- 4-bit carry-MUX select input
--===================================================================================
-- 						Uscite
--===================================================================================
c_in <=   CA(3) after 2083 ps; -- Oscilla a 240MHz


OSC_EN <= EN;

buf_inst_lower : if add < 12 generate
           BUFG_inst : BUFG
                           port map (
                              O => FREQ, -- 1-bit output: Clock output
                              I => CA(3)   -- 1-bit input: Clock input
                           );
            end generate;
buf_inst_upper : if add >= 12 generate
--                       BUFMR_inst : BUFMR
--                           port map (
--                              O => intermediate_clk,--FREQ, -- 1-bit output: Clock output
--                              I => CA(3)   -- 1-bit input: Clock input
--                           );
                           
                        BUFR_inst : BUFR
                           generic map (
                              BUFR_DIVIDE => "BYPASS",   -- Values: "BYPASS, 1, 2, 3, 4, 5, 6, 7, 8" 
                              SIM_DEVICE => "7SERIES"  -- Must be set to "7SERIES" 
                           )
                           port map (
                              O => FREQ,     -- 1-bit output: Clock output port
                              CE => '1',   -- 1-bit input: Active high, clock enable (Divided modes only)
                              CLR => '1', -- 1-bit input: Active high, asynchronous clear (Divided modes only)
                              I => CA(3)      -- 1-bit input: Clock buffer input driven by an IBUF, MMCM or local interconnect
                        );
                      --FREQ <= CA(3);  
            end generate;
            
            
--   BUFR_inst : BUFR
--   generic map (
--      BUFR_DIVIDE => "BYPASS",   -- Values: "BYPASS, 1, 2, 3, 4, 5, 6, 7, 8" 
--      SIM_DEVICE => "7SERIES"  -- Must be set to "7SERIES" 
--   )
--   port map (
--      O => FREQ,     -- 1-bit output: Clock output port
--      CE => '1',   -- 1-bit input: Active high, clock enable (Divided modes only)
--      CLR => '1', -- 1-bit input: Active high, asynchronous clear (Divided modes only)
--      I => CA(3)      -- 1-bit input: Clock buffer input driven by an IBUF, MMCM or local interconnect
--   );
--       BUFG_inst : BUFMR
--   port map (
--      O => FREQ, -- 1-bit output: Clock output
--      I => CA(3)   -- 1-bit input: Clock input
--   );

--FREQ <= CA(3);
   
end Behavioral;

