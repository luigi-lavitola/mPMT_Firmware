----------------------------------------------------------------------------------
-- Company: INFN Napoli
-- Engineer: AB
-- 
-- Create Date:    12:41:11 21/08/2020 
-- Design Name: 
-- Module Name:    Pulser - Behavioral 
-- Project Name: 

-- Description: Generatore di frequenza step 1ms CLK= USB

----------------------------------------------------------------------------------
library IEEE;
library UNISIM;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use UNISIM.vcomponents.all;
use work.instruction_buffer_type.all;

entity Pulser is
    Port ( CLK48M 		: in  STD_LOGIC;
           RESET 		: in  STD_LOGIC;
           Periodo_ms 	: in  STD_LOGIC_VECTOR (13 downto 0); -- 0 = OFF
           PULSER_OUT 	: out  STD_LOGIC);
end Pulser;

architecture Behavioral of Pulser is

signal ContaPulser	: std_logic_vector (13 downto 0);
signal Conta_1ms	: std_logic_vector (23 downto 0);



begin

process(RESET ,CLK48M)
begin
	if(RESET='1')then
		ContaPulser 	<= ( others => '0');
		PULSER_OUT		<= '0';
		Conta_1ms		<= ( others => '0');
			
	elsif(rising_edge(CLK48M))then
	
	    if Conta_1ms = 24999 then -- OGNI 1ms
		      Conta_1ms <= ( others => '0');
				if Periodo_ms = 0  then -- abilita il conteggio
						ContaPulser <= ( others => '0');
						PULSER_OUT	<= '0';
				elsif 	ContaPulser = (Periodo_ms-1) then
						ContaPulser <= ( others => '0');
						PULSER_OUT	<= '1';
				else
						ContaPulser <= ContaPulser + 1;
						PULSER_OUT	<= '0';
				end if;
					
		 else		
			  Conta_1ms <= Conta_1ms +1 ;
			  PULSER_OUT		<= '0';
		 end if;		
		
			
 end if;	
end process;


end Behavioral;

