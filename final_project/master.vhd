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
           rx : in  STD_LOGIC;
					 hs : out STD_LOGIC;
					 vs : out STD_LOGIC;
	         green : out std_logic_vector(2 downto 0);
	         red : out std_logic_vector(2 downto 0);
	         blue : out std_logic_vector(1 downto 0);
           sw : in std_logic_vector(7 downto 0);
           antenna : out std_logic);
end master;

architecture Behavioral of master is

	signal vga_clk : std_logic := '0';
  component dcm
  port(
    CLK_IN1    : in  std_logic;
    clk_100mhz : out std_logic;
    clk_10mhz  : out std_logic;
		vga_25mhz  : out std_logic;
    clk_out4   : out std_logic
   );
  end component;

  signal adc_divider : std_logic_vector(23 downto 0) := (others => '0');
  signal fft_scaler : std_logic_vector(7 downto 0) := "01000000";
  COMPONENT uart_comms
  PORT(
    clk : IN std_logic;
    rst : IN std_logic;
    rx : IN std_logic;          
    leds : OUT std_logic_vector(7 downto 0);
    phase_inc : OUT std_logic_vector(13 downto 0);
    adc_divider : OUT std_logic_vector(23 downto 0);
    fft_scaler : OUT std_logic_vector(7 downto 0)
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
  signal dds_clk, buffered_clk, buffered_clk2 : std_logic := '0';

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
  signal fft_xn_re : std_logic_vector(7 downto 0) := (others => '0');
  signal fft_xk_index, fft_xn_index : std_logic_vector(8 downto 0) := (others => '0');
  signal fft_blk_exp : std_logic_vector(4 downto 0) := (others => '0');
  signal fft_xk_re, fft_xk_im : std_logic_vector(17 downto 0);
  signal fft_xk_re_selected, fft_xk_im_selected : std_logic_vector(7 downto 0);

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
    xk_re : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
    xk_im : OUT STD_LOGIC_VECTOR(17 DOWNTO 0)
  );
  END COMPONENT;

	signal mag_input_valid, mag_output_valid : std_logic := '0';
	signal mag_idx_in, mag_idx_out : std_logic_vector(8 downto 0) := (others => '0');
	signal mag_out, mag_re, mag_im : std_logic_vector(7 downto 0) := (others => '0');
	COMPONENT mag
	PORT(
		clk : IN std_logic;
		rst : IN std_logic;
		input_valid : IN std_logic;
		re : IN std_logic_vector(7 downto 0);
		im : IN std_logic_vector(7 downto 0);
		idx_in : IN std_logic_vector(8 downto 0);          
		idx_out : OUT std_logic_vector(8 downto 0);
		mag : OUT std_logic_vector(7 downto 0);
		output_valid : OUT std_logic
		);
	END COMPONENT;

	signal vga_ram_in_data, vga_ram_out_data : std_logic_vector(mag_out'range);
	signal vga_ram_in_addr, vga_ram_out_addr : std_logic_vector(mag_idx_in'range);
	signal vga_ram_in_we : std_logic_vector(0 downto 0) := (others => '0');
	COMPONENT VGA_RAM
  PORT (
    clka : IN STD_LOGIC;
    rsta : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    clkb : IN STD_LOGIC;
    web : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addrb : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
    dinb : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    doutb : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
  );
	END COMPONENT;


	signal vga_green_in : std_logic_vector(green'range);
	signal vga_red_in : std_logic_vector(red'range);
	signal vga_blue_in : std_logic_vector(blue'range);
	signal vga_x_pos, vga_y_pos : integer;
  signal vga_vs, last_vga_vs : std_logic;
	COMPONENT vga_configurable
	PORT(
		clk : IN std_logic;
		rst : IN std_logic;
		blue_in : IN std_logic_vector(1 downto 0);
		red_in : IN std_logic_vector(2 downto 0);
		green_in : IN std_logic_vector(2 downto 0);          
		hs : OUT std_logic;
		vs : OUT std_logic;
		green : OUT std_logic_vector(2 downto 0);
		red : OUT std_logic_vector(2 downto 0);
		blue : OUT std_logic_vector(1 downto 0);
		x_pos : OUT integer;
		y_pos : OUT integer
		);
	END COMPONENT;

  signal cic_in, cic_out : std_logic_vector(7 downto 0) := (others => '0');
  signal cic_nd, cic_rdy, cic_rfd, cic_clk : std_logic := '0';
  COMPONENT cic_compiler_v2_0
  PORT(
    din : IN std_logic_vector(7 downto 0);
    nd : IN std_logic;
    sclr : IN std_logic;
    clk : IN std_logic;          
    dout : OUT std_logic_vector(7 downto 0);
    rdy : OUT std_logic;
    rfd : OUT std_logic
    );
  END COMPONENT;

  component fm_dcm
port
 (-- Clock in ports
  CLK_IN1           : in     std_logic;
  -- Clock out ports
  CLK_OUT1          : out    std_logic
 );
end component;

  type adc_state_t is (ADC_WRITING, ADC_WAITING);
  signal adc_state : adc_state_t := ADC_WAITING;

  type fft_state_t is (FFT_WAITING, FFT_READING, FFT_WAIT_FOR_EDONE, FFT_WAIT_FOR_VSYNC, FFT_WAIT_FOR_DV, FFT_UNLOAD_DATA);
  signal fft_state : fft_state_t := FFT_WAITING;

  signal setup_delay : integer := 10;
  signal adc_clk_buff : std_logic := '0';
  signal adc_clk_counter : integer := 0;

  signal max : integer := 0;
  signal last_adc_divider : std_logic_vector(adc_divider'range) := (others => '0');

  signal clk320            : std_logic;
   signal shift_ctr         : unsigned (4 downto 0) := (others => '0');
   signal phase_accumulator : unsigned (31 downto 0) := (others => '0');
   signal beep_counter      : unsigned (19 downto 0):= (others => '0'); -- gives a 305Hz beep signal
   signal message           : std_logic_vector(33 downto 0) := "1111000011110000111100001111000011";
begin
  fft_xk_re_selected <= fft_xk_re(max downto max-7);
  fft_xk_im_selected <= fft_xk_im(max downto max-7);
  max <= to_integer(unsigned(sw)) + 7;
  leds <= adc_divider(15 downto 8);
  --leds <= "10"&adc_clk_buff&vga_vs&vga_ram_in_we&(vga_ram_in_we(0) and vga_vs)&mag_output_valid&mag_input_valid;
  adc_clk <= adc_clk_buff;
  sine_out <= adc_fifo_data_out;
  vs <= vga_vs;

  antenna <= std_logic(phase_accumulator(31));

  process(clk320)
   begin
      if rising_edge(clk320) then
         if beep_counter = x"00FFFF" then
            if shift_ctr = "00000" then
               message <= message(0) & message(33 downto 1);
            end if;
            shift_ctr <= shift_ctr + 1;
         end if;      
         
         -- The constants are calculated as (desired freq)/320Mhz*2^32
         if message(0) = '1' then
            if beep_counter(16) = '1' then
               phase_accumulator <= phase_accumulator + 1222387958; -- gives a 91075kHz signal               
            else
               phase_accumulator <= phase_accumulator + 1220374692; -- gives 90925kHz signal
            end if;
         else 
            phase_accumulator <= phase_accumulator + 1221381325; -- gives 91000kHz signal
         end if;
         
         beep_counter <= beep_counter+1;
      end if;
   end process;

  process(dds_clk, rst)
  begin
    if(rst = '1') then
      adc_clk_counter <= 0;
    elsif(rising_edge(dds_clk)) then
      last_adc_divider <= adc_divider;

      if(last_adc_divider /= adc_divider) then
        adc_clk_counter <= 0;
      else
        if(adc_clk_counter = to_integer(unsigned(adc_divider))) then
          adc_clk_buff <= not adc_clk_buff;
          adc_clk_counter <= 0;
        else
          adc_clk_counter <= adc_clk_counter + 1;
        end if;
      end if;
    end if;
  end process;

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
      mag_input_valid <= '0';
      last_vga_vs <= '0';
    elsif(rising_edge(buffered_clk)) then
      last_vga_vs <= vga_vs;
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
              fft_state <= FFT_WAIT_FOR_VSYNC;
            end if;
          when FFT_WAIT_FOR_VSYNC =>
            if(vga_vs = '0') then
              fft_state <= FFT_WAIT_FOR_DV;
              fft_unload <= '1';
            end if;
          when FFT_WAIT_FOR_DV =>
            if(fft_dv = '1') then
              mag_input_valid <= '1';
              fft_unload <= '0';
              fft_state <= FFT_UNLOAD_DATA;
            end if;
          when FFT_UNLOAD_DATA =>
            if(fft_dv = '0') then
              fft_unload <= '0';
              mag_input_valid <= '0';
              if(vga_vs = '1') then
                fft_state <= FFT_WAITING;
              end if;
            end if;
        end case;
      end if;
    end if;
  end process;

	process(vga_clk, rst)
    variable scaled : unsigned(15 downto 0) := (others => '0');
	begin
		if(rst = '1') then
			vga_blue_in <= (others => '0');
			vga_red_in <= (others => '0');
			vga_green_in <= (others => '0');
      scaled := (others => '0');
		elsif(rising_edge(vga_clk)) then
			vga_ram_out_addr <= std_logic_vector(to_unsigned(vga_x_pos + 1, fft_xk_index'length));

			if(vga_x_pos < 2 ** fft_xk_index'length and vga_y_pos < 2 ** fft_xk_im'length) then
        scaled := unsigned(vga_ram_out_data) * unsigned(fft_scaler);
				if(256 - to_integer(scaled(13 downto 6)) >= vga_y_pos) then
					vga_blue_in <= (others => '1');
				else
					vga_blue_in <= (others => '0');
				end if;
			else
				vga_blue_in <= (others => '0');
				vga_red_in <= (others => '0');
				vga_green_in <= (others => '0');
			end if;
		end if;
	end process;

  adc_fifo_inst : adc_fifo
  PORT MAP (
    rst => rst,
    wr_clk => adc_clk_buff,
    rd_clk => buffered_clk,
    din => adc_in,
    --din => sine_buffer,
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
    clk_10mhz => dds_clk,
		vga_25mhz => vga_clk,
    clk_out4 => buffered_clk2
  );

  Inst_test_signal_gen: test_signal_gen PORT MAP(
    clk => dds_clk,
    rst => rst,
    phase_inc => phase_inc,
    sine_out => sine_buffer
  );

  Inst_uart_comms: uart_comms PORT MAP(
    clk => buffered_clk,
    rst => rst,
    rx => rx,
    leds => open,
    phase_inc => phase_inc,
    adc_divider => adc_divider,
    fft_scaler => fft_scaler
  );

  fft_instance : fft
  PORT MAP (
    clk => buffered_clk,
    sclr => fft_rst,
    start => fft_start,
    unload => fft_unload,
    xn_re => adc_fifo_data_out,
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
    xk_im => fft_xk_im
 --   blk_exp => fft_blk_exp
  );

	Inst_mag: mag PORT MAP(
		clk => buffered_clk,
		rst => rst,
		input_valid => fft_dv,
		re => fft_xk_re_selected,
		im => fft_xk_im_selected,
		idx_in => fft_xk_index,
		idx_out => mag_idx_out,
		mag => mag_out,
		output_valid => mag_output_valid
	);

	your_instance_name : VGA_RAM
  PORT MAP (
    clka => buffered_clk,
    rsta => rst,
    wea => mag_output_valid&"",
    addra => mag_idx_out,
    dina => mag_out,
    douta => open,
    clkb => vga_clk,
    web => (others => '0'),
    addrb => vga_ram_out_addr,
    dinb => (others => '0'),
    doutb => vga_ram_out_data
  );

	Inst_vga_configurable: vga_configurable PORT MAP(
		clk => vga_clk,
		rst => rst,
		hs => hs,
		vs => vga_vs,
		green => green,
		red => red,
		blue => blue,
		x_pos => vga_x_pos,
		y_pos => vga_y_pos,
		blue_in => vga_blue_in,
		red_in => vga_red_in,
		green_in => vga_green_in
	);

  fm_dcm_mgr : fm_dcm
  port map
   (-- Clock in ports
    CLK_IN1 => buffered_clk2,
    -- Clock out ports
    CLK_OUT1 => clk320);

--  Inst_cic_compiler_v2_0: cic_compiler_v2_0 PORT MAP(
--    din => adc_in,
--    nd => '1',
--    sclr => rst,
--    clk => adc_clk_buff,
--    dout => cic_out,
--    rdy => cic_rdy,
--    rfd => cic_rfd
--  );

end Behavioral;

