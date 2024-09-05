----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.11.2021 12:00:02
-- Design Name: 
-- Module Name: Boot_MCU_FE - Behavioral
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
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Boot_MCU_FE is
    Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           CS_pin : out STD_LOGIC_VECTOR (18 downto 0);
           BOOT_reg : in STD_LOGIC_VECTOR (5 downto 0);
           Delay_BOOT : in STD_LOGIC_VECTOR (15 downto 0);
           EN_ACQ : in STD_LOGIC_VECTOR (18 downto 0);
           CS_ADC : in STD_LOGIC_VECTOR (18 downto 0);
           PW_EN_RC :   in  STD_LOGIC_VECTOR(18 downto 0);
           PWR_EN_OUT : out STD_LOGIC_VECTOR(18 downto 0)
           );
end Boot_MCU_FE;

architecture Behavioral of Boot_MCU_FE is

signal BOOT_Mode_Status :   std_logic;
signal GO_CS_EN :   std_logic;
signal GO_PWR_EN :   std_logic;
signal GO_CheckStatus :   std_logic;
signal GO_delay_PWR :   STD_LOGIC;
signal Counter_delay :   STD_LOGIC_VECTOR(15 downto 0);
signal PWR_EN_int   :   STD_LOGIC_VECTOR(18 downto 0);
signal CS_PIN_int   :   STD_LOGIC_VECTOR(18 downto 0);
signal CH_toEnable : integer range 0 to 15;

--BOOT_Reg MAP--------------- Bit 4-0 FE number to load in boot mode, bit 5 BOOT_Mode status ON/OFF
--Delay_BOOT ---------------- Delay to enable PWR in boot mode to MCU, step 5 ns

begin

BOOT_Mode_Status <= BOOT_reg(5);
CH_toEnable <= to_integer(signed(BOOT_reg(4 downto 0)));

main_proc: process(CLK, Reset)
begin
    if Reset = '1' then
    
    elsif rising_edge(CLK) then
        if BOOT_Mode_Status = '0' then
            CS_PIN_int <= CS_ADC and EN_ACQ;
        else
            --start boot procedure
            PWR_EN_int <= (others => '0');    
            
            GO_CS_EN <= '1';
            if GO_CS_EN <= '1' then
                CS_PIN_int(CH_toEnable) <= '1';
                GO_delay_PWR <= '1';
            else
                
            end if;
            
            if GO_delay_PWR = '1' then
                if Counter_delay = Delay_BOOT then
                    Counter_delay <= Counter_delay;
                    GO_PWR_EN <= '1';
                else
                    Counter_delay <= Counter_delay + 1;
                    GO_PWR_EN <= '0';
                end if;    
            end if;
            
            if GO_PWR_EN = '1' then
                PWR_EN_int <= (CH_toEnable => '1', others => '0');
                GO_CheckStatus <= '1';    
            end if;
            
            if GO_CheckStatus = '1' then
                if BOOT_Mode_Status = '1' then
                     PWR_EN_int <= (CH_toEnable => '1', others => '0');
                else
                    PWR_EN_int <= (others => '0');
                end if;    
                    
            end if;
            
        end if;    
    end if;
end process;

end Behavioral;
