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
sd_create_scalar_port -sd_name ${sd_name} -port_name {TRNG_RST_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {axi_clk_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {axi_clk_rstn_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ddr_clk_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ddr_clk_rstn_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {mAXI4_SLAVE_arready} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {mAXI4_SLAVE_awready} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {mAXI4_SLAVE_bvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {mAXI4_SLAVE_rlast} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {mAXI4_SLAVE_rvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {mAXI4_SLAVE_wready} -port_direction {IN}

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
sd_create_scalar_port -sd_name ${sd_name} -port_name {INT_DMA_O} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MIPI_INTERRUPT_O} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {mAXI4_SLAVE_arvalid} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {mAXI4_SLAVE_awvalid} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {mAXI4_SLAVE_bready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {mAXI4_SLAVE_rready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {mAXI4_SLAVE_wlast} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {mAXI4_SLAVE_wvalid} -port_direction {OUT}


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
sd_create_bus_port -sd_name ${sd_name} -port_name {mAXI4_SLAVE_bid} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {mAXI4_SLAVE_bresp} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {mAXI4_SLAVE_rdata} -port_direction {IN} -port_range {[63:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {mAXI4_SLAVE_rid} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {mAXI4_SLAVE_rresp} -port_direction {IN} -port_range {[1:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_DMA_bresp} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_DMA_rdata} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_DMA_rresp} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_bresp} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_rdata} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_rresp} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {mAXI4_SLAVE_araddr} -port_direction {OUT} -port_range {[37:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {mAXI4_SLAVE_arburst} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {mAXI4_SLAVE_arcache} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {mAXI4_SLAVE_arid} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {mAXI4_SLAVE_arlen} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {mAXI4_SLAVE_arlock} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {mAXI4_SLAVE_arprot} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {mAXI4_SLAVE_arsize} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {mAXI4_SLAVE_awaddr} -port_direction {OUT} -port_range {[37:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {mAXI4_SLAVE_awburst} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {mAXI4_SLAVE_awcache} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {mAXI4_SLAVE_awid} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {mAXI4_SLAVE_awlen} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {mAXI4_SLAVE_awlock} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {mAXI4_SLAVE_awprot} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {mAXI4_SLAVE_awsize} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {mAXI4_SLAVE_wdata} -port_direction {OUT} -port_range {[63:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {mAXI4_SLAVE_wstrb} -port_direction {OUT} -port_range {[7:0]}


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

sd_create_bif_port -sd_name ${sd_name} -port_name {mAXI4_SLAVE} -port_bif_vlnv {AMBA:AMBA4:AXI4:r0p0_0} -port_bif_role {mirroredSlave} -port_bif_mapping {\
"AWID:mAXI4_SLAVE_awid" \
"AWADDR:mAXI4_SLAVE_awaddr" \
"AWLEN:mAXI4_SLAVE_awlen" \
"AWSIZE:mAXI4_SLAVE_awsize" \
"AWBURST:mAXI4_SLAVE_awburst" \
"AWLOCK:mAXI4_SLAVE_awlock" \
"AWCACHE:mAXI4_SLAVE_awcache" \
"AWPROT:mAXI4_SLAVE_awprot" \
"AWVALID:mAXI4_SLAVE_awvalid" \
"AWREADY:mAXI4_SLAVE_awready" \
"WDATA:mAXI4_SLAVE_wdata" \
"WSTRB:mAXI4_SLAVE_wstrb" \
"WLAST:mAXI4_SLAVE_wlast" \
"WVALID:mAXI4_SLAVE_wvalid" \
"WREADY:mAXI4_SLAVE_wready" \
"BID:mAXI4_SLAVE_bid" \
"BRESP:mAXI4_SLAVE_bresp" \
"BVALID:mAXI4_SLAVE_bvalid" \
"BREADY:mAXI4_SLAVE_bready" \
"ARID:mAXI4_SLAVE_arid" \
"ARADDR:mAXI4_SLAVE_araddr" \
"ARLEN:mAXI4_SLAVE_arlen" \
"ARSIZE:mAXI4_SLAVE_arsize" \
"ARBURST:mAXI4_SLAVE_arburst" \
"ARLOCK:mAXI4_SLAVE_arlock" \
"ARCACHE:mAXI4_SLAVE_arcache" \
"ARPROT:mAXI4_SLAVE_arprot" \
"ARVALID:mAXI4_SLAVE_arvalid" \
"ARREADY:mAXI4_SLAVE_arready" \
"RID:mAXI4_SLAVE_rid" \
"RDATA:mAXI4_SLAVE_rdata" \
"RRESP:mAXI4_SLAVE_rresp" \
"RLAST:mAXI4_SLAVE_rlast" \
"RVALID:mAXI4_SLAVE_rvalid" \
"RREADY:mAXI4_SLAVE_rready" } 

# Add IMX334_IF_TOP_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {IMX334_IF_TOP} -instance_name {IMX334_IF_TOP_0}



# Add VDMA_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {VDMA_C0} -instance_name {VDMA_C0_0}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAM1_RX_CLK_N" "IMX334_IF_TOP_0:CAM1_RX_CLK_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAM1_RX_CLK_P" "IMX334_IF_TOP_0:CAM1_RX_CLK_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"IMX334_IF_TOP_0:ACLK_I" "VDMA_C0_0:ACLK_I" "axi_clk_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"IMX334_IF_TOP_0:ARESETN_I" "VDMA_C0_0:ARESETN_I" "axi_clk_rstn_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"IMX334_IF_TOP_0:ARST_N" "IMX334_IF_TOP_0:INIT_DONE" "INIT_DONE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"IMX334_IF_TOP_0:MIPI_INTERRUPT_O" "MIPI_INTERRUPT_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"IMX334_IF_TOP_0:PARALLEL_CLK" "VDMA_C0_0:VIDEO_CLK_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"IMX334_IF_TOP_0:PARALLEL_CLK_RESET_N" "VDMA_C0_0:VIDEO_CLK_RSTN_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"IMX334_IF_TOP_0:TRNG_RST_N" "TRNG_RST_N" "VDMA_C0_0:DDR_CTRL_READY_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"IMX334_IF_TOP_0:c1_frame_start_o" "VDMA_C0_0:FRAME_START_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"IMX334_IF_TOP_0:c1_line_valid_o" "VDMA_C0_0:DATA_VALID_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"INT_DMA_O" "VDMA_C0_0:INT_DMA_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"VDMA_C0_0:DDR_CLK_I" "ddr_clk_i" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"VDMA_C0_0:DDR_CLK_RSTN_I" "ddr_clk_rstn_i" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAM1_RXD" "IMX334_IF_TOP_0:CAM1_RXD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAM1_RXD_N" "IMX334_IF_TOP_0:CAM1_RXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"IMX334_IF_TOP_0:c1_data_out_o" "VDMA_C0_0:DATA_I" }

# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4L_DMA" "VDMA_C0_0:AXI4L_VDMA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4L_MIPI" "IMX334_IF_TOP_0:AXI4L_MIPI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"VDMA_C0_0:mAXI4_SLAVE" "mAXI4_SLAVE" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the SmartDesign 
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign "Video_Pipeline"
generate_component -component_name ${sd_name}
