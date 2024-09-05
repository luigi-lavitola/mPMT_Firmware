----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.10.2021 18:13:23
-- Design Name: 
-- Module Name: TB_FIFO_split - Behavioral
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



-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 12.10.2021 16:14:18 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_FIFO_split is
end tb_FIFO_split;

architecture tb of tb_FIFO_split is

    component FIFO_split
        port (DATA_96        : in std_logic_vector (95 downto 0);
              Data_32        : out std_logic_vector (31 downto 0);
              Clock          : in std_logic;
              Reset          : in std_logic;
              FIFO_96_nEmpty : in std_logic;
              FIFO_96_RD_EN  : out std_logic;
              FIFO_32_WR_EN  : out std_logic;
              FIFO_32_Full   : in std_logic);
    end component;

    signal DATA_96        : std_logic_vector (95 downto 0);
    signal Data_32        : std_logic_vector (31 downto 0);
    signal Clock          : std_logic;
    signal Reset          : std_logic;
    signal FIFO_96_nEmpty : std_logic;
    signal FIFO_96_RD_EN  : std_logic;
    signal FIFO_32_WR_EN  : std_logic;
    signal FIFO_32_Full   : std_logic;

    constant TbPeriod : time := 5 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : FIFO_split
    port map (DATA_96        => DATA_96,
              Data_32        => Data_32,
              Clock          => Clock,
              Reset          => Reset,
              FIFO_96_nEmpty => FIFO_96_nEmpty,
              FIFO_96_RD_EN  => FIFO_96_RD_EN,
              FIFO_32_WR_EN  => FIFO_32_WR_EN,
              FIFO_32_Full   => FIFO_32_Full);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that Clock is really your main clock signal
    Clock <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        DATA_96 <= (others => '0');
        FIFO_96_nEmpty <= '0';
        FIFO_32_Full <= '0';

        -- Reset generation
        -- EDIT: Check that Reset is really your reset signal
        Reset <= '1';
        wait for 25 ns;
        Reset <= '0';
        wait for 100 ns;

        -- EDIT Add stimuli here
        wait for 100 * TbPeriod;
        DATA_96 <= (0 => '1', 33 => '1', 66 => '1',others => '0');
        FIFO_96_nEmpty <= '1';
        wait for 20 * TbPeriod;

        
        
        wait for 20 * TbPeriod;
        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;


