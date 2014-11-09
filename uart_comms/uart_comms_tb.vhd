LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY uart_comms_tb IS
END uart_comms_tb;

ARCHITECTURE behavior OF uart_comms_tb IS 
  COMPONENT uart_comms
  PORT(
      clk : IN  std_logic;
      rst : IN  std_logic;
      rx : IN  std_logic;
      leds : OUT  std_logic_vector(7 downto 0)
      );
  END COMPONENT;

  signal clk : std_logic := '0';
  signal rst : std_logic := '0';
  signal rx : std_logic := '0';

  signal leds : std_logic_vector(7 downto 0);

  constant clk_period : time := 10 ns;

  procedure write_byte ( data : std_logic_vector(7 downto 0); signal rx : out std_logic) is
  begin
    rx <= '0';
    wait for 8.68 us;
    rx <= data(0);
    wait for 8.68 us;
    rx <= data(1);
    wait for 8.68 us;
    rx <= data(2);
    wait for 8.68 us;
    rx <= data(3);
    wait for 8.68 us;
    rx <= data(4);
    wait for 8.68 us;
    rx <= data(5);
    wait for 8.68 us;
    rx <= data(6);
    wait for 8.68 us;
    rx <= data(7);
    wait for 8.68 us;
    rx <= '1';
    wait for 8.68 us;
  end write_byte;
BEGIN
  uut: uart_comms PORT MAP (
      clk => clk,
      rst => rst,
      rx => rx,
      leds => leds
      );

  clk_process :process
  begin
    clk <= '0';
    wait for clk_period/2;
    clk <= '1';
    wait for clk_period/2;
  end process;


  stim_proc: process
  begin		
    wait for 100 ns;	
    wait for clk_period*10;

    write_byte(x"55", rx);
    write_byte(x"55", rx);
    write_byte(x"01", rx);
    write_byte(x"ff", rx);
    write_byte(x"fe", rx);
    
    wait;
  end process;
END;
