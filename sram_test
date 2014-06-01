library IEEE;

use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sram_test is
	GENERIC(
		clock_speed : integer := 100_000_000;
		clock_divider : integer := 100;
		addr_width : integer := 5;
		data_width : integer := 8;
		number_of_leds : integer := 8
	);
	PORT(
		clk : in std_logic;
		rst : in std_logic;
		ce : out std_logic;
		we : out std_logic;
		oe : out std_logic;
		data : inout std_logic_vector(data_width-1 downto 0);
		addr : out std_logic_vector(addr_width-1 downto 0);
		leds : out std_logic_vector(number_of_leds-1 downto 0)
	);
end sram_test;

architecture behavorial of sram_test is 

	type master_state_t is (WRITE_ALL, READ_ALL, ERRORED);
	type sub_state_t is (SET_SIGS, EN, CLOCK, DISABLE);

	signal master_state : master_state_t := WRITE_ALL;
	signal sub_state : sub_state_t := SET_SIGS;

	signal addr_val : unsigned(addr'range) := (others => '0');
	signal data_val : unsigned(data'range) := (others => '0');
	signal leds_buffer : std_logic_vector(leds'range) := (others => '0');

	type ram_t is array(0 to (2 ** addr'length) - 1) of std_logic_vector(data'range);
	signal ram : ram_t := (others => (others => '0'));

	signal slow_clk : std_logic := '0';

	constant is_test : std_logic := '0';
begin

	leds <= leds_buffer;

	process(clk, rst)
		constant max : unsigned(31 downto 0) := to_unsigned(clock_speed / clock_divider, 32);
		variable counter : unsigned(max'range) := (others => '0');
	begin
		if(rst = '1') then
			counter := (others => '0');
		elsif(rising_edge(clk)) then
			if(is_test = '1') then
				slow_clk <= not slow_clk;
			else
				if(counter = max) then
					slow_clk <= not slow_clk;
					counter := (others => '0');
				else
					counter := counter + 1;
				end if;
			end if;
		end if;
	end process;

	process(slow_clk, rst)
	begin
		if(rst = '1') then
			oe <= '1';
			ce <= '1';
			we <= '1';
			data <= (others => 'Z');
			addr <= (others => '0');
			master_state <= WRITE_ALL;
			sub_state <= SET_SIGS;
			addr_val <= (others => '0');
			data_val <= (others => '0');
			leds_buffer <= (others => '0');
		elsif(rising_edge(slow_clk)) then
			case master_state is
			when WRITE_ALL =>
				leds_buffer <= "10" & (leds'high-2 downto 0 => '0');
				case sub_state is
				when SET_SIGS =>
					addr <= std_logic_vector(addr_val);
					data <= std_logic_vector(data_val);
					we <= '1';
					oe <= '1';

					sub_state <= EN;
				when EN =>
					ce <= '0';
					sub_state <= CLOCK;
				when CLOCK =>
					we <= '0';
					sub_state <= DISABLE;
				when DISABLE =>
					ce <= '1';
					we <= '1';
					
					ram(to_integer(addr_val)) <= std_logic_vector(data_val);

					if(addr_val = (2 ** addr_val'length) - 1) then
						master_state <= READ_ALL;
						addr_val <= (others => '0');
						data_val <= (others => '0');
					else
						addr_val <= addr_val + 1;
						data_val <= data_val + 1;
					end if;

					sub_state <= SET_SIGS;
				end case;
			when READ_ALL =>
				leds_buffer <= "01" & (leds'high-2 downto 0 => '0');
				case sub_state is
				when SET_SIGS =>
					addr <= std_logic_vector(addr_val);
					data <= (others => 'Z');
					we <= '1';
					oe <= '1';

					sub_state <= EN;
				when EN =>
					ce <= '0';
					sub_state <= CLOCK;
				when CLOCK =>
					oe <= '0';
					sub_state <= DISABLE;
				when DISABLE =>
					ce <= '1';
					oe <= '1';



					if(addr_val = (2 ** addr_val'length) - 1) then
						master_state <= WRITE_ALL;
						addr_val <= (others => '0');
						data_val <= (others => '0');
					else
						addr_val <= addr_val + 1;
						data_val <= data_val + 1;
					end if;

					if(ram(to_integer(addr_val)) /= data) then
						master_state <= ERRORED;
						leds_buffer <= (others => '0');
					end if;

					sub_state <= SET_SIGS;
				end case;
			when ERRORED =>
				leds_buffer <= not leds_buffer;
			
			end case;

		end if;
	end process;




end architecture;
