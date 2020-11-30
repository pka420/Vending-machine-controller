LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY intergration IS
PORT( clock, reset, hard_reset, Start, set,N, D, Q : IN STD_LOGIC;
		funct, prod : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		change0, change1, change2, runTotal0, runTotal1, runTotal2, total0, total1, total2 : out std_LOGIC_VECTOR(3 downto 0);
--		bin_Change, bin_runTotal, bin_Total : out std_LOGIC_VECTOR(7 downto 0);
		finished : OUT STD_LOGIC );
END intergration;

architecture behav of intergration is 	
component SRAM is 
	PORT
	(
		address	: IN STD_LOGIC_VECTOR (1 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (5 DOWNTO 0);
		rden		: IN STD_LOGIC  := '1';
		wren		: IN STD_LOGIC ;
		q		   : OUT STD_LOGIC_VECTOR (5 DOWNTO 0)
	);
END COMPONENT;

component PROGRAM_UNIT is
PORT( Clock ,set, enable, reset : IN STD_LOGIC;
		N, D, Q : IN STD_LOGIC;
		product : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		wen, done : OUT STD_LOGIC;
		addr_out : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);	
		data_mem : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) );
END COMPONENT;

component ven_unit is
PORT (clock, reset, en, N, D, Q : in std_logic;
		price_in : in  std_logic_vector(7 downto 0);
		done : out std_logic;
		insert_out, change : out std_logic_vector(7 downto 0));
END COMPONENT;

component convert2bcd is
PORT(binary : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
 bcd : OUT STD_LOGIC_VECTOR(11 DOWNTO 0));
END COMPONENT;

Component free is
PORT (clock, reset, en: in std_logic;
		finished	: out std_logic := '0';
		change, runTotal, total :out std_logic_vector(7 downto 0));
END COMPONENT;

Component Seven_set3 is
	PORT( input : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
			output : OUT STD_LOGIC_VECTOR(20 DOWNTO 0));
end component;


--enable signals
Signal en_PU : STD_LOGIC;
Signal en_VU : STD_LOGIC;
Signal en_display : STD_LOGIC;
Signal en_free : STD_LOGIC;

-- sram signals
Signal add_sram : STD_LOGIC_VECTOR(1 downto 0);
Signal data_sram : STD_LOGIC_VECTOR(7 downto 0);
Signal read_sram : STD_LOGIC;
Signal write_sram : STD_LOGIC;
Signal q_sram : STD_LOGIC_VECTOR(5 downto 0);

-- signals for vending unit diaplay
Signal bcd_in_VU_insert : STD_LOGIC_VECTOR(7 downto 0);
Signal bcd_in_VU_change : STD_LOGIC_VECTOR(7 downto 0);

--displauy mode implemented in thuis file


--signals for displaying in free mode:
signal bcd_in_total_free : STD_LOGIC_VECTOR(7 downto 0);
signal bcd_in_insert_free : STD_LOGIC_VECTOR(7 downto 0);
signal bcd_in_change_free : STD_LOGIC_VECTOR(7 downto 0);


--convert2bcd inputs:
Signal bcd_change : STD_LOGIC_VECTOR(7 downto 0);
Signal bcd_insert : STD_LOGIC_VECTOR(7 downto 0);
Signal bcd_total  : STD_LOGIC_VECTOR(7 downto 0);

--Seven Segmend set of 3 inputs: and also outputs of bcd:
Signal Seg_insert : STD_LOGIC_VECTOR(11 downto 0);
Signal Seg_total  : STD_LOGIC_VECTOR(11 downto 0);
Signal Seg_change : STD_LOGIC_VECTOR(11 downto 0);

-- output from Seven Segment set of 3 and also input of our hex display
Signal Segout_insert : STD_LOGIC_VECTOR(20 downto 0);
Signal Segout_change : STD_LOGIC_VECTOR(20 downto 0);
Signal Segout_total  : STD_LOGIC_VECTOR(20 downto 0);

Signal temp : UNSIGNED(1 DOWNTO 0);
Signal data_pu : STD_LOGIC_VECTOR(7 DOWNTO 0);

Signal finish_sig : STD_LOGIC;
Signal finish_sig_free : STD_LOGIC;
Signal finish_sig_pu : STD_LOGIC;
Signal finish_sig_vu : STD_LOGIC;


Signal add_sram_pu : STD_LOGIC_VECTOR(1 DOWNTO 0);
Signal write_sram_pu : STD_LOGIC;

signal reset_sig : std_LOGIC;
signal internal_slave_sig : std_LOGIC_VECTOR(7 downto 0);

Begin


process(hard_reset, clock)
variable idle :boolean := false;
	BEGIN
	if(hard_reset = '0') then
