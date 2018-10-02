library IEEE; -- Using the std_logic library
use IEEE.std_logic_1164.all;

entity PeriodicSignals is
port(	clk 			:	in	 std_logic; --Global clock for testing
		rst_n 			:	in	 std_logic; --asynchronous reset
		clk1 			:	in	 std_logic; --clock 1 generated in testbench
		clk2 			:	in	 std_logic; --clock 2 generated in testbench
		PeriodicSignal1 :	out  std_logic; --clock 1 generated in this file
		PeriodicSignal2 :	out  std_logic  --clock 2 generated in this file
);
end entity PeriodicSignals;

architecture behavioral of PeriodicSignals is


begin

PeriodicSingal1: process is --sensitivity list (in this casse none)
begin
	PeriodicSignal1 <= '0', '1' after 5 ns, '0' after 15 ns;
	wait for 20 ns;
end process PeriodicSingal1;

PeriodicSingal2: process is --sensitivity list
begin
	PeriodicSignal2 <= '0', '1' after 5 ns, '0' after 10 ns, '1' after 15 ns;
	wait for 20 ns;
end process PeriodicSingal2;

end architecture behavioral;