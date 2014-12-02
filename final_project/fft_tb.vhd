-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY fft_tb IS
  END fft_tb;

  ARCHITECTURE behavior OF fft_tb IS 

    COMPONENT test_signal_gen
    PORT(
      clk : IN std_logic;
      rst : IN std_logic;
      phase_inc : IN std_logic_vector(13 downto 0);
      sine_out : OUT std_logic_vector(7 downto 0)
      );
    END COMPONENT;
    signal rst : std_logic := '0';
    signal sine_buffer, sine_corrected : std_logic_vector(7 downto 0) := (others => '0');
    
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

  signal fft_rst, fft_start, fft_unload, fft_rfd, fft_busy, fft_edone, fft_done, fft_dv : std_logic := '0';
  signal fft_xn_re, fft_xk_re, fft_xk_im : std_logic_vector(7 downto 0) := (others => '0');
  signal fft_xk_index, fft_xn_index : std_logic_vector(8 downto 0) := (others => '0');
  signal fft_blk_exp : std_logic_vector(4 downto 0) := (others => '0');


  constant period : time := 10 ns;
  signal clk : std_logic := '0';

  BEGIN

    sine_corrected <= std_logic_vector(unsigned(sine_buffer) + 128);
    fft_xn_re <= sine_corrected;
    process
    begin
      wait for period / 2;
      clk <= not clk;
    end process;

    process
    begin
      wait for 100 ns;

      fft_start <= '1';
      wait for period;
      fft_start <= '0';
      wait until fft_done = '1';
      fft_unload <= '1';
      wait for period;
      wait until fft_dv = '0';
      fft_unload <= '0';
      wait;
    end process;


    Inst_test_signal_gen: test_signal_gen PORT MAP(
       clk => clk,
       rst => rst,
       phase_inc => "00000000000001",
       sine_out => sine_buffer
     );


    fft_instance : fft 
    PORT MAP (
      clk => clk,
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

  
  END;
