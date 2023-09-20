# Creating SmartDesign "debug_logic_dma"
set sd_name {debug_logic_dma}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {buff_addr_fifo_wen_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {interrupt_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {rstn_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {sys_clk_i} -port_direction {IN}


# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {buff_addr_frm_processor_o} -port_direction {OUT} -port_range {[10:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {frame_processed_count_o} -port_direction {OUT} -port_range {[10:0]}


# Add debug_counters_dma_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {debug_counters_dma} -hdl_file {hdl/debug_counters_dma.v} -instance_name {debug_counters_dma_0}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"buff_addr_fifo_wen_i" "debug_counters_dma_0:buff_addr_fifo_wen_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"debug_counters_dma_0:interrupt_i" "interrupt_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"debug_counters_dma_0:rstn_i" "rstn_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"debug_counters_dma_0:sys_clk_i" "sys_clk_i" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"buff_addr_frm_processor_o" "debug_counters_dma_0:buff_addr_frm_processor_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"debug_counters_dma_0:frame_processed_count_o" "frame_processed_count_o" }


# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the SmartDesign 
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign "debug_logic_dma"
generate_component -component_name ${sd_name}
