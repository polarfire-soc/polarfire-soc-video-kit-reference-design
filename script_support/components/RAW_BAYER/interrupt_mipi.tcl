# Creating SmartDesign "interrupt_mipi"
set sd_name {interrupt_mipi}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {global_interrupt_en_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {mipi_en} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {rstn_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {sys_clk_i} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {interrupt_o} -port_direction {OUT}


# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {interrupt_clear_i} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {interrupt_en_i} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {interrupt_event_i} -port_direction {IN} -port_range {[7:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {status_reg_o} -port_direction {OUT} -port_range {[7:0]}


# Add AND2_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {AND2} -instance_name {AND2_0}



# Add interrupt_controller_mipi_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {interrupt_controller_mipi} -hdl_file {hdl/interrupt_controller_mipi.v} -instance_name {interrupt_controller_mipi_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {interrupt_controller_mipi_0:interrupt_overflow_o}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:A" "global_interrupt_en_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:B" "mipi_en" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:Y" "interrupt_controller_mipi_0:global_interrupt_en_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"interrupt_controller_mipi_0:interrupt_o" "interrupt_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"interrupt_controller_mipi_0:rstn_i" "rstn_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"interrupt_controller_mipi_0:sys_clk_i" "sys_clk_i" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"interrupt_clear_i" "interrupt_controller_mipi_0:interrupt_clear_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"interrupt_controller_mipi_0:interrupt_en_i" "interrupt_en_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"interrupt_controller_mipi_0:interrupt_event_i" "interrupt_event_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"interrupt_controller_mipi_0:status_reg_o" "status_reg_o" }


# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the SmartDesign 
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign "interrupt_mipi"
generate_component -component_name ${sd_name}
