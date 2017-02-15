
LIBRARY ieee;
USE ieee.std_logic_1164.all; 
USE ieee.numeric_std.all;

Library work;

ENTITY g58_modulo_test IS 
END g58_modulo_test;

ARCHITECTURE g58_modulo_test_arch OF g58_modulo_test IS 

SIGNAL A : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL Amod2powB : STD_LOGIC_VECTOR(31 DOWNTO 0);

COMPONENT g58_modulo
	PORT
	(
		A :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		Amod2powB :  OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

BEGIN 


b2v_inst : g58_modulo
PORT MAP(
		 A => A,
		 Amod2powB => Amod2powB
		 );


generate_test : PROCESS

BEGIN

FOR i IN 0 to 1024 LOOP -- loop over all A values
	A <= std_logic_vector(to_unsigned(i,32)); -- convert the loop variable i to std_logic_vector

	WAIT FOR 10 ns; -- suspend process for 10 nanoseconds at the start of each loop

END LOOP; -- end the i loop

WAIT; -- we have gone through all possible input patterns, so suspend simulator forever

END PROCESS generate_test;



END g58_modulo_test_arch;