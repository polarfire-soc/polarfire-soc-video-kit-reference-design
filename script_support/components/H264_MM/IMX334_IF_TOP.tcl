# Creating SmartDesign "IMX334_IF_TOP"
set sd_name {IMX334_IF_TOP}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {ACLK_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ARESETN_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ARST_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_arvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_awvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_bready} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_rready} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_wvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAM1_RX_CLK_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAM1_RX_CLK_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {INIT_DONE} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TRNG_RST_N} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_arready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_awready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_bvalid} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_rvalid} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_wready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MIPI_INTERRUPT_O} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PARALLEL_CLK_RESET_N} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PARALLEL_CLK} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {c1_frame_start_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {c1_line_valid_o} -port_direction {OUT}


# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_araddr} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_awaddr} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_wdata} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {CAM1_RXD_N} -port_direction {IN} -port_range {[3:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {CAM1_RXD} -port_direction {IN} -port_range {[3:0]} -port_is_pad {1}

sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_bresp} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_rdata} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_rresp} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {c1_data_out_o} -port_direction {OUT} -port_range {[7:0]}


# Create top level Bus interface Ports
sd_create_bif_port -sd_name ${sd_name} -port_name {AXI4L_MIPI} -port_bif_vlnv {AMBA:AMBA4:AXI4:r0p0_0} -port_bif_role {slave} -port_bif_mapping {\
"AWADDR:AXI4L_MIPI_awaddr" \
"AWVALID:AXI4L_MIPI_awvalid" \
"AWREADY:AXI4L_MIPI_awready" \
"WDATA:AXI4L_MIPI_wdata" \
"WVALID:AXI4L_MIPI_wvalid" \
"WREADY:AXI4L_MIPI_wready" \
"BRESP:AXI4L_MIPI_bresp" \
"BVALID:AXI4L_MIPI_bvalid" \
"BREADY:AXI4L_MIPI_bready" \
"ARADDR:AXI4L_MIPI_araddr" \
"ARVALID:AXI4L_MIPI_arvalid" \
"ARREADY:AXI4L_MIPI_arready" \
"RDATA:AXI4L_MIPI_rdata" \
"RRESP:AXI4L_MIPI_rresp" \
"RVALID:AXI4L_MIPI_rvalid" \
"RREADY:AXI4L_MIPI_rready" } 

# Add AND2_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {AND2} -instance_name {AND2_0}



# Add CORERESET_PF_C2_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CORERESET_PF_C2} -instance_name {CORERESET_PF_C2_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C2_0:BANK_x_VDDI_STATUS} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C2_0:BANK_y_VDDI_STATUS} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C2_0:SS_BUSY} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C2_0:FF_US_RESTORE} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C2_0:FPGA_POR_N} -value {VCC}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CORERESET_PF_C2_0:PLL_POWERDOWN_B}



# Add CORERESET_PF_C5_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CORERESET_PF_C5} -instance_name {CORERESET_PF_C5_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C5_0:BANK_x_VDDI_STATUS} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C5_0:BANK_y_VDDI_STATUS} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C5_0:SS_BUSY} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C5_0:FF_US_RESTORE} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORERESET_PF_C5_0:FPGA_POR_N} -value {VCC}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CORERESET_PF_C5_0:PLL_POWERDOWN_B}



# Add DFN1_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {DFN1} -instance_name {DFN1_0}



# Add DFN1_1 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {DFN1} -instance_name {DFN1_1}



# Add DFN1_2 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {DFN1} -instance_name {DFN1_2}



# Add mipi_ip_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {mipicsi2rxdecoderPF_C0} -instance_name {mipi_ip_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {mipi_ip_0:DATA_O} -pin_slices {[1:0]}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {mipi_ip_0:DATA_O[1:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {mipi_ip_0:DATA_O} -pin_slices {[9:2]}
sd_create_pin_group -sd_name ${sd_name} -group_name {Group} -instance_name {mipi_ip_0} -pin_names {"FRAME_VALID_O" "CRC_ERROR_O" "ECC_ERROR_O" "WORD_COUNT_O" "DATA_TYPE_O" "VIRTUAL_CHANNEL_O" "EBD_VALID_O" "LINE_END_O" "LINE_START_O" "FRAME_END_O" }
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {mipi_ip_0:FRAME_VALID_O}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {mipi_ip_0:FRAME_END_O}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {mipi_ip_0:LINE_START_O}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {mipi_ip_0:LINE_END_O}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {mipi_ip_0:ECC_ERROR_O}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {mipi_ip_0:CRC_ERROR_O}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {mipi_ip_0:EBD_VALID_O}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {mipi_ip_0:VIRTUAL_CHANNEL_O}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {mipi_ip_0:DATA_TYPE_O}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {mipi_ip_0:WORD_COUNT_O}



# Add PF_CCC_C2_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_CCC_C2} -instance_name {PF_CCC_C2_0}



