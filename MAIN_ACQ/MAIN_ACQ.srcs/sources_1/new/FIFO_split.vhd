----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.10.2021 17:56:53
-- Design Name: 
-- Module Name: FIFO_split - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FIFO_split is
    Port ( DATA_96 : in STD_LOGIC_VECTOR (95 downto 0);
           Data_32 : out STD_LOGIC_VECTOR (31 downto 0);
           Clock : in STD_LOGIC;
           Reset : in STD_LOGIC;
           FIFO_96_nEmpty : in STD_LOGIC;
           FIFO_96_RD_EN : out STD_LOGIC;
           FIFO_32_WR_EN : out STD_LOGIC;
           FIFO_32_Full : in STD_LOGIC);
end FIFO_split;

architecture Behavioral of FIFO_split is

signal counter : STD_LOGIC_VECTOR(2 downto 0);
signal FIFO_96_RD_EN_int : STD_LOGIC;


signal DATA_32_0_int : STD_LOGIC_VECTOR(31 downto 0);
signal DATA_32_1_int : STD_LOGIC_VECTOR(31 downto 0);
signal DATA_32_2_int : STD_LOGIC_VECTOR(31 downto 0);
signal DATA_96_int : STD_LOGIC_VECTOR(95 downto 0);

begin

FIFO_96_RD_EN <= FIFO_96_RD_EN_int;

fifo_splitting : process (Clock, Reset)
begin

    if Reset = '1' then
        DATA_96_int <= (others => '0');
        FIFO_96_RD_EN_int <= '0';
        FIFO_32_WR_EN <= '0';
        counter <= "000";
        Data_32 <= (others => '0');
    elsif rising_edge(Clock) then
            if (FIFO_32_Full = '0') then
                if FIFO_96_nEmpty = '1' then
                    FIFO_96_RD_EN_int <= '1';
                else
                    FIFO_96_RD_EN_int <= '0';
                end if;
            end if;    
            if FIFO_96_RD_EN_int = '1' then
                FIFO_96_RD_EN_int <= '0';
                DATA_96_int <= DATA_96;
                counter <= "001";
            end if;
            
            if counter = "001" then
                Data_32 <= DATA_96_int(95 downto 64);
                FIFO_32_WR_EN <= '1';
                counter <= "010";
            end if; 
            
            if counter = "010" then
                Data_32 <= DATA_96_int(63 downto 32);
                FIFO_32_WR_EN <= '1';
                counter <= "011";
            end if; 
            
            if counter = "011" then
                Data_32 <= DATA_96_int(31 downto 0);
                FIFO_32_WR_EN <= '1';
                counter <= "000";
            end if;
            
            if counter = "000" then 
                FIFO_32_WR_EN <= '0';
            end if;
            
    
    end if;
end process;


end Behavioral;
