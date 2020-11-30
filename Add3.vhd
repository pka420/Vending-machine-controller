library IEEE;
Use ieee.std_logic_1164.all;

Entity Add3 IS
PORT( A : IN STD_LOGIC_VECTOR(3 downto 0);
		S : OUT STD_LOGIC_VECTOR(3 downto 0) );
END Add3;

ARCHITECTURE Behav OF Add3 IS 
Signal temp : STD_LOGIC;
Signal n_A2 : STD_LOGIC;
Signal n_A3 : STD_LOGIC;
Signal n_A1 : STD_LOGIC;
Signal n_A0 : STD_LOGIC;
Begin
	n_A1 <= NOT A(1);
	n_A2 <= NOT A(2);
	n_A3 <= NOT A(3);
	n_A0 <= NOT A(0);
	temp <= A(3) AND n_A0;
	S(0)<= temp OR (n_A3 AND n_A2 AND A(0)) OR (A(2) AND A(1) AND N_A0);
	S(1)<= (A(1) AND ( A(0) OR n_A2)) OR (A(3) AND n_A0);
	S(2)<= (n_A1 AND n_A0 AND A(2)) OR (A(3) AND A(0));
	S(3)<= (A(2) AND A(1)) OR A(3) OR (A(2) AND A(0));
END Behav;