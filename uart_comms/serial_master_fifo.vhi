
-- VHDL Instantiation Created from source file serial_master_fifo.vhd -- 18:57:12 11/02/2014
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

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

	Inst_serial_master_fifo: serial_master_fifo PORT MAP(
		ser_clk => ,
		rst => ,
		rx => ,
		tx => ,
		rx_full => ,
		tx_full => ,
		rx_empty => ,
		tx_empty => ,
		data_in => ,
		data_out => ,
		rd_clk => ,
		rd_en => ,
		wr_clk => ,
		wr_en => 
	);


