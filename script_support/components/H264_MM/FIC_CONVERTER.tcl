# Creating SmartDesign "FIC_CONVERTER"
set sd_name {FIC_CONVERTER}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {ACLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ARESETN} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_H264_SLAVE2_ARREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_H264_SLAVE2_AWREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_H264_SLAVE2_BVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_H264_SLAVE2_RLAST} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_H264_SLAVE2_RVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_H264_SLAVE2_WREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_IE_SLAVE3_ARREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_IE_SLAVE3_AWREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_IE_SLAVE3_BVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_IE_SLAVE3_RLAST} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_IE_SLAVE3_RVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_IE_SLAVE3_WREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MASTER0_ARVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MASTER0_AWVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MASTER0_BREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MASTER0_RREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MASTER0_WLAST} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MASTER0_WVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_SLAVE1_ARREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_SLAVE1_AWREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_SLAVE1_BVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_SLAVE1_RLAST} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_SLAVE1_RVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_SLAVE1_WREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_OSD_SLAVE5_ARREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_OSD_SLAVE5_AWREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_OSD_SLAVE5_BVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_OSD_SLAVE5_RLAST} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_OSD_SLAVE5_RVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_OSD_SLAVE5_WREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_SLAVE4_ARREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_SLAVE4_AWREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_SLAVE4_BVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_SLAVE4_RLAST} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_SLAVE4_RVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_SLAVE4_WREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_VDMA_SLAVE0_ARREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_VDMA_SLAVE0_AWREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_VDMA_SLAVE0_BVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_VDMA_SLAVE0_RLAST} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_VDMA_SLAVE0_RVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_VDMA_SLAVE0_WREADY} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_H264_SLAVE2_ARVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_H264_SLAVE2_AWVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_H264_SLAVE2_BREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_H264_SLAVE2_RREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_H264_SLAVE2_WLAST} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_H264_SLAVE2_WVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_IE_SLAVE3_ARVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_IE_SLAVE3_AWVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_IE_SLAVE3_BREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_IE_SLAVE3_RREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_IE_SLAVE3_WLAST} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_IE_SLAVE3_WVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MASTER0_ARREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MASTER0_AWREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MASTER0_BVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MASTER0_RLAST} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MASTER0_RVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MASTER0_WREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_SLAVE1_ARVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_SLAVE1_AWVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_SLAVE1_BREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_SLAVE1_RREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_SLAVE1_WLAST} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_SLAVE1_WVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_OSD_SLAVE5_ARVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_OSD_SLAVE5_AWVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_OSD_SLAVE5_BREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_OSD_SLAVE5_RREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_OSD_SLAVE5_WLAST} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_OSD_SLAVE5_WVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_SLAVE4_ARVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_SLAVE4_AWVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_SLAVE4_BREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_SLAVE4_RREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_SLAVE4_WLAST} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_SLAVE4_WVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_VDMA_SLAVE0_ARVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_VDMA_SLAVE0_AWVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_VDMA_SLAVE0_BREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_VDMA_SLAVE0_RREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_VDMA_SLAVE0_WLAST} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_VDMA_SLAVE0_WVALID} -port_direction {OUT}


# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_H264_SLAVE2_BID} -port_direction {IN} -port_range {[8:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_H264_SLAVE2_BRESP} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_H264_SLAVE2_BUSER} -port_direction {IN} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_H264_SLAVE2_RDATA} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_H264_SLAVE2_RID} -port_direction {IN} -port_range {[8:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_H264_SLAVE2_RRESP} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_H264_SLAVE2_RUSER} -port_direction {IN} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_IE_SLAVE3_BID} -port_direction {IN} -port_range {[8:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_IE_SLAVE3_BRESP} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_IE_SLAVE3_BUSER} -port_direction {IN} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_IE_SLAVE3_RDATA} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_IE_SLAVE3_RID} -port_direction {IN} -port_range {[8:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_IE_SLAVE3_RRESP} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_IE_SLAVE3_RUSER} -port_direction {IN} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MASTER0_ARADDR} -port_direction {IN} -port_range {[37:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MASTER0_ARBURST} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MASTER0_ARCACHE} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MASTER0_ARID} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MASTER0_ARLEN} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MASTER0_ARLOCK} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MASTER0_ARPROT} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MASTER0_ARQOS} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MASTER0_ARREGION} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MASTER0_ARSIZE} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MASTER0_ARUSER} -port_direction {IN} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MASTER0_AWADDR} -port_direction {IN} -port_range {[37:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MASTER0_AWBURST} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MASTER0_AWCACHE} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MASTER0_AWID} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MASTER0_AWLEN} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MASTER0_AWLOCK} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MASTER0_AWPROT} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MASTER0_AWQOS} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MASTER0_AWREGION} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MASTER0_AWSIZE} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MASTER0_AWUSER} -port_direction {IN} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MASTER0_WDATA} -port_direction {IN} -port_range {[63:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MASTER0_WSTRB} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MASTER0_WUSER} -port_direction {IN} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_SLAVE1_BID} -port_direction {IN} -port_range {[8:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_SLAVE1_BRESP} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_SLAVE1_BUSER} -port_direction {IN} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_SLAVE1_RDATA} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_SLAVE1_RID} -port_direction {IN} -port_range {[8:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_SLAVE1_RRESP} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_SLAVE1_RUSER} -port_direction {IN} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_OSD_SLAVE5_BID} -port_direction {IN} -port_range {[8:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_OSD_SLAVE5_BRESP} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_OSD_SLAVE5_BUSER} -port_direction {IN} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_OSD_SLAVE5_RDATA} -port_direction {IN} -port_range {[63:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_OSD_SLAVE5_RID} -port_direction {IN} -port_range {[8:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_OSD_SLAVE5_RRESP} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_OSD_SLAVE5_RUSER} -port_direction {IN} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_SLAVE4_BID} -port_direction {IN} -port_range {[8:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_SLAVE4_BRESP} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_SLAVE4_BUSER} -port_direction {IN} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_SLAVE4_RDATA} -port_direction {IN} -port_range {[63:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_SLAVE4_RID} -port_direction {IN} -port_range {[8:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_SLAVE4_RRESP} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_SLAVE4_RUSER} -port_direction {IN} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_VDMA_SLAVE0_BID} -port_direction {IN} -port_range {[8:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_VDMA_SLAVE0_BRESP} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_VDMA_SLAVE0_BUSER} -port_direction {IN} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_VDMA_SLAVE0_RDATA} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_VDMA_SLAVE0_RID} -port_direction {IN} -port_range {[8:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_VDMA_SLAVE0_RRESP} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_VDMA_SLAVE0_RUSER} -port_direction {IN} -port_range {[0:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_H264_SLAVE2_ARADDR} -port_direction {OUT} -port_range {[37:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_H264_SLAVE2_ARBURST} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_H264_SLAVE2_ARCACHE} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_H264_SLAVE2_ARID} -port_direction {OUT} -port_range {[8:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_H264_SLAVE2_ARLEN} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_H264_SLAVE2_ARLOCK} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_H264_SLAVE2_ARPROT} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_H264_SLAVE2_ARQOS} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_H264_SLAVE2_ARREGION} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_H264_SLAVE2_ARSIZE} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_H264_SLAVE2_ARUSER} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_H264_SLAVE2_AWADDR} -port_direction {OUT} -port_range {[37:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_H264_SLAVE2_AWBURST} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_H264_SLAVE2_AWCACHE} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_H264_SLAVE2_AWID} -port_direction {OUT} -port_range {[8:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_H264_SLAVE2_AWLEN} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_H264_SLAVE2_AWLOCK} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_H264_SLAVE2_AWPROT} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_H264_SLAVE2_AWQOS} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_H264_SLAVE2_AWREGION} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_H264_SLAVE2_AWSIZE} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_H264_SLAVE2_AWUSER} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_H264_SLAVE2_WDATA} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_H264_SLAVE2_WSTRB} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_H264_SLAVE2_WUSER} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_IE_SLAVE3_ARADDR} -port_direction {OUT} -port_range {[37:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_IE_SLAVE3_ARBURST} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_IE_SLAVE3_ARCACHE} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_IE_SLAVE3_ARID} -port_direction {OUT} -port_range {[8:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_IE_SLAVE3_ARLEN} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_IE_SLAVE3_ARLOCK} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_IE_SLAVE3_ARPROT} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_IE_SLAVE3_ARQOS} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_IE_SLAVE3_ARREGION} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_IE_SLAVE3_ARSIZE} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_IE_SLAVE3_ARUSER} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_IE_SLAVE3_AWADDR} -port_direction {OUT} -port_range {[37:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_IE_SLAVE3_AWBURST} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_IE_SLAVE3_AWCACHE} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_IE_SLAVE3_AWID} -port_direction {OUT} -port_range {[8:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_IE_SLAVE3_AWLEN} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_IE_SLAVE3_AWLOCK} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_IE_SLAVE3_AWPROT} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_IE_SLAVE3_AWQOS} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_IE_SLAVE3_AWREGION} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_IE_SLAVE3_AWSIZE} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_IE_SLAVE3_AWUSER} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_IE_SLAVE3_WDATA} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_IE_SLAVE3_WSTRB} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_IE_SLAVE3_WUSER} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MASTER0_BID} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MASTER0_BRESP} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MASTER0_BUSER} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MASTER0_RDATA} -port_direction {OUT} -port_range {[63:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MASTER0_RID} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MASTER0_RRESP} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MASTER0_RUSER} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_SLAVE1_ARADDR} -port_direction {OUT} -port_range {[37:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_SLAVE1_ARBURST} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_SLAVE1_ARCACHE} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_SLAVE1_ARID} -port_direction {OUT} -port_range {[8:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_SLAVE1_ARLEN} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_SLAVE1_ARLOCK} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_SLAVE1_ARPROT} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_SLAVE1_ARQOS} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_SLAVE1_ARREGION} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_SLAVE1_ARSIZE} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_SLAVE1_ARUSER} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_SLAVE1_AWADDR} -port_direction {OUT} -port_range {[37:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_SLAVE1_AWBURST} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_SLAVE1_AWCACHE} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_SLAVE1_AWID} -port_direction {OUT} -port_range {[8:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_SLAVE1_AWLEN} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_SLAVE1_AWLOCK} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_SLAVE1_AWPROT} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_SLAVE1_AWQOS} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_SLAVE1_AWREGION} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_SLAVE1_AWSIZE} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_SLAVE1_AWUSER} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_SLAVE1_WDATA} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_SLAVE1_WSTRB} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_SLAVE1_WUSER} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_OSD_SLAVE5_ARADDR} -port_direction {OUT} -port_range {[37:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_OSD_SLAVE5_ARBURST} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_OSD_SLAVE5_ARCACHE} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_OSD_SLAVE5_ARID} -port_direction {OUT} -port_range {[8:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_OSD_SLAVE5_ARLEN} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_OSD_SLAVE5_ARLOCK} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_OSD_SLAVE5_ARPROT} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_OSD_SLAVE5_ARQOS} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_OSD_SLAVE5_ARREGION} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_OSD_SLAVE5_ARSIZE} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_OSD_SLAVE5_ARUSER} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_OSD_SLAVE5_AWADDR} -port_direction {OUT} -port_range {[37:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_OSD_SLAVE5_AWBURST} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_OSD_SLAVE5_AWCACHE} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_OSD_SLAVE5_AWID} -port_direction {OUT} -port_range {[8:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_OSD_SLAVE5_AWLEN} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_OSD_SLAVE5_AWLOCK} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_OSD_SLAVE5_AWPROT} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_OSD_SLAVE5_AWQOS} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_OSD_SLAVE5_AWREGION} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_OSD_SLAVE5_AWSIZE} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_OSD_SLAVE5_AWUSER} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_OSD_SLAVE5_WDATA} -port_direction {OUT} -port_range {[63:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_OSD_SLAVE5_WSTRB} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_OSD_SLAVE5_WUSER} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_SLAVE4_ARADDR} -port_direction {OUT} -port_range {[37:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_SLAVE4_ARBURST} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_SLAVE4_ARCACHE} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_SLAVE4_ARID} -port_direction {OUT} -port_range {[8:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_SLAVE4_ARLEN} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_SLAVE4_ARLOCK} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_SLAVE4_ARPROT} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_SLAVE4_ARQOS} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_SLAVE4_ARREGION} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_SLAVE4_ARSIZE} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_SLAVE4_ARUSER} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_SLAVE4_AWADDR} -port_direction {OUT} -port_range {[37:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_SLAVE4_AWBURST} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_SLAVE4_AWCACHE} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_SLAVE4_AWID} -port_direction {OUT} -port_range {[8:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_SLAVE4_AWLEN} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_SLAVE4_AWLOCK} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_SLAVE4_AWPROT} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_SLAVE4_AWQOS} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_SLAVE4_AWREGION} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_SLAVE4_AWSIZE} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_SLAVE4_AWUSER} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_SLAVE4_WDATA} -port_direction {OUT} -port_range {[63:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_SLAVE4_WSTRB} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_SCALER_SLAVE4_WUSER} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_VDMA_SLAVE0_ARADDR} -port_direction {OUT} -port_range {[37:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_VDMA_SLAVE0_ARBURST} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_VDMA_SLAVE0_ARCACHE} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_VDMA_SLAVE0_ARID} -port_direction {OUT} -port_range {[8:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_VDMA_SLAVE0_ARLEN} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_VDMA_SLAVE0_ARLOCK} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_VDMA_SLAVE0_ARPROT} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_VDMA_SLAVE0_ARQOS} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_VDMA_SLAVE0_ARREGION} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_VDMA_SLAVE0_ARSIZE} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_VDMA_SLAVE0_ARUSER} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_VDMA_SLAVE0_AWADDR} -port_direction {OUT} -port_range {[37:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_VDMA_SLAVE0_AWBURST} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_VDMA_SLAVE0_AWCACHE} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_VDMA_SLAVE0_AWID} -port_direction {OUT} -port_range {[8:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_VDMA_SLAVE0_AWLEN} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_VDMA_SLAVE0_AWLOCK} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_VDMA_SLAVE0_AWPROT} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_VDMA_SLAVE0_AWQOS} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_VDMA_SLAVE0_AWREGION} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_VDMA_SLAVE0_AWSIZE} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_VDMA_SLAVE0_AWUSER} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_VDMA_SLAVE0_WDATA} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_VDMA_SLAVE0_WSTRB} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_VDMA_SLAVE0_WUSER} -port_direction {OUT} -port_range {[0:0]}


