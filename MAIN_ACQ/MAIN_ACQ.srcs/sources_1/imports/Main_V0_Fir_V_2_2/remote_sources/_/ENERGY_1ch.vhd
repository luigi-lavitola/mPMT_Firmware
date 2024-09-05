----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Andrea Evangelisti
-- 
-- Create Date:    13:17:56 10/09/2017 
-- Design Name: 
-- Module Name:    CS_latch - Behavioral 
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
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.STD_LOGIC_arith.ALL;

entity CS_latch is
    generic (add : STD_LOGIC_vector(4 downto 0) := "00000");
    Port ( time_info : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           miso : in  STD_LOGIC;
			  sclk : out  STD_LOGIC;
			  CS_out : out  STD_LOGIC;
           beccailmax : in STD_LOGIC_vector(10 downto 0);--CAMBIA
           dato_fuori : out  STD_LOGIC_vector(11 downto 0);
           cal : in  STD_LOGIC;
           data_valid : out  STD_LOGIC;
           clk : in  STD_LOGIC);

end CS_latch;

architecture Behavioral of CS_latch is

--===================================================================================
-- 						COSTANTI & SEGNALI
--===================================================================================
signal data_out : std_logic_vector(12 downto 0);
signal calibrazione : std_logic;
signal pow_up : std_logic;
signal enable : std_logic;
signal abilita : std_logic;
signal enableorabilita : std_logic;
signal contatore : integer range 0 to 128;
signal osc_240M : std_logic;
signal scrivi : std_logic;
signal dato_stabile : std_logic;
signal Reset_Ring   :   std_logic;

type stato is (calibra, ac_dat, off,rst,ac_cal);
signal state, next_state : stato;

begin

--===================================================================================
-- 						Trascrizione dato energia
--===================================================================================
dout : process(clk,reset)
begin
	if(reset='1')then
		dato_fuori<=x"000";
	elsif(rising_edge(clk))then
		if(scrivi='1' and data_out(12)='0')then
			dato_fuori<=data_out(11 downto 0);
		else
			dato_fuori<=x"000";
		end if;
	end if;	
end process;

--===================================================================================
-- 						FSM gestione SPI
--===================================================================================
ck : process(clk,reset)
begin
	if(reset='1')then
		pow_up<='1';
		enable<='0';
		state<=rst;
		calibrazione<='0';
		data_valid<='0';

	elsif(rising_edge(clk))then
		state<=next_state;
		if(state=rst)then
			calibrazione<='0';	
			enable<='0';
			pow_up<='1';
			data_valid<='0';
			
		elsif(state=calibra)then
			pow_up<='0';
			enable<='0';
			calibrazione<='0';
			data_valid<='0';
			
		elsif(state=ac_dat)then
			calibrazione<='0';	
			pow_up<='0';
			enable<=abilita;
			data_valid<=scrivi;
			
		elsif(state=ac_cal)then
			calibrazione<='1';	
			pow_up<='0';
			enable<=abilita;		
			data_valid<=scrivi;

		else
			pow_up<='0';
			enable<='0';
			calibrazione<='0';
			data_valid<='0';

		end if;
	end if;
end process;	


comb : process(state,scrivi,cal)
begin
case state is

	when rst =>
		next_state <= calibra;

	when calibra =>
		--next_state <= off;
		next_state <= ac_dat;
--	when off =>
--		next_state <= ac_dat;		

	when ac_dat =>
		if(cal='1')then
			next_state <= ac_cal;	
		else
			next_state <= ac_dat;			
		end if;	
	when ac_cal =>
		if(scrivi='1')then
			next_state <= ac_dat;	
		else
			next_state <= ac_cal;			
		end if;		
	when off =>
	   NULL;		
	end case;
end process;	

--===================================================================================
-- 						SPI
--===================================================================================			
enableorabilita<=enable or abilita;
			
Inst_SPI: entity work.SPI_buono PORT MAP(
	clk => clk,
	enable => enableorabilita,
	sclk => sclk,
	calibrazione => calibrazione,
	pow_up => pow_up,
	miso => miso,
	chip_select => CS_out,
	scrivi => scrivi,
	reset => reset,
	data_out => data_out 
);

--===================================================================================
-- 						Cattura transizione
--===================================================================================
process(Reset_Ring,reset,time_info)--,abilita)
begin
	if(Reset_Ring='1' or reset= '1')then
	--if(scrivi='1' or reset= '1' or abilita = '1')then
			  dato_stabile<='0';
	elsif(rising_edge(time_info))then
			  dato_stabile<='1';
	end if;
end process;

--===================================================================================
-- 						Oscillatore
--===================================================================================
Inst_OSCILLATORE: entity work.OSCILLATORE 
GENERIC MAP(
	add=>add )
PORT MAP(
		 EN => dato_stabile,
		 FREQ => osc_240M
);

--===================================================================================
-- 						Ritardo di acquisizione
--===================================================================================
process(scrivi,reset,osc_240M)
begin
	--if(scrivi='1' or reset= '1' )then
	if(dato_stabile='0' or reset= '1' )then
	  contatore<=0;
	  abilita<='0';
	  Reset_Ring <= '0';
	elsif(rising_edge(osc_240M))then
	  --if(dato_stabile='1')then
		 contatore<=contatore+1;
		 if(contatore<beccailmax)then----CAMBIA
				abilita<='0';
				--contatore<=contatore+1;
		 else
				abilita<='1';
		 end if;
		 
		 if (contatore = (beccailmax +10)) then
		      Reset_Ring <= '1';
		 else
		      Reset_Ring <= '0';
		 end if;
	  --else
		-- contatore<=0;
	  --end if;
	end if;
end process;

end Behavioral;

