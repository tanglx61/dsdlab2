-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- PROGRAM		"Quartus II 64-Bit"
-- VERSION		"Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Full Version"
-- CREATED		"Wed Feb 01 19:25:30 2017"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 
USE ieee.numeric_std.all;

LIBRARY work;

ENTITY g58_adder_test IS 
	PORT
	(
		c_in :  IN  STD_LOGIC;
		A :  IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
		B :  IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
		C :  OUT  STD_LOGIC;
		S :  OUT  STD_LOGIC_VECTOR(5 DOWNTO 0)
	);
END g58_adder_test;

ARCHITECTURE bdf_type OF g58_adder_test IS 

COMPONENT g58_adder
	PORT(c_in : IN STD_LOGIC;
		 A : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
		 B : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
		 C : OUT STD_LOGIC;
		 S : OUT STD_LOGIC_VECTOR(5 DOWNTO 0)
	);
END COMPONENT;



BEGIN 



b2v_inst : g58_adder
PORT MAP(c_in => c_in,
		 A => A,
		 B => B,
		 C => C,
		 S => S);

generate_test : PROCESS

BEGIN

FOR i IN 0 to 63 LOOP -- loop over all A values
	A <= std_logic_vector(to_unsigned(i,6)); -- convert the loop variable i to std_logic_vector

	FOR j IN 0 to 63 LOOP -- loop over all B values
		B <= std_logic_vector(to_unsigned(j,6)); -- convert the loop variable j to std_logic_vector
		WAIT FOR 10 ns; -- suspend process for 10 nanoseconds at the start of each loop
	END LOOP; -- end the j loop

END LOOP; -- end the i loop

WAIT; -- we have gone through all possible input patterns, so suspend simulator forever

END PROCESS generate_test;
     

END bdf_type;