----------------------------------------------------------------------------------
-- Company:   INFN
-- Engineer:     AB

-- Module Name:    RS232_come_USB - Behavioral 

-- PROTOCOLLO

-- aaaa dddd(LF or CR) < WRITE
-- aaaa (LF or CR) < LEGGE
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
--------------------------------------------------------


entity RS232_come_USB is
    GENERIC (  RS_Sppen_bps   : integer := 921600; -- Indirizzo base -- BPS
					Freq_CLK_KHz	: integer := 200000 ); ---- CLK in KHz
					
    Port ( CLK48M 	: in  STD_LOGIC; -- 48MHz
           RESET 		: in  STD_LOGIC ;
			  
		-- RS232	  
				RS232_TX		: out   STD_LOGIC ;
				RS232_RX  	: in    STD_LOGIC ;  		  
															
		--  INTERNI										
				PKT_REQ	: in  STD_LOGIC;	-- FIFO NON VUOTA	1= dati da leggere	
				PKT_ACK	: out STD_LOGIC;	-- RD_FIFO		
				Fifo_DATA: in  STD_LOGIC_VECTOR (15 downto 0);
				BDATA_IN	: in  STD_LOGIC_VECTOR (15 downto 0);
				BDATA_OUT: out STD_LOGIC_VECTOR (15 downto 0);
				BADDR		: out STD_LOGIC_VECTOR (15 downto 0);
				BWR		: out STD_LOGIC;
				BRD		: out STD_LOGIC
			  
			  );
end RS232_come_USB;

architecture Behavioral of RS232_come_USB is

-- COMPONENTI 




----------------------------------------------------------
--				            SEGNALI
----------------------------------------------------------
    --   X Macchina a  STATI 
  type cmds is (S0, S_RD_FIFO, Send1, Wait1, Send2, Wait2, Send3, Wait3, Send4, Wait4, SendFINE, WaitFINE);
signal state : cmds;

signal LD_SHIFT 			: std_logic;
signal Send_TX 			: std_logic;
signal WR_FLG 				: std_logic;
signal int_WR 				: std_logic;
signal int_RD 				: std_logic;
signal DATA_VALID 		: std_logic;
signal TX_ACTIVE_int 				: std_logic;
signal SEND_OK 			: std_logic;
signal CHR_ERR 			: std_logic;
signal int_RDr 			: std_logic;
signal RX_DATA_HEX		: std_logic_vector ( 7 downto 0);
signal RX_DATA_HEX_TOTALE	: std_logic_vector ( 15 downto 0);
signal Val_ADDR			: std_logic_vector ( 15 downto 0);
signal Val_DATA			: std_logic_vector ( 15 downto 0);
signal Val_DATA_TX		: std_logic_vector ( 7 downto 0);
signal Val_DATA_RX		: std_logic_vector ( 7 downto 0);
signal Wrd_to_Send		: std_logic_vector ( 15 downto 0);

-- BDRATE calcolation	
	--constant Freq_CLK_KHz	: integer := 48000;  -- KHz
	--constant RS_Sppen_bps	: integer := 115200; -- BPS
	constant BDRate     		: INTEGER  := natural((Freq_CLK_KHz*1000)/RS_Sppen_bps);

begin
-------------  COMPONENTI --------------
--  SERIALE -----------------------------
	Inst_RX: entity work.RX 
	generic map ( CLK_bits  => BDRate) --: 48.000.000/115200
	PORT MAP(
		CLK 			=> CLK48M ,
		RESET 		=> RESET,
		ENABLE 		=> '1',
		RX_IN 		=> RS232_RX,
		DATA_OUT 	=> Val_DATA_RX,
		DATA_VALID 	=> DATA_VALID
	);

	Inst_TX: entity work.TX 
	generic map ( CLK_bits  => BDRate) --: 
	PORT MAP(
		CLK 			=> CLK48M ,
		RESET 		=> RESET,
		ENABLE 		=> '1',
		TX_OUT 		=> RS232_TX,
		TX_ACTIVE 	=> TX_ACTIVE_int,
		TX_END 		=> open,
		DATA_IN 		=> Val_DATA_TX ,
		START 		=> Send_TX
	);
