LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity display is
port (prod : in std_logic_vector(1 downto 0);
		en, clock   : in std_logic;
		price: out std_logic_vector(7 downto 0));
		
end display;

architecture behaviour of display is


signal  prod_sig : std_LOGIC_VECTOR(1 downto 0);
signal price_sig : std_LOGIC_VECTOR(5 downto 0);
signal clock_sig, wren_sig, rden_sig, en_sig : std_LOGIC;
signal data_sig : std_LOGIC_VECTOR(5 downto 0);


begin
prod_sig <= prod;
clock_sig <= clock;
en_sig <= en;
wren_sig <= '0';

ram : SRAM
port map(address => prod_sig, q => price_sig, clock => clock_sig, rden => en_sig, data => data_sig, wren => wren_sig);

price <= "00" & price_sig;

end behaviour;