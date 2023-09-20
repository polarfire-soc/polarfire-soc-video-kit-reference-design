# Creating SmartDesign "Video_Pipeline"
set sd_name {Video_Pipeline}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_DMA_arvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_DMA_awvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_DMA_bready} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_DMA_rready} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_DMA_wvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_arvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_awvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_bready} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_rready} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_wvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAM1_RX_CLK_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAM1_RX_CLK_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {INIT_DONE} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MASTER_AXI4_arready} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MASTER_AXI4_awready} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MASTER_AXI4_bvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MASTER_AXI4_rlast} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MASTER_AXI4_rvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MASTER_AXI4_wready} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TRNG_RST_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {axi_clk_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {axi_clk_rstn_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ddr_clk_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ddr_clk_rstn_i} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_DMA_arready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_DMA_awready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_DMA_bvalid} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_DMA_rvalid} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_DMA_wready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_arready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_awready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_bvalid} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_rvalid} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_wready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MASTER_AXI4_arvalid} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MASTER_AXI4_awvalid} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MASTER_AXI4_bready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MASTER_AXI4_rready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MASTER_AXI4_wlast} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MASTER_AXI4_wvalid} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {interrupt_dma} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {interrupt_mipi} -port_direction {OUT}


# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_DMA_araddr} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_DMA_arprot} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_DMA_awaddr} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_DMA_awprot} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_DMA_wdata} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_DMA_wstrb} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_araddr} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_arprot} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_awaddr} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_awprot} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_wdata} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_wstrb} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {CAM1_RXD_N} -port_direction {IN} -port_range {[3:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {CAM1_RXD} -port_direction {IN} -port_range {[3:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER_AXI4_bid} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER_AXI4_bresp} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER_AXI4_rdata} -port_direction {IN} -port_range {[511:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER_AXI4_rid} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER_AXI4_rresp} -port_direction {IN} -port_range {[1:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_DMA_bresp} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_DMA_rdata} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_DMA_rresp} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_bresp} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_rdata} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_rresp} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER_AXI4_araddr} -port_direction {OUT} -port_range {[37:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER_AXI4_arburst} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER_AXI4_arcache} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER_AXI4_arid} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER_AXI4_arlen} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER_AXI4_arlock} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER_AXI4_arprot} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER_AXI4_arsize} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER_AXI4_awaddr} -port_direction {OUT} -port_range {[37:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER_AXI4_awburst} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER_AXI4_awcache} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER_AXI4_awid} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER_AXI4_awlen} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER_AXI4_awlock} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER_AXI4_awprot} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER_AXI4_awsize} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER_AXI4_wdata} -port_direction {OUT} -port_range {[511:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER_AXI4_wstrb} -port_direction {OUT} -port_range {[63:0]}


# Create top level Bus interface Ports
sd_create_bif_port -sd_name ${sd_name} -port_name {MASTER_AXI4} -port_bif_vlnv {AMBA:AMBA4:AXI4:r0p0_0} -port_bif_role {master} -port_bif_mapping {\
"AWID:MASTER_AXI4_awid" \
"AWADDR:MASTER_AXI4_awaddr" \
"AWLEN:MASTER_AXI4_awlen" \
"AWSIZE:MASTER_AXI4_awsize" \
"AWBURST:MASTER_AXI4_awburst" \
"AWLOCK:MASTER_AXI4_awlock" \
"AWCACHE:MASTER_AXI4_awcache" \
"AWPROT:MASTER_AXI4_awprot" \
"AWVALID:MASTER_AXI4_awvalid" \
"AWREADY:MASTER_AXI4_awready" \
"WDATA:MASTER_AXI4_wdata" \
"WSTRB:MASTER_AXI4_wstrb" \
"WLAST:MASTER_AXI4_wlast" \
"WVALID:MASTER_AXI4_wvalid" \
"WREADY:MASTER_AXI4_wready" \
"BID:MASTER_AXI4_bid" \
"BRESP:MASTER_AXI4_bresp" \
"BVALID:MASTER_AXI4_bvalid" \
"BREADY:MASTER_AXI4_bready" \
"ARID:MASTER_AXI4_arid" \
"ARADDR:MASTER_AXI4_araddr" \
"ARLEN:MASTER_AXI4_arlen" \
"ARSIZE:MASTER_AXI4_arsize" \
"ARBURST:MASTER_AXI4_arburst" \
"ARLOCK:MASTER_AXI4_arlock" \
"ARCACHE:MASTER_AXI4_arcache" \
"ARPROT:MASTER_AXI4_arprot" \
"ARVALID:MASTER_AXI4_arvalid" \
"ARREADY:MASTER_AXI4_arready" \
"RID:MASTER_AXI4_rid" \
"RDATA:MASTER_AXI4_rdata" \
"RRESP:MASTER_AXI4_rresp" \
"RLAST:MASTER_AXI4_rlast" \
"RVALID:MASTER_AXI4_rvalid" \
"RREADY:MASTER_AXI4_rready" } 

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

