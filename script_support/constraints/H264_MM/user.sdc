# 125MHz clock used in AXI interconnect, FIC1 and LPDDR memory access
set_clock_groups -name {clk_grp_fic1} -asynchronous -group [ get_clocks { CLOCKS_AND_RESETS_inst_0/PF_CCC_C0_0/PF_CCC_C0_0/pll_inst_0/OUT0 } ]
# I2C clock for camera data given to MSS block
set_clock_groups -name {clk_grp_i2c} -asynchronous -group [ get_clocks { osc_rc2mhz } ]
#cam clocks
set_clock_groups -name {clk_grp_cam_ccc_o0} -asynchronous -group [ get_clocks { Video_Pipeline_0/IMX334_IF_TOP_0/PF_CCC_C2_0/PF_CCC_C2_0/pll_inst_0/OUT0 } ]
set_clock_groups -name {clk_grp_cam_ccc_ydiv0} -asynchronous -group [ get_clocks {Video_Pipeline_0/IMX334_IF_TOP_0/PF_IOD_GENERIC_RX_C0_0/PF_IOD_0/PF_CLK_DIV_FIFO/I_CDD/Y_DIV } ]
