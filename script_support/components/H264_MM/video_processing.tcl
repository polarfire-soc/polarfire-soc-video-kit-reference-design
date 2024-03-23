# Creating SmartDesign "video_processing"
set sd_name {video_processing}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {ACLK_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ARESETN_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_H264_arvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_H264_awvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_H264_bready} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_H264_rready} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_H264_wvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_IE_arvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_IE_awvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_IE_bready} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_IE_rready} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_IE_wvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_OSD_arvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_OSD_awvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_OSD_bready} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_OSD_rready} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_OSD_wvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_arvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_awvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_bready} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_rready} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_wvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DATA_VALID_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FRAME_START_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RESETN_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SYS_CLK_I} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_H264_arready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_H264_awready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_H264_bvalid} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_H264_rvalid} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_H264_wready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_IE_arready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_IE_awready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_IE_bvalid} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_IE_rvalid} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_IE_wready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_OSD_arready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_OSD_awready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_OSD_bvalid} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_OSD_rvalid} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_OSD_wready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_arready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_awready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_bvalid} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_rvalid} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_wready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DATA_VALID_O} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FRAME_START_O} -port_direction {OUT}


# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_H264_araddr} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_H264_awaddr} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_H264_wdata} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_IE_araddr} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_IE_awaddr} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_IE_wdata} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_OSD_araddr} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_OSD_awaddr} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_OSD_wdata} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_araddr} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_awaddr} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_wdata} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {DATA_I} -port_direction {IN} -port_range {[7:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_H264_bresp} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_H264_rdata} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_H264_rresp} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_IE_bresp} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_IE_rdata} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_IE_rresp} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_OSD_bresp} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_OSD_rdata} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_OSD_rresp} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_bresp} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_rdata} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_rresp} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {DATA_O} -port_direction {OUT} -port_range {[15:0]}


