----------------------------------------------------------------------------------
-- Company: INFN Napoli
-- Engineer: AB
-- 
-- Create Date: 13.09.2020 16:39:41
-- Design Name: 
-- Module Name: TX - Behavioral
 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;
---------------------------------------

entity TX is
--  						(((((((( F(MHz)/BD(MHz) = CLK_BIT )))))))
    Generic ( CLK_bits  : integer :=862); -- Freq/bps
    Port (
        CLK         :       in      STD_LOGIC;
        RESET       :       in      STD_LOGIC;
        ENABLE      :       in      STD_LOGIC;
        
        TX_OUT      :       out     STD_LOGIC;
        TX_ACTIVE   :       out     STD_LOGIC;
        TX_END      :       out     STD_LOGIC;
        
        DATA_IN     :        in     STD_LOGIC_VECTOR(7 downto 0);
        START       :        in     STD_LOGIC
   );
end TX;

architecture Behavioral of TX is

type RS232_fsm is (IDLE, START_BIT, DATA_BITS, STOP_BIT, CLEAR);
signal state    :   RS232_fsm := IDLE;

signal DATA_in_int  :   std_logic_vector(7 downto 0);
signal START_int    :   std_logic;
signal START_int_r    :   std_logic;

signal TX_OUT_int   :   std_logic;
signal TX_ACTIVE_INT    :   std_logic;
signal TX_END_int   :   std_logic;

--constant CLK_bits			:   Integer := 166000;
signal  COUNT_clk       :   integer range 0 to CLK_BITs; --(BAUD_RATE_SEL);
signal  COUNT_bit       :   integer range 0 to 7;


begin


START_int   <=  START;



main_process: process(CLK, RESET) 
begin
    if RESET = '1' then
        state 				<= IDLE;
        TX_OUT_int  		<= '1';
        TX_END_int  		<= '0';
        TX_ACTIVE_INT  	<= '0';
    elsif rising_edge(CLK) then
        if ENABLE = '1' then
        
            case state is
                
                when IDLE =>
                    TX_OUT_int      <= '1';
                    TX_END_int      <= '0';
                    TX_ACTIVE_INT   <= '0';
                    COUNT_clk       <= 0;
                    COUNT_bit       <= 0;        
                    
                    if START_int = '1' then
                        DATA_in_int <= DATA_IN;
                        state       <=  START_BIT;
                    else
                        state       <=  IDLE; 
                    end if;
            
                when START_BIT =>
                    TX_OUT_int      <= '0';   --   ----____----- 
                    TX_ACTIVE_INT   <= '1';
                    
                    if COUNT_clk < (CLK_BITs-1)then--(BAUD_RATE_SEL) - 1) then
                        COUNT_clk   <=  COUNT_clk + 1;
                        state       <=  START_BIT; 
                    else    
                        COUNT_clk   <= 0;
                        state       <= DATA_BITS;
                    end if;
                    
               when DATA_BITS =>
                    TX_OUT_int      <= DATA_in_int(COUNT_bit);
                    
                    if COUNT_clk < (CLK_BITs-1)then --(BAUD_RATE_SEL) - 1) then
                        COUNT_clk   <=  COUNT_clk + 1;
                        state       <=  DATA_BITS;
                    else    
                        COUNT_clk   <= 0;
                        
                        if COUNT_bit < 7 then
                            COUNT_bit   <= COUNT_bit + 1;
                            state       <= DATA_BITS;
                        else
                            COUNT_bit   <= 0;
                            state       <= STOP_BIT;
                        end if;
                   end if;        
               
               when STOP_BIT =>
                    TX_OUT_int      <=  '1';
                    
                    if COUNT_clk < (CLK_BITs-1)then--(BAUD_RATE_SEL) - 1) then
                        COUNT_clk   <=  COUNT_clk + 1;
                        state       <=  STOP_BIT;
                    else    
                        COUNT_clk   <= 0;
                        TX_END_int  <= '1';
                        state       <= CLEAR;
                    end if;
                    
               when CLEAR =>
                    TX_ACTIVE_INT   <= '0';
                    TX_END_int      <= '1';
                    state           <= IDLE;
                          
               when others =>
                    state           <= IDLE;
            
            end case;
        else
            TX_ACTIVE_INT   <= '0';
            TX_OUT_int      <= '1';
            TX_END_int      <= '0';
        end if;
    end if;
end process;

TX_OUT      <=  TX_OUT_int;
TX_ACTIVE   <=  TX_ACTIVE_INT;
TX_END      <=  TX_END_int;




end Behavioral;