# Creating SmartDesign "Video_Pipeline"
set sd_name {Video_Pipeline}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {ACLK_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ARESETN_I} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_H264_arvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_H264_awvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_H264_bready} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_H264_rready} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_H264_wvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_IE_arvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_IE_awvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_IE_bready} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_IE_rready} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_IE_wvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_arvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_awvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_bready} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_rready} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_wvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_OSD_arvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_OSD_awvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_OSD_bready} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_OSD_rready} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_OSD_wvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_arvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_awvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_bready} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_rready} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_wvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_VDMA_arvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_VDMA_awvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_VDMA_bready} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_VDMA_rready} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_VDMA_wvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAM1_RX_CLK_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CAM1_RX_CLK_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CLK_125MHz_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {INIT_DONE} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LPDDR4_RDY_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RESETN_125MHz_i} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {mAXI4_SLAVE_arready} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {mAXI4_SLAVE_awready} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {mAXI4_SLAVE_bvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {mAXI4_SLAVE_rlast} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {mAXI4_SLAVE_rvalid} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {mAXI4_SLAVE_wready} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_H264_arready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_H264_awready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_H264_bvalid} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_H264_rvalid} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_H264_wready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_IE_arready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_IE_awready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_IE_bvalid} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_IE_rvalid} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_IE_wready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_arready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_awready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_bvalid} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_rvalid} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_wready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_OSD_arready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_OSD_awready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_OSD_bvalid} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_OSD_rvalid} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_OSD_wready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_arready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_awready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_bvalid} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_rvalid} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_wready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_VDMA_arready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_VDMA_awready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_VDMA_bvalid} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_VDMA_rvalid} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_VDMA_wready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {INT_DMA_O} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MIPI_INTERRUPT_O} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {mAXI4_SLAVE_arvalid} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {mAXI4_SLAVE_awvalid} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {mAXI4_SLAVE_bready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {mAXI4_SLAVE_rready} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {mAXI4_SLAVE_wlast} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {mAXI4_SLAVE_wvalid} -port_direction {OUT}


# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_H264_araddr} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_H264_awaddr} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_H264_wdata} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_IE_araddr} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_IE_awaddr} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_IE_wdata} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_araddr} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_awaddr} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_wdata} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_OSD_araddr} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_OSD_awaddr} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_OSD_wdata} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_araddr} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_awaddr} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_wdata} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_VDMA_araddr} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_VDMA_awaddr} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_VDMA_wdata} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {CAM1_RXD_N} -port_direction {IN} -port_range {[3:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {CAM1_RXD} -port_direction {IN} -port_range {[3:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {mAXI4_SLAVE_bid} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {mAXI4_SLAVE_bresp} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {mAXI4_SLAVE_rdata} -port_direction {IN} -port_range {[63:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {mAXI4_SLAVE_rid} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {mAXI4_SLAVE_rresp} -port_direction {IN} -port_range {[1:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_H264_bresp} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_H264_rdata} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_H264_rresp} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_IE_bresp} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_IE_rdata} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_IE_rresp} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_bresp} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_rdata} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_rresp} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_OSD_bresp} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_OSD_rdata} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_OSD_rresp} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_bresp} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_rdata} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_rresp} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_VDMA_bresp} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_VDMA_rdata} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_VDMA_rresp} -port_direction {OUT} -port_range {[1:0]}
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
sd_create_bif_port -sd_name ${sd_name} -port_name {AXI4L_MIPI} -port_bif_vlnv {AMBA:AMBA4:AXI4:r0p0_0} -port_bif_role {slave} -port_bif_mapping {\
"AWADDR:AXI4L_MIPI_awaddr" \
"AWVALID:AXI4L_MIPI_awvalid" \
"AWREADY:AXI4L_MIPI_awready" \
"WDATA:AXI4L_MIPI_wdata" \
"WVALID:AXI4L_MIPI_wvalid" \
"WREADY:AXI4L_MIPI_wready" \
"BRESP:AXI4L_MIPI_bresp" \
"BVALID:AXI4L_MIPI_bvalid" \
"BREADY:AXI4L_MIPI_bready" \
"ARADDR:AXI4L_MIPI_araddr" \
"ARVALID:AXI4L_MIPI_arvalid" \
"ARREADY:AXI4L_MIPI_arready" \
"RDATA:AXI4L_MIPI_rdata" \
"RRESP:AXI4L_MIPI_rresp" \
"RVALID:AXI4L_MIPI_rvalid" \
"RREADY:AXI4L_MIPI_rready" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {AXI4L_H264} -port_bif_vlnv {AMBA:AMBA4:AXI4:r0p0_0} -port_bif_role {slave} -port_bif_mapping {\
"AWADDR:AXI4L_H264_awaddr" \
"AWVALID:AXI4L_H264_awvalid" \
"AWREADY:AXI4L_H264_awready" \
"WDATA:AXI4L_H264_wdata" \
"WVALID:AXI4L_H264_wvalid" \
"WREADY:AXI4L_H264_wready" \
"BRESP:AXI4L_H264_bresp" \
"BVALID:AXI4L_H264_bvalid" \
"BREADY:AXI4L_H264_bready" \
"ARADDR:AXI4L_H264_araddr" \
"ARVALID:AXI4L_H264_arvalid" \
"ARREADY:AXI4L_H264_arready" \
"RDATA:AXI4L_H264_rdata" \
"RRESP:AXI4L_H264_rresp" \
"RVALID:AXI4L_H264_rvalid" \
"RREADY:AXI4L_H264_rready" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {AXI4L_OSD} -port_bif_vlnv {AMBA:AMBA4:AXI4:r0p0_0} -port_bif_role {slave} -port_bif_mapping {\
"AWADDR:AXI4L_OSD_awaddr" \
"AWVALID:AXI4L_OSD_awvalid" \
"AWREADY:AXI4L_OSD_awready" \
"WDATA:AXI4L_OSD_wdata" \
"WVALID:AXI4L_OSD_wvalid" \
"WREADY:AXI4L_OSD_wready" \
"BRESP:AXI4L_OSD_bresp" \
"BVALID:AXI4L_OSD_bvalid" \
"BREADY:AXI4L_OSD_bready" \
"ARADDR:AXI4L_OSD_araddr" \
"ARVALID:AXI4L_OSD_arvalid" \
"ARREADY:AXI4L_OSD_arready" \
"RDATA:AXI4L_OSD_rdata" \
"RRESP:AXI4L_OSD_rresp" \
"RVALID:AXI4L_OSD_rvalid" \
"RREADY:AXI4L_OSD_rready" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {AXI4L_IE} -port_bif_vlnv {AMBA:AMBA4:AXI4:r0p0_0} -port_bif_role {slave} -port_bif_mapping {\
"AWADDR:AXI4L_IE_awaddr" \
"AWVALID:AXI4L_IE_awvalid" \
"AWREADY:AXI4L_IE_awready" \
"WDATA:AXI4L_IE_wdata" \
"WVALID:AXI4L_IE_wvalid" \
"WREADY:AXI4L_IE_wready" \
"BRESP:AXI4L_IE_bresp" \
"BVALID:AXI4L_IE_bvalid" \
"BREADY:AXI4L_IE_bready" \
"ARADDR:AXI4L_IE_araddr" \
"ARVALID:AXI4L_IE_arvalid" \
"ARREADY:AXI4L_IE_arready" \
"RDATA:AXI4L_IE_rdata" \
"RRESP:AXI4L_IE_rresp" \
"RVALID:AXI4L_IE_rvalid" \
"RREADY:AXI4L_IE_rready" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {AXI4L_SCALER} -port_bif_vlnv {AMBA:AMBA4:AXI4:r0p0_0} -port_bif_role {slave} -port_bif_mapping {\
"AWADDR:AXI4L_SCALER_awaddr" \
"AWVALID:AXI4L_SCALER_awvalid" \
"AWREADY:AXI4L_SCALER_awready" \
"WDATA:AXI4L_SCALER_wdata" \
"WVALID:AXI4L_SCALER_wvalid" \
"WREADY:AXI4L_SCALER_wready" \
"BRESP:AXI4L_SCALER_bresp" \
"BVALID:AXI4L_SCALER_bvalid" \
"BREADY:AXI4L_SCALER_bready" \
"ARADDR:AXI4L_SCALER_araddr" \
"ARVALID:AXI4L_SCALER_arvalid" \
"ARREADY:AXI4L_SCALER_arready" \
"RDATA:AXI4L_SCALER_rdata" \
"RRESP:AXI4L_SCALER_rresp" \
"RVALID:AXI4L_SCALER_rvalid" \
"RREADY:AXI4L_SCALER_rready" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {AXI4L_VDMA} -port_bif_vlnv {AMBA:AMBA4:AXI4:r0p0_0} -port_bif_role {slave} -port_bif_mapping {\
"AWADDR:AXI4L_VDMA_awaddr" \
"AWVALID:AXI4L_VDMA_awvalid" \
"AWREADY:AXI4L_VDMA_awready" \
"WDATA:AXI4L_VDMA_wdata" \
"WVALID:AXI4L_VDMA_wvalid" \
"WREADY:AXI4L_VDMA_wready" \
"BRESP:AXI4L_VDMA_bresp" \
"BVALID:AXI4L_VDMA_bvalid" \
"BREADY:AXI4L_VDMA_bready" \
"ARADDR:AXI4L_VDMA_araddr" \
"ARVALID:AXI4L_VDMA_arvalid" \
"ARREADY:AXI4L_VDMA_arready" \
"RDATA:AXI4L_VDMA_rdata" \
"RRESP:AXI4L_VDMA_rresp" \
"RVALID:AXI4L_VDMA_rvalid" \
"RREADY:AXI4L_VDMA_rready" } 

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



# Add VDMA_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {VDMA_C0} -instance_name {VDMA_C0_0}


# Add video_processing_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {video_processing} -instance_name {video_processing_0}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"ACLK_I" "IMX334_IF_TOP_0:ACLK_I" "VDMA_C0_0:ACLK_I" "video_processing_0:ACLK_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ARESETN_I" "IMX334_IF_TOP_0:ARESETN_I" "VDMA_C0_0:ARESETN_I" "video_processing_0:ARESETN_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAM1_RX_CLK_N" "IMX334_IF_TOP_0:CAM1_RX_CLK_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAM1_RX_CLK_P" "IMX334_IF_TOP_0:CAM1_RX_CLK_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLK_125MHz_i" "VDMA_C0_0:DDR_CLK_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"IMX334_IF_TOP_0:ARST_N" "IMX334_IF_TOP_0:INIT_DONE" "INIT_DONE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"IMX334_IF_TOP_0:MIPI_INTERRUPT_O" "MIPI_INTERRUPT_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"IMX334_IF_TOP_0:PARALLEL_CLK" "VDMA_C0_0:VIDEO_CLK_I" "video_processing_0:SYS_CLK_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"IMX334_IF_TOP_0:PARALLEL_CLK_RESET_N" "VDMA_C0_0:VIDEO_CLK_RSTN_I" "video_processing_0:RESETN_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"IMX334_IF_TOP_0:TRNG_RST_N" "LPDDR4_RDY_i" "VDMA_C0_0:DDR_CTRL_READY_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"IMX334_IF_TOP_0:c1_frame_start_o" "video_processing_0:FRAME_START_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"IMX334_IF_TOP_0:c1_line_valid_o" "video_processing_0:DATA_VALID_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"INT_DMA_O" "VDMA_C0_0:INT_DMA_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RESETN_125MHz_i" "VDMA_C0_0:DDR_CLK_RSTN_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"VDMA_C0_0:DATA_VALID_I" "video_processing_0:DATA_VALID_O" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"VDMA_C0_0:FRAME_START_I" "video_processing_0:FRAME_START_O" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAM1_RXD" "IMX334_IF_TOP_0:CAM1_RXD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAM1_RXD_N" "IMX334_IF_TOP_0:CAM1_RXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"IMX334_IF_TOP_0:c1_data_out_o" "video_processing_0:DATA_I" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"VDMA_C0_0:DATA_I" "video_processing_0:DATA_O" }

# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4L_H264" "video_processing_0:AXI4L_H264" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4L_IE" "video_processing_0:AXI4L_IE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4L_MIPI" "IMX334_IF_TOP_0:AXI4L_MIPI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4L_OSD" "video_processing_0:AXI4L_OSD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4L_SCALER" "video_processing_0:AXI4L_SCALER" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4L_VDMA" "VDMA_C0_0:AXI4L_VDMA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"VDMA_C0_0:mAXI4_SLAVE" "mAXI4_SLAVE" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the SmartDesign 
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign "Video_Pipeline"
generate_component -component_name ${sd_name}
