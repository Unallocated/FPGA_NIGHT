LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY rx2_tb IS
END rx2_tb;

ARCHITECTURE behavior OF rx2_tb IS 

  COMPONENT rx2
  PORT(
      clk : IN  std_logic;
  rst : IN  std_logic;
  rx : IN  std_logic;
  leds : OUT  std_logic_vector(7 downto 0)
  );
  END COMPONENT;


  --Inputs
  signal clk : std_logic := '0';
  signal rst : std_logic := '0';
  signal rx : std_logic := '0';

  --Outputs
  signal leds : std_logic_vector(7 downto 0);

  -- Clock period definitions
  constant clk_period : time := 10 ns;


  procedure write_serial(data : std_logic_vector(7 downto 0); signal rx : out std_logic) is
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
  end write_serial;

BEGIN

-- Instantiate the Unit Under Test (UUT)
  uut: rx2 PORT MAP (
      clk => clk,
      rst => rst,
      rx => rx,
      leds => leds
      );

  -- Clock process definitions
  clk_process :process
  begin
    clk <= '0';
    wait for clk_period/2;
    clk <= '1';
    wait for clk_period/2;
  end process;


  -- Stimulus process
  stim_proc: process
  begin		
    -- hold reset state for 100 ns.
    wait for 100 ns;	

    wait for clk_period*10;

    -- insert stimulus here 

    write_serial(x"55", rx);
    write_serial(x"55", rx);
    write_serial(x"02", rx);
    write_serial(x"01", rx);
    write_serial(x"ff", rx);
    write_serial(x"fc", rx);

    wait for 1 us;
    assert leds = (x"02" xor x"01" xor x"ff") severity failure;

    write_serial(x"55", rx);
    write_serial(x"55", rx);
    write_serial(x"02", rx);
    write_serial(x"ff", rx);
    write_serial(x"77", rx);
    write_serial(x"02" xor x"ff" xor x"77", rx);

    wait for 1 us;
    assert leds = (x"02" xor x"ff" xor x"77") severity failure;

    write_serial(x"55", rx);
    write_serial(x"55", rx);
    write_serial(x"1b", rx);

    write_serial(x"55", rx);
    write_serial(x"55", rx);
    write_serial(x"55", rx);
    write_serial(x"55", rx);
    write_serial(x"55", rx);
    write_serial(x"55", rx);
    write_serial(x"55", rx);
    write_serial(x"55", rx);
    write_serial(x"55", rx);
    write_serial(x"55", rx);
    write_serial(x"55", rx);
    write_serial(x"55", rx);
    write_serial(x"55", rx);
    write_serial(x"55", rx);
    write_serial(x"55", rx);
    write_serial(x"55", rx);
    write_serial(x"55", rx);
    write_serial(x"55", rx);
    write_serial(x"55", rx);
    write_serial(x"55", rx);
    write_serial(x"55", rx);
    write_serial(x"55", rx);
    write_serial(x"55", rx);
    write_serial(x"55", rx);
    write_serial(x"55", rx);
    write_serial(x"55", rx);
    write_serial(x"55", rx);

    write_serial(x"4e", rx);


    wait;
  end process;

  END;
