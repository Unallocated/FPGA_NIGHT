library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity uart_comms is
  port( clk  : in  std_logic;
        rst  : in  std_logic;
        rx   : in  std_logic;
        leds : out std_logic_vector(7 downto 0);
        phase_inc : out std_logic_vector(13 downto 0));
end uart_comms;

architecture Behavioral of uart_comms is

  signal rx_empty, rx_rd_en : std_logic := '0';
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

  type reading_state_t is (WAIT_FOR_DATA, STALL, DATA_VALID);
  signal reading_state : reading_state_t := WAIT_FOR_DATA;

  type frame_state_t is (PREAMBLE, LENGTH, PAYLOAD, FCS);
  signal frame_state : frame_state_t := PREAMBLE;

  subtype byte is std_logic_vector(7 downto 0);
  type frame_t is array(0 to 31) of byte;
  signal current_frame : frame_t := (others => (others => '0'));
  signal last_frame : frame_t := (others => (others => '0'));

  signal current_frame_pos : integer range 0 to 31 := 0;
  signal current_frame_checksum : std_logic_vector(7 downto 0) := (others => '0');

  signal last_frame_valid : std_logic := '0';
begin

  process(clk, rst)
    variable prev_last_frame_valid : std_logic := '0';
  begin
    if(rst = '1') then
      phase_inc <= (others => '0');
      leds <= (others => '0');
    elsif(rising_edge(clk)) then
      if(prev_last_frame_valid = '0' and last_frame_valid = '1') then
        case last_frame(3) is
          when x"00" =>
            leds <= last_frame(4);
          when x"01" =>
            phase_inc <= last_frame(5)(5 downto 0) & last_frame(4);
          when others =>
            null;
        end case;
      end if;

      prev_last_frame_valid := last_frame_valid;
    end if;
  end process;

  process(clk, rst)
  begin
    if(rst = '1') then
      reading_state <= WAIT_FOR_DATA;
      rx_rd_en <= '0';
      frame_state <= PREAMBLE;
      current_frame_pos <= 0;
      current_frame <= (others => (others => '0'));
      last_frame <= (others => (others => '0'));
      current_frame_checksum <= (others => '0');
      last_frame_valid <= '0';
    elsif(rising_edge(clk)) then
      last_frame_valid <= '0';

      case reading_state is
        when WAIT_FOR_DATA =>
          if(rx_empty = '0') then
            rx_rd_en <= '1';
            reading_state <= STALL;
          end if;
        when STALL =>
          rx_rd_en <= '0';
          reading_state <= DATA_VALID;
        when DATA_VALID =>
          reading_state <= WAIT_FOR_DATA;
          current_frame_pos <= current_frame_pos + 1;
          current_frame(current_frame_pos) <= rx_data;

          case frame_state is
            when PREAMBLE =>
              if(rx_data /= x"55") then
                current_frame_pos <= 0;
              else
                if(current_frame_pos = 1) then
                  frame_state <= LENGTH;
                end if;
              end if;
            when LENGTH =>
              if(unsigned(rx_data) > 28) then
                current_frame_pos <= 0;
                frame_state <= PREAMBLE;
              else
                frame_state <= PAYLOAD;
                current_frame_checksum <= rx_data;
              end if;
            when PAYLOAD =>
              current_frame_checksum <= current_frame_checksum xor rx_data;
              if(unsigned(current_frame(2)) + 2 = current_frame_pos) then
                frame_state <= FCS;
              end if;
            when FCS =>
              current_frame_pos <= 0;
              frame_state <= PREAMBLE;

              if(rx_data = current_frame_checksum) then
                last_frame <= current_frame;
                last_frame_valid <= '1';
              end if;
          end case;
      end case;
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
    rd_en => rx_rd_en
  );

end Behavioral;
