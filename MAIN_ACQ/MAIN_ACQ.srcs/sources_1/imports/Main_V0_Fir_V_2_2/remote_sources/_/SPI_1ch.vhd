----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Andrea Evangelisti
-- 
-- Create Date:    21:49:16 10/09/2017 
-- Design Name: 
-- Module Name:    SPI_buono - Behavioral 
-- Project Name: 
-- Target Devices: 	Artix 7 200-T
-- Tool versions: 
-- Description: GESTIONE SPI
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
use IEEE.NUMERIC_STD.ALL;

entity SPI_buono is
    Port ( clk : in  STD_LOGIC;
           enable : in  STD_LOGIC;
           sclk : out  STD_LOGIC;
		   calibrazione : in STD_LOGIC;
		   pow_up : in STD_LOGIC;
           miso : in  STD_LOGIC;
           chip_select : out STD_LOGIC;
           scrivi : out STD_LOGIC;
           reset : in  STD_LOGIC;
           data_out : out  STD_LOGIC_VECTOR (12 downto 0));
end SPI_buono;

architecture Behavioral of SPI_buono is

--===================================================================================
-- 						COSTANTI & SEGNALI
--===================================================================================
signal valore_massimo : integer range 13 to 30;
signal sclk_interno : STD_LOGIC:='0';
signal campionati : STD_LOGIC_vector(12 downto 0);
signal aspetta : integer range 0 to 15 :=0;
signal conta : integer range 0 to 31 :=0;
signal aspetta_p : integer range 0 to 5 :=0;
type stato is (fermo, parti, dato_normale_up, dato_normale_down,sec_att,tacq,tacq1);
signal state, next_state : stato;

signal enable_int   :std_logic;
signal FLAG_PROBLEM : STD_LOGIC_vector(3 downto 0);

attribute keep : string;
attribute keep of FLAG_PROBLEM : signal is "true";
attribute keep of enable_int : signal is "true";

begin
enable_int <= enable;
--sclk<=sclk_interno;
--===================================================================================
-- 						FSM gestione SPI
--===================================================================================
comb : process(enable,aspetta_p,state,conta,aspetta,valore_massimo)
begin
	case state is

		when fermo =>
			sclk_interno<='1';
			if (enable = '1') then
				next_state <= parti;
				chip_select<='0';
				FLAG_PROBLEM <= "0111";
			else 
				next_state <= fermo;
				chip_select<='1';			
			end if;
			FLAG_PROBLEM <= "0000";
		when parti =>
			if (aspetta_p=3) then--
				next_state <= dato_normale_down;
				chip_select<='0';
				sclk_interno<='0';
			else 
				next_state <= parti;
				chip_select<='0';	
				sclk_interno<='1';	
			end if;		
			FLAG_PROBLEM <= "0001";
		when dato_normale_down =>
			if(conta=valore_massimo)then
				next_state<=sec_att;
				chip_select<='0';	
				sclk_interno<='0';			
			elsif (aspetta=6) then--6--3--5
				next_state <= dato_normale_up;
				chip_select<='0';
				sclk_interno<='1';
			else 
				next_state <= dato_normale_down;
				chip_select<='0';	
				sclk_interno<='0';	
			end if;
            FLAG_PROBLEM <= "0010";
		when dato_normale_up =>
			if(aspetta=12)then--12--8--11
				next_state <= dato_normale_down;
				chip_select<='0';	
				sclk_interno<='0';
			else
				next_state <= dato_normale_up;
				chip_select<='0';
				sclk_interno<='1';
			end if;
            FLAG_PROBLEM <= "0011";
		when sec_att =>
			if(aspetta_p=1)then --era 1
				next_state<=tacq;
				sclk_interno<='0';
				chip_select<='1';
			else
				next_state<=sec_att;
				chip_select<='0';	
				sclk_interno<='0';			
			end if;
			FLAG_PROBLEM <= "0100";
		when tacq=>
			if(aspetta=1)then
				next_state<=tacq1;
				sclk_interno<='1';
				chip_select<='1';		
			else
				next_state<=tacq;
				sclk_interno<='0';
				chip_select<='1';
			end if;
			FLAG_PROBLEM <= "0101";
		when tacq1=>
			if(aspetta=2)then
				next_state<=fermo;
				sclk_interno<='1';
				chip_select<='1';		
			else
				next_state<=tacq1;
				sclk_interno<='1';
				chip_select<='1';
			end if;
			FLAG_PROBLEM <= "0110";
	   when others =>
	      next_state<=fermo;
	      sclk_interno<='1';
	      chip_select<='1';
	      
	end case;
end process;		
			
			
grande : process(clk,reset)
begin
	if(reset= '1')then
		conta<=0;
		aspetta<=0;
		aspetta_p<=0;
		state<=fermo;
		scrivi<='0';
		data_out<=(others=>'0');
		campionati<=(others=>'0');
		valore_massimo<=15;
		
	elsif(rising_edge(clk))then
		state <= next_state;
		sclk<=sclk_interno;
		if(state=parti)then
			aspetta_p<=aspetta_p+1;
			conta<=0;

		elsif(state=dato_normale_down or state=dato_normale_up)then
			aspetta_p<=0;
			aspetta<=aspetta+1;
			scrivi<='0';
			if(aspetta=11)then--11--6--10
				if(conta<13)then
					campionati(12-conta)<=miso;
				end if;
			elsif(aspetta=12)then--12--7--11
				conta<=conta+1;
				aspetta<=0;
			end if;	
		elsif(state=sec_att)then
			conta<=0;
			aspetta<=0;
			aspetta_p<=aspetta_p+1;--=0
			scrivi<='1';
			data_out<=campionati;
		elsif(state=tacq)then
			conta<=conta+1;
			scrivi<='0';
			if(conta=4)then--18--2
				aspetta<=aspetta+1;
				conta<=0;
			end if;	
			elsif(state=tacq1)then
				conta<=conta+1;
				scrivi<='0';
			if(conta=4)then--18--2
				aspetta<=aspetta+1;
				conta<=0;
			end if;		
		elsif(state=fermo)then
			aspetta_p<=0;
			conta<=0;
			aspetta<=0;
			campionati<="0000000000000";
			if(pow_up='1')then
				valore_massimo<=15;
			elsif(pow_up='0' and calibrazione='1')then
				valore_massimo<=30;
			else 
				valore_massimo<=13;
			end if;
		end if;	
	end if;
end process;

end Behavioral;
