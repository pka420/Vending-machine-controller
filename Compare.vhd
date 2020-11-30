library IEEE;
Use ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY Compare IS
PORT( price_in  : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		accum_out : IN UNSIGNED(7 downto 0);
		change    : OUT STD_LOGIC_VECTOR(7 downto 0);
		done      : OUT STD_LOGIC );
END Compare;

ARCHITECTURE Behav OF Compare IS
	Begin
		process(price_in, accum_out)
			begin
				if(unsigned(price_in) <= accum_out) then
					change <= std_logic_vector(accum_out - unsigned(price_in(7 downto 0)));
					done <= '1';
				else 
					change <= "ZZZZZZZZ";
					done <= '0';
				end if;
		end process;
END Behav;