----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Andrea Evangelisti
-- 
-- Create Date:    14:37:42 10/17/2017 
-- Design Name: 
-- Module Name:    flip_flop_master - Behavioral 
-- Project Name: 
-- Target Devices: 	Artix 7 200-T
-- Tool versions: 
-- Description: TDC
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
library UNISIM;
use UNISIM.VComponents.all;

entity flip_flop is
--generic(	sys_x       : integer:= 6;
--			sys_y       : integer:= 118);
    Port ( d : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           data_valid_rise : out  STD_LOGIC;
           data_valid_fall : out  STD_LOGIC;
           q_rise : out  STD_LOGIC_VECTOR (4 downto 0);
           q_fall : out  STD_LOGIC_VECTOR (4 downto 0);
			  CLK_OUT : in  STD_LOGIC_VECTOR(7 downto 1)
			  );
		  
		  attribute keep_hierarchy : string;
          attribute keep_hierarchy of flip_flop : entity is "yes";
end flip_flop;

architecture Behavioral of flip_flop is

--===================================================================================
-- 						COSTANTI & SEGNALI
--===================================================================================
	
signal q_intermedio_0 : STD_LOGIC_VECTOR (14 downto 0);
signal q_intermedio_1 : STD_LOGIC_VECTOR (17 downto 0);--2
signal q_intermedio_2 : STD_LOGIC_VECTOR (17 downto 0);--2
signal q_intermedio_3 : STD_LOGIC_VECTOR (17 downto 0);--3
signal q_intermedio_3_negato : STD_LOGIC_VECTOR (17 downto 0);

signal valid_sali : STD_LOGIC;

signal q_compatto_sali : std_logic_vector(4 downto 0);
signal q_compatto_scendi : std_logic_vector(4 downto 0);

signal q_carry : std_logic_vector(18 downto 0);
signal CO :STD_LOGIC_vector(3 downto 0);
constant DI :STD_LOGIC_vector(3 downto 0):="----";
constant S :STD_LOGIC_vector(3 downto 0):=x"F";

attribute keep 								: string;
attribute keep of q_intermedio_0			: signal is "true";
attribute keep of q_intermedio_3			: signal is "true";

ATTRIBUTE LOC			 						: string;

begin

--===================================================================================
-- 						Carry line TDC
--===================================================================================
q_carry(0)<=CO(3);

--ATTRIBUTE LOC OF CARRY4_inst : LABEL IS "SLICE_X"&INTEGER'image(sys_x)&"Y"&INTEGER'image(sys_y);

   CARRY4_inst : CARRY4
   port map (
      CO => CO,         -- 4-bit carry out
      O => open,           -- 4-bit carry chain XOR data out
      CI => '0',         -- 1-bit carry cascade input
      CYINIT => d, -- 1-bit carry initialization
      DI => DI,         -- 4-bit carry-MUX data in
      S => S            -- 4-bit carry-MUX select input
   );

p1 : for I in 0 to 6 generate


begin


	Inst_ff_interno_re: entity work.ff_interno_re PORT MAP(
		i_data => q_carry(I),
		o_carry => q_carry(I+1),
		o_digital => q_intermedio_0(I),
		i_clk => CLK_OUT(I+1),--(7-I)
		i_reset => RESET
	);

	Inst_ff_interno_fe: entity work.ff_interno_fe PORT MAP(
		i_data => q_carry(7+I),
		o_carry => q_carry(I+8),
		o_digital => q_intermedio_0(7+I),
		i_clk => CLK_OUT(I+1),--I+1
		i_reset => RESET
	);

end generate;

	Inst_ff_interno_ret: entity work.ff_interno_re PORT MAP(
		i_data => q_carry(14),
		o_carry => q_carry(15),
		o_digital => q_intermedio_0(14),
		i_clk => CLK_OUT(1),--I+1
		i_reset => RESET
	);

	Inst_ff_interno_rett: entity work.ff_interno_re PORT MAP(
		i_data => q_carry(15),
		o_carry => q_carry(16),
		o_digital => q_intermedio_1(15),
		i_clk => CLK_OUT(2),--I+1
		i_reset => RESET
	);

	Inst_ff_interno_rettt: entity work.ff_interno_re PORT MAP(
		i_data => q_carry(16),
		o_carry => q_carry(17),
		o_digital => q_intermedio_1(16),
		i_clk => CLK_OUT(3),--I+1
		i_reset => RESET
	);

	Inst_ff_interno_retttt: entity work.ff_interno_re PORT MAP(
		i_data => q_carry(17),
		o_carry => q_carry(18),
		o_digital => q_intermedio_1(17),--0
		i_clk => CLK_OUT(4),--I+1
		i_reset => RESET
	);
--===================================================================================
-- 						Allineamento TDC
--===================================================================================

clocked1 : process(CLK_OUT(1),RESET)
begin
	if(RESET='1')then
		q_intermedio_1(0)<='0';
		q_intermedio_1(7)<='0';
		q_intermedio_2(9 downto 7)<="000";
		q_intermedio_2(2 downto 0)<="000";
		q_intermedio_2(17 downto 14)<="0000";
		q_intermedio_3<=x"0000"&"00";
	elsif(rising_edge(CLK_OUT(1)))then
		q_intermedio_1(0)<=q_intermedio_0(0);
		q_intermedio_1(7)<=q_intermedio_0(7);
		q_intermedio_2(2 downto 0)<=q_intermedio_1(2 downto 0);
		q_intermedio_2(9 downto 7)<=q_intermedio_1(9 downto 7);
		q_intermedio_2(17 downto 14)<=q_intermedio_1(17 downto 14);
		q_intermedio_3(17 downto 0)<=q_intermedio_2(17 downto 0);
	end if;	
