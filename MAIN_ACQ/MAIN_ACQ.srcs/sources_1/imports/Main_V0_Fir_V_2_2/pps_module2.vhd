----------------------------------------------------------------------------------
-- Company: INFN
-- Engineer: AB
-- 
-- Create Date:    11:57:34 25/07/2020 
-- Module Name:    pps_module2 - Behavioral 
--
-- Description: Riceve il Tag0 e Reset T
--  Tag0 	= sincronizza il contatore a 200MHz ogni 1sec
-- Tag_ResT = resetta il contatore di secondi
--
--  TAG0 = ____----____--______------__----____
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity pps_module2 is
	generic (C_MAX       : integer:= 199999999 ); -- 199.999.999 Contrggi a 200MHz
			--	Val_Tag0		: integer:= 0 );
    Port ( 	CLK_25MHZ 		: in  	STD_LOGIC; -- CLK con TAG_T e ResT
				CLK_200MHZ 		: in  	STD_LOGIC;
				CLK_200MHZ_1 	: in  	STD_LOGIC;-- Sfasato per problemi di metastabilita con i 25MHz
				RESET 			: in  	STD_LOGIC;
				PPS_OUT 			: out  	STD_LOGIC;
				RunC_TAG_OK		: out  	STD_LOGIC_VECTOR (2 downto 0); -- 0 = Tag0_OK  1= Tag_ResT_OK -- 2 = unic time aligned 
				RunC_Res_FLG  	: in  	STD_LOGIC;	
				Runc_Val_Tag0	: in  	STD_LOGIC_VECTOR (15 downto 0);		--latenza 3, inserire valore + 3
				CONTA 			: out  	STD_LOGIC_VECTOR (27 downto 0);
				COUNTA_sec 		: out  	STD_LOGIC_VECTOR (31 downto 0); -- Conta secondi
				UnixTime_ARM 	: IN 	STD_LOGIC_VECTOR (31 downto 0);
				FLAG_WR_Unix_Time   :   in  STD_LOGIC
				
				); 
end pps_module2;

architecture Behavioral of pps_module2 is

signal int_Conta 				: std_logic_vector (27 downto 0);
signal int_Conta_r 			: std_logic_vector (27 downto 0);
signal int_COUNTA_sec		: std_logic_vector (31 downto 0);
signal Width_H_R0				: std_logic_vector (2 downto 0);
signal Width_H_R1				: std_logic_vector (2 downto 0);
signal CLK_25R					: std_logic;
signal CLK_25R_0				: std_logic;
signal int_RunC_Res_FLG		: std_logic;
signal int_RunC_Res_FLGr	: std_logic;
signal FLAG_WR_Unix_Time_r	: std_logic;
signal buio						: std_logic_vector (4 downto 0);
signal Conta_Delay				: std_logic_vector (4 downto 0);

signal Aligned_NTP_int      :   std_logic;
signal Aligned_NTP_RC      :   std_logic;
signal PPS_not_Aligned      :   std_logic;
signal intFLG_TAG0_OK      :   std_logic;
signal PPS_OUT_int      :   std_logic;
signal UnixTime_ARM_r	: std_logic_vector (31 downto 0);

attribute keep : string;
attribute keep of UnixTime_ARM_r : signal is "true";
attribute keep of FLAG_WR_Unix_Time_r : signal is "true";

begin

CONTA 		<= int_Conta;
COUNTA_sec 	<= int_COUNTA_sec;
--RunC_TAG_OK(2) <= Aligned_NTP_RC;
-- Sincronizza i 25MHz con i 200MHz SFASATI
process(CLK_200MHZ_1,RESET)
begin
	if(RESET='1')then
	 CLK_25R_0 <= '0';
	elsif(rising_edge(CLK_200MHZ_1))then 
	   CLK_25R_0 <= CLK_25MHZ;
	end if;
end process;	
	 

