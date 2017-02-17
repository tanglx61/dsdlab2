LIBRARY ieee;
USE ieee.std_logic_1164.all; 
USE ieee.numeric_std.all;

Library work;

ENTITY g58_7_segment_decoder_test IS 
END g58_7_segment_decoder_test;

ARCHITECTURE g58_7_segment_decoder_test_arch OF g58_7_segment_decoder_test IS 

SIGNAL code : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL mode : STD_LOGIC;
SIGNAL segments_out : STD_LOGIC_VECTOR(6 DOWNTO 0);

COMPONENT g58_7_segment_decoder
	PORT
	(	
		code :  IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		mode :  IN STD_LOGIC;
		segments_out :	OUT STD_LOGIC_VECTOR(6 DOWNTO 0) 
	);
END COMPONENT;

BEGIN 

inst1 : g58_7_segment_decoder
PORT MAP(
		 code => code,
		 mode => mode,
		 segments_out => segments_out);



generate_test : PROCESS

BEGIN


mode <= '0';
FOR i IN 0 to 15 LOOP
	code <= std_logic_vector(to_unsigned(i,4));
	WAIT FOR 20 ns; -- suspend process for 20 nanoseconds at the start of each loop

END LOOP;

mode <= '1';
FOR i IN 0 to 15 LOOP
	code <= std_logic_vector(to_unsigned(i,4));
	WAIT FOR 20 ns; -- suspend process for 20 nanoseconds at the start of each loop

END LOOP;


WAIT; -- we have gone through all possible input patterns, so suspend simulator forever

END PROCESS generate_test;

END g58_7_segment_decoder_test_arch;