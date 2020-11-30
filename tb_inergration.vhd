LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_intergration is
end tb_intergration;

architecture test of tb_intergration is

component intergration IS
PORT( clock, reset, hard_reset, Start, set,N, D, Q : IN STD_LOGIC;
		funct, prod : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		change0, change1, change2, runTotal0, runTotal1, runTotal2, total0, total1, total2 : out std_LOGIC_VECTOR(6 downto 0);
		finished : OUT STD_LOGIC );
END component;


signal clock_sig, reset_sig, hard_reset_sig, start_sig, set_sig, N_sig, D_sig, Q_sig : std_LOGIC;
signal funct_sig, prod_sig : std_logic_vector(1 downto 0);

constant clc_period :time := 10 ns;

begin
DUT: intergration

port map(clock => clock_sig, reset => reset_sig, hard_reset => hard_reset_sig, set => set_sig, start => start_sig, N => n_sig, D => d_sig, Q => q_sig, funct => funct_sig, prod => prod_sig);

clock_process: process
begin

clock_sig <= '0';
wait for clc_period/2;
clock_sig <= '1';
wait for clc_period/2;
end process;

stim_proc: process
begin

reset_sig <= '1';
Q_sig <= '0';
n_sig <= '0';
d_sig <= '0';
start_sig <= '0';
set_sig <= '0';
funct_sig <= "00";
prod_sig <= "00";
hard_reset_sig <= '0';
wait for clc_period;

reset_sig <= '0';
wait for clc_period;

hard_reset_sig <= '0';
wait for clc_period;

hard_reset_sig <= '0';
funct_sig <= "00";
prod_sig <= "11";
start_sig <= '1';
wait for clc_period;

Q_sig <= '1';
wait for clc_period*4; --20 or $1.00
set_sig <= '1';
q_sig <= '0';
wait for clc_period;
set_sig <= '0';
start_sig <= '0';
wait for clc_period * 5;
-- so far we have made a product in 11 for $1.00 ---
-- lets create one for address 00 for $0.20 ---

prod_sig <= "00";
start_sig <= '1';
wait for clc_period;
d_sig <= '1';
n_sig <= '1';
wait for clc_period;
d_sig <= '0';
wait for clc_period;
n_sig <= '0';
wait for clc_period;
set_sig <= '1';
start_sig <= '1';
wait for clc_period;
-- should have it here, lets test it with display --
set_sig <= '0';
prod_sig <= "00";
funct_sig <= "01";
--Hopefully we see $1.00 in total right now--
wait for clc_period *4; --lets admire it for 4 clock cycles;

-- now lets buy this product --
funct_sig <= "10";
start_sig <= '0';
wait for clc_period * 4;
start_sig <= '1';
wait for clc_period;
--aight we are in vending mode, and we need to insert $1
-- so lets insert $1.50
q_sig <= '1';
wait for clc_period * 6;
q_sig <= '0';
-- hopefully we are seeing change of 50 cents right now...
wait for clc_period;
start_sig <= '0';
--lets dispense the other product using free mode
funct_sig <= "11";
prod_sig <= "00";
wait for clc_period * 4;
start_sig <= '1';
wait for clc_period * 2;
-- lets do a hard reset.
start_sig <= '0';
wait for clc_period;
hard_reset_sig <= '1';
wait for clc_period * 6;
--make sure its reset!
hard_reset_sig <= '0';
wait for clc_period * 2;
--everything should be reset.
--we can test by displaying out earlier set products;
prod_sig <= "11";
funct_sig <= "01";
wait for clc_period * 4; -- we should see zero here
prod_sig <= "00";
wait for clc_period * 4; -- and here
prod_sig <= "10";
wait for clc_period * 4; -- and even here, even though we hever set it.

end process;
end;
