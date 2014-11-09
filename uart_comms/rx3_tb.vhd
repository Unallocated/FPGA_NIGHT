LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY rx3_tb IS
END rx3_tb;
 
ARCHITECTURE behavior OF rx3_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT rx3
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
 
  constant baud_period : time := 1000 ns;

  procedure write_serial(data : std_logic_vector(7 downto 0); signal rx : out std_logic) is
  begin
    rx <= '0';
    wait for baud_period;
    rx <= data(0);
    wait for baud_period;
    rx <= data(1);
    wait for baud_period;
    rx <= data(2);
    wait for baud_period;
    rx <= data(3);
    wait for baud_period;
    rx <= data(4);
    wait for baud_period;
    rx <= data(5);
    wait for baud_period;
    rx <= data(6);
    wait for baud_period;
    rx <= data(7);
    wait for baud_period;
    rx <= '1';
    wait for baud_period;
  end write_serial;


BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: rx3 PORT MAP (
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
    write_serial(x"01", rx);
    write_serial(x"ff", rx);
    write_serial(x"fe", rx);
      wait;
   end process;

END;
