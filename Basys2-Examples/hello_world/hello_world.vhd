-- We are using packages in the IEEE library
library IEEE;
-- Include all 'functions' in the STD_LOGIC_1164 package
use IEEE.STD_LOGIC_1164.ALL;
-- Include all of 'functions' in the NUMERIC_STD package
use IEEE.NUMERIC_STD.ALL;

-- Define what connections this module has to the outside world
entity hello_world is
    Port ( clk : in  STD_LOGIC; -- Almost all designs need a clock input
           rst : in  STD_LOGIC; -- Almost all designs should have a reset
           leds : out  STD_LOGIC_VECTOR (7 downto 0)); -- These are the LEDs we will output to.  There are 8 in total
end hello_world;

-- Here we start describing how the 'Behavioral' architecture works
architecture Behavioral of hello_world is
	-- This is where we tell ISE what extra modules we will be using
	-- (things like dividers, multipliers, FFT cores, clock managers, etc)
	-- as well as the signals that our design will have


	-- This will be used to increment the value you see on the LEDs
	signal counter : integer := 0;

-- Now the actual circuits are described
begin

	-- This is a combinatorial circuit.  The outputs of the first 8 bits
	-- of the counter signal are 'hard wired' to the leds vector outputs.
	-- As soon as counter is changed, the value on the leds vector will change
	-- as well.  There is no clock needed.  It just happens!
	-- You cannot assign an integer to an std_logic_vector directly.  They are
	-- not compatible types (think assigning a string to an integer).  To
	-- convert the types, we have to do two things
	--   1. Convert the integer to an unsigned number using 
	--      to_unsigned(<signal/variable>, <width_in_bits>).
	--   2. Convert the unsigned number to an std_logic_vector using
	--      std_logic_vector(<unsigned_number>);
	-- Both of these functions are provided in the IEEE.NUMERIC_STD package.
	leds <= std_logic_vector(to_unsigned(counter, 8));
	
	-- This is a sequential logic block.  It is called sequential because
	-- it has a sensitivity list (the '(cli, rst)' part) that defines when
	-- it will run.  This block of code will ONLY run when rst or clk change.
	process(clk, rst)
		-- Processes can have variables and types defined inside.  Think of these
		-- as local variables.  They are not able to be seen from outside the process.
		-- Notice that this is called a 'variable' and NOT a 'signal'!!  No signals
		-- can be defined in the process block.
		variable divider : integer := 0;
	begin
		-- Now the actual process logic
		
		-- There are several ways to check to see if the reset condition has been
		-- met.  This reset method ensures that the 'instant' the reset button is pressed,
		-- the reset will occur.  If the reset test were put in the 'else(rising_edge(clk)) then'
		-- portion, then there would be the possibility that pressing the reset button 
		-- very quickly might not actuall cause a reset since there may not have been a 
		-- rising edge change in clk.
		-- On the Mojo, pressing the reset button causes the sigal to be a zero.  That's just
		-- the way the Mojo works.  Some other boards do this a well.
		if(rst = '0') then
			counter <= 0;
			divider := 0;
			
		-- The rising_edge(<signal_name>) function checks to see if the signal provided
		-- changed from a '0' to a '1'.  If so, then the code inside the block is executed.
		elsif(rising_edge(clk)) then
			-- The only thing checked in this block is the value of divider.  If it is equal
			-- to 50 million (chosen because the clock speed is 50MHz) divided by 2.  If so,
			if(divider = 50000000/2) then
				-- The divider has reached 25 million.  That means that it's time to increment the
				-- signal 'counter'.  Sadly there is no <signal>++ notation in VHDL.  You have to 
				-- increment the way shown below.  It is very important to note that ALL signals are
				-- assigned with '<='!
				counter <= counter + 1;
				-- Since the divider reached the max value of 25 million, it's time to reset it to
				-- zero.  Notice that divider is assigned using ':='.  That is because all variables
				-- are assigned using ':=' instead of '<='!
				divider := 0;
			else
				-- The divider has not yet reached 25 million.  Simply increment the divider and
				-- wait for the next rising edge of clk (or for reset to happen)
				divider := divider + 1;
				
			-- End the 'if(divider = 50000000/2) then' if block
			end if;
		-- end the 'if(rst = '0') then' if block
		end if;
	-- End the process
	end process;

-- End the Behavioral architecture block
end Behavioral;