--		if (finish_sig_pu = '1' or finish_sig_vu = '1') then
--		reset_sig <= '1';
--		end if;
		case funct is
			when "00"=>			-- Program mode
					en_PU<=Start;
					en_vu <= '0';
					en_display <= '0';
					bcd_insert <= data_pu;
					bcd_change <= "00000000";
					bcd_total  <= "00000000";
					data_sram  <= data_pu; -- ?
					finished   <= finish_sig_pu;
					write_sram <= write_sram_pu;
					add_sram   <= add_sram_pu;
					
			when "10"=>			--vending mode
					en_VU<=Start;
					en_PU <= '0';
					en_display <= '0';
					bcd_insert <= bcd_in_VU_insert;
					bcd_change <= bcd_in_VU_change;
					bcd_total  <= "00" & q_sram;            --(price_in needed here)
					read_sram  <= '1';
					add_sram   <= prod;
					finished   <= finish_sig_vu;
	
			when "01"=>			-- display mode
					en_PU <= '0';
					en_vu <= '0';
					en_display<=Start;
					bcd_total  <= "00" & q_sram;
					bcd_change <= "ZZZZZZZZ";
					bcd_insert <= "ZZZZZZZZ";
					read_sram <= '1';
					write_sram <= '0';
					add_sram <= prod;
					finished <= '1';
										
			when "11"=>			-- free mode
--					en_free<=Start;
--					bcd_insert <= bcd_in_insert_free;
--					bcd_total  <= bcd_in_total_free;
--					bcd_change <= bcd_in_change_free;					
--					finished   <= finish_sig_free;
--					
					if (start = '1') then
						bcd_change <= "ZZZZZZZZ";
						bcd_total  <= "ZZZZZZZZ";
						bcd_change <= "ZZZZZZZZ";
						finished <= '1';
					else
						finished <= '0';
					end if;
			when others =>
					en_PU <= '0';
					en_VU <= '0';
					en_display <= '0';
				
					
		end case;
	else		-- erase sram
		temp<="00";
			for ii in 0 to 4 loop			-- idk how to wait in loop
				add_sram<=std_logic_vector(temp);
				data_sram<="00000000";
				temp<= temp + 1 ;
			end loop; 
			if(temp = "11") then
				finish_sig <= '1';
			else
				finish_sig<= '0';
			end if;
			finished<=finish_sig;
	end if;
end process;

internal_slave_sig <= ("00") & (q_sram);

RAM : SRAM 
		port map(address =>add_sram, clock => clock, data=> data_sram(5 downto 0), rden=>read_sram, wren=>write_sram, q=>q_sram );

	
PU :  program_unit 
		port map(clock=>clock, set=>set, reset=>reset_sig, enable=> en_PU, N=>N, D=>D, Q=>Q, product=>prod, wen=> write_sram_pu, done=>finish_sig_pu, addr_out=>add_sram_pu, data_mem=>data_pu);
		
VU :  ven_unit
		port map(clock=>clock, reset=>reset_sig, en=>en_VU, N=>N, D=>D, Q=>Q, price_in=> internal_slave_sig, done=>finish_sig_vu, insert_out=> bcd_in_VU_insert, change=> bcd_in_VU_change);
																																	--integartion's finished
																																		-- insert out to bcd																													
fR : free
		port map(clock=>clock, reset=>reset, en=>en_free, change=>bcd_in_change_free, runTotal=> bcd_in_insert_free, total=>bcd_in_total_free, finished=>finish_sig_free);

		
bcd_run_total : convert2bcd
		port map(binary => bcd_insert, bcd=>Seg_insert );

bcd_change_out : convert2bcd
		port map(binary=> bcd_change, bcd=>Seg_change );
	
bcd_total_out : convert2bcd
		port map(binary=>bcd_total, bcd=>Seg_total);
	
Seg_insert_out : Seven_set3
				port map(input=>Seg_insert, output=>Segout_insert);

Seg_change_out : Seven_set3
				port map(input=>Seg_change, output=>Segout_change);

Seg_total_out : Seven_set3
				port map(input=>Seg_total, output=>Segout_total);

	
--runTotal2 <= segout_insert(20 downto 14);
--runTotal1 <= segout_insert(13 downto 7);
--runTotal0 <= segout_insert(6 downto 0);
--
--Total2 <= segout_total(20 downto 14);
--Total1 <= segout_total(13 downto 7);
--Total0 <= segout_total(6 downto 0);
--
--change2 <= segout_change(20 downto 14);
--change1 <= segout_change(13 downto 7);
--change0 <= segout_change(6 downto 0);


	
runTotal2 <= seg_insert(11 downto 8);
runTotal1 <= seg_insert(7 downto 4);
runTotal0 <= seg_insert(3 downto 0);

Total2 <= seg_total(11 downto 8);
Total1 <= seg_total(7 downto 4);
Total0 <= seg_total(3 downto 0);

change2 <= seg_change(11 downto 8);
change1 <= seg_change(7 downto 4);
change0 <= seg_change(3 downto 0);

		
end behav;