# Creating SmartDesign "axi4lite_regmap_dma"
set sd_name {axi4lite_regmap_dma}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_dma_arvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_dma_awvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_dma_bready} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_dma_rready} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_dma_wvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {aclk} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {axi_clk_regmap_rstn} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {axi_clk_rstn} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_dma_arready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_dma_awready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_dma_bvalid} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_dma_rvalid} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_dma_wready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {buff_addr_fifo_wen} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {fifo_rstn} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {frame_size_fifo_ren} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ip_en} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ip_rstn} -port_direction {OUT}


# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_dma_araddr} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_dma_arprot} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_dma_awaddr} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_dma_awprot} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_dma_wdata} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_dma_wstrb} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {buff_addr_fifo_rcount} -port_direction {IN} -port_range {[4:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {frame_counter} -port_direction {IN} -port_range {[10:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {frame_size_fifo_wcount} -port_direction {IN} -port_range {[4:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {frame_size_fifo} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {input_frame_counter} -port_direction {IN} -port_range {[10:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {interrupt_status} -port_direction {IN} -port_range {[4:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_dma_bresp} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_dma_rdata} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_dma_rresp} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {buff_addr_fifo_data} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {glbl_int_en} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {interrupt_en} -port_direction {OUT} -port_range {[4:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {interrupt_status_clr} -port_direction {OUT} -port_range {[4:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {line_gap} -port_direction {OUT} -port_range {[15:0]}


# Create top level Bus interface Ports
sd_create_bif_port -sd_name ${sd_name} -port_name {AXI4L_dma} -port_bif_vlnv {AMBA:AMBA4:AXI4:r0p0_0} -port_bif_role {slave} -port_bif_mapping {\
"AWADDR:AXI4L_dma_awaddr" \
"AWPROT:AXI4L_dma_awprot" \
"AWVALID:AXI4L_dma_awvalid" \
"AWREADY:AXI4L_dma_awready" \
"WDATA:AXI4L_dma_wdata" \
"WSTRB:AXI4L_dma_wstrb" \
"WVALID:AXI4L_dma_wvalid" \
"WREADY:AXI4L_dma_wready" \
"BRESP:AXI4L_dma_bresp" \
"BVALID:AXI4L_dma_bvalid" \
"BREADY:AXI4L_dma_bready" \
"ARADDR:AXI4L_dma_araddr" \
"ARPROT:AXI4L_dma_arprot" \
"ARVALID:AXI4L_dma_arvalid" \
"ARREADY:AXI4L_dma_arready" \
"RDATA:AXI4L_dma_rdata" \
"RRESP:AXI4L_dma_rresp" \
"RVALID:AXI4L_dma_rvalid" \
"RREADY:AXI4L_dma_rready" } 

sd_invert_pins -sd_name ${sd_name} -pin_names {fifo_rstn}
sd_invert_pins -sd_name ${sd_name} -pin_names {ip_rstn}
# Add axi4lite_adapter_0 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {axi4lite_adapter_dma} -instance_name {axi4lite_adapter_0}



# Add read_reg_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {read_reg_dma} -hdl_file {hdl/read_reg_dma.v} -instance_name {read_reg_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {read_reg_0:ctrl_reg} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {read_reg_0:ctrl_reg} -pin_slices {[2:1]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {read_reg_0:ctrl_reg[2:1]} -value {GND}



# Add write_reg_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {write_reg_dma} -hdl_file {hdl/write_reg_dma.v} -instance_name {write_reg_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {write_reg_0:ctrl_reg} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {write_reg_0:ctrl_reg} -pin_slices {[1:1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {write_reg_0:ctrl_reg} -pin_slices {[2:2]}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"aclk" "axi4lite_adapter_0:aclk" "read_reg_0:aclk" "write_reg_0:aclk" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi4lite_adapter_0:aresetn" "axi_clk_rstn" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi4lite_adapter_0:mem_wr_valid" "write_reg_0:mem_wr_valid" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi_clk_regmap_rstn" "read_reg_0:aresetn" "write_reg_0:aresetn" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"buff_addr_fifo_wen" "write_reg_0:buff_addr_fifo_wen" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"fifo_rstn" "write_reg_0:ctrl_reg[2:2]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"frame_size_fifo_ren" "read_reg_0:frame_size_fifo_ren" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"glbl_int_en" "read_reg_0:glbl_int_en" "write_reg_0:glbl_int_en" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ip_en" "read_reg_0:ctrl_reg[0:0]" "write_reg_0:ctrl_reg[0:0]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ip_rstn" "write_reg_0:ctrl_reg[1:1]" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi4lite_adapter_0:mem_rd_addr" "read_reg_0:mem_rd_addr" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi4lite_adapter_0:mem_rd_data" "read_reg_0:mem_rd_data" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi4lite_adapter_0:mem_wr_addr" "write_reg_0:mem_wr_addr" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi4lite_adapter_0:mem_wr_data" "write_reg_0:mem_wr_data" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"buff_addr_fifo_data" "write_reg_0:buff_addr_fifo_data" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"buff_addr_fifo_rcount" "read_reg_0:buff_addr_fifo_rcount" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"frame_counter" "read_reg_0:frame_counter" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"frame_size_fifo" "read_reg_0:frame_size_fifo" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"frame_size_fifo_wcount" "read_reg_0:frame_size_fifo_wcount" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"input_frame_counter" "read_reg_0:input_frame_counter" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"interrupt_en" "read_reg_0:interrupt_en" "write_reg_0:interrupt_en" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"interrupt_status" "read_reg_0:interrupt_status" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"interrupt_status_clr" "write_reg_0:interrupt_status_clr" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"line_gap" "read_reg_0:line_gap" "write_reg_0:line_gap" }

# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4L_dma" "axi4lite_adapter_0:AXI4L_dma" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the SmartDesign 
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign "axi4lite_regmap_dma"
generate_component -component_name ${sd_name}
