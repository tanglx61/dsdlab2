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
-- CREATED		"Wed Feb 01 18:43:51 2017"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY g58_adder IS 
	PORT
	(
		c_in :  IN  STD_LOGIC;
		A :  IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
		B :  IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
		C :  OUT  STD_LOGIC;
		S :  OUT  STD_LOGIC_VECTOR(5 DOWNTO 0)
	);
END g58_adder;

ARCHITECTURE bdf_type OF g58_adder IS 

COMPONENT g58_1bit_full_adder
	PORT(A : IN STD_LOGIC;
		 B : IN STD_LOGIC;
		 C : IN STD_LOGIC;
		 S : OUT STD_LOGIC;
		 Cout : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	C_1 :  STD_LOGIC;
SIGNAL	C_2 :  STD_LOGIC;
SIGNAL	C_3 :  STD_LOGIC;
SIGNAL	C_4 :  STD_LOGIC;
SIGNAL	C_5 :  STD_LOGIC;
SIGNAL	S_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(5 DOWNTO 0);


BEGIN 



b2v_inst : g58_1bit_full_adder
PORT MAP(A => A(1),
		 B => B(1),
		 C => C_1,
		 S => S_ALTERA_SYNTHESIZED(1),
		 Cout => C_2);


b2v_inst1 : g58_1bit_full_adder
PORT MAP(A => A(0),
		 B => B(0),
		 C => c_in,
		 S => S_ALTERA_SYNTHESIZED(0),
		 Cout => C_1);


b2v_inst2 : g58_1bit_full_adder
PORT MAP(A => A(2),
		 B => B(2),
		 C => C_2,
		 S => S_ALTERA_SYNTHESIZED(2),
		 Cout => C_3);


b2v_inst3 : g58_1bit_full_adder
PORT MAP(A => A(4),
		 B => B(4),
		 C => C_4,
		 S => S_ALTERA_SYNTHESIZED(4),
		 Cout => C_5);


b2v_inst4 : g58_1bit_full_adder
PORT MAP(A => A(3),
		 B => B(3),
		 C => C_3,
		 S => S_ALTERA_SYNTHESIZED(3),
		 Cout => C_4);


b2v_inst5 : g58_1bit_full_adder
PORT MAP(A => A(5),
		 B => B(5),
		 C => C_5,
		 S => S_ALTERA_SYNTHESIZED(5),
		 Cout => C);

S <= S_ALTERA_SYNTHESIZED;

END bdf_type;