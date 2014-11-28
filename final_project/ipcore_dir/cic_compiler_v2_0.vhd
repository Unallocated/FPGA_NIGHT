--------------------------------------------------------------------------------
--     (c) Copyright 1995 - 2010 Xilinx, Inc. All rights reserved.            --
--                                                                            --
--     This file contains confidential and proprietary information            --
--     of Xilinx, Inc. and is protected under U.S. and                        --
--     international copyright and other intellectual property                --
--     laws.                                                                  --
--                                                                            --
--     DISCLAIMER                                                             --
--     This disclaimer is not a license and does not grant any                --
--     rights to the materials distributed herewith. Except as                --
--     otherwise provided in a valid license issued to you by                 --
--     Xilinx, and to the maximum extent permitted by applicable              --
--     law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND                --
--     WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES            --
--     AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING              --
--     BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-                 --
--     INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and               --
--     (2) Xilinx shall not be liable (whether in contract or tort,           --
--     including negligence, or under any other theory of                     --
--     liability) for any loss or damage of any kind or nature                --
--     related to, arising under or in connection with these                  --
--     materials, including for any direct, or any indirect,                  --
--     special, incidental, or consequential loss or damage                   --
--     (including loss of data, profits, goodwill, or any type of             --
--     loss or damage suffered as a result of any action brought              --
--     by a third party) even if such damage or loss was                      --
--     reasonably foreseeable or Xilinx had been advised of the               --
--     possibility of the same.                                               --
--                                                                            --
--     CRITICAL APPLICATIONS                                                  --
--     Xilinx products are not designed or intended to be fail-               --
--     safe, or for use in any application requiring fail-safe                --
--     performance, such as life-support or safety devices or                 --
--     systems, Class III medical devices, nuclear facilities,                --
--     applications related to the deployment of airbags, or any              --
--     other applications that could lead to death, personal                  --
--     injury, or severe property or environmental damage                     --
--     (individually and collectively, "Critical                              --
--     Applications"). Customer assumes the sole risk and                     --
--     liability of any use of Xilinx products in Critical                    --
--     Applications, subject only to applicable laws and                      --
--     regulations governing limitations on product liability.                --
--                                                                            --
--     THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS               --
--     PART OF THIS FILE AT ALL TIMES.                                        --
--------------------------------------------------------------------------------

--  Generated from component ID: xilinx.com:ip:cic_compiler:2.0


-- You must compile the wrapper file cic_compiler_v2_0.vhd when simulating
-- the core, cic_compiler_v2_0. When compiling the wrapper file, be sure to
-- reference the XilinxCoreLib VHDL simulation library. For detailed
-- instructions, please refer to the "CORE Generator Help".

-- The synthesis directives "translate_off/translate_on" specified
-- below are supported by Xilinx, Mentor Graphics and Synplicity
-- synthesis tools. Ensure they are correct for your synthesis tool(s).

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-- synthesis translate_off
Library XilinxCoreLib;
-- synthesis translate_on
ENTITY cic_compiler_v2_0 IS
	port (
	din: in std_logic_vector(7 downto 0);
	nd: in std_logic;
	sclr: in std_logic;
	clk: in std_logic;
	dout: out std_logic_vector(7 downto 0);
	rdy: out std_logic;
	rfd: out std_logic);
END cic_compiler_v2_0;

ARCHITECTURE cic_compiler_v2_0_a OF cic_compiler_v2_0 IS
-- synthesis translate_off
component wrapped_cic_compiler_v2_0
	port (
	din: in std_logic_vector(7 downto 0);
	nd: in std_logic;
	sclr: in std_logic;
	clk: in std_logic;
	dout: out std_logic_vector(7 downto 0);
	rdy: out std_logic;
	rfd: out std_logic);
end component;

-- Configuration specification 
	for all : wrapped_cic_compiler_v2_0 use entity XilinxCoreLib.cic_compiler_v2_0(behavioral)
		generic map(
			c_num_stages => 3,
			c_num_channels => 1,
			c_has_rounding => 0,
			c_diff_delay => 1,
			c_input_width => 8,
			c_use_dsp => 0,
			c_filter_type => 1,
			c_sample_freq => 1,
			c_has_sclr => 1,
			c_has_nd => 1,
			c_rate_type => 0,
			c_min_rate => 40,
			c_use_streaming_interface => 1,
			c_has_ce => 0,
			c_family => "spartan6",
			c_clk_freq => 1,
			c_rate => 40,
			c_max_rate => 40,
			c_c6 => 0,
			c_c5 => 0,
			c_i6 => 0,
			c_c4 => 0,
			c_component_name => "cic_compiler_v2_0",
			c_i5 => 0,
			c_c3 => 10,
			c_i4 => 0,
			c_c2 => 11,
			c_i3 => 14,
			c_c1 => 12,
			c_xdevicefamily => "spartan6",
			c_i2 => 18,
			c_i1 => 23,
			c_output_width => 8);
-- synthesis translate_on
BEGIN
-- synthesis translate_off
U0 : wrapped_cic_compiler_v2_0
		port map (
			din => din,
			nd => nd,
			sclr => sclr,
			clk => clk,
			dout => dout,
			rdy => rdy,
			rfd => rfd);
-- synthesis translate_on

END cic_compiler_v2_0_a;

