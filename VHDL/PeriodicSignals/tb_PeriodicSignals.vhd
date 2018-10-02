library IEEE; -- Using the std_logic library
use IEEE.std_logic_1164.all;

entity tb_PeriodicSignals is
-- no ports
end tb_PeriodicSignals;

architecture behave of tb_PeriodicSignals is
	component PeriodicSignals is -- Creating a component which is from the original vhdl file
		port ( -- they have the same signals there as here.
			clk 			:	in	 std_logic; --Global clock for testing
			rst_n 			:	in std_logic; -- asynchronous reset
			clk1 			:	in std_logic; -- clock 1 generated in testbench
			clk2 			:	in std_logic; -- clock 2 generated in testbench
			PeriodicSignal1 :	out std_logic; --clock 1 generated in this file
			PeriodicSignal2 :	out std_logic  --clock 2 generated in this file
		);
	end component PeriodicSignals;

	-- Now to create signals for all the signals ...
	-- Also giving all signals a starting value of 0
	signal	clk				: std_logic := '0';
	signal 	rst_n 			: std_logic := '0'; --asynchronous reset
	signal	clk1 			: std_logic := '0';
	signal	clk2 			: std_logic := '0';
	signal	PeriodicSignal1 : std_logic := '0'; 
	signal	PeriodicSignal2 : std_logic := '0'; 

	constant period1 : time := 5 ns; --constant def.
	constant period2 : time := 10 ns; --constant def.

begin
	-- Now to use a portmap to make sure the correct signals are synched across the files.
	Portmapping: PeriodicSignals port map (
		clk => clk,
		rst_n => rst_n,
		clk1 => clk1, 
		clk2 => clk2,
		PeriodicSignal1 => PeriodicSignal1,
		PeriodicSignal2 => PeriodicSignal2
	);

	clk <= not clk after period1; --clock generation 2 test
	rst_n <= '0', '1' after 5 ns; -- waveform generation of async reset.
	clk1 <= not clk1 after period2; --clock generation 1
	clock_process: process (rst_n,clk) is --using clock to keep it updated. 
	begin
		if (rst_n = '0') then
			clk2 <= '0';
		elsif (rst_n = '1') then
			clk2 <= clk; --clock generation 2
		end if;
	end process clock_process;
end architecture behave;