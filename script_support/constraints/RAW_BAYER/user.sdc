# 1MHz I2C clock for camera data given to MSS block
#set_clock_groups -name {clk_grp_i2c} -asynchronous -group [ get_clocks { CLOCKS_AND_RESETS_inst_0/PF_OSC_C0_0/PF_OSC_C0_0/I_OSC_2/CLK } ]

# 125 MHz clock used in AXI interconnect, FIC1 and LPDDR4
set_clock_groups -name {clk_grp_apb3} -asynchronous -group [ get_clocks { CLOCKS_AND_RESETS_inst_0/PF_CCC_C0_0/PF_CCC_C0_0/pll_inst_0/OUT0 } ]

# 50 MHz clock used for fabric ddr4 and FIC converter block
#set_clock_groups -name {clk_grp_fic0_fic1} -asynchronous -group [ get_clocks { CLOCKS_AND_RESETS_inst_0/PF_CCC_C1_0/PF_CCC_C1_0/pll_inst_0/OUT0 } ]