# Create top level Bus interface Ports
sd_create_bif_port -sd_name ${sd_name} -port_name {AXI4L_H264} -port_bif_vlnv {AMBA:AMBA4:AXI4:r0p0_0} -port_bif_role {slave} -port_bif_mapping {\
"AWADDR:AXI4L_H264_awaddr" \
"AWVALID:AXI4L_H264_awvalid" \
"AWREADY:AXI4L_H264_awready" \
"WDATA:AXI4L_H264_wdata" \
"WVALID:AXI4L_H264_wvalid" \
"WREADY:AXI4L_H264_wready" \
"BRESP:AXI4L_H264_bresp" \
"BVALID:AXI4L_H264_bvalid" \
"BREADY:AXI4L_H264_bready" \
"ARADDR:AXI4L_H264_araddr" \
"ARVALID:AXI4L_H264_arvalid" \
"ARREADY:AXI4L_H264_arready" \
"RDATA:AXI4L_H264_rdata" \
"RRESP:AXI4L_H264_rresp" \
"RVALID:AXI4L_H264_rvalid" \
"RREADY:AXI4L_H264_rready" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {AXI4L_OSD} -port_bif_vlnv {AMBA:AMBA4:AXI4:r0p0_0} -port_bif_role {slave} -port_bif_mapping {\
"AWADDR:AXI4L_OSD_awaddr" \
"AWVALID:AXI4L_OSD_awvalid" \
"AWREADY:AXI4L_OSD_awready" \
"WDATA:AXI4L_OSD_wdata" \
"WVALID:AXI4L_OSD_wvalid" \
"WREADY:AXI4L_OSD_wready" \
"BRESP:AXI4L_OSD_bresp" \
"BVALID:AXI4L_OSD_bvalid" \
"BREADY:AXI4L_OSD_bready" \
"ARADDR:AXI4L_OSD_araddr" \
"ARVALID:AXI4L_OSD_arvalid" \
"ARREADY:AXI4L_OSD_arready" \
"RDATA:AXI4L_OSD_rdata" \
"RRESP:AXI4L_OSD_rresp" \
"RVALID:AXI4L_OSD_rvalid" \
"RREADY:AXI4L_OSD_rready" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {AXI4L_IE} -port_bif_vlnv {AMBA:AMBA4:AXI4:r0p0_0} -port_bif_role {slave} -port_bif_mapping {\
"AWADDR:AXI4L_IE_awaddr" \
"AWVALID:AXI4L_IE_awvalid" \
"AWREADY:AXI4L_IE_awready" \
"WDATA:AXI4L_IE_wdata" \
"WVALID:AXI4L_IE_wvalid" \
"WREADY:AXI4L_IE_wready" \
"BRESP:AXI4L_IE_bresp" \
"BVALID:AXI4L_IE_bvalid" \
"BREADY:AXI4L_IE_bready" \
"ARADDR:AXI4L_IE_araddr" \
"ARVALID:AXI4L_IE_arvalid" \
"ARREADY:AXI4L_IE_arready" \
"RDATA:AXI4L_IE_rdata" \
"RRESP:AXI4L_IE_rresp" \
"RVALID:AXI4L_IE_rvalid" \
"RREADY:AXI4L_IE_rready" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {AXI4L_SCALER} -port_bif_vlnv {AMBA:AMBA4:AXI4:r0p0_0} -port_bif_role {slave} -port_bif_mapping {\
"AWADDR:AXI4L_SCALER_awaddr" \
"AWVALID:AXI4L_SCALER_awvalid" \
"AWREADY:AXI4L_SCALER_awready" \
"WDATA:AXI4L_SCALER_wdata" \
"WVALID:AXI4L_SCALER_wvalid" \
"WREADY:AXI4L_SCALER_wready" \
"BRESP:AXI4L_SCALER_bresp" \
"BVALID:AXI4L_SCALER_bvalid" \
"BREADY:AXI4L_SCALER_bready" \
"ARADDR:AXI4L_SCALER_araddr" \
"ARVALID:AXI4L_SCALER_arvalid" \
"ARREADY:AXI4L_SCALER_arready" \
"RDATA:AXI4L_SCALER_rdata" \
"RRESP:AXI4L_SCALER_rresp" \
"RVALID:AXI4L_SCALER_rvalid" \
"RREADY:AXI4L_SCALER_rready" } 

# Add Bayer_Interpolation_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {Bayer_Interpolation_C0} -instance_name {Bayer_Interpolation_C0_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Bayer_Interpolation_C0_0:EOF_O}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {Bayer_Interpolation_C0_0:BAYER_FORMAT} -value {00}



# Add Gamma_Correction_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {Gamma_Correction_C0} -instance_name {Gamma_Correction_C0_0}



# Add H264_Iframe_Encoder_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {H264_Iframe_Encoder_C0} -instance_name {H264_Iframe_Encoder_C0_0}



# Add Image_Enhancement_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {Image_Enhancement_C0} -instance_name {Image_Enhancement_C0_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Image_Enhancement_C0_0:Y_AVG_O}



# Add Image_Scaler_top_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {IMAGE_SCALER_C0} -instance_name {Image_Scaler_top_0}



# Add osd_top_0 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {CR_OSD} -instance_name {osd_top_0}



# Add RGBtoYCbCr_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {RGBtoYCbCr_C0} -instance_name {RGBtoYCbCr_C0_0}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"ACLK_I" "H264_Iframe_Encoder_C0_0:ACLK_I" "Image_Enhancement_C0_0:ACLK_I" "Image_Scaler_top_0:ACLK_I" "osd_top_0:aclk" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ARESETN_I" "H264_Iframe_Encoder_C0_0:ARESETN_I" "Image_Enhancement_C0_0:ARESETN_I" "Image_Scaler_top_0:ARESETN_I" "osd_top_0:aresetn" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Bayer_Interpolation_C0_0:DATA_VALID_I" "DATA_VALID_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Bayer_Interpolation_C0_0:EOF_I" "FRAME_START_I" "H264_Iframe_Encoder_C0_0:FRAME_START_I" "Image_Enhancement_C0_0:FRAME_START_I" "Image_Scaler_top_0:FRAME_START_I" "osd_top_0:FRAME_END_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Bayer_Interpolation_C0_0:RESETN_I" "Gamma_Correction_C0_0:RESETN_I" "H264_Iframe_Encoder_C0_0:RESETN_I" "Image_Enhancement_C0_0:RESETN_I" "Image_Scaler_top_0:RESETN_I" "RESETN_I" "RGBtoYCbCr_C0_0:RESET_N_I" "osd_top_0:RESETN_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Bayer_Interpolation_C0_0:RGB_VALID_O" "Gamma_Correction_C0_0:DATA_VALID_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Bayer_Interpolation_C0_0:SYS_CLK_I" "Gamma_Correction_C0_0:SYS_CLK_I" "H264_Iframe_Encoder_C0_0:PIX_CLK_I" "Image_Enhancement_C0_0:SYS_CLK_I" "Image_Scaler_top_0:IN_VIDEO_CLK_I" "Image_Scaler_top_0:OUT_VIDEO_CLK_I" "RGBtoYCbCr_C0_0:CLOCK_I" "SYS_CLK_I" "osd_top_0:SYS_CLK_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DATA_VALID_O" "H264_Iframe_Encoder_C0_0:DATA_VALID_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"FRAME_START_O" "H264_Iframe_Encoder_C0_0:FRAME_START_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Gamma_Correction_C0_0:DATA_VALID_O" "Image_Enhancement_C0_0:DATA_VALID_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"H264_Iframe_Encoder_C0_0:DATA_VALID_I" "RGBtoYCbCr_C0_0:DATA_VALID_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Image_Enhancement_C0_0:DATA_VALID_O" "Image_Scaler_top_0:DATA_VALID_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Image_Scaler_top_0:DATA_VALID_O" "osd_top_0:DATA_VALID_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RGBtoYCbCr_C0_0:DATA_VALID_I" "osd_top_0:data_valid_o" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"Bayer_Interpolation_C0_0:B_O" "Gamma_Correction_C0_0:BLUE_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Bayer_Interpolation_C0_0:DATA_I" "DATA_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Bayer_Interpolation_C0_0:G_O" "Gamma_Correction_C0_0:GREEN_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Bayer_Interpolation_C0_0:R_O" "Gamma_Correction_C0_0:RED_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DATA_O" "H264_Iframe_Encoder_C0_0:DATA_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Gamma_Correction_C0_0:BLUE_O" "Image_Enhancement_C0_0:B_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Gamma_Correction_C0_0:GREEN_O" "Image_Enhancement_C0_0:G_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Gamma_Correction_C0_0:RED_O" "Image_Enhancement_C0_0:R_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"H264_Iframe_Encoder_C0_0:DATA_C_I" "RGBtoYCbCr_C0_0:C_OUT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"H264_Iframe_Encoder_C0_0:DATA_Y_I" "RGBtoYCbCr_C0_0:Y_OUT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Image_Enhancement_C0_0:B_O" "Image_Scaler_top_0:DATA_B_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Image_Enhancement_C0_0:G_O" "Image_Scaler_top_0:DATA_G_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Image_Enhancement_C0_0:R_O" "Image_Scaler_top_0:DATA_R_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Image_Scaler_top_0:DATA_B_O" "osd_top_0:b_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Image_Scaler_top_0:DATA_G_O" "osd_top_0:g_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Image_Scaler_top_0:DATA_R_O" "osd_top_0:r_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RGBtoYCbCr_C0_0:BLUE_I" "osd_top_0:b_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RGBtoYCbCr_C0_0:GREEN_I" "osd_top_0:g_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RGBtoYCbCr_C0_0:RED_I" "osd_top_0:r_o" }

# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4L_H264" "H264_Iframe_Encoder_C0_0:AXI4L_H264" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4L_IE" "Image_Enhancement_C0_0:AXI4L_IE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4L_OSD" "osd_top_0:AXI4L_OSD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4L_SCALER" "Image_Scaler_top_0:AXI4L_SCALER" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the SmartDesign 
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign "video_processing"
generate_component -component_name ${sd_name}
