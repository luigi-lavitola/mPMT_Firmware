library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package instruction_buffer_type is

    TYPE D_ARRAY_61BIT 	is array	(0 to 19) 	of std_logic_vector 	(76 downto 0);
	 TYPE D_ARRAY_Type 	IS array (0 to 7) 	of std_logic_vector	(15 downto 0);
	 TYPE F_ARRAY_Type 	IS array (0 to 19) 	of std_logic_vector	(15 downto 0);

end package instruction_buffer_type;