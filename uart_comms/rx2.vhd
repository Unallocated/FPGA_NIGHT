library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity rx2 is
  port( clk : in std_logic;
        rst : in std_logic;
        rx  : in std_logic;
        leds : out std_logic_vector(7 downto 0)
  );
end rx2;

architecture behave of rx2 is

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

  type gatherer_state_t is (WAIT_FOR_DATA, ENABLE_READ, STALL, PUSH_DATA);
  signal gatherer_state : gatherer_state_t := WAIT_FOR_DATA;

  signal stall_counter : integer range 4 downto 0 := 0;

  subtype byte is std_logic_vector(7 downto 0);
  type preamble_t is array (0 to 1) of byte;
  type payload_t is array (0 to 27) of byte;
  type frame_t is record
    preamble    : preamble_t;
    length      : integer range 0 to payload_t'high;
    payload     : payload_t;
    payload_pos : integer range 0 to payload_t'high;
    fcs         : byte;
  end record frame_t;

  signal frame : frame_t := (
    preamble    => (others => (others => '0')),
    length      => 0,
    payload     => (others => (others => '0')),
    payload_pos => 0,
    fcs         => (others => '0') 
  );

  signal last_frame : frame_t;
  signal frame_valid : std_logic := '0';

  procedure reset_frame (signal frame : out frame_t) is
  begin
    frame.preamble <= (others => (others => '0'));
    frame.length <= 0;
    frame.payload <= (others => (others => '0'));
    frame.payload_pos <= 0;
    frame.fcs <= (others => '0');
  end reset_frame;
  
  type frame_state_t is (PREAMBLE, LENGTH, PAYLOAD, FCS);
  signal frame_state : frame_state_t := PREAMBLE;

  signal last_frame_valid : std_logic := '0';
  
begin

  process(clk, rst)
  begin
    if(rst = '1') then
      leds <= (others => '0');
    elsif(rising_edge(clk)) then
      if(last_frame_valid = '0' and frame_valid = '1') then
        leds <= last_frame.payload(0);
      end if;

      last_frame_valid <= frame_valid;
    end if;
  end process;

  process(clk, rst)
  begin
    if(rst = '1') then
      gatherer_state <= WAIT_FOR_DATA;
      rd_en <= '0';
      stall_counter <= 0;
      reset_frame(frame);
      frame_valid <= '0';
    elsif(rising_edge(clk)) then
      case gatherer_state is
        when WAIT_FOR_DATA =>
          if(rx_empty = '0') then
            gatherer_state <= ENABLE_READ;
          end if;

        when ENABLE_READ =>
          rd_en <= '1';
          gatherer_state <= STALL;
          stall_counter <= 4;

        when STALL =>
          rd_en <= '0';
          stall_counter <= stall_counter - 1;
          if(stall_counter = 1) then
            gatherer_state <= PUSH_DATA;
          end if;
        when PUSH_DATA =>
          gatherer_state <= WAIT_FOR_DATA;
          case frame_state is
            when PREAMBLE =>
              frame_valid <= '0';
              if(rx_data /= x"55") then
                reset_frame(frame);
              else
                if(frame.preamble(1) = x"55") then
                  frame.preamble(0) <= x"55";
                  frame_state <= LENGTH;
                else
                  frame.preamble(1) <= x"55";
                end if;
              end if;
            
            when LENGTH =>
              if(unsigned(rx_data) > to_unsigned(payload_t'length, 8)) then
                reset_frame(frame);
                frame_state <= PREAMBLE;
              else
                frame.length <= to_integer(unsigned(rx_data));
                frame.fcs <= frame.fcs xor rx_data;
                frame_state <= PAYLOAD;
              end if;

            when PAYLOAD =>
              frame.payload(frame.payload_pos) <= rx_data;
              frame.fcs <= frame.fcs xor rx_data;
              if(frame.payload_pos = frame.length - 1) then
                frame_state <= FCS;
              else
                frame.payload_pos <= frame.payload_pos + 1;
              end if;

            when FCS =>
              if(frame.fcs = rx_data) then
                frame_valid <= '1';
                last_frame <= frame;
              end if;
              
              frame_state <= PREAMBLE;
              reset_frame(frame);
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
