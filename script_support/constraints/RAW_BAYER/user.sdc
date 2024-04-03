#I2C clock 
set_clock_groups -name {clk_grp_2mhz} -asynchronous -group [ get_clocks { osc_rc2mhz } ]
# 150 MHz clock
set_clock_groups -name {clk_grp_apb3} -asynchronous -group [ get_clocks { CLOCKS_AND_RESETS_inst_0/PF_CCC_C0_0/PF_CCC_C0_0/pll_inst_0/OUT0 } ]
#Camera clock
set_clock_groups -name {clk_grp_camera} -asynchronous -group [ get_clocks { Video_Pipeline_0/IMX334_IF_TOP_0/PF_CCC_C1_0/PF_CCC_C1_0/pll_inst_0/OUT0 } ]
