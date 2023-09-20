# Creating SmartDesign "axi4lite_regmap_mipi"
set sd_name {axi4lite_regmap_mipi}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_arvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_awvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_bready} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_rready} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_wvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {aclk} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {aresetn} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_arready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_awready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_bvalid} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_rvalid} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_wready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {mipi_en} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {mipi_rstn} -port_direction {OUT}


# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_araddr} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_arprot} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_awaddr} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_awprot} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_wdata} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_wstrb} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {data_width} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {fifo_size} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {frame_resolution} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {input_data_invert} -port_direction {IN} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {int_status} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {ip_ver} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {lane_config} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {mipi_cam_data_type} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {mipi_cam_lanes_config} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {mipi_clk_status} -port_direction {IN} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {no_of_pixels} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {no_of_vc} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {word_count} -port_direction {IN} -port_range {[15:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_bresp} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_rdata} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_rresp} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {glbl_int_en} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {int_en} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {int_status_clr} -port_direction {OUT} -port_range {[7:0]}


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

# Add axi4lite_adapter_mipi_0 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {axi4lite_adapter_mipi} -instance_name {axi4lite_adapter_mipi_0}



# Add read_reg_mipi_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {read_reg_mipi} -hdl_file {hdl/read_reg_mipi.v} -instance_name {read_reg_mipi_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {read_reg_mipi_0:ctrl_reg} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {read_reg_mipi_0:ctrl_reg} -pin_slices {[1:1]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {read_reg_mipi_0:ctrl_reg[1:1]} -value {GND}



# Add write_reg_mipi_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {write_reg_mipi} -hdl_file {hdl/write_reg_mipi.v} -instance_name {write_reg_mipi_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {write_reg_mipi_0:ctrl_reg} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {write_reg_mipi_0:ctrl_reg} -pin_slices {[1:1]}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"aclk" "axi4lite_adapter_mipi_0:aclk" "read_reg_mipi_0:aclk" "write_reg_mipi_0:aclk" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"aresetn" "axi4lite_adapter_mipi_0:aresetn" "read_reg_mipi_0:aresetn" "write_reg_mipi_0:aresetn" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi4lite_adapter_mipi_0:mem_wr_valid" "write_reg_mipi_0:mem_wr_valid" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"glbl_int_en" "read_reg_mipi_0:glbl_int_en" "write_reg_mipi_0:glbl_int_en" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"input_data_invert" "read_reg_mipi_0:input_data_invert" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"mipi_clk_status" "read_reg_mipi_0:mipi_clk_status" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"mipi_en" "read_reg_mipi_0:ctrl_reg[0:0]" "write_reg_mipi_0:ctrl_reg[0:0]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"mipi_rstn" "write_reg_mipi_0:ctrl_reg[1:1]" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi4lite_adapter_mipi_0:mem_rd_addr" "read_reg_mipi_0:mem_rd_addr" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi4lite_adapter_mipi_0:mem_rd_data" "read_reg_mipi_0:mem_rd_data" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi4lite_adapter_mipi_0:mem_wr_addr" "write_reg_mipi_0:mem_wr_addr" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi4lite_adapter_mipi_0:mem_wr_data" "write_reg_mipi_0:mem_wr_data" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"data_width" "read_reg_mipi_0:data_width" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"fifo_size" "read_reg_mipi_0:fifo_size" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"frame_resolution" "read_reg_mipi_0:frame_resolution" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"int_en" "read_reg_mipi_0:int_en" "write_reg_mipi_0:int_en" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"int_status" "read_reg_mipi_0:int_status" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"int_status_clr" "write_reg_mipi_0:int_status_clr" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ip_ver" "read_reg_mipi_0:ip_ver" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"lane_config" "read_reg_mipi_0:lane_config" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"mipi_cam_data_type" "read_reg_mipi_0:mipi_cam_data_type" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"mipi_cam_lanes_config" "read_reg_mipi_0:mipi_cam_lanes_config" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"no_of_pixels" "read_reg_mipi_0:no_of_pixels" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"no_of_vc" "read_reg_mipi_0:no_of_vc" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"read_reg_mipi_0:word_count" "word_count" }

# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4L_MIPI" "axi4lite_adapter_mipi_0:AXI4L_MIPI" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the SmartDesign 
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign "axi4lite_regmap_mipi"
generate_component -component_name ${sd_name}
