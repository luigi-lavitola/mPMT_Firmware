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
use IEEE.std_logic_arith.all;


entity RX is
--  						(((((((( F(MHz)/BD(MHz) = CLK_BIT )))))))
    Generic ( CLK_bits  : integer :=862); -- Freq/bps
    Port (
        CLK         :       in      STD_LOGIC;
        RESET       :       in      STD_LOGIC;
        ENABLE      :       in      STD_LOGIC;
        
        RX_IN       :       in      STD_LOGIC;
        
        DATA_OUT    :       out     STD_LOGIC_VECTOR(7 downto 0);
        DATA_VALID  :       out     STD_LOGIC
   );
   attribute DONT_TOUCH : string;
   attribute DONT_TOUCH of RX : entity is "YES";
end RX;

architecture Behavioral of RX is


type RS232_fsm is (IDLE, START_BIT, DATA_BITS, STOP_BIT, CLEAR);
--signal present_state    : RS232_fsm := IDLE;
signal next_state       : RS232_fsm := IDLE;

signal DATA_RX_int      :   std_logic_vector(7 downto 0);

signal  COUNT_clk       :   integer range 0 to CLK_BITs;
signal  COUNT_bit       :   integer range 0 to 7;

signal  DATA_VALID_int  :   std_logic;
signal  DATA_VALID_int_r :   std_logic; 

signal DATA_OUT_reg     :   std_logic_vector(7 downto 0);

signal  RX_IN_r         :   std_logic;
signal  RX_IN_r2        :   std_logic;


begin

sync_proc : process(CLK)        --registro due volte per evitare metastabilità
begin 
    if rising_edge(CLK) then
        RX_IN_r     <=  RX_IN;
        RX_IN_r2    <=  RX_IN_r;        --      RX_IN_r2 sono i veri dati
    end if;
end process;


main_process : process(CLK, RESET)
begin
if RESET = '1' then
    next_state  <=  IDLE;
    DATA_RX_int <=  (others => '0');
    DATA_VALID_int  <= '0';
elsif rising_edge(CLK) then
    if ENABLE= '1' then
        case next_state is
        
            when IDLE =>
                COUNT_clk   <=  0;
                COUNT_bit   <=  0;
                DATA_VALID_int  <= '0';
            
                if RX_IN_r2 = '0' then
                    next_state  <= START_BIT;   -- start detection
                else
                    next_state  <= IDLE;
                end if;
                
            when START_BIT =>
                if count_clk = CLK_BITs/2 then  
                    if RX_IN_r2 = '0' then
                          count_clk <= 0;
                          next_state  <= DATA_BITS;                  
                    else    
                        next_state  <= IDLE;
                    end if;
                else
                    count_clk <= count_clk + 1;
                    next_state  <= START_BIT;
                end if;
             
             when DATA_BITS =>
                if count_clk < (CLK_BITs - 1) then
                    count_clk <= count_clk +1;
                    next_state  <= DATA_BITS;
                else 
                    count_clk <= 0;
                    DATA_RX_int(COUNT_bit) <= RX_IN_r2;
                    
                    if COUNT_bit < 7 then
                        COUNT_bit <= COUNT_bit + 1;
                        next_state  <= DATA_BITS;
                    else
                        COUNT_bit   <=  0;
                        next_state  <= STOP_BIT;
                    end if;
                end if;
                
            when STOP_BIT =>
                if count_clk < (CLK_BITs - 1) then
                    count_clk <= count_clk +1;
                    next_state  <= STOP_BIT;
                else
                    count_clk <= 0;
                    DATA_VALID_int <= '1';
                    next_state  <= CLEAR;
                end if;
                
            when CLEAR =>
                DATA_VALID_int <= '0';  
                next_state  <= IDLE;
                  
            when others =>
                next_state  <= IDLE; 
                      
        end case;
   end if;
end if;
end process;


DATA_OUT_REG_proc : process(CLK,RESET)
begin
    if RESET = '1' then
	 
	  DATA_OUT_reg <= (others => '0');
	  DATA_VALID_int_r <= '0';
	 
    elsif rising_edge(CLK) then
        DATA_VALID_int_r <= DATA_VALID_int;
        if DATA_VALID_int = '1' and DATA_VALID_int_r = '0' then
            DATA_OUT_reg    <=  DATA_RX_int;
        else
            DATA_OUT_reg    <=  DATA_OUT_reg;
        end if;
    end if;
end process;
DATA_VALID  <=  DATA_VALID_int_r;
DATA_OUT    <=  DATA_OUT_reg;

end Behavioral;
