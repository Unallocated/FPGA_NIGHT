LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY rx_idea_tb IS
END rx_idea_tb;
 
ARCHITECTURE behavior OF rx_idea_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT rx_idea
    PORT(
         clk : IN  std_logic;
         leds : OUT  std_logic_vector(7 downto 0);
         rst : IN  std_logic;
         rx : IN  std_logic
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

		procedure send_byte(data : std_logic_vector(7 downto 0); signal rx : out std_logic) is
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
		end send_byte;
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: rx_idea PORT MAP (
          clk => clk,
          leds => leds,
          rst => rst,
          rx => rx
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

			send_byte(x"55", rx);
			send_byte(x"55", rx);
			send_byte(x"55", rx);
			send_byte(x"55", rx);
			send_byte(x"aa", rx);
			send_byte(x"aa", rx);
			
			send_byte(x"55", rx);

      wait;
   end process;

END;
