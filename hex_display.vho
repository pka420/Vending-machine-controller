-- Copyright (C) 1991-2015 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus Prime License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 15.1.0 Build 185 10/21/2015 SJ Lite Edition"

-- DATE "05/11/2020 21:08:55"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
LIBRARY STD;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE STD.STANDARD.ALL;

ENTITY 	hex_display IS
    PORT (
	bcd_in : IN std_logic_vector(6 DOWNTO 0);
	number : OUT STD.STANDARD.integer
	);
END hex_display;

-- Design Ports Information
-- number[0]	=>  Location: PIN_AA7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- number[1]	=>  Location: PIN_V8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- number[2]	=>  Location: PIN_Y6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- number[3]	=>  Location: PIN_AB4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- number[4]	=>  Location: PIN_W4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- number[5]	=>  Location: PIN_W2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- number[6]	=>  Location: PIN_D22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- number[7]	=>  Location: PIN_R28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- number[8]	=>  Location: PIN_AA5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- number[9]	=>  Location: PIN_AB23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- number[10]	=>  Location: PIN_J12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- number[11]	=>  Location: PIN_A19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- number[12]	=>  Location: PIN_H25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- number[13]	=>  Location: PIN_U7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- number[14]	=>  Location: PIN_AE20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- number[15]	=>  Location: PIN_D7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- number[16]	=>  Location: PIN_H4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- number[17]	=>  Location: PIN_V7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- number[18]	=>  Location: PIN_AE6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- number[19]	=>  Location: PIN_AE2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- number[20]	=>  Location: PIN_AA6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- number[21]	=>  Location: PIN_AF27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- number[22]	=>  Location: PIN_AH12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- number[23]	=>  Location: PIN_U8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- number[24]	=>  Location: PIN_AA13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- number[25]	=>  Location: PIN_AB18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- number[26]	=>  Location: PIN_E22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- number[27]	=>  Location: PIN_AG6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- number[28]	=>  Location: PIN_AD21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- number[29]	=>  Location: PIN_AC12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- number[30]	=>  Location: PIN_D4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- number[31]	=>  Location: PIN_AH17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bcd_in[4]	=>  Location: PIN_Y5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bcd_in[2]	=>  Location: PIN_AE1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bcd_in[1]	=>  Location: PIN_W8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bcd_in[0]	=>  Location: PIN_V5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bcd_in[3]	=>  Location: PIN_Y7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bcd_in[6]	=>  Location: PIN_W7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bcd_in[5]	=>  Location: PIN_W3,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF hex_display IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_bcd_in : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_number : std_logic_vector(31 DOWNTO 0);
SIGNAL \number[0]~output_o\ : std_logic;
SIGNAL \number[1]~output_o\ : std_logic;
SIGNAL \number[2]~output_o\ : std_logic;
SIGNAL \number[3]~output_o\ : std_logic;
SIGNAL \number[4]~output_o\ : std_logic;
SIGNAL \number[5]~output_o\ : std_logic;
SIGNAL \number[6]~output_o\ : std_logic;
SIGNAL \number[7]~output_o\ : std_logic;
SIGNAL \number[8]~output_o\ : std_logic;
SIGNAL \number[9]~output_o\ : std_logic;
SIGNAL \number[10]~output_o\ : std_logic;
SIGNAL \number[11]~output_o\ : std_logic;
SIGNAL \number[12]~output_o\ : std_logic;
SIGNAL \number[13]~output_o\ : std_logic;
SIGNAL \number[14]~output_o\ : std_logic;
SIGNAL \number[15]~output_o\ : std_logic;
SIGNAL \number[16]~output_o\ : std_logic;
SIGNAL \number[17]~output_o\ : std_logic;
SIGNAL \number[18]~output_o\ : std_logic;
SIGNAL \number[19]~output_o\ : std_logic;
SIGNAL \number[20]~output_o\ : std_logic;
SIGNAL \number[21]~output_o\ : std_logic;
SIGNAL \number[22]~output_o\ : std_logic;
SIGNAL \number[23]~output_o\ : std_logic;
SIGNAL \number[24]~output_o\ : std_logic;
SIGNAL \number[25]~output_o\ : std_logic;
SIGNAL \number[26]~output_o\ : std_logic;
SIGNAL \number[27]~output_o\ : std_logic;
SIGNAL \number[28]~output_o\ : std_logic;
SIGNAL \number[29]~output_o\ : std_logic;
SIGNAL \number[30]~output_o\ : std_logic;
SIGNAL \number[31]~output_o\ : std_logic;
SIGNAL \bcd_in[3]~input_o\ : std_logic;
SIGNAL \bcd_in[5]~input_o\ : std_logic;
SIGNAL \bcd_in[6]~input_o\ : std_logic;
SIGNAL \bcd_in[0]~input_o\ : std_logic;
SIGNAL \Mux10~0_combout\ : std_logic;
SIGNAL \bcd_in[4]~input_o\ : std_logic;
SIGNAL \bcd_in[2]~input_o\ : std_logic;
SIGNAL \Mux8~0_combout\ : std_logic;
SIGNAL \bcd_in[1]~input_o\ : std_logic;
SIGNAL \Mux8~1_combout\ : std_logic;
SIGNAL \Mux8~2_combout\ : std_logic;
SIGNAL \Mux10~1_combout\ : std_logic;
SIGNAL \Mux9~3_combout\ : std_logic;
SIGNAL \Mux9~0_combout\ : std_logic;
SIGNAL \Mux9~1_combout\ : std_logic;
SIGNAL \Mux9~2_combout\ : std_logic;
SIGNAL \Mux9~4_combout\ : std_logic;
SIGNAL \Mux8~3_combout\ : std_logic;
SIGNAL \Mux8~4_combout\ : std_logic;
SIGNAL \Mux8~5_combout\ : std_logic;
SIGNAL \Mux7~0_combout\ : std_logic;
SIGNAL \Mux7~1_combout\ : std_logic;
SIGNAL \Mux6~1_combout\ : std_logic;
SIGNAL \Mux6~3_combout\ : std_logic;
SIGNAL \Mux6~2_combout\ : std_logic;
SIGNAL \Mux6~4_combout\ : std_logic;
SIGNAL \Mux6~0_combout\ : std_logic;
SIGNAL \Mux6~5_combout\ : std_logic;
SIGNAL \ALT_INV_Mux7~1_combout\ : std_logic;

