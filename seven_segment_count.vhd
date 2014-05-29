library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity seven_segment_count is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           segments : out  STD_LOGIC_VECTOR(7 downto 0);
           commons : out  STD_LOGIC_VECTOR (3 downto 0));
end seven_segment_count;

architecture Behavioral of seven_segment_count is

	type mem_t is array (0 to 15) of std_logic_vector(segments'range);
	constant mem : mem_t := (
		 "11111100", -- 0
		 "01100000", -- 1
		 "11011010", -- 2
		 "11110010", -- 3
		 "01100110", -- 4
		 "10110110", -- 5
		 "10111110", -- 6
		 "11100000", -- 7
		 "11111110", -- 8
		 "11100110", -- 9
		 "11101110", -- A
		 "00111110", -- B
		 "10011100", -- C
		 "01111010", -- D
		 "10011110", -- E
		 "10001110");-- F
			
	signal pos : unsigned(3 downto 0) := (others => '0');

	constant clock_divider_max : unsigned(natural range <>) := to_unsigned(100_000_000 / 1, 32);
	signal clock_divider_counter : unsigned(clock_divider_max'range) := (others => '0');

begin
	segments <= not mem(to_integer(pos));
	commons <= "0000";

	clock_divider_process : process(clk, rst)
	begin
		if(rst = '1') then
			pos <= (others => '0');
			clock_divider_counter <= (others => '0');
		elsif(rising_edge(clk)) then
			if(clock_divider_counter = clock_divider_max) then
				clock_divider_counter <= (others => '0');
				pos <= pos + 1;
			else
				clock_divider_counter <= clock_divider_counter + 1;
			end if;
		end if;
	end process;
	

end Behavioral;