-- END SERIALE --------------
-------------------------------

--  USCITE

BDATA_OUT	<= Val_DATA;
BADDR			<= Val_ADDR ;
BWR			<= int_WR;
BRD			<= int_RD;


--------------------------------------------------------------
--      CODICE
--------------------------------------------------------------


Proc_MAIN : process(CLK48M,RESET)
begin
	if RESET = '1' then
	 
	  LD_SHIFT 		<= '0';
	  RX_DATA_HEX	<= (others => '0');
	  RX_DATA_HEX_TOTALE	<= (others => '0');
	  Val_ADDR		<= (others => '0');
	  Val_DATA		<= (others => '0');
	  
	  state 			<= S0 ;
	  Val_DATA_TX 	<=  (others => '0');
	  Wrd_to_Send 	<=  (others => '0');
	  Send_TX		<= '0';
	  WR_FLG			<= '0';
	  int_WR			<= '0';
	  int_RD			<= '0';
	  SEND_OK		<= '0';
	  CHR_ERR		<= '0';
	  int_RDr		<= '0';
	 
    elsif rising_edge(CLK48M) then
			int_RDr <= int_RD;
			
			if DATA_VALID = '1' then
			
				if (Val_DATA_RX > 47) and (Val_DATA_RX < 58) then -- è un numero
						RX_DATA_HEX <= Val_DATA_RX - 48 ;
						LD_SHIFT <= '1';
				elsif (Val_DATA_RX > 64) and (Val_DATA_RX < 71) then -- è una lettera A--F
						RX_DATA_HEX <= Val_DATA_RX - 55 ;
						LD_SHIFT <= '1';
            elsif (Val_DATA_RX > 96) and (Val_DATA_RX < 103) then -- è una lettera a--f
						RX_DATA_HEX <= Val_DATA_RX - 87 ;
						LD_SHIFT <= '1';		
						
				elsif (Val_DATA_RX = 32) then -- SPAZIO
							Val_ADDR <= RX_DATA_HEX_TOTALE ;
							RX_DATA_HEX_TOTALE <= (others => '0');
							WR_FLG	<= '1';
							
				elsif (Val_DATA_RX = 10) or (Val_DATA_RX = 13)  then -- CR o LF
				
				         if WR_FLG = '1' and CHR_ERR = '0' then -- SCRITTURA
							  Val_DATA <= RX_DATA_HEX_TOTALE ;	
							  RX_DATA_HEX_TOTALE <= (others => '0'); 
							  int_WR <= '1'; 
							  WR_FLG	<= '0';
							  SEND_OK <= '1';
							elsif  WR_FLG = '0' and CHR_ERR = '0' then -- Lettura
								Val_ADDR <= RX_DATA_HEX_TOTALE ;
								RX_DATA_HEX_TOTALE <= (others => '0'); 
								int_RD <= '1'; 
							else
								CHR_ERR <= '0';	
							end if;
							
				else -- Carattere non previsto
					CHR_ERR <= '1';
			 
				end if;	
			else
			    int_WR <= '0';	
          --------------------
		end if;
			 
				if LD_SHIFT = '1' then  -- Crea la variabile a 16 bit
				  LD_SHIFT <= '0';
				  RX_DATA_HEX_TOTALE <= RX_DATA_HEX_TOTALE(11 downto 0) & RX_DATA_HEX(3 downto 0);
				 end if ;
	
------------------------------------
-- Risposta	

