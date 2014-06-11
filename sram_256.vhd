library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SRAM_256 is
	 Port ( clk : in  STD_LOGIC;
			  rst : in  STD_LOGIC;
			  ce : out std_logic;
			  oe : out std_logic;
			  we : out std_logic;
			  data : inout std_logic_vector(7 downto 0);
			  addr : out std_logic_vector(14 downto 0);
			  leds : out std_logic_vector(7 downto 0));
end SRAM_256;

architecture Behavioral of SRAM_256 is
	type state_t is (IDLE, SET_ADDR, CE_OFF, WE_OFF, SET_DATA, WE_ON, CE_ON);
	signal state : state_t := IDLE;
	signal slow_clk : std_logic := '0';
	type operation_t is (WRITING, READING);
	signal operation : operation_t := WRITING;
begin

	process(clk, rst)
		variable cntr : unsigned(31 downto 0) := (others => '0');
	begin
		if(rst = '1') then
			cntr := (others => '0');
		elsif(rising_edge(clk)) then
			if(cntr = to_unsigned(100_000_000 / 1_000, 32)) then
				slow_clk <= not slow_clk;
				cntr := (others => '0');
			else
				cntr := cntr + 1;
			end if;
		end if;
	end process;

	--slow_clk <= clk;

	process(slow_clk, rst)
	begin
		if(rst = '1') then
			operation <= WRITING;
			state <= IDLE;
			ce <= '1';
			we <= '1';
			oe <= '1';
			data <= (others => 'Z');
			addr <= (others => '0');
			leds <= "00000000";
		elsif(rising_edge(slow_clk)) then
			case state is
			when IDLE =>
				data <= (others => 'Z');
				addr <= (others => '0');
				ce <= '1';
				we <= '1';
				oe <= '1';
				state <= SET_ADDR;
			when SET_ADDR =>
				addr <= "101010101010101";
				state <= CE_OFF;
			when CE_OFF =>
				ce <= '0';
				state <= WE_OFF;
			when WE_OFF =>
				if(operation = WRITING) then
					we <= '0';
				else
					oe <= '0';
				end if;
				state <= SET_DATA;
			when SET_DATA =>
				if(operation = WRITING) then
					data <= "01111110";
				else
					data <= (others => 'Z');
				end if;
				state <= WE_ON;
			when WE_ON =>
				if(operation = WRITING) then
					we <= '1';
				else
					if(data = "01111110") then
						leds <= "00000000";
					else
						leds <= "11111111";
					end if;
					oe <= '1';
				end if;
				state <= CE_ON;
			when CE_ON =>
				ce <= '1';
				if(operation = READING) then
					
					operation <= WRITING;
				else
					operation <= READING;
				end if;
				state <= IDLE;
			end case;
		end if;
	end process;



end Behavioral;