BEGIN

ww_bcd_in <= bcd_in;
number <= IEEE.STD_LOGIC_ARITH.CONV_INTEGER(UNSIGNED(ww_number));
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_Mux7~1_combout\ <= NOT \Mux7~1_combout\;

-- Location: IOOBUF_X0_Y9_N16
\number[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux10~1_combout\,
	devoe => ww_devoe,
	o => \number[0]~output_o\);

-- Location: IOOBUF_X0_Y15_N23
\number[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux9~4_combout\,
	devoe => ww_devoe,
	o => \number[1]~output_o\);

-- Location: IOOBUF_X0_Y13_N9
\number[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux8~5_combout\,
	devoe => ww_devoe,
	o => \number[2]~output_o\);

-- Location: IOOBUF_X0_Y8_N23
\number[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Mux7~1_combout\,
	devoe => ww_devoe,
	o => \number[3]~output_o\);

-- Location: IOOBUF_X0_Y14_N9
\number[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux6~5_combout\,
	devoe => ww_devoe,
	o => \number[4]~output_o\);

-- Location: IOOBUF_X0_Y26_N16
\number[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \number[5]~output_o\);

-- Location: IOOBUF_X111_Y73_N2
\number[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \number[6]~output_o\);

-- Location: IOOBUF_X115_Y34_N23
\number[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \number[7]~output_o\);

