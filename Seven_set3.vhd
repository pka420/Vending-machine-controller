LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Entity Seven_set3 IS
	PORT( input : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
			output : OUT STD_LOGIC_VECTOR(20 DOWNTO 0));
END Seven_Set3;

ARCHITECTURE set of Seven_set3 IS
COMPONENT SevenSeg IS
Port (D : in std_logic_vector (3 downto 0);
		Y : Out std_logic_vector (6 downto 0));
END COMPONENT;
Begin

S1 : SevenSeg port map(D=>input(11 downto 8), Y=>output(20 downto 14) );

S2 : SevenSeg port map(D=>input(7 downto 4), Y=>output(13 downto 7) );

S3 : SevenSeg port map(D=>input(3 downto 0), Y=>output(6 downto 0) );

END set;