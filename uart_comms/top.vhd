library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity top is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           tx : out  STD_LOGIC;
           rx : in  STD_LOGIC;
           leds : out  STD_LOGIC_VECTOR (7 downto 0));
end top;

architecture Behavioral of top is

  signal adc_clk_counter, adc_clk_counter_max : unsigned(31 downto 0) := (others => '0');  
  signal adc_clk : std_logic := '0';

  COMPONENT serial_master_fifo
	PORT(
		ser_clk : IN std_logic;
		rst : IN std_logic;
		rx : IN std_logic;
		data_in : IN std_logic_vector(7 downto 0);
		rd_clk : IN std_logic;
		rd_en : IN std_logic;
		wr_clk : IN std_logic;
		wr_en : IN std_logic;          
		tx : OUT std_logic;
		rx_full : OUT std_logic;
		tx_full : OUT std_logic;
		rx_empty : OUT std_logic;
		tx_empty : OUT std_logic;
		data_out : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

  signal data_in, data_out : std_logic_vector(7 downto 0);
  signal wr_en, rd_en, rx_empty, tx_full : std_logic := '0';

  COMPONENT sine_gen
  PORT (
    ce : IN STD_LOGIC;
    clk : IN STD_LOGIC;
    sclr : IN STD_LOGIC;
    we : IN STD_LOGIC;
    data : IN STD_LOGIC_VECTOR(16 DOWNTO 0);
    sine : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
  );
  END COMPONENT;

  signal sine_gen_data : std_logic_vector(16 downto 0) := ("00000000000001111");
  signal sine_gen_we : std_logic := '0';
  signal sine_gen_out : std_logic_vector(7 downto 0) := (others => '0');
  
  type serial_update_t is (IDLE, PROCESSING);
  signal serial_update_state : serial_update_t := IDLE;

  signal delay_counter : unsigned(31 downto 0) := (others => '0');
  signal command_index : unsigned(7 downto 0) := (others => '0');

  type command_t is record
    length : unsigned(7 downto 0);
  end record command_t;

  type commands_t is array(natural range <>) of command_t;
  constant commands : commands_t := (
    (length => x"04"),
    (length => x"08")
  );

begin

  Inst_serial_master_fifo: serial_master_fifo PORT MAP(
		ser_clk => clk,
		rst => rst,
		rx => rx,
		tx => tx,
		rx_full => open,
		tx_full => tx_full,
		rx_empty => rx_empty,
		tx_empty => open,
		data_in => data_in,
		data_out => data_out,
		rd_clk => clk,
		rd_en => rd_en,
		wr_clk => clk,
		wr_en => wr_en
	);

  dummy_adc : sine_gen
  PORT MAP (
    ce => '1',
    clk => adc_clk,
    sclr => rst,
    we => sine_gen_we,
    data => sine_gen_data,
    sine => sine_gen_out
  );

  process(clk, rst)
  begin
    if(rst = '1') then
      adc_clk_counter <= (others => '0');
    elsif(rising_edge(clk)) then
      adc_clk_counter <= adc_clk_counter + 1;
      
      if(adc_clk_counter = adc_clk_counter_max) then
        adc_clk_counter <= (others => '0');
        adc_clk <= not adc_clk;
      end if;
    end if;
  end process;

  process(clk, rst)
  begin
    if(rst = '1') then

    elsif(rising_edge(clk)) then
      rd_en <= '0';

      case serial_update_state is
        when IDLE =>
          if(rd_en = '1') then

            serial_update_state <= PROCESSING;
          else
            if(rx_empty = '1') then
              rd_en <= '1'
            end if;
          end if;
        others =>
          if(rd_en = '0') then
            if(

    end if;
  end process;

end Behavioral;

