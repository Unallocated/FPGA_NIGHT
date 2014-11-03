
-- VHDL Instantiation Created from source file serial_rx_fifo.vhd -- 18:57:18 11/02/2014
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT serial_rx_fifo
	PORT(
		clk : IN std_logic;
		rst : IN std_logic;
		rx : IN std_logic;
		rd_clk : IN std_logic;
		rd_en : IN std_logic;          
		data : OUT std_logic_vector(7 downto 0);
		full : OUT std_logic;
		empty : OUT std_logic
		);
	END COMPONENT;

	Inst_serial_rx_fifo: serial_rx_fifo PORT MAP(
		clk => ,
		rst => ,
		rx => ,
		data => ,
		full => ,
		empty => ,
		rd_clk => ,
		rd_en => 
	);


