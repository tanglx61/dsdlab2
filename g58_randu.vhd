
LIBRARY ieee;
USE ieee.std_logic_1164.all; 


ENTITY g58_randu IS 
	PORT
	(
		c_in :  IN  STD_LOGIC;
		A :  IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
		B :  IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
		C :  OUT  STD_LOGIC;
		S :  OUT  STD_LOGIC_VECTOR(5 DOWNTO 0)
	);
END g58_adder;