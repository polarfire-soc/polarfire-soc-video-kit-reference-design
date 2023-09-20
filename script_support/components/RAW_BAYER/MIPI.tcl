# Creating SmartDesign "MIPI"
set sd_name {MIPI}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_arvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_awvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_bready} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_rready} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_wvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAM_CLOCK_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAM_PLL_LOCK_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {L0_LP_DATA_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {L0_LP_DATA_N_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {L1_LP_DATA_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {L1_LP_DATA_N_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {L2_LP_DATA_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {L2_LP_DATA_N_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {L3_LP_DATA_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {L3_LP_DATA_N_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PARALLEL_CLOCK_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RESET_N_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TRAINING_DONE_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {aclk} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {aresetn} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_arready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_awready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_bvalid} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_rvalid} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_wready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FRAME_START_O} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FRAME_VALID_O} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LINE_VALID_O} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {mipi_interrupt} -port_direction {OUT}


# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_araddr} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_arprot} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_awaddr} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_awprot} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_wdata} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_wstrb} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {L0_HS_DATA_I} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {L1_HS_DATA_I} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {L2_HS_DATA_I} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {L3_HS_DATA_I} -port_direction {IN} -port_range {[7:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_bresp} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_rdata} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_rresp} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {DATA_O} -port_direction {OUT} -port_range {[7:0]}


# Create top level Bus interface Ports
sd_create_bif_port -sd_name ${sd_name} -port_name {AXI4L_MIPI} -port_bif_vlnv {AMBA:AMBA4:AXI4:r0p0_0} -port_bif_role {slave} -port_bif_mapping {\
"AWADDR:AXI4L_MIPI_awaddr" \
"AWPROT:AXI4L_MIPI_awprot" \
"AWVALID:AXI4L_MIPI_awvalid" \
"AWREADY:AXI4L_MIPI_awready" \
"WDATA:AXI4L_MIPI_wdata" \
"WSTRB:AXI4L_MIPI_wstrb" \
"WVALID:AXI4L_MIPI_wvalid" \
"WREADY:AXI4L_MIPI_wready" \
"BRESP:AXI4L_MIPI_bresp" \
"BVALID:AXI4L_MIPI_bvalid" \
"BREADY:AXI4L_MIPI_bready" \
"ARADDR:AXI4L_MIPI_araddr" \
"ARPROT:AXI4L_MIPI_arprot" \
"ARVALID:AXI4L_MIPI_arvalid" \
"ARREADY:AXI4L_MIPI_arready" \
"RDATA:AXI4L_MIPI_rdata" \
"RRESP:AXI4L_MIPI_rresp" \
"RVALID:AXI4L_MIPI_rvalid" \
"RREADY:AXI4L_MIPI_rready" } 

# Add axi4lite_regmap_mipi_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {axi4lite_regmap_mipi} -instance_name {axi4lite_regmap_mipi_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {axi4lite_regmap_mipi_0:ip_ver} -value {001}



# Add interrupt_mipi_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {interrupt_mipi} -instance_name {interrupt_mipi_0}



# Add mipi_rx_decoder_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {mipicsi2rxdecoderPF_C0} -instance_name {mipi_rx_decoder_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {mipi_rx_decoder_0:DATA_O} -pin_slices {[1:0]}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {mipi_rx_decoder_0:DATA_O[1:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {mipi_rx_decoder_0:DATA_O} -pin_slices {[9:2]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {mipi_rx_decoder_0:CTRL_REG_I} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {mipi_rx_decoder_0:CTRL_REG_I} -pin_slices {[1:1]}
sd_create_pin_group -sd_name ${sd_name} -group_name {Group} -instance_name {mipi_rx_decoder_0} -pin_names {"EBD_VALID_O" "FRAME_END_O" "LINE_END_O" "ECC_ERROR_O" "CRC_ERROR_O" "LINE_START_O" }
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {mipi_rx_decoder_0:FRAME_END_O}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {mipi_rx_decoder_0:LINE_START_O}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {mipi_rx_decoder_0:LINE_END_O}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {mipi_rx_decoder_0:ECC_ERROR_O}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {mipi_rx_decoder_0:CRC_ERROR_O}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {mipi_rx_decoder_0:EBD_VALID_O}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAM_CLOCK_I" "mipi_rx_decoder_0:CAM_CLOCK_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAM_PLL_LOCK_I" "mipi_rx_decoder_0:CAM_PLL_LOCK_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FRAME_START_O" "mipi_rx_decoder_0:FRAME_START_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FRAME_VALID_O" "mipi_rx_decoder_0:FRAME_VALID_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"L0_LP_DATA_I" "mipi_rx_decoder_0:L0_LP_DATA_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"L0_LP_DATA_N_I" "mipi_rx_decoder_0:L0_LP_DATA_N_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"L1_LP_DATA_I" "mipi_rx_decoder_0:L1_LP_DATA_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"L1_LP_DATA_N_I" "mipi_rx_decoder_0:L1_LP_DATA_N_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"L2_LP_DATA_I" "mipi_rx_decoder_0:L2_LP_DATA_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"L2_LP_DATA_N_I" "mipi_rx_decoder_0:L2_LP_DATA_N_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"L3_LP_DATA_I" "mipi_rx_decoder_0:L3_LP_DATA_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"L3_LP_DATA_N_I" "mipi_rx_decoder_0:L3_LP_DATA_N_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LINE_VALID_O" "mipi_rx_decoder_0:LINE_VALID_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PARALLEL_CLOCK_I" "mipi_rx_decoder_0:PARALLEL_CLOCK_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RESET_N_I" "mipi_rx_decoder_0:RESET_N_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"TRAINING_DONE_I" "mipi_rx_decoder_0:TRAINING_DONE_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"aclk" "axi4lite_regmap_mipi_0:aclk" "interrupt_mipi_0:sys_clk_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"aresetn" "axi4lite_regmap_mipi_0:aresetn" "interrupt_mipi_0:rstn_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi4lite_regmap_mipi_0:glbl_int_en" "interrupt_mipi_0:global_interrupt_en_i" "mipi_rx_decoder_0:GL_IPT_EN_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi4lite_regmap_mipi_0:input_data_invert" "mipi_rx_decoder_0:INP_DATA_INVERT_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi4lite_regmap_mipi_0:mipi_clk_status" "mipi_rx_decoder_0:CAM_PLL_LOCK_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi4lite_regmap_mipi_0:mipi_en" "interrupt_mipi_0:mipi_en" "mipi_rx_decoder_0:CTRL_REG_I[0:0]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi4lite_regmap_mipi_0:mipi_rstn" "mipi_rx_decoder_0:CTRL_REG_I[1:1]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"interrupt_mipi_0:interrupt_o" "mipi_interrupt" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"DATA_O" "mipi_rx_decoder_0:DATA_O[9:2]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"L0_HS_DATA_I" "mipi_rx_decoder_0:L0_HS_DATA_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"L1_HS_DATA_I" "mipi_rx_decoder_0:L1_HS_DATA_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"L2_HS_DATA_I" "mipi_rx_decoder_0:L2_HS_DATA_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"L3_HS_DATA_I" "mipi_rx_decoder_0:L3_HS_DATA_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi4lite_regmap_mipi_0:data_width" "mipi_rx_decoder_0:DATAWIDTH_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi4lite_regmap_mipi_0:fifo_size" "mipi_rx_decoder_0:FIFO_SIZE_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi4lite_regmap_mipi_0:frame_resolution" "mipi_rx_decoder_0:FRAME_RESL_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi4lite_regmap_mipi_0:int_en" "interrupt_mipi_0:interrupt_en_i" "mipi_rx_decoder_0:IER_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi4lite_regmap_mipi_0:int_status" "interrupt_mipi_0:status_reg_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi4lite_regmap_mipi_0:int_status_clr" "interrupt_mipi_0:interrupt_clear_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi4lite_regmap_mipi_0:lane_config" "mipi_rx_decoder_0:LANE_CONFIG_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi4lite_regmap_mipi_0:mipi_cam_data_type" "mipi_rx_decoder_0:DATA_TYPE_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi4lite_regmap_mipi_0:mipi_cam_lanes_config" "mipi_rx_decoder_0:MIPI_CAM_LANES_CONFIG_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi4lite_regmap_mipi_0:no_of_pixels" "mipi_rx_decoder_0:NUM_OF_PIXELS_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi4lite_regmap_mipi_0:no_of_vc" "mipi_rx_decoder_0:VIRTUAL_CHANNEL_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi4lite_regmap_mipi_0:word_count" "mipi_rx_decoder_0:WORD_COUNT_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"interrupt_mipi_0:interrupt_event_i" "mipi_rx_decoder_0:ISR_O" }

# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4L_MIPI" "axi4lite_regmap_mipi_0:AXI4L_MIPI" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the SmartDesign 
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign "MIPI"
generate_component -component_name ${sd_name}
