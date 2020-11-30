Library ieee;
USE IEEE.STD_LOGIC_1164.all;

Entity SevenSeg IS

Port (D : in std_logic_vector (3 downto 0);
		Y : Out std_logic_vector (6 downto 0));
end sevenSeg;
		
Architecture behavior of sevenSeg IS
Begin

process (D)
BEGIN

Case D is --------------6543210
	when "0000" => y <= "1000000"; --0
	when "0001" => y <= "1111001"; --1
	when "0010" => y <= "0100100"; --2
	when "0011" => y <= "0110000"; --3
	when "0100" => y <= "0011001"; --4
	when "0101" => y <= "0010010"; --5
	when "0110" => y <= "0000010";
	when "0111" => y <= "1111000";
	when "1000" => y <= "0000000";
	when "1001" => y <= "0011000"; --9
	when others => y <= "1111111"; -- shut off
end case;
end process;
end behavior;