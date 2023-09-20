# Creating SmartDesign "FIC_CONVERTER"
set sd_name {FIC_CONVERTER}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_DMA_WR_SLAVE0_ARREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_DMA_WR_SLAVE0_AWREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_DMA_WR_SLAVE0_BVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_DMA_WR_SLAVE0_RLAST} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_DMA_WR_SLAVE0_RVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_DMA_WR_SLAVE0_WREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_SLAVE1_ARREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_SLAVE1_AWREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_SLAVE1_BVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_SLAVE1_RLAST} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_SLAVE1_RVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_SLAVE1_WREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {Arbiter_MASTER0_ARVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {Arbiter_MASTER0_AWVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {Arbiter_MASTER0_BREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {Arbiter_MASTER0_RREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {Arbiter_MASTER0_WLAST} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {Arbiter_MASTER0_WVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_CLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_RESETn} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LPDDR4_SLAVE0_ARREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LPDDR4_SLAVE0_AWREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LPDDR4_SLAVE0_BVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LPDDR4_SLAVE0_RLAST} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LPDDR4_SLAVE0_RVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LPDDR4_SLAVE0_WREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MASTER0_ARVALID_0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MASTER0_AWVALID_0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MASTER0_BREADY_0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MASTER0_RREADY_0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MASTER0_WLAST_0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MASTER0_WVALID_0} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MEM_CLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MEM_RESETN} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_DMA_WR_SLAVE0_ARVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_DMA_WR_SLAVE0_AWVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_DMA_WR_SLAVE0_BREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_DMA_WR_SLAVE0_RREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_DMA_WR_SLAVE0_WLAST} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_DMA_WR_SLAVE0_WVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_SLAVE1_ARVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_SLAVE1_AWVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_SLAVE1_BREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_SLAVE1_RREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_SLAVE1_WLAST} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_SLAVE1_WVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {Arbiter_MASTER0_ARREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {Arbiter_MASTER0_AWREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {Arbiter_MASTER0_BVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {Arbiter_MASTER0_RLAST} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {Arbiter_MASTER0_RVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {Arbiter_MASTER0_WREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LPDDR4_SLAVE0_ARVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LPDDR4_SLAVE0_AWVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LPDDR4_SLAVE0_BREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LPDDR4_SLAVE0_RREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LPDDR4_SLAVE0_WLAST} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LPDDR4_SLAVE0_WVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MASTER0_ARREADY_0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MASTER0_AWREADY_0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MASTER0_BVALID_0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MASTER0_RLAST_0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MASTER0_RVALID_0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MASTER0_WREADY_0} -port_direction {OUT}


# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_DMA_WR_SLAVE0_BID} -port_direction {IN} -port_range {[8:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_DMA_WR_SLAVE0_BRESP} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_DMA_WR_SLAVE0_BUSER} -port_direction {IN} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_DMA_WR_SLAVE0_RDATA} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_DMA_WR_SLAVE0_RID} -port_direction {IN} -port_range {[8:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_DMA_WR_SLAVE0_RRESP} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_DMA_WR_SLAVE0_RUSER} -port_direction {IN} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_SLAVE1_BID} -port_direction {IN} -port_range {[8:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_SLAVE1_BRESP} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_SLAVE1_BUSER} -port_direction {IN} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_SLAVE1_RDATA} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_SLAVE1_RID} -port_direction {IN} -port_range {[8:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_SLAVE1_RRESP} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_MIPI_SLAVE1_RUSER} -port_direction {IN} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {Arbiter_MASTER0_ARADDR} -port_direction {IN} -port_range {[37:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {Arbiter_MASTER0_ARBURST} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {Arbiter_MASTER0_ARCACHE} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {Arbiter_MASTER0_ARID} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {Arbiter_MASTER0_ARLEN} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {Arbiter_MASTER0_ARLOCK} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {Arbiter_MASTER0_ARPROT} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {Arbiter_MASTER0_ARQOS} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {Arbiter_MASTER0_ARREGION} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {Arbiter_MASTER0_ARSIZE} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {Arbiter_MASTER0_ARUSER} -port_direction {IN} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {Arbiter_MASTER0_AWADDR} -port_direction {IN} -port_range {[37:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {Arbiter_MASTER0_AWBURST} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {Arbiter_MASTER0_AWCACHE} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {Arbiter_MASTER0_AWID} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {Arbiter_MASTER0_AWLEN} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {Arbiter_MASTER0_AWLOCK} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {Arbiter_MASTER0_AWPROT} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {Arbiter_MASTER0_AWQOS} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {Arbiter_MASTER0_AWREGION} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {Arbiter_MASTER0_AWSIZE} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {Arbiter_MASTER0_AWUSER} -port_direction {IN} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {Arbiter_MASTER0_WDATA} -port_direction {IN} -port_range {[511:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {Arbiter_MASTER0_WSTRB} -port_direction {IN} -port_range {[63:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {Arbiter_MASTER0_WUSER} -port_direction {IN} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LPDDR4_SLAVE0_BID} -port_direction {IN} -port_range {[4:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LPDDR4_SLAVE0_BRESP} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LPDDR4_SLAVE0_BUSER} -port_direction {IN} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LPDDR4_SLAVE0_RDATA} -port_direction {IN} -port_range {[63:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LPDDR4_SLAVE0_RID} -port_direction {IN} -port_range {[4:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LPDDR4_SLAVE0_RRESP} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LPDDR4_SLAVE0_RUSER} -port_direction {IN} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_ARADDR_0} -port_direction {IN} -port_range {[37:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_ARBURST_0} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_ARCACHE_0} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_ARID_0} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_ARLEN_0} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_ARLOCK_0} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_ARPROT_0} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_ARQOS_0} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_ARREGION_0} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_ARSIZE_0} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_ARUSER_0} -port_direction {IN} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_AWADDR_0} -port_direction {IN} -port_range {[37:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_AWBURST_0} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_AWCACHE_0} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_AWID_0} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_AWLEN_0} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_AWLOCK_0} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_AWPROT_0} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_AWQOS_0} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_AWREGION_0} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_AWSIZE_0} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_AWUSER_0} -port_direction {IN} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_WDATA_0} -port_direction {IN} -port_range {[63:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_WSTRB_0} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_WUSER_0} -port_direction {IN} -port_range {[0:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_DMA_WR_SLAVE0_ARADDR} -port_direction {OUT} -port_range {[37:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_DMA_WR_SLAVE0_ARBURST} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_DMA_WR_SLAVE0_ARCACHE} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_DMA_WR_SLAVE0_ARID} -port_direction {OUT} -port_range {[8:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_DMA_WR_SLAVE0_ARLEN} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_DMA_WR_SLAVE0_ARLOCK} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_DMA_WR_SLAVE0_ARPROT} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_DMA_WR_SLAVE0_ARQOS} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_DMA_WR_SLAVE0_ARREGION} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_DMA_WR_SLAVE0_ARSIZE} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_DMA_WR_SLAVE0_ARUSER} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_DMA_WR_SLAVE0_AWADDR} -port_direction {OUT} -port_range {[37:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_DMA_WR_SLAVE0_AWBURST} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_DMA_WR_SLAVE0_AWCACHE} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_DMA_WR_SLAVE0_AWID} -port_direction {OUT} -port_range {[8:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_DMA_WR_SLAVE0_AWLEN} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_DMA_WR_SLAVE0_AWLOCK} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_DMA_WR_SLAVE0_AWPROT} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_DMA_WR_SLAVE0_AWQOS} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_DMA_WR_SLAVE0_AWREGION} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_DMA_WR_SLAVE0_AWSIZE} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_DMA_WR_SLAVE0_AWUSER} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_DMA_WR_SLAVE0_WDATA} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_DMA_WR_SLAVE0_WSTRB} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4L_DMA_WR_SLAVE0_WUSER} -port_direction {OUT} -port_range {[0:0]}
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
sd_create_bus_port -sd_name ${sd_name} -port_name {Arbiter_MASTER0_BID} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {Arbiter_MASTER0_BRESP} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {Arbiter_MASTER0_BUSER} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {Arbiter_MASTER0_RDATA} -port_direction {OUT} -port_range {[511:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {Arbiter_MASTER0_RID} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {Arbiter_MASTER0_RRESP} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {Arbiter_MASTER0_RUSER} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LPDDR4_SLAVE0_ARADDR} -port_direction {OUT} -port_range {[37:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LPDDR4_SLAVE0_ARBURST} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LPDDR4_SLAVE0_ARCACHE} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LPDDR4_SLAVE0_ARID} -port_direction {OUT} -port_range {[4:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LPDDR4_SLAVE0_ARLEN} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LPDDR4_SLAVE0_ARLOCK} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LPDDR4_SLAVE0_ARPROT} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LPDDR4_SLAVE0_ARQOS} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LPDDR4_SLAVE0_ARREGION} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LPDDR4_SLAVE0_ARSIZE} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LPDDR4_SLAVE0_ARUSER} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LPDDR4_SLAVE0_AWADDR} -port_direction {OUT} -port_range {[37:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LPDDR4_SLAVE0_AWBURST} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LPDDR4_SLAVE0_AWCACHE} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LPDDR4_SLAVE0_AWID} -port_direction {OUT} -port_range {[4:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LPDDR4_SLAVE0_AWLEN} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LPDDR4_SLAVE0_AWLOCK} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LPDDR4_SLAVE0_AWPROT} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LPDDR4_SLAVE0_AWQOS} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LPDDR4_SLAVE0_AWREGION} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LPDDR4_SLAVE0_AWSIZE} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LPDDR4_SLAVE0_AWUSER} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LPDDR4_SLAVE0_WDATA} -port_direction {OUT} -port_range {[63:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LPDDR4_SLAVE0_WSTRB} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {LPDDR4_SLAVE0_WUSER} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_BID_0} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_BRESP_0} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_BUSER_0} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_RDATA_0} -port_direction {OUT} -port_range {[63:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_RID_0} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_RRESP_0} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {MASTER0_RUSER_0} -port_direction {OUT} -port_range {[0:0]}