process(CLK_200MHZ,RESET)
begin
	if(RESET='1')then
		Width_H_R0 	<= ( others => '0');
		Width_H_R1 	<= ( others => '0');
		CLK_25R 		<= '0';
		int_Conta 	<= ( others => '0');
	int_COUNTA_sec <= X"56355600";     --01/11/2015 00:00:00 Nobel Kajita
	   RunC_TAG_OK <= ( others => '0');
	int_RunC_Res_FLG <= '0'	;
	int_RunC_Res_FLGr <= '0' ;
	PPS_OUT				<= '0';
	PPS_OUT_int				<= '0';
	buio					<= ( others => '0');
	int_Conta_r			<= ( others => '0');
	Conta_Delay			<= ( others => '0');
	UnixTime_ARM_r			<= ( others => '0');
	FLAG_WR_Unix_Time_r <= '0';
	PPS_not_Aligned <= '0';
    Aligned_NTP_RC <= '0';
    intFLG_TAG0_OK <= '0';
     
	elsif(rising_edge(CLK_200MHZ))then
			CLK_25R 			<= CLK_25R_0;
		 int_RunC_Res_FLG <= RunC_Res_FLG;
		 int_RunC_Res_FLGr <= int_RunC_Res_FLG;
		 FLAG_WR_Unix_Time_r <= FLAG_WR_Unix_Time;
		
		--  if (CLK_25R = '1' and CLK_25MHZ = '1')then -- stabile alto > conta la durata alta
		  if (CLK_25R = '1' )then -- stabile alto > conta la durata alta
					Width_H_R0 <= Width_H_R0+1;
			end if;
			
			
		  if(CLK_25R = '0' and CLK_25R_0 = '1')then -- di salita  > azzera la memoria > memorizza la durata
					Width_H_R0 	<= ( others => '0'); -- azzera
					Width_H_R1 <=Width_H_R0;       -- memorizza
					if buio > 0 then  --  Monostabile per  accettare un ResT
					    buio <= buio - 1 ;
					  end if;
			end if;
	-- Tag0				
		  if(CLK_25R = '0' and CLK_25R_0 = '1' and buio = 0 and 
                 ( (Width_H_R1 <= 2 and Width_H_R0 >= 5 ) or
      				 (Width_H_R1 <= 3 and Width_H_R0 >= 6 )) )then -- Tag 0;
							--int_Conta 			<= conv_std_logic_vector(Val_Tag0, 28);
							int_Conta 			<= X"000" & Runc_Val_Tag0;
							
							if int_Conta /= ((X"000" & Runc_Val_Tag0) - 1) then
							     
							     RunC_TAG_OK(1) 	<= '0';     --preso dal reset secondi
							end if;
							
							--RunC_TAG_OK(0) 	<= '1';
							 intFLG_TAG0_OK <= '1';
							buio 					<= conv_std_logic_vector(31, 5);
		  elsif  int_Conta = C_MAX  then  -- OVF senza PPS --- si è perso il pps
					     int_Conta 		<= ( others => '0');
						 -- int_COUNTA_sec 	<= int_COUNTA_sec +1;
						 if intFLG_TAG0_OK = '0' then
						   RunC_TAG_OK(0)  <=  '0';
						  end if; 
						 intFLG_TAG0_OK  <= '0';
						   
		  else
					  int_Conta 		<=  int_Conta + 1;
					
		  end if;
			
		-- PPS
		   int_Conta_r <= int_Conta; 
			
				if int_Conta <= int_Conta_r  then --check if order
					PPS_OUT				<= '1';
					PPS_OUT_int				<= '1';
					int_COUNTA_sec 	<= int_COUNTA_sec +1;
					
				else
					PPS_OUT			<= '0';
					PPS_OUT_int			<= '0';
				end if;	
				
	-- Tag RESET		
		 if(CLK_25R = '0' and CLK_25R_0 = '1' and buio > 0 and  Width_H_R1 > 4 and Width_H_R0 < 4 )then  -- Tag_resT;
					int_COUNTA_sec 	<= ( others => '0');
					--RunC_TAG_OK(1) 	<= '1';
		 			
		 end if;
		 
		 --UnixTime SYNC from NTP
--		 if FLAG_WR_Unix_Time = '1' and FLAG_WR_Unix_Time_r ='0' then
--		      int_COUNTA_sec <= UnixTime_ARM;
		      
--		      Aligned_NTP_RC <= '0';
--		      RunC_TAG_OK(2) <= '0';
--		 end if;
         UnixTime_ARM_r <= UnixTime_ARM;
		 if UnixTime_ARM_r /= UnixTime_ARM then
		      int_COUNTA_sec <= UnixTime_ARM;
		      Aligned_NTP_RC <= '0';
		      RunC_TAG_OK(2) <= '0';
		 end if;
		 
		 
		 if int_RunC_Res_FLGr = '0' and int_RunC_Res_FLG = '1'  and Conta_Delay = 0 then  -- Run control  RES FLG Tag
		    Conta_Delay <= Conta_Delay + 1;
		 elsif Conta_Delay > 0 and PPS_OUT_int = '1' and Conta_Delay < 4 then
		    Conta_Delay <= Conta_Delay + 1;
		 elsif Conta_Delay = 4 then
			RunC_TAG_OK(0) <= '1'; --normalmente PPS non ricevuto
			RunC_TAG_OK(1) <= '1'; --normalmente PPS allineato
			RunC_TAG_OK(2) <= '1'; -- normalmente UTC non allineato
			Conta_Delay <= (others => '0'); 
		 end if;
		 
					
 end if;	
end process;



end Behavioral;

