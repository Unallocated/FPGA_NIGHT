library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity rx3 is
  port( clk : in std_logic;
        rst : in std_logic;
        rx  : in std_logic;
        leds: out std_logic_vector(7 downto 0)
  );
end rx3;

architecture behave of rx3 is

  signal rd_en, rx_empty : std_logic := '0';
  signal rx_data : std_logic_vector(7 downto 0);

  COMPONENT serial_rx_fifo
  GENERIC( baud_rate : natural );
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

  type gatherer_state_t is (WAIT_FOR_DATA, STALL, DATA_VALID);
  signal gatherer_state : gatherer_state_t := WAIT_FOR_DATA;

  type frame_state_t is (PREAMBLE, LENGTH, PAYLOAD, FCS);
  signal frame_state : frame_state_t := PREAMBLE;

  signal fifo_delay_count : integer range 0 to 2 := 0;

  constant max_frame_bytes : integer := 32;
  type frame_t is array(0 to max_frame_bytes-1) of std_logic_vector(7 downto 0);
  signal current_frame : frame_t := (others => (others => '0'));
  signal current_frame_pos : integer range 0 to max_frame_bytes := 0;
  signal current_frame_fcs : std_logic_vector(7 downto 0) := (others => '0');
  
  signal last_frame : frame_t;
  signal last_frame_valid : std_logic := '0';
  signal last_frame_valid_prev_state : std_logic := '0';

begin

  process(clk, rst)
  begin
    if(rst = '1') then
      leds <= (others => '0');
    elsif(rising_edge(clk)) then
      last_frame_valid_prev_state <= last_frame_valid;
      if(last_frame_valid = '1' and last_frame_valid_prev_state = '0') then
        leds <= last_frame(3);
      end if;
    end if;
  end process;

  process(clk, rst)
  begin
    if(rst = '1') then
      frame_state <= PREAMBLE;
      gatherer_state <= WAIT_FOR_DATA;
      current_frame_fcs <= (others => '0');
    elsif(rising_edge(clk)) then
      rd_en <= '0';

      case gatherer_state is
        when WAIT_FOR_DATA =>
          if(rx_empty = '0') then
            rd_en <= '1';
            gatherer_state <= STALL;
            fifo_delay_count <= 2;
          end if;
        when STALL =>
          fifo_delay_count <= fifo_delay_count - 1;

          if(fifo_delay_count = 1) then
            gatherer_state <= DATA_VALID;
          end if;
        when DATA_VALID =>
          gatherer_state <= WAIT_FOR_DATA;
          current_frame_pos <= current_frame_pos + 1;

          case frame_state is
            when PREAMBLE =>
              if(rx_data /= x"55") then
                current_frame_pos <= 0;
              else
                current_frame(current_frame_pos) <= rx_data;
                if(current_frame_pos = 1) then
                  frame_state <= LENGTH;
                end if;
              end if;
            when LENGTH =>
              last_frame_valid <= '0';
              if(unsigned(rx_data) > to_unsigned(max_frame_bytes, 8)) then
                current_frame_pos <= 0;
                frame_state <= PREAMBLE;
              else
                current_frame(current_frame_pos) <= rx_data;
                current_frame_fcs <= rx_data;
                frame_state <= PAYLOAD;
              end if;
            when PAYLOAD =>
              current_frame(current_frame_pos) <= rx_data;
              current_frame_fcs <= current_frame_fcs xor rx_data;
              if(current_frame_pos = to_integer(unsigned(current_frame(2))) + 2) then
                frame_state <= FCS;
              end if;
            when FCS =>
              if(current_frame_fcs = rx_data) then
                last_frame <= current_frame;
                last_frame_valid <= '1';
              end if;

              frame_state <= PREAMBLE;
              current_frame_pos <= 0;

          end case;
      end case;
    end if;
  end process;

  Inst_serial_rx_fifo: serial_rx_fifo
  GENERIC MAP( baud_rate => 1_000_000 )
  PORT MAP(
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
