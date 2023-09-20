# Creating SmartDesign "interrupt_dma"
set sd_name {interrupt_dma}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {buff_addr_fifo_empty_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {buff_addr_fifo_full_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {frame_end_interrupt_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {frame_size_fifo_empty_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {frame_size_fifo_full_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {glbl_int_en} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ip_en} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {rstn_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {sys_clk_i} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {interrupt_o} -port_direction {OUT}


# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {interrupt_clear_i} -port_direction {IN} -port_range {[4:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {interrupt_en_i} -port_direction {IN} -port_range {[4:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {status_reg_o} -port_direction {OUT} -port_range {[4:0]}


# Add AND2_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {AND2} -instance_name {AND2_0}



# Add interrupt_controller_dma_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {interrupt_controller_dma} -hdl_file {hdl/interrupt_controller_dma.v} -instance_name {interrupt_controller_dma_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {interrupt_controller_dma_0:interrupt_event_i} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {interrupt_controller_dma_0:interrupt_event_i} -pin_slices {[1:1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {interrupt_controller_dma_0:interrupt_event_i} -pin_slices {[2:2]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {interrupt_controller_dma_0:interrupt_event_i} -pin_slices {[3:3]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {interrupt_controller_dma_0:interrupt_event_i} -pin_slices {[4:4]}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {interrupt_controller_dma_0:interrupt_overflow_o}



# Add synchronizer_circuit_2stage_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {synchronizer_circuit_2stage} -hdl_file {hdl/synchronizer_circuit_2stage.v} -instance_name {synchronizer_circuit_2stage_0}



# Add synchronizer_circuit_2stage_1 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {synchronizer_circuit_2stage} -hdl_file {hdl/synchronizer_circuit_2stage.v} -instance_name {synchronizer_circuit_2stage_1}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:A" "glbl_int_en" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:B" "ip_en" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:Y" "interrupt_controller_dma_0:global_interrupt_en_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"buff_addr_fifo_empty_i" "synchronizer_circuit_2stage_0:data_in_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"buff_addr_fifo_full_i" "interrupt_controller_dma_0:interrupt_event_i[1:1]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"frame_end_interrupt_i" "interrupt_controller_dma_0:interrupt_event_i[0:0]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"frame_size_fifo_empty_i" "interrupt_controller_dma_0:interrupt_event_i[4:4]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"frame_size_fifo_full_i" "synchronizer_circuit_2stage_1:data_in_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"interrupt_controller_dma_0:interrupt_event_i[2:2]" "synchronizer_circuit_2stage_0:sync_out_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"interrupt_controller_dma_0:interrupt_event_i[3:3]" "synchronizer_circuit_2stage_1:sync_out_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"interrupt_controller_dma_0:interrupt_o" "interrupt_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"interrupt_controller_dma_0:rstn_i" "rstn_i" "synchronizer_circuit_2stage_0:rstn_i" "synchronizer_circuit_2stage_1:rstn_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"interrupt_controller_dma_0:sys_clk_i" "synchronizer_circuit_2stage_0:sys_clk_i" "synchronizer_circuit_2stage_1:sys_clk_i" "sys_clk_i" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"interrupt_clear_i" "interrupt_controller_dma_0:interrupt_clear_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"interrupt_controller_dma_0:interrupt_en_i" "interrupt_en_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"interrupt_controller_dma_0:status_reg_o" "status_reg_o" }


# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the SmartDesign 
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign "interrupt_dma"
generate_component -component_name ${sd_name}
