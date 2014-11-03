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

  type data_type_t is record
    len : integer range 0 to max_data_length-1;
  end record data_type_t;

  type types_t is array(natural range <>) of data_type_t;
  constant types : types_t := (
    (len => 0), -- leds off
    (len => 0), -- leds flash
    (len => 1) -- display on leds
  );

  signal buff : std_logic_vector((8 * max_data_length)-1 downto 0);
  signal pos : integer range 0 to max_data_length - 1 := 0;
begin

  process(clk, rst)
  begin
    if(rst = '1') then
      pos <= 0;
    elsif(rising_edge(clk)) then
      if(pos > 6 and buff(1 downto 0) = x"5555" and buff(pos downto pos-1) = x"aaaa") then
        if(unsigned(buff(2)) /= to_unsigned(pos + 4, 8)) then
          pos <= 0;
        end if;
      else

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
