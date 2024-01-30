# Creating SmartDesign "axi4lite_regmap_osd"
set sd_name {axi4lite_regmap_osd}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_OSD_arvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_OSD_awvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_OSD_bready} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_OSD_rready} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_OSD_wvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {aclk} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {aresetn} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_OSD_arready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_OSD_awready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_OSD_bvalid} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_OSD_rvalid} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_OSD_wready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {osd_ip_en} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {osd_ip_rstn} -port_direction {OUT}


# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_OSD_araddr} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_OSD_arprot} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_OSD_awaddr} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_OSD_awprot} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_OSD_wdata} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_OSD_wstrb} -port_direction {IN} -port_range {[3:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_OSD_bresp} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_OSD_rdata} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_OSD_rresp} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {coordinate} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {h_res} -port_direction {OUT} -port_range {[15:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {osd_num} -port_direction {OUT} -port_range {[11:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {rgb_color} -port_direction {OUT} -port_range {[23:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {v_res} -port_direction {OUT} -port_range {[15:0]}


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



# Add axi4lite_adapter_osd_0 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {axi4lite_adapter_osd} -instance_name {axi4lite_adapter_osd_0}



# Add read_reg_osd_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {read_reg_osd} -hdl_file {hdl/read_reg_osd.v} -instance_name {read_reg_osd_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {read_reg_osd_0:ctrl_reg} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {read_reg_osd_0:ctrl_reg} -pin_slices {[1:1]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {read_reg_osd_0:ip_ver} -value {100}



# Add write_reg_osd_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {write_reg_osd} -hdl_file {hdl/write_reg_osd.v} -instance_name {write_reg_osd_0}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:A" "osd_ip_rstn" "read_reg_osd_0:ctrl_reg[1:1]" "write_reg_osd_0:osd_ip_rstn" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:B" "aresetn" "axi4lite_adapter_osd_0:aresetn" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:Y" "write_reg_osd_0:aresetn" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"aclk" "axi4lite_adapter_osd_0:aclk" "write_reg_osd_0:aclk" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi4lite_adapter_osd_0:mem_wr_valid" "write_reg_osd_0:mem_wr_valid" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"osd_ip_en" "read_reg_osd_0:ctrl_reg[0:0]" "write_reg_osd_0:osd_ip_en" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi4lite_adapter_osd_0:mem_rd_addr" "read_reg_osd_0:mem_rd_addr" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi4lite_adapter_osd_0:mem_rd_data" "read_reg_osd_0:mem_rd_data" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi4lite_adapter_osd_0:mem_wr_addr" "write_reg_osd_0:mem_wr_addr" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi4lite_adapter_osd_0:mem_wr_data" "write_reg_osd_0:mem_wr_data" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"coordinate" "write_reg_osd_0:coordinate" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"h_res" "write_reg_osd_0:h_res" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"osd_num" "write_reg_osd_0:osd_num" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"rgb_color" "write_reg_osd_0:rgb_color" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"v_res" "write_reg_osd_0:v_res" }

# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4L_OSD" "axi4lite_adapter_osd_0:AXI4L_OSD" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the SmartDesign 
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign "axi4lite_regmap_osd"
generate_component -component_name ${sd_name}
