library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity rx_idea is
  port ( clk : in std_logic;
         leds : out std_logic_vector(7 downto 0);
         rst : in std_logic;
         rx : in std_logic );
end rx_idea;

architecture behave of rx_idea is

  signal rx_data : std_logic_vector(7 downto 0);
  signal rx_empty, rx_rd_en : std_logic := '0';

  COMPONENT serial_rx_fifo
  PORT(
    clk : IN std_logic;
    rst : IN std_logic;
    rx : IN std_logic;
    rd_clk : IN std_logic;
    rd_en : IN std_logic;          
    data : OUT std_logic_vector(7 downto 0);
    full : OUT std_logic;
    empty : OUT std_logic
    );
  END COMPONENT;

  type state_t is (IDLE, PROCESSING);
  signal state : state_t := IDLE;

  constant max_data_length : integer := 32;
	constant preamble : std_logic_vector(15 downto 0) := x"5555";
	constant postamble : std_logic_vector(15 downto 0) := x"aaaa";
  type data_type_t is record
    len : integer range 0 to max_data_length-1;
  end record data_type_t;

  type types_t is array(natural range <>) of data_type_t;
  constant types : types_t := (
    (len => 0), -- leds off
    (len => 0), -- leds flash
    (len => 1) -- display on leds
  );

	type buffer_elements_t is array(0 to max_data_length-1) of std_logic_vector(7 downto 0);
  signal buff : buffer_elements_t;
  signal pos : integer range 0 to max_data_length - 1 := 0;
	signal leds_buffer : std_logic_vector(leds'range) := (others => '0');
	signal read_delay : integer range 0 to 2 := 0;
  signal data_xor : std_logic_vector(7 downto 0) := (others => '0');
begin

	leds <= leds_buffer;

  process(clk, rst)
  begin
    if(rst = '1') then
      pos <= 0;
    elsif(rising_edge(clk)) then
			rx_rd_en <= '0';
			if(pos >= 6 and buff(0) & buff(1) = preamble and buff(pos-1) & buff(pos-2) = postamble) then
				pos <= 0;
        case to_integer(unsigned(buff(3))) is
          when 0 =>
            leds_buffer <= (others => '0');
          when 1 =>
            leds_buffer <= (others => '1');
          when 2 =>
            leds_buffer <= "00001111";
          when 3 =>
            leds_buffer <= "11110000";
          when others =>
            leds_buffer <= "01010101";
        end case;
			else
				if(read_delay = 0) then
					if(rx_empty = '0') then
						rx_rd_en <= '1';
						read_delay <= 2;
					end if;
				else
					read_delay <= read_delay - 1;
					if(read_delay = 1) then
						buff(pos) <= rx_data;
						pos <= pos + 1;
					end if;
				end if;
      end if;
    end if;
  end process;

--  process(clk, rst)
--  begin
--    if(rst = '1') then
--      rx_rd_en <= '0';
--    elsif(rising_edge(clk)) then
--      rx_rd_en <= '0';
--      if(state = IDLE) then
--        if(rx_rd_en = '0') then
--          rx_rd_en <= '1';
--        else
--                   
--
--    end if;
--  end process;

  Inst_serial_rx_fifo: serial_rx_fifo PORT MAP(
    clk => clk,
    rst => rst,
    rx => rx,
    data => rx_data,
    full => open,
    empty => rx_empty,
    rd_clk => clk,
    rd_en => rx_rd_en
  );

end behave;
