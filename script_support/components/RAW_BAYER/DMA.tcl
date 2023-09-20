# Creating SmartDesign "DMA"
set sd_name {DMA}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_DMA_arvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_DMA_awvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_DMA_bready} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_DMA_rready} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_DMA_wvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {axi_clk_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {axi_clk_rstn_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ddr_clk_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ddr_clk_rstn_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {frame_start_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {line_valid_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {video_source_clk_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {video_source_rstn_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {write_ackn_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {write_done_i} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_DMA_arready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_DMA_awready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_DMA_bvalid} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_DMA_rvalid} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_DMA_wready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {data_rdy_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {dma_ip_interrupt} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {dma_ready_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {frame_start_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {write_req_o} -port_direction {OUT}


# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_DMA_araddr} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_DMA_arprot} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_DMA_awaddr} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_DMA_awprot} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_DMA_wdata} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_DMA_wstrb} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {data_i} -port_direction {IN} -port_range {[7:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_DMA_bresp} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_DMA_rdata} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_DMA_rresp} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {burst_size_o} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {data_o} -port_direction {OUT} -port_range {[511:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {write_start_addr_o} -port_direction {OUT} -port_range {[37:0]}


# Create top level Bus interface Ports
sd_create_bif_port -sd_name ${sd_name} -port_name {AXI4L_DMA} -port_bif_vlnv {AMBA:AMBA4:AXI4:r0p0_0} -port_bif_role {slave} -port_bif_mapping {\
"AWADDR:AXI4L_DMA_awaddr" \
"AWPROT:AXI4L_DMA_awprot" \
"AWVALID:AXI4L_DMA_awvalid" \
"AWREADY:AXI4L_DMA_awready" \
"WDATA:AXI4L_DMA_wdata" \
"WSTRB:AXI4L_DMA_wstrb" \
"WVALID:AXI4L_DMA_wvalid" \
"WREADY:AXI4L_DMA_wready" \
"BRESP:AXI4L_DMA_bresp" \
"BVALID:AXI4L_DMA_bvalid" \
"BREADY:AXI4L_DMA_bready" \
"ARADDR:AXI4L_DMA_araddr" \
"ARPROT:AXI4L_DMA_arprot" \
"ARVALID:AXI4L_DMA_arvalid" \
"ARREADY:AXI4L_DMA_arready" \
"RDATA:AXI4L_DMA_rdata" \
"RRESP:AXI4L_DMA_rresp" \
"RVALID:AXI4L_DMA_rvalid" \
"RREADY:AXI4L_DMA_rready" } 

# Add axi4lite_regmap_dma_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {axi4lite_regmap_dma} -instance_name {axi4lite_regmap_dma_0}



# Add debug_logic_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {debug_logic_dma} -instance_name {debug_logic_0}



# Add dma_with_addr_fifo_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {dma_with_addr_fifo} -instance_name {dma_with_addr_fifo_0}



# Add interrupt_dma_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {interrupt_dma} -instance_name {interrupt_dma_0}



# Add ip_reset_circuit_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {ip_reset_circuit_dma} -instance_name {ip_reset_circuit_0}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi4lite_regmap_dma_0:aclk" "axi_clk_i" "debug_logic_0:sys_clk_i" "dma_with_addr_fifo_0:axi_clk_i" "interrupt_dma_0:sys_clk_i" "ip_reset_circuit_0:axi_clk_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi4lite_regmap_dma_0:axi_clk_regmap_rstn" "dma_with_addr_fifo_0:axi_clk_rstn_i" "interrupt_dma_0:rstn_i" "ip_reset_circuit_0:axi_clk_rstn_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi4lite_regmap_dma_0:axi_clk_rstn" "axi_clk_rstn_i" "debug_logic_0:rstn_i" "ip_reset_circuit_0:axi_clk_rstn_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi4lite_regmap_dma_0:buff_addr_fifo_wen" "debug_logic_0:buff_addr_fifo_wen_i" "dma_with_addr_fifo_0:buff_addr_fifo_wen_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi4lite_regmap_dma_0:fifo_rstn" "ip_reset_circuit_0:fifo_rstn_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi4lite_regmap_dma_0:frame_size_fifo_ren" "dma_with_addr_fifo_0:frame_size_fifo_ren_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi4lite_regmap_dma_0:glbl_int_en" "interrupt_dma_0:glbl_int_en" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi4lite_regmap_dma_0:ip_en" "dma_with_addr_fifo_0:ip_enbl" "interrupt_dma_0:ip_en" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi4lite_regmap_dma_0:ip_rstn" "ip_reset_circuit_0:ip_rstn_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"data_rdy_o" "dma_with_addr_fifo_0:data_rdy_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ddr_clk_i" "dma_with_addr_fifo_0:ddr_clk_i" "ip_reset_circuit_0:ddr_clk_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ddr_clk_rstn_i" "ip_reset_circuit_0:ddr_clk_rstn_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"debug_logic_0:interrupt_i" "dma_ip_interrupt" "interrupt_dma_0:interrupt_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"dma_ready_o" "dma_with_addr_fifo_0:dma_ready_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"dma_with_addr_fifo_0:buff_addr_fifo_empty" "interrupt_dma_0:buff_addr_fifo_empty_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"dma_with_addr_fifo_0:buff_addr_fifo_full" "interrupt_dma_0:buff_addr_fifo_full_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"dma_with_addr_fifo_0:ddr_clk_rstn_i" "ip_reset_circuit_0:ddr_clk_rstn_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"dma_with_addr_fifo_0:fifo_rstn_i" "ip_reset_circuit_0:fifo_rstn_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"dma_with_addr_fifo_0:frame_end_interrupt_o" "interrupt_dma_0:frame_end_interrupt_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"dma_with_addr_fifo_0:frame_size_fifo_empty" "interrupt_dma_0:frame_size_fifo_empty_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"dma_with_addr_fifo_0:frame_size_fifo_full" "interrupt_dma_0:frame_size_fifo_full_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"dma_with_addr_fifo_0:frame_start_i" "frame_start_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"dma_with_addr_fifo_0:frame_start_o" "frame_start_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"dma_with_addr_fifo_0:line_valid_i" "line_valid_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"dma_with_addr_fifo_0:video_source_clk_i" "ip_reset_circuit_0:video_clk_i" "video_source_clk_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"dma_with_addr_fifo_0:video_source_rstn_i" "ip_reset_circuit_0:video_clk_rstn_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"dma_with_addr_fifo_0:write_ackn_i" "write_ackn_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"dma_with_addr_fifo_0:write_done_i" "write_done_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"dma_with_addr_fifo_0:write_req_o" "write_req_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ip_reset_circuit_0:video_clk_rstn_i" "video_source_rstn_i" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi4lite_regmap_dma_0:buff_addr_fifo_data" "dma_with_addr_fifo_0:buff_addr_fifo_data_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi4lite_regmap_dma_0:buff_addr_fifo_rcount" "dma_with_addr_fifo_0:buff_addr_fifo_rcount_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi4lite_regmap_dma_0:frame_counter" "debug_logic_0:buff_addr_frm_processor_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi4lite_regmap_dma_0:frame_size_fifo" "dma_with_addr_fifo_0:frame_size" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi4lite_regmap_dma_0:frame_size_fifo_wcount" "dma_with_addr_fifo_0:frame_size_fifo_data_count_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi4lite_regmap_dma_0:input_frame_counter" "debug_logic_0:frame_processed_count_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi4lite_regmap_dma_0:interrupt_en" "interrupt_dma_0:interrupt_en_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi4lite_regmap_dma_0:interrupt_status" "interrupt_dma_0:status_reg_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi4lite_regmap_dma_0:interrupt_status_clr" "interrupt_dma_0:interrupt_clear_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi4lite_regmap_dma_0:line_gap" "dma_with_addr_fifo_0:line_gap_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"burst_size_o" "dma_with_addr_fifo_0:burst_size_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"data_i" "dma_with_addr_fifo_0:data_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"data_o" "dma_with_addr_fifo_0:data_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"dma_with_addr_fifo_0:write_start_addr_o" "write_start_addr_o" }

# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4L_DMA" "axi4lite_regmap_dma_0:AXI4L_dma" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the SmartDesign 
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign "DMA"
generate_component -component_name ${sd_name}