-- Location: IOOBUF_X0_Y10_N23
\number[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux6~5_combout\,
	devoe => ww_devoe,
	o => \number[8]~output_o\);

-- Location: IOOBUF_X115_Y7_N16
\number[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \number[9]~output_o\);

-- Location: IOOBUF_X40_Y73_N9
\number[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \number[10]~output_o\);

-- Location: IOOBUF_X81_Y73_N16
\number[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \number[11]~output_o\);

-- Location: IOOBUF_X115_Y58_N16
\number[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \number[12]~output_o\);

-- Location: IOOBUF_X0_Y18_N16
\number[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux6~5_combout\,
	devoe => ww_devoe,
	o => \number[13]~output_o\);

-- Location: IOOBUF_X85_Y0_N23
\number[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \number[14]~output_o\);

-- Location: IOOBUF_X13_Y73_N2
\number[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \number[15]~output_o\);

-- Location: IOOBUF_X0_Y62_N16
\number[16]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \number[16]~output_o\);

-- Location: IOOBUF_X0_Y14_N2
\number[17]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux6~5_combout\,
	devoe => ww_devoe,
	o => \number[17]~output_o\);

-- Location: IOOBUF_X1_Y0_N16
\number[18]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \number[18]~output_o\);

-- Location: IOOBUF_X0_Y17_N16
\number[19]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux6~5_combout\,
	devoe => ww_devoe,
	o => \number[19]~output_o\);

-- Location: IOOBUF_X0_Y10_N16
\number[20]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux6~5_combout\,
	devoe => ww_devoe,
	o => \number[20]~output_o\);

-- Location: IOOBUF_X115_Y8_N23
\number[21]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \number[21]~output_o\);

-- Location: IOOBUF_X54_Y0_N2
\number[22]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \number[22]~output_o\);

-- Location: IOOBUF_X0_Y18_N23
\number[23]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux6~5_combout\,
	devoe => ww_devoe,
	o => \number[23]~output_o\);

-- Location: IOOBUF_X52_Y0_N2
\number[24]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \number[24]~output_o\);

-- Location: IOOBUF_X98_Y0_N16
\number[25]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \number[25]~output_o\);

-- Location: IOOBUF_X111_Y73_N9
\number[26]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \number[26]~output_o\);

-- Location: IOOBUF_X11_Y0_N23
\number[27]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \number[27]~output_o\);

-- Location: IOOBUF_X102_Y0_N16
\number[28]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \number[28]~output_o\);

-- Location: IOOBUF_X45_Y0_N23
\number[29]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \number[29]~output_o\);

-- Location: IOOBUF_X1_Y73_N2
\number[30]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \number[30]~output_o\);

-- Location: IOOBUF_X62_Y0_N16
\number[31]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \number[31]~output_o\);

-- Location: IOIBUF_X0_Y11_N22
\bcd_in[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_bcd_in(3),
	o => \bcd_in[3]~input_o\);

-- Location: IOIBUF_X0_Y13_N1
\bcd_in[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_bcd_in(5),
	o => \bcd_in[5]~input_o\);

-- Location: IOIBUF_X0_Y12_N22
\bcd_in[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_bcd_in(6),
	o => \bcd_in[6]~input_o\);

-- Location: IOIBUF_X0_Y15_N15
\bcd_in[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_bcd_in(0),
	o => \bcd_in[0]~input_o\);

-- Location: LCCOMB_X4_Y12_N26
\Mux10~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux10~0_combout\ = (\bcd_in[6]~input_o\ & (\bcd_in[3]~input_o\ & (\bcd_in[5]~input_o\))) # (!\bcd_in[6]~input_o\ & (!\bcd_in[0]~input_o\ & (\bcd_in[3]~input_o\ $ (\bcd_in[5]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bcd_in[3]~input_o\,
	datab => \bcd_in[5]~input_o\,
	datac => \bcd_in[6]~input_o\,
	datad => \bcd_in[0]~input_o\,
	combout => \Mux10~0_combout\);

