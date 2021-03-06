library ieee;
use ieee.std_logic_1164.all; -- use of std_logic

entity half_adder is
	port( 		
		a		: in std_logic; 
		b		: in std_logic;
		-- space between inputs and outputs.
		sum		: out std_logic;
		cout	: out std_logic 
		);
end half_adder;

architecture behave of half_adder is

component and_gate is--here you declare your components
	port( 
		inAnd1 : in std_logic;     -- AND gate input
		inAnd2 : in std_logic;     -- AND gate input
		-- In between in and outputs
        outAnd : out std_logic    -- AND gate output
		);
end component and_gate;

component xor_gate is
	port( 
		inXOR1 : in std_logic;     -- XOR gate input
		inXOR2 : in std_logic;     -- XOR gate input
		-- In between in and outputs
        outXOR : out std_logic    -- XOR gate output
		);
end component xor_gate;

begin
ANDG: and_gate port map (
						inAnd1=>a,
						inAnd2=>b,
						outAnd=>cout
						);
XORG: xor_gate port map (
						inXOR1=>a,
						inXOR2=>b,
						outXOR=>sum
						);
end architecture behave;