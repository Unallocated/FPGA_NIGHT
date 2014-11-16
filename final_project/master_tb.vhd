LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY master_tb IS
END master_tb;
 
ARCHITECTURE behavior OF master_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT master
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         adc_in : IN  std_logic_vector(7 downto 0);
         adc_clk : OUT  std_logic;
         leds : OUT  std_logic_vector(7 downto 0);
         sine_out : OUT  std_logic_vector(7 downto 0);
         rx : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal adc_in : std_logic_vector(7 downto 0) := (others => '0');
   signal rx : std_logic := '0';

 	--Outputs
   signal adc_clk : std_logic;
   signal leds : std_logic_vector(7 downto 0);
   signal sine_out : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: master PORT MAP (
          clk => clk,
          rst => rst,
          adc_in => adc_in,
          adc_clk => adc_clk,
          leds => leds,
          sine_out => sine_out,
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

      wait;
   end process;

END;
