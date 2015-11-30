-- William Fan
-- 02/14/2011
-- General Multiplexer RTL

package gm_datatypes is
	type mux_input is array (natural range <>,natural range <>) of bit;
end package gm_datatypes;

library ieee;
use work.gm_datatypes.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity genmux is
	generic (N: natural := 16;
			 M: natural := 6);
	port (x: in mux_input(M-1 downto 0,N-1 downto 0);
		  sel: in integer range M-1 to 0;
		  y: out bit_vector(N-1 downto 0));
end entity;

architecture gm of genmux is
	signal z: bit_vector(N-1 downto 0);
	begin
		gen: for i in 0 to N-1 generate
			z(i) <= x(sel,i);
		end generate;
		y <= z;
end architecture;
