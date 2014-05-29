library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alternating is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           leds : out  STD_LOGIC_VECTOR (7 downto 0));
end alternating;

architecture Behavioral of alternating is

	constant clock_divider_max : unsigned(natural range <>) := to_unsigned(100_000_000 / 1, 32);
	signal clock_divider_counter : unsigned(clock_divider_max'range) := (others => '0');

	signal leds_buffer : unsigned(leds'range) := "11110000";
begin

	clock_divider_process : process(clk, rst)
	begin
		if(rst = '1') then
			clock_divider_counter <= (others => '0');
			leds_buffer <= (others => '0');
		elsif(rising_edge(clk)) then
			if(clock_divider_counter = clock_divider_max) then
				clock_divider_counter <= (others => '0');
				leds_buffer <= not leds_buffer;
			else
				clock_divider_counter <= clock_divider_counter + 1;
			end if;
		end if;
	end process;

end Behavioral;