# Add DDR_AXI4_ARBITER_PF_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {DDR_AXI4_ARBITER_PF_C0} -instance_name {DDR_AXI4_ARBITER_PF_C0_0}
sd_create_pin_group -sd_name ${sd_name} -group_name {Group} -instance_name {DDR_AXI4_ARBITER_PF_C0_0} -pin_names {"r0_done_o" "r0_rstart_addr_i" "r0_burst_size_i" "r0_req_i" "r0_ack_o" "r0_data_valid_o" "rdata_o" }
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {DDR_AXI4_ARBITER_PF_C0_0:r0_req_i} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {DDR_AXI4_ARBITER_PF_C0_0:r0_ack_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {DDR_AXI4_ARBITER_PF_C0_0:r0_data_valid_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {DDR_AXI4_ARBITER_PF_C0_0:r0_done_o}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {DDR_AXI4_ARBITER_PF_C0_0:r0_burst_size_i} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {DDR_AXI4_ARBITER_PF_C0_0:r0_rstart_addr_i} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {DDR_AXI4_ARBITER_PF_C0_0:rdata_o}



# Add DMA_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {DMA} -instance_name {DMA_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {DMA_0:dma_ready_o}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {DMA_0:frame_start_o}



# Add IMX334_IF_TOP_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {IMX334_IF_TOP} -instance_name {IMX334_IF_TOP_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {IMX334_IF_TOP_0:c1_frame_valid_o}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAM1_RX_CLK_N" "IMX334_IF_TOP_0:CAM1_RX_CLK_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAM1_RX_CLK_P" "IMX334_IF_TOP_0:CAM1_RX_CLK_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_AXI4_ARBITER_PF_C0_0:ddr_ctrl_ready_i" "IMX334_IF_TOP_0:TRNG_RST_N" "TRNG_RST_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_AXI4_ARBITER_PF_C0_0:reset_i" "DMA_0:ddr_clk_rstn_i" "ddr_clk_rstn_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_AXI4_ARBITER_PF_C0_0:sys_clk_i" "DMA_0:ddr_clk_i" "ddr_clk_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_AXI4_ARBITER_PF_C0_0:w0_ack_o" "DMA_0:write_ackn_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_AXI4_ARBITER_PF_C0_0:w0_data_valid_i" "DMA_0:data_rdy_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_AXI4_ARBITER_PF_C0_0:w0_done_o" "DMA_0:write_done_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_AXI4_ARBITER_PF_C0_0:w0_req_i" "DMA_0:write_req_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DMA_0:axi_clk_i" "IMX334_IF_TOP_0:fic_clk" "axi_clk_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DMA_0:axi_clk_rstn_i" "IMX334_IF_TOP_0:fic_rstn" "axi_clk_rstn_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DMA_0:dma_ip_interrupt" "interrupt_dma" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DMA_0:frame_start_i" "IMX334_IF_TOP_0:c1_frame_start_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DMA_0:line_valid_i" "IMX334_IF_TOP_0:c1_line_valid_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DMA_0:video_source_clk_i" "IMX334_IF_TOP_0:PARALLEL_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DMA_0:video_source_rstn_i" "IMX334_IF_TOP_0:PARALLEL_CLK_RESET_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"IMX334_IF_TOP_0:ARST_N" "IMX334_IF_TOP_0:INIT_DONE" "INIT_DONE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"IMX334_IF_TOP_0:interrupt_mipi" "interrupt_mipi" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAM1_RXD" "IMX334_IF_TOP_0:CAM1_RXD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAM1_RXD_N" "IMX334_IF_TOP_0:CAM1_RXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_AXI4_ARBITER_PF_C0_0:w0_burst_size_i" "DMA_0:burst_size_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_AXI4_ARBITER_PF_C0_0:w0_data_i" "DMA_0:data_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_AXI4_ARBITER_PF_C0_0:w0_wstart_addr_i" "DMA_0:write_start_addr_o" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DMA_0:data_i" "IMX334_IF_TOP_0:c1_data_out_o" }

# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4L_DMA" "DMA_0:AXI4L_DMA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4L_MIPI" "IMX334_IF_TOP_0:AXI4L_MIPI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DDR_AXI4_ARBITER_PF_C0_0:MASTER_AXI4" "MASTER_AXI4" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the SmartDesign 
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign "Video_Pipeline"
generate_component -component_name ${sd_name}
