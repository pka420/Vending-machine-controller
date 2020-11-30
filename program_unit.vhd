 LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY program_unit IS
PORT( Clock ,set, enable, reset : IN STD_LOGIC;
		N, D, Q : IN STD_LOGIC;
		product : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		wen, done : OUT STD_LOGIC;
		addr_out : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);	
		data_mem : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) );
END program_unit;

ARCHITECTURE fsm OF program_unit IS

COMPONENT accumulator IS
PORT (clock, reset, en, N, D, Q : in std_logic;
		accum_out : out unsigned(7 downto 0));
END COMPONENT;

--signals:

Signal acc_out : uNSIGNED(7 DOWNTO 0);
signal acc_en  : STD_LOGIC := '0';
Signal done_sig : STD_LOGIC;
Signal temp : STD_LOGIC_VECTOR(1 DOWNTO 0) ;
Signal state : STD_LOGIC := '0';

Begin

	acc : accumulator 
	port map(clock => clock, en=>acc_en, reset=>reset, N=>N, D=>D, Q=>Q, accum_out => acc_out );
	
	process(clock) 
		begin
			if(rising_edge(clock)) then
				if(reset = '1'  ) then			--idle
					acc_en<='0';
					data_mem<="ZZZZZZZZ";
					addr_out<="ZZ";
					wen<='0';
					done_sig<='0';
				elsif(enable = '1') then 		
					acc_en <= '1';
						if(set = '1') then
							addr_out<=product;
							data_mem<=STD_LOGIC_VECTOR(acc_out);				
							wen<='1';
							done_sig<='1';
						else
							data_mem<="ZZZZZZZZ";
							addr_out<="ZZ";
							wen<='0';
							done_sig<='0';
						end if;
				end if;
			end if;
	end process;

	done<=done_sig;
END fsm;