-- First include the libraries.
library ieee;
use ieee.std_logic_1164.all; -- use of std_logic

entity tb_Full_adder is --saying its the testbench also it will be used like before.
-- no ports
end entity tb_Full_adder;

architecture behave of tb_Full_adder is

	component Full_adder is -- Creating a component which is from the original vhdl fil
		port (
			a		: in std_logic; 
			b		: in std_logic;
			cin		: in std_logic;
			-- space between inputs and outputs.
			sumF		: out std_logic;
			coutF	: out std_logic
		);
	end component Full_adder;

	signal a : std_logic := '0'; 
	signal b : std_logic := '0';
	signal cin : std_logic := '0';
	-- space between inputs and outputs.
	signal sumF : std_logic := '0';
	signal coutF	: std_logic  := '0';


begin
		-- Now to use a portmap to make sure the correct signals are synched across the files.
	Portmapping: Full_adder port map (
		a => a,
		b => b,
		cin => cin, 
		sumF => sumF,
		coutF => coutF
	);
	Data_Gen: process is -- to make the data more different.
  	begin
		a <= '0';
		b <= '0';
		cin <= '0';
		wait for 10 ns;
		a <= '1';
		b <= '0';
		cin <= '0';
		wait for 10 ns;
		a <= '0';
		b <= '1';
		cin <= '0';
		wait for 10 ns;
		a <= '1';
		b <= '1';
		cin <= '0';
		wait for 10 ns;
		a <= '0';
		b <= '0';
		cin <= '1';
		wait for 10 ns;
		a <= '1';
		b <= '0';
		cin <= '1';
		wait for 10 ns;
		a <= '0';
		b <= '1';
		cin <= '1';
		wait for 10 ns;
		a <= '1';
		b <= '1';
		cin <= '1';
		wait for 10 ns;
  end process Data_Gen;


end architecture behave;