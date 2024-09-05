
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_CLK_SAFE IS
END TB_CLK_SAFE;
 
ARCHITECTURE behavior OF TB_CLK_SAFE IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
      component CLK_SAFE
      generic (MaxTime_OK     : integer:= 10000 );
      Port ( Ref_CLK1 				: in  STD_LOGIC;
             Ref_CLK2 				: in  STD_LOGIC;
             XCLK 					: in  STD_LOGIC;
             FCLK25M 				: in  STD_LOGIC;
             RESET 					: in  STD_LOGIC;
  		   RunC_CLK_est_int	: in  STD_LOGIC;
  		   RunC_CLK_Automat	: in  STD_LOGIC;
             RunC_Ref_CLK_OK 	: out  STD_LOGIC;
  		   Runc_Ref_CLK_Perso	: out  STD_LOGIC;
  		   Runc_Ref_CLK_ritrov: out  STD_LOGIC;
  		   Runc_ClkSafe_Rflag	: in  STD_LOGIC;
  		   Clock_register       : out STD_LOGIC_VECTOR(11 downto 0);
  		   Clock_register_out   : in  STD_LOGIC_VECTOR(3 downto 0);
  		   Letto_CLK_res_flag   : out STD_LOGIC;
             Mast_CLK25MHz 		: out  STD_LOGIC);
  end component;

  signal Ref_CLK1: STD_LOGIC;
  signal Ref_CLK2: STD_LOGIC;
  signal XCLK: STD_LOGIC;
  signal FCLK25M: STD_LOGIC;
  signal RESET: STD_LOGIC := '0';
  signal RunC_CLK_est_int: STD_LOGIC;
  signal RunC_CLK_Automat: STD_LOGIC;
  signal RunC_Ref_CLK_OK: STD_LOGIC;
  signal Runc_Ref_CLK_Perso: STD_LOGIC;
  signal Runc_Ref_CLK_ritrov: STD_LOGIC;
  signal Runc_ClkSafe_Rflag: STD_LOGIC := '0';
  signal Clock_register: STD_LOGIC_VECTOR(11 downto 0);
  signal Clock_register_out: STD_LOGIC_VECTOR(3 downto 0) := "0101";
  signal Letto_CLK_res_flag: STD_LOGIC;
  signal Mast_CLK25MHz: STD_LOGIC;

  constant clock_period1: time := 40 ns;
  constant clock_period2: time := 40 ns;
  constant clock_period3: time := 40 ns;
  signal stop_the_clock: boolean;

begin

  -- Insert values for generic parameters !!
  uut: CLK_SAFE generic map ( MaxTime_OK          =>  10)
                   port map ( Ref_CLK1            => Ref_CLK1,
                              Ref_CLK2            => Ref_CLK2,
                              XCLK                => XCLK,
                              FCLK25M             => FCLK25M,
                              RESET               => RESET,
                              RunC_CLK_est_int    => RunC_CLK_est_int,
                              RunC_CLK_Automat    => RunC_CLK_Automat,
                              RunC_Ref_CLK_OK     => RunC_Ref_CLK_OK,
                              Runc_Ref_CLK_Perso  => Runc_Ref_CLK_Perso,
                              Runc_Ref_CLK_ritrov => Runc_Ref_CLK_ritrov,
                              Runc_ClkSafe_Rflag  => Runc_ClkSafe_Rflag,
                              Clock_register      => Clock_register,
                              Clock_register_out  => Clock_register_out,
                              Letto_CLK_res_flag  => Letto_CLK_res_flag,
                              Mast_CLK25MHz       => Mast_CLK25MHz );

  stimulus: process
  begin
    stop_the_clock <= false;
    -- Put initialisation code here
    
    Reset <= '1';
      wait for 100 ns;
			Reset <= '0';		

      wait for clock_period1*100;
		
    
    Runc_ClkSafe_Rflag <= '1';
    wait for 5 ns;
    Runc_ClkSafe_Rflag <= '0';
    wait for 5 ns;

    -- Put test bench stimulus code here
    
    
    wait;
  end process;

  clocking1: process
  begin
    while not stop_the_clock loop
      XCLK <= '0', '1' after clock_period1 / 2;
      wait for clock_period1;
    end loop;
    wait;
  end process;

clocking2: process
  begin
    while not stop_the_clock loop
       Ref_CLK1 <= '0', '1' after clock_period2 / 2;
      wait for clock_period2;
    end loop;
    wait;
  end process;
  
  clocking3: process
  begin
    while not stop_the_clock loop
      Ref_CLK2 <= '0', '1' after clock_period3 / 2;
      wait for clock_period3;
    end loop;
    wait;
  end process;
    
end;

