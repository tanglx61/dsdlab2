LIBRARY ieee;
USE ieee.std_logic_1164.all; 
USE ieee.numeric_std.all;

Library work;

ENTITY g58_pop_enable_test IS 
END g58_pop_enable_test;

ARCHITECTURE g58_pop_enable_test_arch OF g58_pop_enable_test IS 

SIGNAL N : STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL P_EN : STD_LOGIC_VECTOR(51 DOWNTO 0);
SIGNAL CLK: STD_LOGIC := '0';

COMPONENT g58_pop_enable
	PORT
	(	
		N :  IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
		CLK: IN 	STD_LOGIC;
		P_EN :  OUT  STD_LOGIC_VECTOR(51 DOWNTO 0) 
	);
END COMPONENT;

BEGIN 

inst1 : g58_pop_enable
PORT MAP(
		 N => N,
		 P_EN => P_EN,
		 CLK => CLK);


setup_clock: PROCESS

BEGIN
	CLK <= '0';
	wait for 5 ns;
	CLK <= '1';
	wait for 5 ns;

END PROCESS setup_clock;


generate_test : PROCESS

BEGIN

N <= "000000";

FOR i IN 0 to 63 LOOP
	N <= std_logic_vector(to_unsigned(i,6));
	WAIT FOR 20 ns; -- suspend process for 10 nanoseconds at the start of each loop

END LOOP;

WAIT; -- we have gone through all possible input patterns, so suspend simulator forever

END PROCESS generate_test;

END g58_pop_enable_test_arch;