# Create top level Bus interface Ports
sd_create_bif_port -sd_name ${sd_name} -port_name {AXI4L_VDMA} -port_bif_vlnv {AMBA:AMBA4:AXI4:r0p0_0} -port_bif_role {mirroredSlave} -port_bif_mapping {\
"AWID:AXI4L_VDMA_SLAVE0_AWID" \
"AWADDR:AXI4L_VDMA_SLAVE0_AWADDR" \
"AWLEN:AXI4L_VDMA_SLAVE0_AWLEN" \
"AWSIZE:AXI4L_VDMA_SLAVE0_AWSIZE" \
"AWBURST:AXI4L_VDMA_SLAVE0_AWBURST" \
"AWLOCK:AXI4L_VDMA_SLAVE0_AWLOCK" \
"AWCACHE:AXI4L_VDMA_SLAVE0_AWCACHE" \
"AWPROT:AXI4L_VDMA_SLAVE0_AWPROT" \
"AWQOS:AXI4L_VDMA_SLAVE0_AWQOS" \
"AWREGION:AXI4L_VDMA_SLAVE0_AWREGION" \
"AWVALID:AXI4L_VDMA_SLAVE0_AWVALID" \
"AWREADY:AXI4L_VDMA_SLAVE0_AWREADY" \
"WDATA:AXI4L_VDMA_SLAVE0_WDATA" \
"WSTRB:AXI4L_VDMA_SLAVE0_WSTRB" \
"WLAST:AXI4L_VDMA_SLAVE0_WLAST" \
"WVALID:AXI4L_VDMA_SLAVE0_WVALID" \
"WREADY:AXI4L_VDMA_SLAVE0_WREADY" \
"BID:AXI4L_VDMA_SLAVE0_BID" \
"BRESP:AXI4L_VDMA_SLAVE0_BRESP" \
"BVALID:AXI4L_VDMA_SLAVE0_BVALID" \
"BREADY:AXI4L_VDMA_SLAVE0_BREADY" \
"ARID:AXI4L_VDMA_SLAVE0_ARID" \
"ARADDR:AXI4L_VDMA_SLAVE0_ARADDR" \
"ARLEN:AXI4L_VDMA_SLAVE0_ARLEN" \
"ARSIZE:AXI4L_VDMA_SLAVE0_ARSIZE" \
"ARBURST:AXI4L_VDMA_SLAVE0_ARBURST" \
"ARLOCK:AXI4L_VDMA_SLAVE0_ARLOCK" \
"ARCACHE:AXI4L_VDMA_SLAVE0_ARCACHE" \
"ARPROT:AXI4L_VDMA_SLAVE0_ARPROT" \
"ARQOS:AXI4L_VDMA_SLAVE0_ARQOS" \
"ARREGION:AXI4L_VDMA_SLAVE0_ARREGION" \
"ARVALID:AXI4L_VDMA_SLAVE0_ARVALID" \
"ARREADY:AXI4L_VDMA_SLAVE0_ARREADY" \
"RID:AXI4L_VDMA_SLAVE0_RID" \
"RDATA:AXI4L_VDMA_SLAVE0_RDATA" \
"RRESP:AXI4L_VDMA_SLAVE0_RRESP" \
"RLAST:AXI4L_VDMA_SLAVE0_RLAST" \
"RVALID:AXI4L_VDMA_SLAVE0_RVALID" \
"RREADY:AXI4L_VDMA_SLAVE0_RREADY" \
"AWUSER:AXI4L_VDMA_SLAVE0_AWUSER" \
"WUSER:AXI4L_VDMA_SLAVE0_WUSER" \
"BUSER:AXI4L_VDMA_SLAVE0_BUSER" \
"ARUSER:AXI4L_VDMA_SLAVE0_ARUSER" \
"RUSER:AXI4L_VDMA_SLAVE0_RUSER" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {AXI4L_MIPI} -port_bif_vlnv {AMBA:AMBA4:AXI4:r0p0_0} -port_bif_role {mirroredSlave} -port_bif_mapping {\
"AWID:AXI4L_MIPI_SLAVE1_AWID" \
"AWADDR:AXI4L_MIPI_SLAVE1_AWADDR" \
"AWLEN:AXI4L_MIPI_SLAVE1_AWLEN" \
"AWSIZE:AXI4L_MIPI_SLAVE1_AWSIZE" \
"AWBURST:AXI4L_MIPI_SLAVE1_AWBURST" \
"AWLOCK:AXI4L_MIPI_SLAVE1_AWLOCK" \
"AWCACHE:AXI4L_MIPI_SLAVE1_AWCACHE" \
"AWPROT:AXI4L_MIPI_SLAVE1_AWPROT" \
"AWQOS:AXI4L_MIPI_SLAVE1_AWQOS" \
"AWREGION:AXI4L_MIPI_SLAVE1_AWREGION" \
"AWVALID:AXI4L_MIPI_SLAVE1_AWVALID" \
"AWREADY:AXI4L_MIPI_SLAVE1_AWREADY" \
"WDATA:AXI4L_MIPI_SLAVE1_WDATA" \
"WSTRB:AXI4L_MIPI_SLAVE1_WSTRB" \
"WLAST:AXI4L_MIPI_SLAVE1_WLAST" \
"WVALID:AXI4L_MIPI_SLAVE1_WVALID" \
"WREADY:AXI4L_MIPI_SLAVE1_WREADY" \
"BID:AXI4L_MIPI_SLAVE1_BID" \
"BRESP:AXI4L_MIPI_SLAVE1_BRESP" \
"BVALID:AXI4L_MIPI_SLAVE1_BVALID" \
"BREADY:AXI4L_MIPI_SLAVE1_BREADY" \
"ARID:AXI4L_MIPI_SLAVE1_ARID" \
"ARADDR:AXI4L_MIPI_SLAVE1_ARADDR" \
"ARLEN:AXI4L_MIPI_SLAVE1_ARLEN" \
"ARSIZE:AXI4L_MIPI_SLAVE1_ARSIZE" \
"ARBURST:AXI4L_MIPI_SLAVE1_ARBURST" \
"ARLOCK:AXI4L_MIPI_SLAVE1_ARLOCK" \
"ARCACHE:AXI4L_MIPI_SLAVE1_ARCACHE" \
"ARPROT:AXI4L_MIPI_SLAVE1_ARPROT" \
"ARQOS:AXI4L_MIPI_SLAVE1_ARQOS" \
"ARREGION:AXI4L_MIPI_SLAVE1_ARREGION" \
"ARVALID:AXI4L_MIPI_SLAVE1_ARVALID" \
"ARREADY:AXI4L_MIPI_SLAVE1_ARREADY" \
"RID:AXI4L_MIPI_SLAVE1_RID" \
"RDATA:AXI4L_MIPI_SLAVE1_RDATA" \
"RRESP:AXI4L_MIPI_SLAVE1_RRESP" \
"RLAST:AXI4L_MIPI_SLAVE1_RLAST" \
"RVALID:AXI4L_MIPI_SLAVE1_RVALID" \
"RREADY:AXI4L_MIPI_SLAVE1_RREADY" \
"AWUSER:AXI4L_MIPI_SLAVE1_AWUSER" \
"WUSER:AXI4L_MIPI_SLAVE1_WUSER" \
"BUSER:AXI4L_MIPI_SLAVE1_BUSER" \
"ARUSER:AXI4L_MIPI_SLAVE1_ARUSER" \
"RUSER:AXI4L_MIPI_SLAVE1_RUSER" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {AXI4L_H264} -port_bif_vlnv {AMBA:AMBA4:AXI4:r0p0_0} -port_bif_role {mirroredSlave} -port_bif_mapping {\
"AWID:AXI4L_H264_SLAVE2_AWID" \
"AWADDR:AXI4L_H264_SLAVE2_AWADDR" \
"AWLEN:AXI4L_H264_SLAVE2_AWLEN" \
"AWSIZE:AXI4L_H264_SLAVE2_AWSIZE" \
"AWBURST:AXI4L_H264_SLAVE2_AWBURST" \
"AWLOCK:AXI4L_H264_SLAVE2_AWLOCK" \
"AWCACHE:AXI4L_H264_SLAVE2_AWCACHE" \
"AWPROT:AXI4L_H264_SLAVE2_AWPROT" \
"AWQOS:AXI4L_H264_SLAVE2_AWQOS" \
"AWREGION:AXI4L_H264_SLAVE2_AWREGION" \
"AWVALID:AXI4L_H264_SLAVE2_AWVALID" \
"AWREADY:AXI4L_H264_SLAVE2_AWREADY" \
"WDATA:AXI4L_H264_SLAVE2_WDATA" \
"WSTRB:AXI4L_H264_SLAVE2_WSTRB" \
"WLAST:AXI4L_H264_SLAVE2_WLAST" \
"WVALID:AXI4L_H264_SLAVE2_WVALID" \
"WREADY:AXI4L_H264_SLAVE2_WREADY" \
"BID:AXI4L_H264_SLAVE2_BID" \
"BRESP:AXI4L_H264_SLAVE2_BRESP" \
"BVALID:AXI4L_H264_SLAVE2_BVALID" \
"BREADY:AXI4L_H264_SLAVE2_BREADY" \
"ARID:AXI4L_H264_SLAVE2_ARID" \
"ARADDR:AXI4L_H264_SLAVE2_ARADDR" \
"ARLEN:AXI4L_H264_SLAVE2_ARLEN" \
"ARSIZE:AXI4L_H264_SLAVE2_ARSIZE" \
"ARBURST:AXI4L_H264_SLAVE2_ARBURST" \
"ARLOCK:AXI4L_H264_SLAVE2_ARLOCK" \
"ARCACHE:AXI4L_H264_SLAVE2_ARCACHE" \
"ARPROT:AXI4L_H264_SLAVE2_ARPROT" \
"ARQOS:AXI4L_H264_SLAVE2_ARQOS" \
"ARREGION:AXI4L_H264_SLAVE2_ARREGION" \
"ARVALID:AXI4L_H264_SLAVE2_ARVALID" \
"ARREADY:AXI4L_H264_SLAVE2_ARREADY" \
"RID:AXI4L_H264_SLAVE2_RID" \
"RDATA:AXI4L_H264_SLAVE2_RDATA" \
"RRESP:AXI4L_H264_SLAVE2_RRESP" \
"RLAST:AXI4L_H264_SLAVE2_RLAST" \
"RVALID:AXI4L_H264_SLAVE2_RVALID" \
"RREADY:AXI4L_H264_SLAVE2_RREADY" \
"AWUSER:AXI4L_H264_SLAVE2_AWUSER" \
"WUSER:AXI4L_H264_SLAVE2_WUSER" \
"BUSER:AXI4L_H264_SLAVE2_BUSER" \
"ARUSER:AXI4L_H264_SLAVE2_ARUSER" \
"RUSER:AXI4L_H264_SLAVE2_RUSER" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {AXI4L_IE} -port_bif_vlnv {AMBA:AMBA4:AXI4:r0p0_0} -port_bif_role {mirroredSlave} -port_bif_mapping {\
"AWID:AXI4L_IE_SLAVE3_AWID" \
"AWADDR:AXI4L_IE_SLAVE3_AWADDR" \
"AWLEN:AXI4L_IE_SLAVE3_AWLEN" \
"AWSIZE:AXI4L_IE_SLAVE3_AWSIZE" \
"AWBURST:AXI4L_IE_SLAVE3_AWBURST" \
"AWLOCK:AXI4L_IE_SLAVE3_AWLOCK" \
"AWCACHE:AXI4L_IE_SLAVE3_AWCACHE" \
"AWPROT:AXI4L_IE_SLAVE3_AWPROT" \
"AWQOS:AXI4L_IE_SLAVE3_AWQOS" \
"AWREGION:AXI4L_IE_SLAVE3_AWREGION" \
"AWVALID:AXI4L_IE_SLAVE3_AWVALID" \
"AWREADY:AXI4L_IE_SLAVE3_AWREADY" \
"WDATA:AXI4L_IE_SLAVE3_WDATA" \
"WSTRB:AXI4L_IE_SLAVE3_WSTRB" \
"WLAST:AXI4L_IE_SLAVE3_WLAST" \
"WVALID:AXI4L_IE_SLAVE3_WVALID" \
"WREADY:AXI4L_IE_SLAVE3_WREADY" \
"BID:AXI4L_IE_SLAVE3_BID" \
"BRESP:AXI4L_IE_SLAVE3_BRESP" \
"BVALID:AXI4L_IE_SLAVE3_BVALID" \
"BREADY:AXI4L_IE_SLAVE3_BREADY" \
"ARID:AXI4L_IE_SLAVE3_ARID" \
"ARADDR:AXI4L_IE_SLAVE3_ARADDR" \
"ARLEN:AXI4L_IE_SLAVE3_ARLEN" \
"ARSIZE:AXI4L_IE_SLAVE3_ARSIZE" \
"ARBURST:AXI4L_IE_SLAVE3_ARBURST" \
"ARLOCK:AXI4L_IE_SLAVE3_ARLOCK" \
"ARCACHE:AXI4L_IE_SLAVE3_ARCACHE" \
"ARPROT:AXI4L_IE_SLAVE3_ARPROT" \
"ARQOS:AXI4L_IE_SLAVE3_ARQOS" \
"ARREGION:AXI4L_IE_SLAVE3_ARREGION" \
"ARVALID:AXI4L_IE_SLAVE3_ARVALID" \
"ARREADY:AXI4L_IE_SLAVE3_ARREADY" \
"RID:AXI4L_IE_SLAVE3_RID" \
"RDATA:AXI4L_IE_SLAVE3_RDATA" \
"RRESP:AXI4L_IE_SLAVE3_RRESP" \
"RLAST:AXI4L_IE_SLAVE3_RLAST" \
"RVALID:AXI4L_IE_SLAVE3_RVALID" \
"RREADY:AXI4L_IE_SLAVE3_RREADY" \
"AWUSER:AXI4L_IE_SLAVE3_AWUSER" \
"WUSER:AXI4L_IE_SLAVE3_WUSER" \
"BUSER:AXI4L_IE_SLAVE3_BUSER" \
"ARUSER:AXI4L_IE_SLAVE3_ARUSER" \
"RUSER:AXI4L_IE_SLAVE3_RUSER" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {AXI4L_SCALER} -port_bif_vlnv {AMBA:AMBA4:AXI4:r0p0_0} -port_bif_role {mirroredSlave} -port_bif_mapping {\
"AWID:AXI4L_SCALER_SLAVE4_AWID" \
"AWADDR:AXI4L_SCALER_SLAVE4_AWADDR" \
"AWLEN:AXI4L_SCALER_SLAVE4_AWLEN" \
"AWSIZE:AXI4L_SCALER_SLAVE4_AWSIZE" \
"AWBURST:AXI4L_SCALER_SLAVE4_AWBURST" \
"AWLOCK:AXI4L_SCALER_SLAVE4_AWLOCK" \
"AWCACHE:AXI4L_SCALER_SLAVE4_AWCACHE" \
"AWPROT:AXI4L_SCALER_SLAVE4_AWPROT" \
"AWQOS:AXI4L_SCALER_SLAVE4_AWQOS" \
"AWREGION:AXI4L_SCALER_SLAVE4_AWREGION" \
"AWVALID:AXI4L_SCALER_SLAVE4_AWVALID" \
"AWREADY:AXI4L_SCALER_SLAVE4_AWREADY" \
"WDATA:AXI4L_SCALER_SLAVE4_WDATA" \
"WSTRB:AXI4L_SCALER_SLAVE4_WSTRB" \
"WLAST:AXI4L_SCALER_SLAVE4_WLAST" \
"WVALID:AXI4L_SCALER_SLAVE4_WVALID" \
"WREADY:AXI4L_SCALER_SLAVE4_WREADY" \
"BID:AXI4L_SCALER_SLAVE4_BID" \
"BRESP:AXI4L_SCALER_SLAVE4_BRESP" \
"BVALID:AXI4L_SCALER_SLAVE4_BVALID" \
"BREADY:AXI4L_SCALER_SLAVE4_BREADY" \
"ARID:AXI4L_SCALER_SLAVE4_ARID" \
"ARADDR:AXI4L_SCALER_SLAVE4_ARADDR" \
"ARLEN:AXI4L_SCALER_SLAVE4_ARLEN" \
"ARSIZE:AXI4L_SCALER_SLAVE4_ARSIZE" \
"ARBURST:AXI4L_SCALER_SLAVE4_ARBURST" \
"ARLOCK:AXI4L_SCALER_SLAVE4_ARLOCK" \
"ARCACHE:AXI4L_SCALER_SLAVE4_ARCACHE" \
"ARPROT:AXI4L_SCALER_SLAVE4_ARPROT" \
"ARQOS:AXI4L_SCALER_SLAVE4_ARQOS" \
"ARREGION:AXI4L_SCALER_SLAVE4_ARREGION" \
"ARVALID:AXI4L_SCALER_SLAVE4_ARVALID" \
"ARREADY:AXI4L_SCALER_SLAVE4_ARREADY" \
"RID:AXI4L_SCALER_SLAVE4_RID" \
"RDATA:AXI4L_SCALER_SLAVE4_RDATA" \
"RRESP:AXI4L_SCALER_SLAVE4_RRESP" \
"RLAST:AXI4L_SCALER_SLAVE4_RLAST" \
"RVALID:AXI4L_SCALER_SLAVE4_RVALID" \
"RREADY:AXI4L_SCALER_SLAVE4_RREADY" \
"AWUSER:AXI4L_SCALER_SLAVE4_AWUSER" \
"WUSER:AXI4L_SCALER_SLAVE4_WUSER" \
"BUSER:AXI4L_SCALER_SLAVE4_BUSER" \
"ARUSER:AXI4L_SCALER_SLAVE4_ARUSER" \
"RUSER:AXI4L_SCALER_SLAVE4_RUSER" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {AXI4L_OSD} -port_bif_vlnv {AMBA:AMBA4:AXI4:r0p0_0} -port_bif_role {mirroredSlave} -port_bif_mapping {\
"AWID:AXI4L_OSD_SLAVE5_AWID" \
"AWADDR:AXI4L_OSD_SLAVE5_AWADDR" \
"AWLEN:AXI4L_OSD_SLAVE5_AWLEN" \
"AWSIZE:AXI4L_OSD_SLAVE5_AWSIZE" \
"AWBURST:AXI4L_OSD_SLAVE5_AWBURST" \
"AWLOCK:AXI4L_OSD_SLAVE5_AWLOCK" \
"AWCACHE:AXI4L_OSD_SLAVE5_AWCACHE" \
"AWPROT:AXI4L_OSD_SLAVE5_AWPROT" \
"AWQOS:AXI4L_OSD_SLAVE5_AWQOS" \
"AWREGION:AXI4L_OSD_SLAVE5_AWREGION" \
"AWVALID:AXI4L_OSD_SLAVE5_AWVALID" \
"AWREADY:AXI4L_OSD_SLAVE5_AWREADY" \
"WDATA:AXI4L_OSD_SLAVE5_WDATA" \
"WSTRB:AXI4L_OSD_SLAVE5_WSTRB" \
"WLAST:AXI4L_OSD_SLAVE5_WLAST" \
"WVALID:AXI4L_OSD_SLAVE5_WVALID" \
"WREADY:AXI4L_OSD_SLAVE5_WREADY" \
"BID:AXI4L_OSD_SLAVE5_BID" \
"BRESP:AXI4L_OSD_SLAVE5_BRESP" \
"BVALID:AXI4L_OSD_SLAVE5_BVALID" \
"BREADY:AXI4L_OSD_SLAVE5_BREADY" \
"ARID:AXI4L_OSD_SLAVE5_ARID" \
"ARADDR:AXI4L_OSD_SLAVE5_ARADDR" \
"ARLEN:AXI4L_OSD_SLAVE5_ARLEN" \
"ARSIZE:AXI4L_OSD_SLAVE5_ARSIZE" \
"ARBURST:AXI4L_OSD_SLAVE5_ARBURST" \
"ARLOCK:AXI4L_OSD_SLAVE5_ARLOCK" \
"ARCACHE:AXI4L_OSD_SLAVE5_ARCACHE" \
"ARPROT:AXI4L_OSD_SLAVE5_ARPROT" \
"ARQOS:AXI4L_OSD_SLAVE5_ARQOS" \
"ARREGION:AXI4L_OSD_SLAVE5_ARREGION" \
"ARVALID:AXI4L_OSD_SLAVE5_ARVALID" \
"ARREADY:AXI4L_OSD_SLAVE5_ARREADY" \
"RID:AXI4L_OSD_SLAVE5_RID" \
"RDATA:AXI4L_OSD_SLAVE5_RDATA" \
"RRESP:AXI4L_OSD_SLAVE5_RRESP" \
"RLAST:AXI4L_OSD_SLAVE5_RLAST" \
"RVALID:AXI4L_OSD_SLAVE5_RVALID" \
"RREADY:AXI4L_OSD_SLAVE5_RREADY" \
"AWUSER:AXI4L_OSD_SLAVE5_AWUSER" \
"WUSER:AXI4L_OSD_SLAVE5_WUSER" \
"BUSER:AXI4L_OSD_SLAVE5_BUSER" \
"ARUSER:AXI4L_OSD_SLAVE5_ARUSER" \
"RUSER:AXI4L_OSD_SLAVE5_RUSER" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {AXI4L} -port_bif_vlnv {AMBA:AMBA4:AXI4:r0p0_0} -port_bif_role {mirroredMaster} -port_bif_mapping {\
"AWID:AXI4L_MASTER0_AWID" \
"AWADDR:AXI4L_MASTER0_AWADDR" \
"AWLEN:AXI4L_MASTER0_AWLEN" \
"AWSIZE:AXI4L_MASTER0_AWSIZE" \
"AWBURST:AXI4L_MASTER0_AWBURST" \
"AWLOCK:AXI4L_MASTER0_AWLOCK" \
"AWCACHE:AXI4L_MASTER0_AWCACHE" \
"AWPROT:AXI4L_MASTER0_AWPROT" \
"AWQOS:AXI4L_MASTER0_AWQOS" \
"AWREGION:AXI4L_MASTER0_AWREGION" \
"AWVALID:AXI4L_MASTER0_AWVALID" \
"AWREADY:AXI4L_MASTER0_AWREADY" \
"WDATA:AXI4L_MASTER0_WDATA" \
"WSTRB:AXI4L_MASTER0_WSTRB" \
"WLAST:AXI4L_MASTER0_WLAST" \
"WVALID:AXI4L_MASTER0_WVALID" \
"WREADY:AXI4L_MASTER0_WREADY" \
"BID:AXI4L_MASTER0_BID" \
"BRESP:AXI4L_MASTER0_BRESP" \
"BVALID:AXI4L_MASTER0_BVALID" \
"BREADY:AXI4L_MASTER0_BREADY" \
"ARID:AXI4L_MASTER0_ARID" \
"ARADDR:AXI4L_MASTER0_ARADDR" \
"ARLEN:AXI4L_MASTER0_ARLEN" \
"ARSIZE:AXI4L_MASTER0_ARSIZE" \
"ARBURST:AXI4L_MASTER0_ARBURST" \
"ARLOCK:AXI4L_MASTER0_ARLOCK" \
"ARCACHE:AXI4L_MASTER0_ARCACHE" \
"ARPROT:AXI4L_MASTER0_ARPROT" \
"ARQOS:AXI4L_MASTER0_ARQOS" \
"ARREGION:AXI4L_MASTER0_ARREGION" \
"ARVALID:AXI4L_MASTER0_ARVALID" \
"ARREADY:AXI4L_MASTER0_ARREADY" \
"RID:AXI4L_MASTER0_RID" \
"RDATA:AXI4L_MASTER0_RDATA" \
"RRESP:AXI4L_MASTER0_RRESP" \
"RLAST:AXI4L_MASTER0_RLAST" \
"RVALID:AXI4L_MASTER0_RVALID" \
"RREADY:AXI4L_MASTER0_RREADY" \
"AWUSER:AXI4L_MASTER0_AWUSER" \
"WUSER:AXI4L_MASTER0_WUSER" \
"BUSER:AXI4L_MASTER0_BUSER" \
"ARUSER:AXI4L_MASTER0_ARUSER" \
"RUSER:AXI4L_MASTER0_RUSER" } 

# Add COREAXI4INTERCONNECT_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {COREAXI4INTERCONNECT_C0} -instance_name {COREAXI4INTERCONNECT_C0_0}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"ACLK" "COREAXI4INTERCONNECT_C0_0:ACLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ARESETN" "COREAXI4INTERCONNECT_C0_0:ARESETN" }


# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4L" "COREAXI4INTERCONNECT_C0_0:AXI4mmaster0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4L_H264" "COREAXI4INTERCONNECT_C0_0:AXI4mslave2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4L_IE" "COREAXI4INTERCONNECT_C0_0:AXI4mslave3" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4L_MIPI" "COREAXI4INTERCONNECT_C0_0:AXI4mslave1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4L_OSD" "COREAXI4INTERCONNECT_C0_0:AXI4mslave5" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4L_SCALER" "COREAXI4INTERCONNECT_C0_0:AXI4mslave4" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4L_VDMA" "COREAXI4INTERCONNECT_C0_0:AXI4mslave0" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the SmartDesign 
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign "FIC_CONVERTER"
generate_component -component_name ${sd_name}
