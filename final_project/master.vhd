library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity master is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           adc_in : in STD_LOGIC_VECTOR(7 downto 0);
           adc_clk : out STD_LOGIC;
           leds : out  STD_LOGIC_VECTOR (7 downto 0);
           sine_out : out std_logic_vector(7 downto 0);
           rx : in  STD_LOGIC);
end master;

architecture Behavioral of master is

  component dcm
  port(
    CLK_IN1    : in  std_logic;
    clk_100mhz : out std_logic;
    clk_10mhz  : out std_logic
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

  signal sine_buffer : std_logic_vector(7 downto 0);
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

  signal adc_fifo_wr_en, adc_fifo_rd_en, adc_fifo_empty, adc_fifo_prog_full : std_logic := '0';
  signal adc_fifo_data_out : std_logic_vector(7 downto 0);

  COMPONENT adc_fifo
  PORT (
    rst : IN STD_LOGIC;
    wr_clk : IN STD_LOGIC;
    rd_clk : IN STD_LOGIC;
    din : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    wr_en : IN STD_LOGIC;
    rd_en : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    full : OUT STD_LOGIC;
    empty : OUT STD_LOGIC;
    prog_full : OUT STD_LOGIC
  );
  END COMPONENT;


  signal fft_rst, fft_start, fft_unload, fft_rfd, fft_busy, fft_edone, fft_done, fft_dv : std_logic := '0';
  signal fft_xn_re, fft_xk_re, fft_xk_im : std_logic_vector(7 downto 0) := (others => '0');
  signal fft_xk_index, fft_xn_index : std_logic_vector(8 downto 0) := (others => '0');
  signal fft_blk_exp : std_logic_vector(4 downto 0) := (others => '0');

  COMPONENT fft
  PORT (
    clk : IN STD_LOGIC;
    sclr : IN STD_LOGIC;
    start : IN STD_LOGIC;
    unload : IN STD_LOGIC;
    xn_re : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    xn_im : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    fwd_inv : IN STD_LOGIC;
    fwd_inv_we : IN STD_LOGIC;
    rfd : OUT STD_LOGIC;
    xn_index : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
    busy : OUT STD_LOGIC;
    edone : OUT STD_LOGIC;
    done : OUT STD_LOGIC;
    dv : OUT STD_LOGIC;
    xk_index : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
    xk_re : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    xk_im : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    blk_exp : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
  );
  END COMPONENT;

  signal fft_fifo_wr_en, fft_fifo_rd_en, fft_fifo_empty, fft_fifo_prog_full : std_logic := '0';
  signal fft_fifo_data_out, fft_fifo_data_in : std_logic_vector(15 downto 0);

  COMPONENT fft_fifo
  PORT (
    rst : IN STD_LOGIC;
    wr_clk : IN STD_LOGIC;
    rd_clk : IN STD_LOGIC;
    din : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    wr_en : IN STD_LOGIC;
    rd_en : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    full : OUT STD_LOGIC;
    empty : OUT STD_LOGIC;
    prog_full : OUT STD_LOGIC
  );
  END COMPONENT;

  type adc_state_t is (ADC_WRITING, ADC_WAITING);
  signal adc_state : adc_state_t := ADC_WAITING;

  type fft_state_t is (FFT_WAITING, FFT_READING, FFT_WAIT_FOR_EDONE, FFT_WAIT_FOR_DV, FFT_UNLOAD_DATA);
  signal fft_state : fft_state_t := FFT_WAITING;

  signal setup_delay : integer := 10;

begin

  leds <= fft_fifo_data_in(7 downto 0);
  adc_clk <= dds_clk;
  sine_out <= adc_fifo_data_out;

  fft_fifo_data_in <= fft_xk_re & fft_xk_im;
  fft_xn_re <= adc_fifo_data_out;
  process(dds_clk, rst)
  begin
    if(rst = '1') then
      setup_delay <= 10;
    elsif(rising_edge(dds_clk)) then
      if(setup_delay /= 0) then
        setup_delay <= setup_delay - 1;
      end if;
    end if;
  end process;

  process(dds_clk, rst)
  begin
    if(rst = '1') then
      adc_state <= ADC_WAITING;
    elsif(rising_edge(dds_clk)) then
      if(setup_delay = 0) then
        case adc_state is
          when ADC_WRITING =>
            adc_fifo_wr_en <= '1';
            if(adc_fifo_prog_full = '1') then
              adc_fifo_wr_en <= '0';
              adc_state <= ADC_WAITING;
            end if;
          when ADC_WAITING =>
            adc_fifo_wr_en <= '0';
            if(adc_fifo_empty = '1') then
              adc_state <= ADC_WRITING;
            end if;
        end case;
      end if;
    end if;
  end process;

  process(buffered_clk, rst)
  begin
    if(rst = '1') then
      fft_state <= FFT_WAITING;
      fft_start <= '0';
      fft_unload <= '0';
      adc_fifo_rd_en <= '0';
      fft_fifo_wr_en <= '0';
    elsif(rising_edge(buffered_clk)) then
      if(setup_delay = 0) then
        case fft_state is 
          when FFT_WAITING =>
            adc_fifo_rd_en <= '0';
            if(adc_fifo_prog_full = '1') then
              fft_state <= FFT_READING;
              fft_start <= '1';
            end if;
          when FFT_READING =>
            fft_start <= '0';
            adc_fifo_rd_en <= '1';
            if(adc_fifo_empty = '1') then
              fft_state <= FFT_WAIT_FOR_EDONE;
              adc_fifo_rd_en <= '0';
            end if;
          when FFT_WAIT_FOR_EDONE =>
            if(fft_edone = '1') then
              fft_state <= FFT_WAIT_FOR_DV;
              fft_unload <= '1';
            end if;
          when FFT_WAIT_FOR_DV =>
            if(fft_dv = '1') then
              fft_fifo_wr_en <= '1';
              fft_unload <= '0';
              fft_state <= FFT_UNLOAD_DATA;
            end if;
          when FFT_UNLOAD_DATA =>
            if(fft_dv = '0') then
              fft_unload <= '0';
              fft_fifo_wr_en <= '0';
              fft_state <= FFT_WAITING;
            end if;
        end case;
      end if;
    end if;
  end process;

  process(buffered_clk, rst)
  begin
    if(rst = '1') then
    
    elsif(rising_edge(clk)) then

    end if;
  end process;

  adc_fifo_inst : adc_fifo
  PORT MAP (
    rst => rst,
    wr_clk => dds_clk,
    rd_clk => buffered_clk,
    --din => adc_in,
    din => sine_buffer,
    wr_en => adc_fifo_wr_en,
    rd_en => adc_fifo_rd_en,
    dout => adc_fifo_data_out,
    full => open,
    empty => adc_fifo_empty,
    prog_full => adc_fifo_prog_full
  );

  dcm_inst : dcm port map (
    CLK_IN1 => clk,
    clk_100mhz => buffered_clk,
    clk_10mhz => dds_clk
  );

  Inst_test_signal_gen: test_signal_gen PORT MAP(
    clk => dds_clk,
    rst => rst,
    phase_inc => "00000000011111",
    sine_out => sine_buffer
  );

  Inst_uart_comms: uart_comms PORT MAP(
    clk => buffered_clk,
    rst => rst,
    rx => rx,
    leds => open,
    phase_inc => phase_inc
  );

  fft_instance : fft
  PORT MAP (
    clk => buffered_clk,
    sclr => fft_rst,
    start => fft_start,
    unload => fft_unload,
    xn_re => fft_xn_re,
    xn_im => "00000000",
    fwd_inv => '1',
    fwd_inv_we => '1',
    rfd => fft_rfd,
    xn_index => fft_xn_index,
    busy => fft_busy,
    edone => fft_edone,
    done => fft_done,
    dv => fft_dv,
    xk_index => fft_xk_index,
    xk_re => fft_xk_re,
    xk_im => fft_xk_im,
    blk_exp => fft_blk_exp
  );

  fft_fifo_inst : fft_fifo
  PORT MAP (
    rst => rst,
    wr_clk => buffered_clk,
    rd_clk => buffered_clk,
    din => fft_fifo_data_in,
    wr_en => fft_fifo_wr_en,
    rd_en => fft_fifo_rd_en,
    dout => fft_fifo_data_out,
    full => open,
    empty => fft_fifo_empty,
    prog_full => fft_fifo_prog_full
  );

end Behavioral;

