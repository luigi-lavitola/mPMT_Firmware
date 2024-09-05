----------------------------------------------------------------------------------
-- Company: INFN Napoli
-- Engineer: AB
-- 
-- Create Date:    12:41:11 18/08/2020 
-- Design Name: 
-- Module Name:    CLK_SAFE - Behavioral 
-- Project Name: 

-- Description: Rivela la presenza del Ref_CLK dal cavo
--  commuta il BUGMUX automaticamente
--  lo segnala al RunControl ( Anche le transizioni avvenute tra 2 letture )

----------------------------------------------------------------------------------
library IEEE;
library UNISIM;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use UNISIM.vcomponents.all;
use work.instruction_buffer_type.all;


entity CLK_SAFE is
    generic (MaxTime_OK     : integer:= 10000 ); -- Tempo x il quale la freq del RefCLK deve essere 25MHz (Step 1.33uS)
    Port ( Ref_CLK1 				: in  STD_LOGIC; -- ref_CLK dal cavo 1
           Ref_CLK2 				: in  STD_LOGIC; -- ref_CLK dal cavo 2
           XCLK 					: in  STD_LOGIC; -- Quarzo a 25MHz 
           FCLK25M 				: in  STD_LOGIC; -- CLK dalla USB
           RESET 					: in  STD_LOGIC;
		   RunC_CLK_est_int	: in  STD_LOGIC; -- 1 = Esterno 0 = Interno   <---| 
		   RunC_CLK_Automat	: in  STD_LOGIC; -- 1 = Automatico 0 = Manuale ---|
           RunC_Ref_CLK_OK 	: out  STD_LOGIC;
		   Runc_Ref_CLK_Perso	: out  STD_LOGIC;
		   Runc_Ref_CLK_ritrov: out  STD_LOGIC;
		   Runc_ClkSafe_Rflag	: in  STD_LOGIC;
		   Clock_register       : out STD_LOGIC_VECTOR(11 downto 0);
		   Clock_register_out   : in  STD_LOGIC_VECTOR(3 downto 0);
		   Letto_CLK_res_flag   : out STD_LOGIC;
           Mast_CLK25MHz 		: out  STD_LOGIC);   ---- <<<< Master CLK a tutta l'FPGA
end CLK_SAFE;

architecture Behavioral of CLK_SAFE is

signal Conta25M_PS				: std_logic_vector (5 downto 0);
signal ContaRef25M			: std_logic_vector (4 downto 0);
signal ContaRef25M_2			: std_logic_vector (4 downto 0);
signal EN_Conta				: std_logic;
signal EN_Sync					: std_logic;
signal EN_Sync2					: std_logic;
signal Res_Conta				: std_logic := '1';
signal Sel_MUX					: std_logic;
signal int_ResFlgR			: std_logic;
signal AND_SelMux				: std_logic;

signal CLK_cavo1_OK         :   std_logic;
signal CLK_cavo2_OK         :   std_logic;

signal RefCLK_Mux           :   std_logic;
signal AND_SelMux_ref_CLK           :   std_logic;
signal Ref_CLK_Automatico           :   std_logic;
signal Ref_CLK_1_2                  :   std_logic;
signal Sel_MUX_master                  :   std_logic;

signal CLK_Register_int         :   std_logic_vector(11 downto 0);

signal CLK_1_ok             :   std_logic;
signal CLK_1_perso             :   std_logic;
signal CLK_1_ritrovato             :   std_logic;
signal CLK_2_ok             :   std_logic;
signal CLK_2_perso             :   std_logic;
signal CLK_2_ritrovato             :   std_logic;
signal CLK_Automatico             :   std_logic;
signal CLK_int_ext             :   std_logic;
signal ContTimeOK_1				: std_logic_vector (13 downto 0);
signal ContTimeOK_2				: std_logic_vector (13 downto 0);


attribute keep : string;  
attribute keep of Conta25M_PS : signal is "true"; 
attribute keep of ContaRef25M : signal is "true"; 
attribute keep of ContaRef25M_2 : signal is "true"; 

begin

