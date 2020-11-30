library IEEE;
Use ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY hard_reset IS
PORT( clock : IN STD_LOGIC;
	   address_out : OUT STD_LOGIC_VECTOR(1 DOWNTO 0); 
	   data_write  : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		done     : OUT STD_LOGIC );
END hard_reset;

ARCHITECTURE dead OF hard_reset IS

Signal temp : STD_LOGIC_VECTOR(1 DOWNTO 0);

Begin
	PROCESS(clock)
		begin
		if(rising_edge(clock)) then
			temp<="00";
			for ii in 0 to 4 loop			-- idk how to wait in loop
				address_out<=temp;
				data_write<="00000000";
				temp<=std_logic_vector(unsigned(temp) + 1);
			end loop; 
			if(temp = "11") then
				done<= '1';
			else
				done<= '0';
			end if;
		end if;
	end process;	

END dead;