# Create top level Bus interface Ports
sd_create_bif_port -sd_name ${sd_name} -port_name {LPDDR4} -port_bif_vlnv {AMBA:AMBA4:AXI4:r0p0_0} -port_bif_role {mirroredSlave} -port_bif_mapping {\
"AWID:LPDDR4_SLAVE0_AWID" \
"AWADDR:LPDDR4_SLAVE0_AWADDR" \
"AWLEN:LPDDR4_SLAVE0_AWLEN" \
"AWSIZE:LPDDR4_SLAVE0_AWSIZE" \
"AWBURST:LPDDR4_SLAVE0_AWBURST" \
"AWLOCK:LPDDR4_SLAVE0_AWLOCK" \
"AWCACHE:LPDDR4_SLAVE0_AWCACHE" \
"AWPROT:LPDDR4_SLAVE0_AWPROT" \
"AWQOS:LPDDR4_SLAVE0_AWQOS" \
"AWREGION:LPDDR4_SLAVE0_AWREGION" \
"AWVALID:LPDDR4_SLAVE0_AWVALID" \
"AWREADY:LPDDR4_SLAVE0_AWREADY" \
"WDATA:LPDDR4_SLAVE0_WDATA" \
"WSTRB:LPDDR4_SLAVE0_WSTRB" \
"WLAST:LPDDR4_SLAVE0_WLAST" \
"WVALID:LPDDR4_SLAVE0_WVALID" \
"WREADY:LPDDR4_SLAVE0_WREADY" \
"BID:LPDDR4_SLAVE0_BID" \
"BRESP:LPDDR4_SLAVE0_BRESP" \
"BVALID:LPDDR4_SLAVE0_BVALID" \
"BREADY:LPDDR4_SLAVE0_BREADY" \
"ARID:LPDDR4_SLAVE0_ARID" \
"ARADDR:LPDDR4_SLAVE0_ARADDR" \
"ARLEN:LPDDR4_SLAVE0_ARLEN" \
"ARSIZE:LPDDR4_SLAVE0_ARSIZE" \
"ARBURST:LPDDR4_SLAVE0_ARBURST" \
"ARLOCK:LPDDR4_SLAVE0_ARLOCK" \
"ARCACHE:LPDDR4_SLAVE0_ARCACHE" \
"ARPROT:LPDDR4_SLAVE0_ARPROT" \
"ARQOS:LPDDR4_SLAVE0_ARQOS" \
"ARREGION:LPDDR4_SLAVE0_ARREGION" \
"ARVALID:LPDDR4_SLAVE0_ARVALID" \
"ARREADY:LPDDR4_SLAVE0_ARREADY" \
"RID:LPDDR4_SLAVE0_RID" \
"RDATA:LPDDR4_SLAVE0_RDATA" \
"RRESP:LPDDR4_SLAVE0_RRESP" \
"RLAST:LPDDR4_SLAVE0_RLAST" \
"RVALID:LPDDR4_SLAVE0_RVALID" \
"RREADY:LPDDR4_SLAVE0_RREADY" \
"AWUSER:LPDDR4_SLAVE0_AWUSER" \
"WUSER:LPDDR4_SLAVE0_WUSER" \
"BUSER:LPDDR4_SLAVE0_BUSER" \
"ARUSER:LPDDR4_SLAVE0_ARUSER" \
"RUSER:LPDDR4_SLAVE0_RUSER" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {Arbiter} -port_bif_vlnv {AMBA:AMBA4:AXI4:r0p0_0} -port_bif_role {mirroredMaster} -port_bif_mapping {\
"AWID:Arbiter_MASTER0_AWID" \
"AWADDR:Arbiter_MASTER0_AWADDR" \
"AWLEN:Arbiter_MASTER0_AWLEN" \
"AWSIZE:Arbiter_MASTER0_AWSIZE" \
"AWBURST:Arbiter_MASTER0_AWBURST" \
"AWLOCK:Arbiter_MASTER0_AWLOCK" \
"AWCACHE:Arbiter_MASTER0_AWCACHE" \
"AWPROT:Arbiter_MASTER0_AWPROT" \
"AWQOS:Arbiter_MASTER0_AWQOS" \
"AWREGION:Arbiter_MASTER0_AWREGION" \
"AWVALID:Arbiter_MASTER0_AWVALID" \
"AWREADY:Arbiter_MASTER0_AWREADY" \
"WDATA:Arbiter_MASTER0_WDATA" \
"WSTRB:Arbiter_MASTER0_WSTRB" \
"WLAST:Arbiter_MASTER0_WLAST" \
"WVALID:Arbiter_MASTER0_WVALID" \
"WREADY:Arbiter_MASTER0_WREADY" \
"BID:Arbiter_MASTER0_BID" \
"BRESP:Arbiter_MASTER0_BRESP" \
"BVALID:Arbiter_MASTER0_BVALID" \
"BREADY:Arbiter_MASTER0_BREADY" \
"ARID:Arbiter_MASTER0_ARID" \
"ARADDR:Arbiter_MASTER0_ARADDR" \
"ARLEN:Arbiter_MASTER0_ARLEN" \
"ARSIZE:Arbiter_MASTER0_ARSIZE" \
"ARBURST:Arbiter_MASTER0_ARBURST" \
"ARLOCK:Arbiter_MASTER0_ARLOCK" \
"ARCACHE:Arbiter_MASTER0_ARCACHE" \
"ARPROT:Arbiter_MASTER0_ARPROT" \
"ARQOS:Arbiter_MASTER0_ARQOS" \
"ARREGION:Arbiter_MASTER0_ARREGION" \
"ARVALID:Arbiter_MASTER0_ARVALID" \
"ARREADY:Arbiter_MASTER0_ARREADY" \
"RID:Arbiter_MASTER0_RID" \
"RDATA:Arbiter_MASTER0_RDATA" \
"RRESP:Arbiter_MASTER0_RRESP" \
"RLAST:Arbiter_MASTER0_RLAST" \
"RVALID:Arbiter_MASTER0_RVALID" \
"RREADY:Arbiter_MASTER0_RREADY" \
"AWUSER:Arbiter_MASTER0_AWUSER" \
"WUSER:Arbiter_MASTER0_WUSER" \
"BUSER:Arbiter_MASTER0_BUSER" \
"ARUSER:Arbiter_MASTER0_ARUSER" \
"RUSER:Arbiter_MASTER0_RUSER" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {AXI4L_DMA_WR} -port_bif_vlnv {AMBA:AMBA4:AXI4:r0p0_0} -port_bif_role {mirroredSlave} -port_bif_mapping {\
"AWID:AXI4L_DMA_WR_SLAVE0_AWID" \
"AWADDR:AXI4L_DMA_WR_SLAVE0_AWADDR" \
"AWLEN:AXI4L_DMA_WR_SLAVE0_AWLEN" \
"AWSIZE:AXI4L_DMA_WR_SLAVE0_AWSIZE" \
"AWBURST:AXI4L_DMA_WR_SLAVE0_AWBURST" \
"AWLOCK:AXI4L_DMA_WR_SLAVE0_AWLOCK" \
"AWCACHE:AXI4L_DMA_WR_SLAVE0_AWCACHE" \
"AWPROT:AXI4L_DMA_WR_SLAVE0_AWPROT" \
"AWQOS:AXI4L_DMA_WR_SLAVE0_AWQOS" \
"AWREGION:AXI4L_DMA_WR_SLAVE0_AWREGION" \
"AWVALID:AXI4L_DMA_WR_SLAVE0_AWVALID" \
"AWREADY:AXI4L_DMA_WR_SLAVE0_AWREADY" \
"WDATA:AXI4L_DMA_WR_SLAVE0_WDATA" \
"WSTRB:AXI4L_DMA_WR_SLAVE0_WSTRB" \
"WLAST:AXI4L_DMA_WR_SLAVE0_WLAST" \
"WVALID:AXI4L_DMA_WR_SLAVE0_WVALID" \
"WREADY:AXI4L_DMA_WR_SLAVE0_WREADY" \
"BID:AXI4L_DMA_WR_SLAVE0_BID" \
"BRESP:AXI4L_DMA_WR_SLAVE0_BRESP" \
"BVALID:AXI4L_DMA_WR_SLAVE0_BVALID" \
"BREADY:AXI4L_DMA_WR_SLAVE0_BREADY" \
"ARID:AXI4L_DMA_WR_SLAVE0_ARID" \
"ARADDR:AXI4L_DMA_WR_SLAVE0_ARADDR" \
"ARLEN:AXI4L_DMA_WR_SLAVE0_ARLEN" \
"ARSIZE:AXI4L_DMA_WR_SLAVE0_ARSIZE" \
"ARBURST:AXI4L_DMA_WR_SLAVE0_ARBURST" \
"ARLOCK:AXI4L_DMA_WR_SLAVE0_ARLOCK" \
"ARCACHE:AXI4L_DMA_WR_SLAVE0_ARCACHE" \
"ARPROT:AXI4L_DMA_WR_SLAVE0_ARPROT" \
"ARQOS:AXI4L_DMA_WR_SLAVE0_ARQOS" \
"ARREGION:AXI4L_DMA_WR_SLAVE0_ARREGION" \
"ARVALID:AXI4L_DMA_WR_SLAVE0_ARVALID" \
"ARREADY:AXI4L_DMA_WR_SLAVE0_ARREADY" \
"RID:AXI4L_DMA_WR_SLAVE0_RID" \
"RDATA:AXI4L_DMA_WR_SLAVE0_RDATA" \
"RRESP:AXI4L_DMA_WR_SLAVE0_RRESP" \
"RLAST:AXI4L_DMA_WR_SLAVE0_RLAST" \
"RVALID:AXI4L_DMA_WR_SLAVE0_RVALID" \
"RREADY:AXI4L_DMA_WR_SLAVE0_RREADY" \
"AWUSER:AXI4L_DMA_WR_SLAVE0_AWUSER" \
"WUSER:AXI4L_DMA_WR_SLAVE0_WUSER" \
"BUSER:AXI4L_DMA_WR_SLAVE0_BUSER" \
"ARUSER:AXI4L_DMA_WR_SLAVE0_ARUSER" \
"RUSER:AXI4L_DMA_WR_SLAVE0_RUSER" } 

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

sd_create_bif_port -sd_name ${sd_name} -port_name {AXI4_Lite} -port_bif_vlnv {AMBA:AMBA4:AXI4:r0p0_0} -port_bif_role {mirroredMaster} -port_bif_mapping {\
"AWID:MASTER0_AWID_0" \
"AWADDR:MASTER0_AWADDR_0" \
"AWLEN:MASTER0_AWLEN_0" \
"AWSIZE:MASTER0_AWSIZE_0" \
"AWBURST:MASTER0_AWBURST_0" \
"AWLOCK:MASTER0_AWLOCK_0" \
"AWCACHE:MASTER0_AWCACHE_0" \
"AWPROT:MASTER0_AWPROT_0" \
"AWQOS:MASTER0_AWQOS_0" \
"AWREGION:MASTER0_AWREGION_0" \
"AWVALID:MASTER0_AWVALID_0" \
"AWREADY:MASTER0_AWREADY_0" \
"WDATA:MASTER0_WDATA_0" \
"WSTRB:MASTER0_WSTRB_0" \
"WLAST:MASTER0_WLAST_0" \
"WVALID:MASTER0_WVALID_0" \
"WREADY:MASTER0_WREADY_0" \
"BID:MASTER0_BID_0" \
"BRESP:MASTER0_BRESP_0" \
"BVALID:MASTER0_BVALID_0" \
"BREADY:MASTER0_BREADY_0" \
"ARID:MASTER0_ARID_0" \
"ARADDR:MASTER0_ARADDR_0" \
"ARLEN:MASTER0_ARLEN_0" \
"ARSIZE:MASTER0_ARSIZE_0" \
"ARBURST:MASTER0_ARBURST_0" \
"ARLOCK:MASTER0_ARLOCK_0" \
"ARCACHE:MASTER0_ARCACHE_0" \
"ARPROT:MASTER0_ARPROT_0" \
"ARQOS:MASTER0_ARQOS_0" \
"ARREGION:MASTER0_ARREGION_0" \
"ARVALID:MASTER0_ARVALID_0" \
"ARREADY:MASTER0_ARREADY_0" \
"RID:MASTER0_RID_0" \
"RDATA:MASTER0_RDATA_0" \
"RRESP:MASTER0_RRESP_0" \
"RLAST:MASTER0_RLAST_0" \
"RVALID:MASTER0_RVALID_0" \
"RREADY:MASTER0_RREADY_0" \
"AWUSER:MASTER0_AWUSER_0" \
"WUSER:MASTER0_WUSER_0" \
"BUSER:MASTER0_BUSER_0" \
"ARUSER:MASTER0_ARUSER_0" \
"RUSER:MASTER0_RUSER_0" } 

# Add COREAXI4INTERCONNECT_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {COREAXI4INTERCONNECT_C0} -instance_name {COREAXI4INTERCONNECT_C0_0}



# Add COREAXI4INTERCONNECT_C1_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {COREAXI4INTERCONNECT_C1} -instance_name {COREAXI4INTERCONNECT_C1_0}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREAXI4INTERCONNECT_C0_0:ACLK" "FIC_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREAXI4INTERCONNECT_C0_0:ARESETN" "FIC_RESETn" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREAXI4INTERCONNECT_C1_0:ACLK" "MEM_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREAXI4INTERCONNECT_C1_0:ARESETN" "MEM_RESETN" }


# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4L_DMA_WR" "COREAXI4INTERCONNECT_C0_0:AXI4mslave0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4L_MIPI" "COREAXI4INTERCONNECT_C0_0:AXI4mslave1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4_Lite" "COREAXI4INTERCONNECT_C0_0:AXI4mmaster0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"Arbiter" "COREAXI4INTERCONNECT_C1_0:AXI4mmaster0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREAXI4INTERCONNECT_C1_0:AXI4mslave0" "LPDDR4" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the SmartDesign 
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign "FIC_CONVERTER"
generate_component -component_name ${sd_name}
