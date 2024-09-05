----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Andrea Evangelisti
-- 
-- Create Date:    12:11:50 10/03/2017 
-- Design Name: 
-- Module Name:    blocco_time - Behavioral 
-- Project Name: 
-- Target Devices: 	Artix 7 200-T
-- Tool versions: 
-- Description: TIME STAMP GENERATION
--
-- Dependencies: 
--
-- Revision: 
-- Revision 1.0 - Definitiva
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.STD_LOGIC_arith.ALL;

entity blocco_time is
--generic(  posizione_y       : integer:= 118;
--			 posizione_x       : integer:= 2);
    Port ( time_sig : IN std_logic;
			  CLK_OUT : in  STD_LOGIC_vector(6 downto 0);
			  reset : IN std_logic;  
			  set_ritardo : IN STD_LOGIC_VECTOR (7 downto 0);  
			  time_out : OUT std_logic_vector(59 downto 0);
			  corse_in : IN std_logic_vector(27 downto 0);
			  Time_16bit 				: in  STD_LOGIC_vector(15 downto 0);
			  time_ready : OUT std_logic;
			  out_valid : OUT std_logic);
end blocco_time;

architecture Behavioral of blocco_time is

--===================================================================================
-- 						COSTANTI & SEGNALI
--===================================================================================
-----fsm--------
type stato is (cattura_corse, conta ,ritardo, trasmetti);
signal state, next_state : stato;
----------------
---contatori----
signal passaggio_corse : STD_LOGIC_VECTOR (27 downto 0):= x"0000000";
signal conta_alto : STD_LOGIC_VECTOR (5 downto 0):= "000000";
signal rit : STD_LOGIC_VECTOR (8 downto 0):= x"00"&'0';
signal Time_16bit_int : STD_LOGIC_VECTOR (15 downto 0);
----------------
------TDC-------
signal comp_time : STD_LOGIC_VECTOR (4 downto 0):= '0'&x"0";
signal tdc_al_time : STD_LOGIC_VECTOR (4 downto 0):= '0'&x"0";
signal comp_alto : STD_LOGIC_VECTOR (4 downto 0):= '0'&x"0";
signal tdc_al_alto : STD_LOGIC_VECTOR (4 downto 0):= '0'&x"0";
----------------
-----enable-----
signal valid_time : std_logic;
signal valid_alto : std_logic;

--ATTRIBUTE LOC			 						: string;
attribute keep : string;
attribute keep of time_sig : signal is "true";
attribute keep of conta_alto : signal is "true";

begin

--===================================================================================
-- 						FSM gestione TDC e Corse
--===================================================================================
clked : process (CLK_OUT(0),reset,rit)
begin
	if(reset='1')then
		conta_alto<="000000";
		passaggio_corse<=x"0000000";
		time_out<=(others => '0');
		tdc_al_time<= '0'&x"0";
		tdc_al_alto<= '0'&x"0";
		out_valid <= '0';
		state <= cattura_corse;
		rit<=x"00"&'0';			
		time_ready<= '1';
		Time_16bit_int <= (others => '0');
	elsif(rising_edge(CLK_OUT(0)))then
		state <= next_state;

		if(valid_time='1')then
			tdc_al_time<=comp_time;
			time_ready<= '0';
		end if;
		if(valid_alto='1')then
			tdc_al_alto<=comp_alto;
			time_ready<= '0';
		end if;	

		if(state=cattura_corse)then
			out_valid <= '0';
			passaggio_corse<=corse_in;
			Time_16bit_int <= Time_16bit;
			conta_alto<="000000";
			rit<=x"00"&'0';
			if(next_state=conta)then
				time_ready<= '0';
		    elsif(next_state=trasmetti)then --aggiunto per evitare glich
				time_ready<= '0';
			else
				time_ready<= '1';
			end if;	
				
		elsif(state=conta)then
			out_valid <= '0';
			time_ready<= '0';
			if(conta_alto<63)then
				conta_alto<=conta_alto+1;	
			end if;
						
		elsif(state=ritardo)then
			out_valid <= '0';
			rit<=rit+1;
			time_ready<= '0';

		elsif(state=trasmetti)then
			rit<=x"00"&'0';
			out_valid <= '1';
			time_out<= Time_16bit_int & passaggio_corse & tdc_al_time & conta_alto & tdc_al_alto;--16 28 5 6 5
			time_ready<= '0';
		end if;	
		
	end if;
end process;


fsm : process(valid_time,valid_alto,state,rit,set_ritardo)
begin
	case state is

		when cattura_corse =>
				if (valid_time = '1' and valid_alto='0') then
					next_state <= conta;
				elsif (valid_time = '1' and valid_alto='1')then
					next_state <= trasmetti;
				else 
					next_state <= cattura_corse;
				end if;

		when conta =>
				if valid_alto = '1' then
					next_state <= trasmetti;
				else 
					next_state <= conta;
				end if;		
			
		when trasmetti =>
				next_state <= ritardo;
				
		when ritardo =>
			if(rit>set_ritardo&'0')then
					next_state <= cattura_corse;
			else
					next_state <= ritardo;
			end if;						

	end case;			
end process;

--===================================================================================
-- 						TDC
--===================================================================================
Inst_flip_flop_time: entity work.flip_flop
--GENERIC MAP(
--	sys_x=>posizione_x,
--	sys_y=>posizione_y)
PORT MAP(
	d => time_sig,
	RESET => reset,
	data_valid_rise => valid_time,
	data_valid_fall => valid_alto,
	q_rise => comp_time,
	q_fall => comp_alto,
	CLK_OUT => CLK_OUT
);

end Behavioral;
