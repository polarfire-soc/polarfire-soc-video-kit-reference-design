# Creating SmartDesign "ip_reset_circuit_dma"
set sd_name {ip_reset_circuit_dma}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {axi_clk_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {axi_clk_rstn_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ddr_clk_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ddr_clk_rstn_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {fifo_rstn_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ip_rstn_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {video_clk_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {video_clk_rstn_i} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {axi_clk_rstn_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ddr_clk_rstn_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {fifo_rstn_o} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {video_clk_rstn_o} -port_direction {OUT}



# Add AND2_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {AND2} -instance_name {AND2_0}



# Add AND2_0_1 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {AND2} -instance_name {AND2_0_1}



# Add AND2_0_2 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {AND2} -instance_name {AND2_0_2}



# Add AND2_1 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {AND2} -instance_name {AND2_1}



# Add synchronizer_circuit_2stage_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {synchronizer_circuit_2stage} -hdl_file {hdl/synchronizer_circuit_2stage.v} -instance_name {synchronizer_circuit_2stage_0}



# Add synchronizer_circuit_2stage_1 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {synchronizer_circuit_2stage} -hdl_file {hdl/synchronizer_circuit_2stage.v} -instance_name {synchronizer_circuit_2stage_1}



# Add synchronizer_circuit_2stage_2 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {synchronizer_circuit_2stage} -hdl_file {hdl/synchronizer_circuit_2stage.v} -instance_name {synchronizer_circuit_2stage_2}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:A" "AND2_0_1:A" "AND2_0_2:A" "AND2_1:A" "ip_rstn_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:B" "axi_clk_rstn_i" "synchronizer_circuit_2stage_0:rstn_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0:Y" "synchronizer_circuit_2stage_0:data_in_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0_1:B" "synchronizer_circuit_2stage_2:rstn_i" "video_clk_rstn_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0_1:Y" "synchronizer_circuit_2stage_2:data_in_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0_2:B" "ddr_clk_rstn_i" "synchronizer_circuit_2stage_1:rstn_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_0_2:Y" "synchronizer_circuit_2stage_1:data_in_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_1:B" "fifo_rstn_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND2_1:Y" "fifo_rstn_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi_clk_i" "synchronizer_circuit_2stage_0:sys_clk_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"axi_clk_rstn_o" "synchronizer_circuit_2stage_0:sync_out_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ddr_clk_i" "synchronizer_circuit_2stage_1:sys_clk_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ddr_clk_rstn_o" "synchronizer_circuit_2stage_1:sync_out_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"synchronizer_circuit_2stage_2:sync_out_o" "video_clk_rstn_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"synchronizer_circuit_2stage_2:sys_clk_i" "video_clk_i" }



# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the SmartDesign 
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign "ip_reset_circuit_dma"
generate_component -component_name ${sd_name}