process(XCLK,RESET)
begin
	if(RESET='1')then      --1
		Conta25M_PS 	<= ( others => '0');
		EN_Conta 	<= '0';
		Res_Conta	<= '1';
		Sel_MUX		<= '0';
		CLK_cavo1_OK <= '0';
		CLK_cavo2_OK <= '0';
        Runc_Ref_CLK_ritrov	<= '0';
        Runc_Ref_CLK_Perso		<= '0';
        CLK_1_perso		<= '0';
        CLK_1_ritrovato <= '0';
        CLK_2_perso		<= '0';
        CLK_2_ritrovato <= '0';
        int_ResFlgR				<= '0';
        Sel_MUX_master          <= '0';
		ContTimeOK_1 <= 	( others => '0');
		ContTimeOK_2 <= 	( others => '0');
	elsif rising_edge(XCLK) then
	
		Conta25M_PS <= Conta25M_PS +1;
		int_ResFlgR <= Runc_ClkSafe_Rflag;
	
		if(Conta25M_PS < 25 )then -- Abilita il contatore per frequenzimetro
					EN_Conta <= '1';
		else		
					EN_Conta <= '0';
		end if;
		
		if((Conta25M_PS > 27 ) and (Conta25M_PS < 30 ))then --  reset contatore
					Res_Conta <= '1';
		else		
					Res_Conta <= '0';
		end if;
		
		if Runc_ClkSafe_Rflag = '1' then --and int_ResFlgR = '1'  then -- Resetta i FLAG RunC
				CLK_1_ritrovato		<= '0';
				CLK_2_ritrovato		<= '0';
				CLK_1_perso		<= '0';
				CLK_2_perso		<= '0';
				Letto_CLK_res_flag <= '1';
		else
		       Letto_CLK_res_flag <= '0';   
		end if;	
		
		
		
		if(Conta25M_PS = 27 ) then --  controlla la frequenza     --2
				
				if (ContaRef25M > 23 and ContaRef25M < 27) then -- Se la frequenza è giusta
				    if ContTimeOK_1 < MaxTime_OK then
								ContTimeOK_1 <= ContTimeOK_1 + 1 ;
					end if;	
						  
				else	 -- Se la frequenza è sbagliata
				    ContTimeOK_1 <= ( others => '0');
			    end if;
			   
			   if (ContaRef25M_2 > 23 and ContaRef25M_2 < 27) then -- Se la frequenza è giusta
				    if ContTimeOK_2 < MaxTime_OK then
								ContTimeOK_2 <= ContTimeOK_2 + 1 ;
					end if;	
						  
				else	 -- Se la frequenza è sbagliata
				    ContTimeOK_2 <= ( others => '0');
			    end if;
			   
		end if;	      --2	
		
		if ContTimeOK_1 >= MaxTime_OK then	
				    CLK_cavo1_OK  <= '1';
                    if CLK_cavo1_OK  = '0' then -- FLAG x RunC
                          CLK_1_ritrovato <= '1';	
                    end if;
		else
			        CLK_cavo1_OK  <= '0';
                    if (CLK_cavo1_OK  = '1') then --FLAG x RunC
                               CLK_1_perso <= '1';
                    end if;
		end if;
		
		if ContTimeOK_2 >= MaxTime_OK then	
				    CLK_cavo2_OK  <= '1';
                    if CLK_cavo2_OK  = '0' then -- FLAG x RunC
                          CLK_2_ritrovato <= '1';	
                    end if;
		else
			        CLK_cavo2_OK  <= '0';
                    if (CLK_cavo2_OK  = '1') then --FLAG x RunC
                               CLK_2_perso <= '1';
                    end if;
		end if;
		
		
		
       if 	CLK_cavo1_OK = '1' then
			         Sel_MUX <= '0';
			         Sel_MUX_master <= '0';
       elsif CLK_cavo2_OK = '1' then
			         Sel_MUX <= '1';
			         Sel_MUX_master <= '0';
       else
			         Sel_MUX_master  <= '1';
       end if;
		
			
 end if;	--1
end process;

AND_SelMux_ref_CLK <= (Sel_MUX and Ref_CLK_Automatico) or (Ref_CLK_1_2 and not Ref_CLK_Automatico ); 
BUFGMUX_inst_refCLK : BUFGMUX
   port map (
      O  => RefCLK_Mux,   -- 1-bit output: Clock output
      I0 => Ref_CLK1, --  25MHz dal cavo 1 (S=0)
      I1 => Ref_CLK2, --  25MHz dal cavo 2 (S=1)
      S  =>  AND_SelMux_ref_CLK   -- 1 = RefCLK presente su cavo 1
   );

--  Frequenzimetro CLK1 cavo
process(Ref_CLK1,Res_Conta)
begin
	if(Res_Conta='1')then
		ContaRef25M 	<= ( others => '0');
		EN_Sync 			<= '0';
			
	elsif(rising_edge(Ref_CLK1))then
	
			EN_Sync <= EN_Conta;
		
			if((ContaRef25M < 31 and EN_Sync = '1')) then -- abilita il conteggio
					ContaRef25M <= ContaRef25M +1;		 
			end if;
			
 end if;	
end process;

--  Frequenzimetro CLK2 cavo
process(Ref_CLK2,Res_Conta)
begin
	if(Res_Conta='1')then
		ContaRef25M_2 	<= ( others => '0');
		EN_Sync2 			<= '0';
			
	elsif(rising_edge(Ref_CLK2))then
	
			EN_Sync2 <= EN_Conta;
		
			if((ContaRef25M_2 < 31 and EN_Sync2 = '1')) then -- abilita il conteggio
					ContaRef25M_2 <= ContaRef25M_2 +1;		 
			end if;
			
 end if;	
end process;

RunC_Ref_CLK_OK <= not Sel_MUX_master ;

--AND_SelMux <= Sel_MUX and not RunC_CLK_Interno; 
AND_SelMux <= (Sel_MUX_master and CLK_Automatico) or (CLK_int_ext and not CLK_Automatico ); 

   BUFGMUX_inst : BUFGMUX
   port map (
      O => Mast_CLK25MHz,   -- 1-bit output: Clock output
      I0 => RefCLK_Mux, -- clock 25MHz dal cavo (S=0)
      I1 => XCLK,--FCLK25M, -- clock 25 da quarzo (S=1)
      S =>  AND_SelMux   -- 
   );


CLK_int_ext <= Clock_register_out(3);
CLK_Automatico <= Clock_register_out(2);
Ref_CLK_1_2 <= Clock_register_out(1);
Ref_CLK_Automatico <= Clock_register_out(0);

CLK_Register_int <= AND_SelMux & "00" & AND_SelMux_ref_CLK & "00" & CLK_2_ritrovato & CLK_2_perso & CLK_cavo2_OK & CLK_1_ritrovato & CLK_1_perso & CLK_cavo1_OK;
Clock_register <=  CLK_Register_int;

end Behavioral;