-- STATI (S0, S_RD_FIFO, Send1, Wait1, Send2,Wait2, Send3, Wait3 Send4, Wait4, SendFINE, WaitFINE)
			case state is
		 
		      when S0 => ----------------  S0
						if SEND_OK 	= '1'	then  --  Invia risposta alla scrittura ((eco dato))
								Wrd_to_Send <= Val_DATA;
								state 		<= Send1 ;
								SEND_OK <= '0';
						elsif int_RDr = '1'  then -- Invia Lettrura
								Wrd_to_Send <= BDATA_IN;
								int_RD		<= '0';
								state 		<= Send1 ;
						elsif PKT_REQ = '1' then -- Fifo NON VUOTA
								PKT_ACK <= '1';
								state 	<= S_RD_FIFO ;
								Wrd_to_Send <= Fifo_DATA;
						else             								
								state <= S0 ;
						end if;
						
				  when S_RD_FIFO => ----------------  Legge FIFO	
						PKT_ACK 		<= '0';
					--	Wrd_to_Send <= Fifo_DATA;
						state 		<= Send1 ;
						
				when Send1 => ----------------  Manda  il Primo	
                 if Wrd_to_Send(15 downto 12)  < 10 then
							Val_DATA_TX <= X"3" & Wrd_to_Send(15 downto 12) ;
						else	
							Val_DATA_TX <= (X"3" & Wrd_to_Send(15 downto 12)) + 7;
						end if;	
						Send_TX		<= '1';
						  if TX_ACTIVE_int = '1' then
								state 		<= Wait1 ;	
							end if;	
						
				when Wait1 => ----------------  ASPETTA  il Primo
                 Send_TX		<= '0';				
                 if TX_ACTIVE_int = '0' then
							state 	<= Send2 ; 
						else	
							state 	<= Wait1 ;	
						end if;		
						
				when Send2 => ----------------  Manda  il II
                 if Wrd_to_Send(11 downto 8)  < 10 then
							Val_DATA_TX <= X"3" & Wrd_to_Send(11 downto 8); 
						else	
							Val_DATA_TX <= (X"3" & Wrd_to_Send(11 downto 8)) + 7;
						end if;
						Send_TX		<= '1';
						if TX_ACTIVE_int = '1' then
								state 		<= Wait2 ;	
							end if;
						
				when Wait2 => ----------------  ASPETTA  il II	
				     Send_TX		<= '0';
                 if TX_ACTIVE_int = '0' then
							state 	<= Send3 ; 
						else	
							state 	<= Wait2 ;	
						end if;	
						
				when Send3 => ----------------  Manda  il III
                 if Wrd_to_Send(7 downto 4)  < 10 then
							Val_DATA_TX <= X"3" & Wrd_to_Send(7 downto 4); 
						else	
							Val_DATA_TX <= (X"3" & Wrd_to_Send(7 downto 4)) + 7;
						end if;	
						Send_TX		<= '1';
						if TX_ACTIVE_int = '1' then
								state 		<= Wait3 ;	
						end if;
						
						
				when Wait3 => ----------------  ASPETTA  il III	
					  Send_TX		<= '0';
                 if TX_ACTIVE_int = '0' then
							state 	<= Send4 ; 
						else	
							state 	<= Wait3 ;	
						end if;
						
				when Send4 => ----------------  Manda  il IV
                 if Wrd_to_Send(3 downto 0)  < 10 then
							Val_DATA_TX <= X"3" & Wrd_to_Send(3 downto 0); 
						else	
							Val_DATA_TX <= (X"3" & Wrd_to_Send(3 downto 0)) + 7;
						end if;	
						Send_TX		<= '1';
						if TX_ACTIVE_int = '1' then
							state 		<= Wait4 ;	
						end if;
						
						
				when Wait4 => ----------------  ASPETTA  il IV	
				     Send_TX		<= '0';
                 if TX_ACTIVE_int = '0' then
							state 	<= SendFINE ; 
						else	
							state 	<= Wait4 ;	
						end if;	 
						
				when SendFINE => ----------------  Manda  CR o LF
              
							Val_DATA_TX <= X"0D" ; -- CR
							Send_TX		<= '1';
							if TX_ACTIVE_int = '1' then
								state 		<= WaitFINE ;	
							end if;
						
						
				when WaitFINE => ----------------  ASPETTA  FINE
						Send_TX		<= '0';
                 if TX_ACTIVE_int = '0' then
							state 	<= S0; 
						else	
							state 	<= WaitFINE ;	
						end if;
						
				when others => ----------------  ALTRI
				               state <= S0 ;

            END CASE ;		
						
	end if;
end process ;


end Behavioral;

																																			
																			