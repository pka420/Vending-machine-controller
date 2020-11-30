library IEEE;
Use ieee.std_logic_1164.all;

ENTITY convert2bcd IS
PORT(binary : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
 bcd : OUT STD_LOGIC_VECTOR(11 DOWNTO 0));
END convert2bcd;

ARCHITECTURE Structure OF convert2bcd IS

COMPONENT Add3 IS 
PORT( A : IN STD_LOGIC_VECTOR(3 downto 0);
		S : OUT STD_LOGIC_VECTOR(3 downto 0) );
END COMPONENT;
	
Signal temp1 : STD_LOGIC_VECTOR(3 downto 0);	
Signal temp2 : STD_LOGIC_VECTOR(3 downto 0);	
Signal temp3 : STD_LOGIC_VECTOR(3 downto 0);	
Signal temp4 : STD_LOGIC_VECTOR(3 downto 0);	
Signal temp5 : STD_LOGIC_VECTOR(3 downto 0);	
Signal temp6 : STD_LOGIC_VECTOR(3 downto 0);	
Signal temp7 : STD_LOGIC_VECTOR(3 downto 0);	

Begin
	

	bcd(11 downto 10) <= "00";
	
	A1: Add3 Port map(A(3)=>'0' , A(2 downto 0) => binary( 7 downto 5) , S=>temp1 );
	A2: Add3 port map(A(0)=> binary(4) , A(3 downto 1)=> temp1(2 downto 0) , S=>temp2);
	A3: Add3 port map(A(0)=> binary(3) , A(3 downto 1)=> temp2(2 downto 0) , S=>temp3);
	
	A4: Add3 port map(A(0)=>temp3(3) , A(1)=>temp2(3), A(2)=>temp1(3) , A(3) => '0' , S=>temp4);
	A5: Add3 port map(A(0)=>binary(2) , A(3 downto 1)=>temp3(2 downto 0) , S=>temp5);
	
	A6: Add3 port map(A(3 downto 1)=>temp4(2 downto 0) , A(0)=>temp5(3) , S=>temp6);
	A7: Add3 port map(A(3 downto 1)=>temp5(2 downto 0) , A(0)=>binary(1) , S=>temp7);
	
	bcd(0) <= binary(0);
	bcd(9) <= temp4(3);
	bcd(8 downto 5) <= temp6;
	bcd(4 downto 1) <= temp7;
END Structure;


