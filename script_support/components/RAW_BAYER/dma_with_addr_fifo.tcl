# Creating SmartDesign "dma_with_addr_fifo"
set sd_name {dma_with_addr_fifo}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {axi_clk_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {axi_clk_rstn_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {buff_addr_fifo_wen_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ddr_clk_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ddr_clk_rstn_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {fifo_rstn_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {frame_size_fifo_ren_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {frame_start_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ip_enbl} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {line_valid_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {video_source_clk_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {video_source_rstn_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {write_ackn_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {write_done_i} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {buff_addr_fifo_empty} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {buff_addr_fifo_full} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {data_rdy_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {dma_ready_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {frame_end_interrupt_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {frame_size_fifo_empty} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {frame_size_fifo_full} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {frame_start_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {write_req_o} -port_direction {OUT}


# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {buff_addr_fifo_data_i} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {data_i} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {line_gap_i} -port_direction {IN} -port_range {[15:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {buff_addr_fifo_rcount_o} -port_direction {OUT} -port_range {[4:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {burst_size_o} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {data_o} -port_direction {OUT} -port_range {[511:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {frame_size_fifo_data_count_o} -port_direction {OUT} -port_range {[4:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {frame_size} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {write_start_addr_o} -port_direction {OUT} -port_range {[37:0]}


# Add AND2_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {AND2} -instance_name {AND2_0}



# Add Buffer_address_fifo instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {async_fifo} -hdl_file {hdl/async_fifo.v} -instance_name {Buffer_address_fifo}
sd_create_pin_group -sd_name ${sd_name} -group_name {Group} -instance_name {Buffer_address_fifo} -pin_names {"rhempty_o" "raempty_o" "wafull_o" "wdata_count_o" }
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Buffer_address_fifo:wafull_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Buffer_address_fifo:raempty_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Buffer_address_fifo:rhempty_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Buffer_address_fifo:wdata_count_o}



# Add DDR_Write_C0_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {DDR_Write_C0} -hdl_file {hdl/DDR_Write_C0.v} -instance_name {DDR_Write_C0_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {DDR_Write_C0_0:frame_ddr_addr_i} -pin_slices {[37:6]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {DDR_Write_C0_0:frame_ddr_addr_i} -pin_slices {[5:0]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {DDR_Write_C0_0:frame_ddr_addr_i[5:0]} -value {GND}
sd_invert_pins -sd_name ${sd_name} -pin_names {DDR_Write_C0_0:frame_valid_i}



# Add dma_controller_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {dma_controller} -hdl_file {hdl/dma_controller.v} -instance_name {dma_controller_0}



# Add Frame_size_fifo instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {async_fifo} -hdl_file {hdl/async_fifo.v} -instance_name {Frame_size_fifo}
sd_create_pin_group -sd_name ${sd_name} -group_name {Group} -instance_name {Frame_size_fifo} -pin_names {"rhempty_o" "raempty_o" "rdata_count_o" "wafull_o" "rdata_rdy_o" }
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Frame_size_fifo:wafull_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Frame_size_fifo:rdata_rdy_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Frame_size_fifo:raempty_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Frame_size_fifo:rhempty_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {Frame_size_fifo:rdata_count_o}



# Add OR2_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {OR2} -instance_name {OR2_0}
sd_invert_pins -sd_name ${sd_name} -pin_names {OR2_0:A}



# Add synchronizer_circuit_2stage_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {synchronizer_circuit_2stage} -hdl_file {hdl/synchronizer_circuit_2stage.v} -instance_name {synchronizer_circuit_2stage_0}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:A" "line_valid_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:B" "synchronizer_circuit_2stage_0:sync_out_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:Y" "DDR_Write_C0_0:data_valid_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Buffer_address_fifo:rclk_i" "DDR_Write_C0_0:pixel_clk_i" "Frame_size_fifo:wclk_i" "dma_controller_0:sys_clk_i" "synchronizer_circuit_2stage_0:sys_clk_i" "video_source_clk_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Buffer_address_fifo:rdata_rdy_o" "dma_controller_0:fifo_data_valid_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Buffer_address_fifo:rempty_o" "OR2_0:B" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Buffer_address_fifo:ren_i" "dma_controller_0:fifo_rd_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Buffer_address_fifo:rrstn_i" "DDR_Write_C0_0:pixel_rstn_i" "Frame_size_fifo:wrstn_i" "dma_controller_0:rstn_i" "synchronizer_circuit_2stage_0:rstn_i" "video_source_rstn_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Buffer_address_fifo:rstn_i" "Frame_size_fifo:rstn_i" "fifo_rstn_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Buffer_address_fifo:wclk_i" "Frame_size_fifo:rclk_i" "axi_clk_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Buffer_address_fifo:wen_i" "buff_addr_fifo_wen_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Buffer_address_fifo:wfull_o" "buff_addr_fifo_full" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Buffer_address_fifo:wrstn_i" "Frame_size_fifo:rrstn_i" "axi_clk_rstn_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Write_C0_0:data_rdy_o" "data_rdy_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Write_C0_0:ddr_clk_i" "ddr_clk_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Write_C0_0:ddr_clk_rstn_i" "ddr_clk_rstn_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Write_C0_0:frame_valid_i" "dma_controller_0:frame_start_o" "frame_start_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Write_C0_0:write_ackn_i" "write_ackn_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Write_C0_0:write_done_i" "write_done_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Write_C0_0:write_req_o" "write_req_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Frame_size_fifo:rempty_o" "frame_size_fifo_empty" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Frame_size_fifo:ren_i" "frame_size_fifo_ren_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Frame_size_fifo:wen_i" "dma_controller_0:frame_size_fifo_wr_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Frame_size_fifo:wfull_o" "frame_size_fifo_full" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"OR2_0:A" "ip_enbl" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"OR2_0:Y" "buff_addr_fifo_empty" "dma_controller_0:fifo_empty_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"dma_controller_0:ddr_wr_en_o" "synchronizer_circuit_2stage_0:data_in_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"dma_controller_0:dma_ready_o" "dma_ready_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"dma_controller_0:frame_end_interrupt_o" "frame_end_interrupt_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"dma_controller_0:frame_start_i" "frame_start_i" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"Buffer_address_fifo:rdata_count_o" "buff_addr_fifo_rcount_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Buffer_address_fifo:rdata_o" "dma_controller_0:fifo_data_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Buffer_address_fifo:wdata_i" "buff_addr_fifo_data_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Write_C0_0:burst_size_o" "burst_size_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Write_C0_0:data_i" "data_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Write_C0_0:data_o" "data_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Write_C0_0:frame_ddr_addr_i[37:6]" "dma_controller_0:ddr_wr_addr_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Write_C0_0:frame_size_o" "Frame_size_fifo:wdata_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Write_C0_0:line_gap_i" "line_gap_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_Write_C0_0:write_start_addr_o" "write_start_addr_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Frame_size_fifo:rdata_o" "frame_size" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Frame_size_fifo:wdata_count_o" "frame_size_fifo_data_count_o" }


# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the SmartDesign 
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign "dma_with_addr_fifo"
generate_component -component_name ${sd_name}