# Add PF_IOD_GENERIC_RX_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CAM_IOD_TIP_TOP} -instance_name {PF_IOD_GENERIC_RX_C0_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {PF_IOD_GENERIC_RX_C0_0:HS_IO_CLK_PAUSE} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {PF_IOD_GENERIC_RX_C0_0:HS_SEL} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {PF_IOD_GENERIC_RX_C0_0:RESTART_TRNG} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {PF_IOD_GENERIC_RX_C0_0:SKIP_TRNG} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_IOD_GENERIC_RX_C0_0:CLK_TRAIN_DONE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_IOD_GENERIC_RX_C0_0:CLK_TRAIN_ERROR}



# Add scalar net connections
sd_create_scalar_net -sd_name ${sd_name} -net_name {DFN1_2_Q}
sd_connect_net_to_pins -sd_name ${sd_name} -net_name {DFN1_2_Q} -pin_names {"CORERESET_PF_C2_0:EXT_RST_N" "CORERESET_PF_C5_0:EXT_RST_N" "DFN1_2:Q" "mipi_ip_0:TRAINING_DONE_I" }

sd_connect_pins -sd_name ${sd_name} -pin_names {"ACLK_I" "mipi_ip_0:ACLK_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:A" "DFN1_0:Q" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:B" "CORERESET_PF_C2_0:PLL_LOCK" "CORERESET_PF_C5_0:PLL_LOCK" "DFN1_1:Q" "PF_IOD_GENERIC_RX_C0_0:PLL_LOCK" "mipi_ip_0:CAM_PLL_LOCK_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:Y" "PF_IOD_GENERIC_RX_C0_0:TRAINING_RESETN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ARESETN_I" "mipi_ip_0:ARESETN_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ARST_N" "PF_IOD_GENERIC_RX_C0_0:ARST_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAM1_RX_CLK_N" "PF_IOD_GENERIC_RX_C0_0:RX_CLK_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAM1_RX_CLK_P" "PF_IOD_GENERIC_RX_C0_0:RX_CLK_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C2_0:CLK" "DFN1_2:CLK" "PF_CCC_C2_0:REF_CLK_0" "PF_IOD_GENERIC_RX_C0_0:RX_CLK_G" "mipi_ip_0:CAM_CLOCK_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C2_0:FABRIC_RESET_N" "mipi_ip_0:RESET_N_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C2_0:INIT_DONE" "CORERESET_PF_C5_0:INIT_DONE" "INIT_DONE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C5_0:CLK" "DFN1_0:CLK" "DFN1_1:CLK" "PARALLEL_CLK" "PF_CCC_C2_0:OUT0_FABCLK_0" "mipi_ip_0:PARALLEL_CLOCK_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORERESET_PF_C5_0:FABRIC_RESET_N" "PARALLEL_CLK_RESET_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DFN1_0:D" "TRNG_RST_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DFN1_1:D" "PF_CCC_C2_0:PLL_LOCK_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DFN1_2:D" "PF_IOD_GENERIC_RX_C0_0:training_done_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"MIPI_INTERRUPT_O" "mipi_ip_0:MIPI_INTERRUPT_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_IOD_GENERIC_RX_C0_0:L0_LP_DATA" "mipi_ip_0:L0_LP_DATA_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_IOD_GENERIC_RX_C0_0:L0_LP_DATA_N" "mipi_ip_0:L0_LP_DATA_N_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_IOD_GENERIC_RX_C0_0:L1_LP_DATA" "mipi_ip_0:L1_LP_DATA_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_IOD_GENERIC_RX_C0_0:L1_LP_DATA_N" "mipi_ip_0:L1_LP_DATA_N_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_IOD_GENERIC_RX_C0_0:L2_LP_DATA" "mipi_ip_0:L2_LP_DATA_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_IOD_GENERIC_RX_C0_0:L2_LP_DATA_N" "mipi_ip_0:L2_LP_DATA_N_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_IOD_GENERIC_RX_C0_0:L3_LP_DATA" "mipi_ip_0:L3_LP_DATA_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_IOD_GENERIC_RX_C0_0:L3_LP_DATA_N" "mipi_ip_0:L3_LP_DATA_N_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"c1_frame_start_o" "mipi_ip_0:FRAME_START_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"c1_line_valid_o" "mipi_ip_0:LINE_VALID_O" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAM1_RXD" "PF_IOD_GENERIC_RX_C0_0:RXD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAM1_RXD_N" "PF_IOD_GENERIC_RX_C0_0:RXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_IOD_GENERIC_RX_C0_0:L0_RXD_DATA" "mipi_ip_0:L0_HS_DATA_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_IOD_GENERIC_RX_C0_0:L1_RXD_DATA" "mipi_ip_0:L1_HS_DATA_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_IOD_GENERIC_RX_C0_0:L2_RXD_DATA" "mipi_ip_0:L2_HS_DATA_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_IOD_GENERIC_RX_C0_0:L3_RXD_DATA" "mipi_ip_0:L3_HS_DATA_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"c1_data_out_o" "mipi_ip_0:DATA_O[9:2]" }

# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4L_MIPI" "mipi_ip_0:AXI4Lite_Target_IF" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the SmartDesign 
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign "IMX334_IF_TOP"
generate_component -component_name ${sd_name}
