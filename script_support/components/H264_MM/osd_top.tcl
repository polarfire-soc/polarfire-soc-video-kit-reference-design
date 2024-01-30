# Creating SmartDesign "osd_top"
set sd_name {osd_top}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_OSD_arvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_OSD_awvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_OSD_bready} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_OSD_rready} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_OSD_wvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {DATA_VALID_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FRAME_END_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RESETN_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SYS_CLK_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {aclk} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {aresetn} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_OSD_arready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_OSD_awready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_OSD_bvalid} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_OSD_rvalid} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_OSD_wready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {data_valid_o} -port_direction {OUT}


# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_OSD_araddr} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_OSD_arprot} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_OSD_awaddr} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_OSD_awprot} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_OSD_wdata} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_OSD_wstrb} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {b_i} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {g_i} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {r_i} -port_direction {IN} -port_range {[7:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_OSD_bresp} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_OSD_rdata} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_OSD_rresp} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {b_o} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {g_o} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {r_o} -port_direction {OUT} -port_range {[7:0]}


# Create top level Bus interface Ports
sd_create_bif_port -sd_name ${sd_name} -port_name {AXI4L_OSD} -port_bif_vlnv {AMBA:AMBA4:AXI4:r0p0_0} -port_bif_role {slave} -port_bif_mapping {\
"AWADDR:AXI4L_OSD_awaddr" \
"AWPROT:AXI4L_OSD_awprot" \
"AWVALID:AXI4L_OSD_awvalid" \
"AWREADY:AXI4L_OSD_awready" \
"WDATA:AXI4L_OSD_wdata" \
"WSTRB:AXI4L_OSD_wstrb" \
"WVALID:AXI4L_OSD_wvalid" \
"WREADY:AXI4L_OSD_wready" \
"BRESP:AXI4L_OSD_bresp" \
"BVALID:AXI4L_OSD_bvalid" \
"BREADY:AXI4L_OSD_bready" \
"ARADDR:AXI4L_OSD_araddr" \
"ARPROT:AXI4L_OSD_arprot" \
"ARVALID:AXI4L_OSD_arvalid" \
"ARREADY:AXI4L_OSD_arready" \
"RDATA:AXI4L_OSD_rdata" \
"RRESP:AXI4L_OSD_rresp" \
"RVALID:AXI4L_OSD_rvalid" \
"RREADY:AXI4L_OSD_rready" } 

# Add AND2_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {AND2} -instance_name {AND2_0}
sd_invert_pins -sd_name ${sd_name} -pin_names {AND2_0:A}



# Add axi4lite_regmap_osd_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {axi4lite_regmap_osd} -instance_name {axi4lite_regmap_osd_0}



# Add CR_OSD_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {CR_OSD} -hdl_file {hdl/CR_OSD.v} -instance_name {CR_OSD_0}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:A" "axi4lite_regmap_osd_0:osd_ip_rstn" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:B" "RESETN_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:Y" "CR_OSD_0:RESETN_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CR_OSD_0:DATA_VALID_I" "DATA_VALID_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CR_OSD_0:FRAME_END_I" "FRAME_END_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CR_OSD_0:OSD_EN_I" "axi4lite_regmap_osd_0:osd_ip_en" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CR_OSD_0:SYS_CLK_I" "SYS_CLK_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CR_OSD_0:data_valid_o" "data_valid_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"aclk" "axi4lite_regmap_osd_0:aclk" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"aresetn" "axi4lite_regmap_osd_0:aresetn" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"CR_OSD_0:b_i" "b_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CR_OSD_0:b_o" "b_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CR_OSD_0:coordinate_i" "axi4lite_regmap_osd_0:coordinate" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CR_OSD_0:g_i" "g_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CR_OSD_0:g_o" "g_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CR_OSD_0:hres_i" "axi4lite_regmap_osd_0:h_res" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CR_OSD_0:num_i" "axi4lite_regmap_osd_0:osd_num" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CR_OSD_0:r_i" "r_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CR_OSD_0:r_o" "r_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CR_OSD_0:text_color_rgb_i" "axi4lite_regmap_osd_0:rgb_color" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CR_OSD_0:vres_i" "axi4lite_regmap_osd_0:v_res" }

# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4L_OSD" "axi4lite_regmap_osd_0:AXI4L_OSD" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the SmartDesign 
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign "osd_top"
generate_component -component_name ${sd_name}
