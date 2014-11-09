library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity rx is 
  port ( clk : in std_logic;
         rst : in std_logic;
         rx  : in std_logic;
         leds : out std_logic_vector(7 downto 0)
  );
end rx;

architecture behave of rx is

  signal rd_en, rx_empty : std_logic := '0';
  signal rx_data : std_logic_vector(7 downto 0);

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

  type buff_t is array(31 downto 0) of std_logic_vector(7 downto 0);
  signal buff : buff_t := (others => (others => '0'));
  signal buff_pos : integer range 0 to buff_t'high := 0;

  type read_state_t is (IDLE, PREAMBLE, LEN, GATHER_BYTES, CHECKSUM);
  signal read_state : read_state_t := IDLE;

  signal waiting_for_data_valid : std_logic := '0';
  signal delay_counter : integer range 0 to 2 := 0;
begin

  process(clk, rst)
  begin
    if(rst = '1') then
      buff_pos <= 0;
      read_state <= IDLE;
    elsif(rising_edge(clk)) then
      rd_en <= '0';
      if(waiting_for_data_valid = '1') then
        delay_counter <= delay_counter - 1;
        if(delay_counter = 0) then
          waiting_for_data_valid <= '0';
        end if;
      else
        case read_state is
          when IDLE =>
            if(rx_empty = '0')
              rd_en <= '1';
              waiting_for_data_valid <= '1';
              read_state <= PREAMBLE;
            end if;
          when PREAMBLE =>
            
    end if;
  end process;


  Inst_serial_rx_fifo: serial_rx_fifo PORT MAP(
    clk => clk,
    rst => rst,
    rx => rx, 
    data => rx_data,
    full => open,
    empty => rx_empty,
    rd_clk => clk,
    rd_en => rd_en
  );

end behave;
