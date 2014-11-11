library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity test_signal_gen is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           phase_inc : in  STD_LOGIC_VECTOR (13 downto 0);
           sine_out : out  STD_LOGIC_VECTOR (7 downto 0));
end test_signal_gen;

architecture Behavioral of test_signal_gen is

  COMPONENT sine_generator
  PORT (
    clk : IN STD_LOGIC;
    we : IN STD_LOGIC;
    data : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
    sine : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
  );
  END COMPONENT;

  signal sine_buffer : std_logic_vector(7 downto 0) := (others => '0');
  signal we : std_logic := '0';

begin

  sine_out <= std_logic_vector(unsigned(sine_buffer) + 127);

  process(clk, rst)
    variable last_val : std_logic_vector(phase_inc'range) := (others => '0');
  begin
    if(rst = '1') then
      we <= '0';
    elsif(rising_edge(clk)) then
      we <= '0';
      if(last_val /= phase_inc) then
        we <= '1';
      end if;
		last_val := phase_inc;
    end if;
  end process;

  sine_gen_inst : sine_generator
  PORT MAP (
    clk => clk,
    we => we,
    data => phase_inc,
    sine => sine_buffer
  );

end Behavioral;

