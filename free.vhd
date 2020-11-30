LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity free is
PORT (clock, reset, en: in std_logic;
		finished	: out std_logic := '0';
		change, runTotal, total :out std_logic_vector(7 downto 0));
		
end free;

architecture behavior of free is

begin

process (clock, reset)
variable idle :boolean := false;
begin
if (Reset = '1') then
change <= "00000000";
runTotal <= "00000000";
total <= "00000000";
idle := false;
elsif(en = '1') then
change <= "ZZZZZZZZ";
runTotal <= "ZZZZZZZZ";
total <= "ZZZZZZZZ";
	if (rising_edge(clock)) then
		finished <= '0';
		if idle then
			finished <= '1';
			idle := false;
		else
			idle := true;
		end if;
	end if;
else
finished <= '0';
end if;
end process;

end behavior;