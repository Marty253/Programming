-- Include the same libraries as in the normal file
library IEEE; -- Using the std_logic library
use IEEE.std_logic_1164.all;

-- Create an entity with no signals in it.
entity tb_dff_async is
-- no ports
end tb_dff_async;

-- Now towards the architecture
architecture behave of tb_dff_async is
	component dff_async is -- Creating a component which is from the original vhdl file
		port ( -- they have the same signals there as here.
			Data 		: in std_logic; --Input D flip flop
			clk			: in std_logic;	--Clk flipflop
			async_rst_n	: in std_logic; --async reset
			Q 			: out std_logic; -- output 1 flipflop
			Qbar		: out std_logic -- bonus output flipflop
		);
	end component dff_async;

	-- Now to create signals for all the signals ...
	-- Also giving all signals a starting value of 0
	signal	Data			: std_logic := '0';
	signal	clk				: std_logic := '0';
	signal	async_rst_n		: std_logic := '0';
	signal	Q				: std_logic := '0';
	signal	Qbar			: std_logic := '0'; 

	constant period1 : time := 5 ns; --constant deff for clock
	constant period2 : time := 17 ns; --constant def for data simplicity.

begin
	-- Now to use a portmap to make sure the correct signals are synched across the files.
	Portmapping: dff_async port map (
		clk => clk,
		Data => Data,
		async_rst_n => async_rst_n,
		Q => Q,
		Qbar => Qbar 
	);
	clk <= not clk after period1; --clock generation 
	--Data <= not Data after period2; --Data generation in waveform form 
	async_rst_n <= '1', '0' after 20 ns; -- waveform generation of async reset.
	Data_Gen: process is -- to make the data more different.
  	begin
		Data <= '0';
		wait for 10 ns;
		Data <= '1';
		wait for 20 ns;
		Data <= '0';
		wait for 15 ns;
		Data <= '1';
		wait for 18 ns;
		Data <= '0';
		wait for 10 ns;   
  end process Data_Gen;
     
end architecture behave;