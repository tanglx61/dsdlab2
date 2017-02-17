LIBRARY ieee;
USE ieee.std_logic_1164.all; 

Library work;

ENTITY g58_randu_test IS 
END g58_randu_test;

ARCHITECTURE g58_randu_test_arch OF g58_randu_test IS 

SIGNAL seed : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL rand : STD_LOGIC_VECTOR(31 DOWNTO 0);

COMPONENT g58_randu
	PORT
	(	
		seed :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		rand :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0) 
	);
END COMPONENT;

BEGIN 

inst1 : g58_randu
PORT MAP(
		 seed => seed,
		 rand => rand
		 );


generate_test : PROCESS

BEGIN

seed <= "00000000000000000000000000000001";
WAIT FOR 10 ns;

FOR i IN 0 to 6 LOOP -- loop over all A values
	seed <= rand;
	WAIT FOR 10 ns; -- suspend process for 10 nanoseconds at the start of each loop



END LOOP;

--seed <= "00000001100101010000000011110011";

--WAIT FOR 10 ns; -- suspend process for 10 nanoseconds at the start of each loop

WAIT; -- we have gone through all possible input patterns, so suspend simulator forever

END PROCESS generate_test;

END g58_randu_test_arch;