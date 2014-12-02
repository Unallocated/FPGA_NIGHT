-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY mag_tb IS
  END mag_tb;

  ARCHITECTURE behavior OF mag_tb IS 

    COMPONENT mag
    PORT(
      clk : IN std_logic;
      rst : IN std_logic;
      input_valid : in std_logic;
      re : IN std_logic_vector(7 downto 0);
      im : IN std_logic_vector(7 downto 0);
      idx_out : OUT std_logic_vector(8 downto 0);          
      idx_in : IN std_logic_vector(8 downto 0);          
      mag : OUT std_logic_vector(7 downto 0);
      output_valid : OUT std_logic
      );
    END COMPONENT;
  
    signal clk, rst, input_valid, output_valid : std_logic := '0';
    signal im, re, magnitude : std_logic_vector(7 downto 0) := (others => '0');
    signal idx_in, idx_out : std_logic_vector(8 downto 0) := (others => '0');

    constant period : time := 10 ns;

  BEGIN

    process
    begin
      wait for period / 2;
      clk <= not clk;
    end process;

    Inst_mag: mag PORT MAP(
      clk => clk,
      rst => rst,
      re => re,
      im => im,
      idx_in => idx_in,
      idx_out => idx_out,
      mag => magnitude,
      input_valid => input_valid,
      output_valid => output_valid
    );
  
     tb : PROCESS
     BEGIN

        wait for 100 ns; -- wait until global set/reset completes

        rst <= '1';
        wait for period;
        rst <= '0';
        im <= "01111111";
        idx_in <= "000000001";
        input_valid <= '1';
        re <= "01111111";
        wait for period;
        im <= "10000000";
        re <= "10000000";
        idx_in <= "000000010";
        wait for period;
        input_valid <= '0';
        im <= "00000000";
        re <= "00000000";
        idx_in <= "000000000";

        wait until output_valid = '1';
        --assert magnitude = std_logic_vector(to_unsigned(179, 8));
        assert magnitude = "010110011";
        wait for period;
        --assert magnitude = std_logic_vector(to_unsigned(181, 8));
        assert magnitude = "010110011";
        wait; -- will wait forever
     END PROCESS tb;

  END;
