library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity master is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           leds : out  STD_LOGIC_VECTOR (7 downto 0);
           sine_out : out std_logic_vector(7 downto 0);
           rx : in  STD_LOGIC);
end master;

architecture Behavioral of master is

  component dcm
  port
   (-- Clock in ports
    CLK_IN1           : in     std_logic;
    -- Clock out ports
    clk_100mhz          : out    std_logic;
    clk_10mhz          : out    std_logic
   );
  end component;

  COMPONENT uart_comms
  PORT(
    clk : IN std_logic;
    rst : IN std_logic;
    rx : IN std_logic;          
    leds : OUT std_logic_vector(7 downto 0);
    phase_inc : OUT std_logic_vector(13 downto 0)
    );
  END COMPONENT;

  COMPONENT test_signal_gen
  PORT(
    clk : IN std_logic;
    rst : IN std_logic;
    phase_inc : IN std_logic_vector(13 downto 0);          
    sine_out : OUT std_logic_vector(7 downto 0)
    );
  END COMPONENT;

  signal phase_inc : std_logic_vector(13 downto 0) := (others => '0');
  signal dds_clk, buffered_clk : std_logic := '0';

begin

  leds <= phase_inc(7 downto 0);

  dcm_inst : dcm
  port map
   (-- Clock in ports
    CLK_IN1 => clk,
    -- Clock out ports
    clk_100mhz => buffered_clk,
    clk_10mhz => dds_clk);


  Inst_test_signal_gen: test_signal_gen PORT MAP(
    clk => dds_clk,
    rst => rst,
    phase_inc => phase_inc,
    sine_out => sine_out
  );

  Inst_uart_comms: uart_comms PORT MAP(
    clk => buffered_clk,
    rst => rst,
    rx => rx,
    leds => open,
    phase_inc => phase_inc
  );

end Behavioral;

