LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ven_unit is
PORT (clock, reset, en, N, D, Q : in std_logic;
		price_in : in  std_logic_vector(7 downto 0);
		done : out std_logic;
		insert_out, change : out std_logic_vector(7 downto 0));
end ven_unit;

architecture structure of ven_unit is

component Accumulator is
PORT (clock, reset, en, N, D, Q : in std_logic;

		accum_out : out unsigned(7 downto 0));
end component;

component compare is
PORT( price_in  : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		accum_out : IN UNSIGNED(7 downto 0);
		change    : OUT STD_LOGIC_VECTOR(7 downto 0);
		done      : OUT STD_LOGIC );
END component;

signal clock_sig, rest_sig, en_sig, N_sig, D_sig, Q_sig : std_logic;
signal price_sig, change_sig : std_LOGIC_VECTOR(7 downto 0);
signal acc_out : unsigned (7 downto 0);
signal done_sig :std_LOGIC;

begin
clock_sig <= clock;
rest_sig <= reset;
en_sig <= en;
price_sig <= price_in;
n_sig <= n;
d_sig <=d;
q_sig <=q;


accum: Accumulator
port map(clock => clock_sig, en => en_sig, reset => rest_sig, N => n_sig, D => d_sig, q => q_sig, accum_out => acc_out);

comparator: compare
port map(price_in => price_sig, accum_out => acc_out, change => change_sig, done => done_sig);

insert_out <= std_LOGIC_VECTOR(acc_out);
done <= done_sig;
change <= change_sig;

end structure;