-- Location: IOIBUF_X0_Y12_N15
\bcd_in[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_bcd_in(4),
	o => \bcd_in[4]~input_o\);

-- Location: IOIBUF_X0_Y16_N15
\bcd_in[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_bcd_in(2),
	o => \bcd_in[2]~input_o\);

-- Location: LCCOMB_X1_Y12_N16
\Mux8~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux8~0_combout\ = (\bcd_in[4]~input_o\ & !\bcd_in[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \bcd_in[4]~input_o\,
	datad => \bcd_in[2]~input_o\,
	combout => \Mux8~0_combout\);

-- Location: IOIBUF_X0_Y11_N15
\bcd_in[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_bcd_in(1),
	o => \bcd_in[1]~input_o\);

-- Location: LCCOMB_X4_Y12_N16
\Mux8~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux8~1_combout\ = (!\bcd_in[3]~input_o\ & (!\bcd_in[6]~input_o\ & !\bcd_in[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bcd_in[3]~input_o\,
	datac => \bcd_in[6]~input_o\,
	datad => \bcd_in[0]~input_o\,
	combout => \Mux8~1_combout\);

-- Location: LCCOMB_X1_Y12_N2
\Mux8~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux8~2_combout\ = (!\bcd_in[5]~input_o\ & (\bcd_in[1]~input_o\ & \Mux8~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \bcd_in[5]~input_o\,
	datac => \bcd_in[1]~input_o\,
	datad => \Mux8~1_combout\,
	combout => \Mux8~2_combout\);

-- Location: LCCOMB_X1_Y12_N28
\Mux10~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux10~1_combout\ = (\Mux8~0_combout\ & ((\Mux8~2_combout\) # ((\Mux10~0_combout\ & !\bcd_in[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux10~0_combout\,
	datab => \Mux8~0_combout\,
	datac => \bcd_in[1]~input_o\,
	datad => \Mux8~2_combout\,
	combout => \Mux10~1_combout\);

-- Location: LCCOMB_X4_Y12_N6
\Mux9~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux9~3_combout\ = (((!\bcd_in[0]~input_o\) # (!\bcd_in[6]~input_o\)) # (!\bcd_in[4]~input_o\)) # (!\bcd_in[3]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bcd_in[3]~input_o\,
	datab => \bcd_in[4]~input_o\,
	datac => \bcd_in[6]~input_o\,
	datad => \bcd_in[0]~input_o\,
	combout => \Mux9~3_combout\);

-- Location: LCCOMB_X1_Y12_N6
\Mux9~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux9~0_combout\ = (\bcd_in[4]~input_o\ & (((\bcd_in[6]~input_o\)) # (!\bcd_in[3]~input_o\))) # (!\bcd_in[4]~input_o\ & ((\bcd_in[3]~input_o\) # ((\bcd_in[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111001110110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bcd_in[4]~input_o\,
	datab => \bcd_in[3]~input_o\,
	datac => \bcd_in[0]~input_o\,
	datad => \bcd_in[6]~input_o\,
	combout => \Mux9~0_combout\);

-- Location: LCCOMB_X1_Y12_N24
\Mux9~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux9~1_combout\ = (\bcd_in[2]~input_o\) # ((\Mux9~0_combout\ & (!\bcd_in[5]~input_o\ & !\bcd_in[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux9~0_combout\,
	datab => \bcd_in[5]~input_o\,
	datac => \bcd_in[1]~input_o\,
	datad => \bcd_in[2]~input_o\,
	combout => \Mux9~1_combout\);

-- Location: LCCOMB_X4_Y12_N28
\Mux9~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux9~2_combout\ = (\bcd_in[1]~input_o\ & ((!\Mux8~1_combout\) # (!\bcd_in[4]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \bcd_in[4]~input_o\,
	datac => \bcd_in[1]~input_o\,
	datad => \Mux8~1_combout\,
	combout => \Mux9~2_combout\);

-- Location: LCCOMB_X4_Y12_N8
\Mux9~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux9~4_combout\ = (\Mux9~1_combout\) # ((\Mux9~2_combout\) # ((\Mux9~3_combout\ & \bcd_in[5]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux9~3_combout\,
	datab => \bcd_in[5]~input_o\,
	datac => \Mux9~1_combout\,
	datad => \Mux9~2_combout\,
	combout => \Mux9~4_combout\);

-- Location: LCCOMB_X1_Y12_N18
\Mux8~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux8~3_combout\ = (\bcd_in[1]~input_o\ & (!\bcd_in[3]~input_o\ & (!\bcd_in[0]~input_o\ & !\bcd_in[6]~input_o\))) # (!\bcd_in[1]~input_o\ & (\bcd_in[3]~input_o\ & (\bcd_in[0]~input_o\ $ (\bcd_in[6]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010001000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bcd_in[1]~input_o\,
	datab => \bcd_in[3]~input_o\,
	datac => \bcd_in[0]~input_o\,
	datad => \bcd_in[6]~input_o\,
	combout => \Mux8~3_combout\);

-- Location: LCCOMB_X1_Y12_N12
\Mux8~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux8~4_combout\ = (\Mux8~3_combout\ & (\bcd_in[5]~input_o\ $ (!\bcd_in[6]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \bcd_in[5]~input_o\,
	datac => \bcd_in[6]~input_o\,
	datad => \Mux8~3_combout\,
	combout => \Mux8~4_combout\);

-- Location: LCCOMB_X1_Y12_N22
\Mux8~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux8~5_combout\ = (!\bcd_in[2]~input_o\ & ((\bcd_in[4]~input_o\ & (\Mux8~4_combout\)) # (!\bcd_in[4]~input_o\ & ((\Mux8~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux8~4_combout\,
	datab => \bcd_in[2]~input_o\,
	datac => \bcd_in[4]~input_o\,
	datad => \Mux8~2_combout\,
	combout => \Mux8~5_combout\);

-- Location: LCCOMB_X1_Y12_N0
\Mux7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux7~0_combout\ = (\bcd_in[0]~input_o\) # ((\bcd_in[1]~input_o\) # (\bcd_in[4]~input_o\ $ (\bcd_in[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bcd_in[4]~input_o\,
	datab => \bcd_in[3]~input_o\,
	datac => \bcd_in[0]~input_o\,
	datad => \bcd_in[1]~input_o\,
	combout => \Mux7~0_combout\);

-- Location: LCCOMB_X1_Y12_N26
\Mux7~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux7~1_combout\ = (\bcd_in[5]~input_o\) # ((\bcd_in[2]~input_o\) # ((\bcd_in[6]~input_o\) # (\Mux7~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bcd_in[5]~input_o\,
	datab => \bcd_in[2]~input_o\,
	datac => \bcd_in[6]~input_o\,
	datad => \Mux7~0_combout\,
	combout => \Mux7~1_combout\);

-- Location: LCCOMB_X1_Y12_N30
\Mux6~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux6~1_combout\ = (\bcd_in[5]~input_o\ & ((\bcd_in[1]~input_o\) # ((\bcd_in[4]~input_o\ & \bcd_in[2]~input_o\)))) # (!\bcd_in[5]~input_o\ & (((\bcd_in[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bcd_in[4]~input_o\,
	datab => \bcd_in[5]~input_o\,
	datac => \bcd_in[1]~input_o\,
	datad => \bcd_in[2]~input_o\,
	combout => \Mux6~1_combout\);

-- Location: LCCOMB_X1_Y12_N10
\Mux6~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux6~3_combout\ = (\bcd_in[3]~input_o\ & ((\bcd_in[6]~input_o\ $ (\bcd_in[5]~input_o\)) # (!\bcd_in[4]~input_o\))) # (!\bcd_in[3]~input_o\ & ((\bcd_in[4]~input_o\ & ((\bcd_in[6]~input_o\) # (!\bcd_in[5]~input_o\))) # (!\bcd_in[4]~input_o\ & 
-- ((\bcd_in[5]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110111110111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bcd_in[6]~input_o\,
	datab => \bcd_in[3]~input_o\,
	datac => \bcd_in[4]~input_o\,
	datad => \bcd_in[5]~input_o\,
	combout => \Mux6~3_combout\);

-- Location: LCCOMB_X1_Y12_N8
\Mux6~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux6~2_combout\ = (!\bcd_in[1]~input_o\ & !\bcd_in[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \bcd_in[1]~input_o\,
	datad => \bcd_in[2]~input_o\,
	combout => \Mux6~2_combout\);

-- Location: LCCOMB_X1_Y12_N20
\Mux6~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux6~4_combout\ = (\Mux6~2_combout\ & (\Mux6~3_combout\ & (!\bcd_in[0]~input_o\))) # (!\Mux6~2_combout\ & (((!\Mux8~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux6~3_combout\,
	datab => \Mux6~2_combout\,
	datac => \bcd_in[0]~input_o\,
	datad => \Mux8~1_combout\,
	combout => \Mux6~4_combout\);

-- Location: LCCOMB_X1_Y12_N4
\Mux6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux6~0_combout\ = (\bcd_in[3]~input_o\ & (\bcd_in[4]~input_o\ & (\bcd_in[6]~input_o\ $ (!\bcd_in[5]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bcd_in[6]~input_o\,
	datab => \bcd_in[3]~input_o\,
	datac => \bcd_in[4]~input_o\,
	datad => \bcd_in[5]~input_o\,
	combout => \Mux6~0_combout\);

-- Location: LCCOMB_X1_Y12_N14
\Mux6~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux6~5_combout\ = (\Mux6~1_combout\) # ((\Mux6~4_combout\) # ((!\Mux6~0_combout\ & \bcd_in[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux6~1_combout\,
	datab => \Mux6~4_combout\,
	datac => \Mux6~0_combout\,
	datad => \bcd_in[0]~input_o\,
	combout => \Mux6~5_combout\);

ww_number(0) <= \number[0]~output_o\;

ww_number(1) <= \number[1]~output_o\;

ww_number(2) <= \number[2]~output_o\;

ww_number(3) <= \number[3]~output_o\;

ww_number(4) <= \number[4]~output_o\;

ww_number(5) <= \number[5]~output_o\;

ww_number(6) <= \number[6]~output_o\;

ww_number(7) <= \number[7]~output_o\;

ww_number(8) <= \number[8]~output_o\;

ww_number(9) <= \number[9]~output_o\;

ww_number(10) <= \number[10]~output_o\;

ww_number(11) <= \number[11]~output_o\;

ww_number(12) <= \number[12]~output_o\;

ww_number(13) <= \number[13]~output_o\;

ww_number(14) <= \number[14]~output_o\;

ww_number(15) <= \number[15]~output_o\;

ww_number(16) <= \number[16]~output_o\;

ww_number(17) <= \number[17]~output_o\;

ww_number(18) <= \number[18]~output_o\;

ww_number(19) <= \number[19]~output_o\;

ww_number(20) <= \number[20]~output_o\;

ww_number(21) <= \number[21]~output_o\;

ww_number(22) <= \number[22]~output_o\;

ww_number(23) <= \number[23]~output_o\;

ww_number(24) <= \number[24]~output_o\;

ww_number(25) <= \number[25]~output_o\;

ww_number(26) <= \number[26]~output_o\;

ww_number(27) <= \number[27]~output_o\;

ww_number(28) <= \number[28]~output_o\;

ww_number(29) <= \number[29]~output_o\;

ww_number(30) <= \number[30]~output_o\;

ww_number(31) <= \number[31]~output_o\;
END structure;