end process;

clocked2 : process(CLK_OUT(2),RESET)
begin
	if(RESET='1')then
		q_intermedio_1(1)<='0';
	elsif(rising_edge(CLK_OUT(2)))then
		q_intermedio_1(1)<=q_intermedio_0(1);
	end if;
end process;

clocked3 : process(CLK_OUT(3),RESET)
begin
	if(RESET='1')then
		q_intermedio_1(2)<='0';
		q_intermedio_1(9)<='0';
		q_intermedio_1(8)<='0';
	elsif(rising_edge(CLK_OUT(3)))then
		q_intermedio_1(2)<=q_intermedio_0(2);
		q_intermedio_1(9)<=q_intermedio_0(9);
		q_intermedio_1(8)<=q_intermedio_0(8);
		
	end if;
end process;

clocked4 : process(CLK_OUT(4),RESET)
begin
	if(RESET='1')then
		q_intermedio_1(3)<='0';
		q_intermedio_1(10)<='0';
		q_intermedio_2(4 downto 3)<="00";
		q_intermedio_2(11 downto 10)<="00";
	elsif(rising_edge(CLK_OUT(4)))then
		q_intermedio_1(3)<=q_intermedio_0(3);
		q_intermedio_1(10)<=q_intermedio_0(10);
		q_intermedio_2(4 downto 3)<=q_intermedio_1(4 downto 3);
		q_intermedio_2(11 downto 10)<=q_intermedio_1(11 downto 10);
	end if;
end process;

clocked5 : process(CLK_OUT(5),RESET)
begin
	if(RESET='1')then
		q_intermedio_1(4)<='0';
		q_intermedio_1(11)<='0';
	elsif(rising_edge(CLK_OUT(5)))then
		q_intermedio_1(4)<=q_intermedio_0(4);
		q_intermedio_1(11)<=q_intermedio_0(11);
	end if;
end process;

clocked6 : process(CLK_OUT(6),RESET)
begin
	if(RESET='1')then
		q_intermedio_1(5)<='0';
		q_intermedio_1(12)<='0';
		q_intermedio_2(6 downto 5)<="00";
		q_intermedio_2(13 downto 12)<="00";
	elsif(rising_edge(CLK_OUT(6)))then
		q_intermedio_1(5)<=q_intermedio_0(5);
		q_intermedio_1(12)<=q_intermedio_0(12);
		q_intermedio_2(6 downto 5)<=q_intermedio_1(6 downto 5);
		q_intermedio_2(13 downto 12)<=q_intermedio_1(13 downto 12);
	end if;
end process;

clocked7 : process(CLK_OUT(7),RESET)
begin
	if(RESET='1')then
		q_intermedio_1(6)<='0';
		q_intermedio_1(14 downto 13)<="00";
	elsif(rising_edge(CLK_OUT(7)))then
		q_intermedio_1(6)<=q_intermedio_0(6);
		q_intermedio_1(14 downto 13)<=q_intermedio_0(14 downto 13);--16
	end if;
end process;

--===================================================================================
-- 						Generazione segnale valid fronte di salita
--===================================================================================

process(CLK_OUT(1),reset)
begin
	if(reset='1')then
		data_valid_rise<='0';--esterni
		valid_sali<='0';--interni
		q_rise<='0'&x"0";--uscite
	elsif(rising_edge(CLK_OUT(1)))then	
		if(valid_sali='0')then
			if(q_intermedio_3=x"0000"&"00")then
				data_valid_rise<='0';
				valid_sali<='0';
			else
				valid_sali<='1';
				data_valid_rise<='1';
				q_rise<=q_compatto_sali;
			end if;	
		else
			data_valid_rise<='0';
			if(q_intermedio_3=x"0000"&"00")then
				valid_sali<='0';
			end if;
		end if;
	end if;
end process;

--===================================================================================
-- 						Generazione segnale valid fronte di discesa
--===================================================================================

process(CLK_OUT(1),reset)
begin
	if(reset='1')then
		data_valid_fall<='0';
		q_fall<='0'&x"0";
	elsif(rising_edge(CLK_OUT(1)))then	
		if(q_compatto_sali="11111")then---questa condizione va migliorata
			q_fall<=q_compatto_scendi;
			data_valid_fall<='1';
		elsif(valid_sali='1' and q_compatto_scendi/=  "00000")then
			q_fall<=q_compatto_scendi;
			data_valid_fall<='1';		
		else
			data_valid_fall<='0';
		end if;	
	end if;
end process;

--===================================================================================
-- 						Compattamento TDC fronte salita
--===================================================================================


Inst_rom_tdc_sync_sali: entity work.rom_tdc PORT MAP(
	inp => q_intermedio_3,
	usc => q_compatto_sali
);

--===================================================================================
-- 						Compattamento TDC fronte discesa
--===================================================================================

q_intermedio_3_negato<=not q_intermedio_3;
Inst_rom_tdc_sync_scendi: entity work.rom_tdc PORT MAP(
	inp => q_intermedio_3_negato,
	usc => q_compatto_scendi
);
end Behavioral;

