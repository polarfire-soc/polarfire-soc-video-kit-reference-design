# Creating SmartDesign "FIC_0_PERIPHERALS"
set sd_name {FIC_0_PERIPHERALS}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {ACLK_125MHZ} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_1588_PENABLE} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_1588_PSEL} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_1588_PWRITE} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ARESETN_125MHZ} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_ARVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_AWVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_BREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_RREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_WLAST} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_WVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_ARREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_AWREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_BVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_RLAST} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_RVALID} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_WREADY} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {IOD_CDR_CCC_RST} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_CDR_REF_CLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_PCS_ARST_N} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_RXD_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_RXD_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PADN} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PADP} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCKT_GEN_APB_SLAVE_PENABLE_IN} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCKT_GEN_APB_SLAVE_PSEL_IN} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCKT_GEN_APB_SLAVE_PWRITE_IN} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PRESETn_CLK50} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RX_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {RX_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TSN_APB_SLAVE_PENABLE} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TSN_APB_SLAVE_PSEL} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TSN_APB_SLAVE_PWRITE} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_1588_PREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_1588_PSLVERR} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_ARREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_AWREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_BVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_RLAST} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_RVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_WREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_ARVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_AWVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_BREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_RREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_WLAST} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_WVALID} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {IOD_CDR_CCC_PLL_LOCK} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_TXD_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {LANE0_TXD_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MDC} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MM2S_INT_0} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCKT_GEN_APB_SLAVE_PREADY_OUT} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {S2MM_INT} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TSN_APB_SLAVE_PREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TSN_APB_SLAVE_PSLVERR} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TX_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {TX_P} -port_direction {OUT} -port_is_pad {1}

sd_create_scalar_port -sd_name ${sd_name} -port_name {PHY_MDIO} -port_direction {INOUT} -port_is_pad {1}

# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {APB_1588_PADDR} -port_direction {IN} -port_range {[8:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {APB_1588_PWDATA} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_ARADDR} -port_direction {IN} -port_range {[37:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_ARBURST} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_ARCACHE} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_ARID} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_ARLEN} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_ARLOCK} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_ARPROT} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_ARQOS} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_ARREGION} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_ARSIZE} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_ARUSER} -port_direction {IN} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_AWADDR} -port_direction {IN} -port_range {[37:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_AWBURST} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_AWCACHE} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_AWID} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_AWLEN} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_AWLOCK} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_AWPROT} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_AWQOS} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_AWREGION} -port_direction {IN} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_AWSIZE} -port_direction {IN} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_AWUSER} -port_direction {IN} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_WDATA} -port_direction {IN} -port_range {[63:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_WSTRB} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_WUSER} -port_direction {IN} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_BID} -port_direction {IN} -port_range {[9:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_BRESP} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_BUSER} -port_direction {IN} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_RDATA} -port_direction {IN} -port_range {[63:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_RID} -port_direction {IN} -port_range {[9:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_RRESP} -port_direction {IN} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_RUSER} -port_direction {IN} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {PCKT_GEN_APB_SLAVE_PADDR_IN} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {PCKT_GEN_APB_SLAVE_PWDATA_IN} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {TSN_APB_SLAVE_PADDR} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {TSN_APB_SLAVE_PWDATA} -port_direction {IN} -port_range {[31:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {APB_1588_PRDATA} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_BID} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_BRESP} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_BUSER} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_RDATA} -port_direction {OUT} -port_range {[63:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_RID} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_RRESP} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mmaster0_MASTER0_RUSER} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_ARADDR} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_ARBURST} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_ARCACHE} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_ARID} -port_direction {OUT} -port_range {[9:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_ARLEN} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_ARLOCK} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_ARPROT} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_ARQOS} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_ARREGION} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_ARSIZE} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_ARUSER} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_AWADDR} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_AWBURST} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_AWCACHE} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_AWID} -port_direction {OUT} -port_range {[9:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_AWLEN} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_AWLOCK} -port_direction {OUT} -port_range {[1:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_AWPROT} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_AWQOS} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_AWREGION} -port_direction {OUT} -port_range {[3:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_AWSIZE} -port_direction {OUT} -port_range {[2:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_AWUSER} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_WDATA} -port_direction {OUT} -port_range {[63:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_WSTRB} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {AXI4mslave0_SLAVE0_WUSER} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {PCKT_GEN_APB_SLAVE_PRDATA_OUT} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {TSN_APB_SLAVE_PRDATA} -port_direction {OUT} -port_range {[31:0]}


# Create top level Bus interface Ports
sd_create_bif_port -sd_name ${sd_name} -port_name {AXI4mmaster0} -port_bif_vlnv {AMBA:AMBA4:AXI4:r0p0_0} -port_bif_role {mirroredMaster} -port_bif_mapping {\
"AWID:AXI4mmaster0_MASTER0_AWID" \
"AWADDR:AXI4mmaster0_MASTER0_AWADDR" \
"AWLEN:AXI4mmaster0_MASTER0_AWLEN" \
"AWSIZE:AXI4mmaster0_MASTER0_AWSIZE" \
"AWBURST:AXI4mmaster0_MASTER0_AWBURST" \
"AWLOCK:AXI4mmaster0_MASTER0_AWLOCK" \
"AWCACHE:AXI4mmaster0_MASTER0_AWCACHE" \
"AWPROT:AXI4mmaster0_MASTER0_AWPROT" \
"AWQOS:AXI4mmaster0_MASTER0_AWQOS" \
"AWREGION:AXI4mmaster0_MASTER0_AWREGION" \
"AWVALID:AXI4mmaster0_MASTER0_AWVALID" \
"AWREADY:AXI4mmaster0_MASTER0_AWREADY" \
"WDATA:AXI4mmaster0_MASTER0_WDATA" \
"WSTRB:AXI4mmaster0_MASTER0_WSTRB" \
"WLAST:AXI4mmaster0_MASTER0_WLAST" \
"WVALID:AXI4mmaster0_MASTER0_WVALID" \
"WREADY:AXI4mmaster0_MASTER0_WREADY" \
"BID:AXI4mmaster0_MASTER0_BID" \
"BRESP:AXI4mmaster0_MASTER0_BRESP" \
"BVALID:AXI4mmaster0_MASTER0_BVALID" \
"BREADY:AXI4mmaster0_MASTER0_BREADY" \
"ARID:AXI4mmaster0_MASTER0_ARID" \
"ARADDR:AXI4mmaster0_MASTER0_ARADDR" \
"ARLEN:AXI4mmaster0_MASTER0_ARLEN" \
"ARSIZE:AXI4mmaster0_MASTER0_ARSIZE" \
"ARBURST:AXI4mmaster0_MASTER0_ARBURST" \
"ARLOCK:AXI4mmaster0_MASTER0_ARLOCK" \
"ARCACHE:AXI4mmaster0_MASTER0_ARCACHE" \
"ARPROT:AXI4mmaster0_MASTER0_ARPROT" \
"ARQOS:AXI4mmaster0_MASTER0_ARQOS" \
"ARREGION:AXI4mmaster0_MASTER0_ARREGION" \
"ARVALID:AXI4mmaster0_MASTER0_ARVALID" \
"ARREADY:AXI4mmaster0_MASTER0_ARREADY" \
"RID:AXI4mmaster0_MASTER0_RID" \
"RDATA:AXI4mmaster0_MASTER0_RDATA" \
"RRESP:AXI4mmaster0_MASTER0_RRESP" \
"RLAST:AXI4mmaster0_MASTER0_RLAST" \
"RVALID:AXI4mmaster0_MASTER0_RVALID" \
"RREADY:AXI4mmaster0_MASTER0_RREADY" \
"AWUSER:AXI4mmaster0_MASTER0_AWUSER" \
"WUSER:AXI4mmaster0_MASTER0_WUSER" \
"BUSER:AXI4mmaster0_MASTER0_BUSER" \
"ARUSER:AXI4mmaster0_MASTER0_ARUSER" \
"RUSER:AXI4mmaster0_MASTER0_RUSER" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {AXI4mslave0} -port_bif_vlnv {AMBA:AMBA4:AXI4:r0p0_0} -port_bif_role {mirroredSlave} -port_bif_mapping {\
"AWID:AXI4mslave0_SLAVE0_AWID" \
"AWADDR:AXI4mslave0_SLAVE0_AWADDR" \
"AWLEN:AXI4mslave0_SLAVE0_AWLEN" \
"AWSIZE:AXI4mslave0_SLAVE0_AWSIZE" \
"AWBURST:AXI4mslave0_SLAVE0_AWBURST" \
"AWLOCK:AXI4mslave0_SLAVE0_AWLOCK" \
"AWCACHE:AXI4mslave0_SLAVE0_AWCACHE" \
"AWPROT:AXI4mslave0_SLAVE0_AWPROT" \
"AWQOS:AXI4mslave0_SLAVE0_AWQOS" \
"AWREGION:AXI4mslave0_SLAVE0_AWREGION" \
"AWVALID:AXI4mslave0_SLAVE0_AWVALID" \
"AWREADY:AXI4mslave0_SLAVE0_AWREADY" \
"WDATA:AXI4mslave0_SLAVE0_WDATA" \
"WSTRB:AXI4mslave0_SLAVE0_WSTRB" \
"WLAST:AXI4mslave0_SLAVE0_WLAST" \
"WVALID:AXI4mslave0_SLAVE0_WVALID" \
"WREADY:AXI4mslave0_SLAVE0_WREADY" \
"BID:AXI4mslave0_SLAVE0_BID" \
"BRESP:AXI4mslave0_SLAVE0_BRESP" \
"BVALID:AXI4mslave0_SLAVE0_BVALID" \
"BREADY:AXI4mslave0_SLAVE0_BREADY" \
"ARID:AXI4mslave0_SLAVE0_ARID" \
"ARADDR:AXI4mslave0_SLAVE0_ARADDR" \
"ARLEN:AXI4mslave0_SLAVE0_ARLEN" \
"ARSIZE:AXI4mslave0_SLAVE0_ARSIZE" \
"ARBURST:AXI4mslave0_SLAVE0_ARBURST" \
"ARLOCK:AXI4mslave0_SLAVE0_ARLOCK" \
"ARCACHE:AXI4mslave0_SLAVE0_ARCACHE" \
"ARPROT:AXI4mslave0_SLAVE0_ARPROT" \
"ARQOS:AXI4mslave0_SLAVE0_ARQOS" \
"ARREGION:AXI4mslave0_SLAVE0_ARREGION" \
"ARVALID:AXI4mslave0_SLAVE0_ARVALID" \
"ARREADY:AXI4mslave0_SLAVE0_ARREADY" \
"RID:AXI4mslave0_SLAVE0_RID" \
"RDATA:AXI4mslave0_SLAVE0_RDATA" \
"RRESP:AXI4mslave0_SLAVE0_RRESP" \
"RLAST:AXI4mslave0_SLAVE0_RLAST" \
"RVALID:AXI4mslave0_SLAVE0_RVALID" \
"RREADY:AXI4mslave0_SLAVE0_RREADY" \
"AWUSER:AXI4mslave0_SLAVE0_AWUSER" \
"WUSER:AXI4mslave0_SLAVE0_WUSER" \
"BUSER:AXI4mslave0_SLAVE0_BUSER" \
"ARUSER:AXI4mslave0_SLAVE0_ARUSER" \
"RUSER:AXI4mslave0_SLAVE0_RUSER" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {APB_1588} -port_bif_vlnv {AMBA:AMBA2:APB:r0p0} -port_bif_role {slave} -port_bif_mapping {\
"PADDR:APB_1588_PADDR" \
"PSELx:APB_1588_PSEL" \
"PENABLE:APB_1588_PENABLE" \
"PWRITE:APB_1588_PWRITE" \
"PRDATA:APB_1588_PRDATA" \
"PWDATA:APB_1588_PWDATA" \
"PREADY:APB_1588_PREADY" \
"PSLVERR:APB_1588_PSLVERR" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {PCKT_GEN_APB_SLAVE} -port_bif_vlnv {AMBA:AMBA2:APB:r0p0} -port_bif_role {slave} -port_bif_mapping {\
"PADDR:PCKT_GEN_APB_SLAVE_PADDR_IN" \
"PSELx:PCKT_GEN_APB_SLAVE_PSEL_IN" \
"PENABLE:PCKT_GEN_APB_SLAVE_PENABLE_IN" \
"PWRITE:PCKT_GEN_APB_SLAVE_PWRITE_IN" \
"PRDATA:PCKT_GEN_APB_SLAVE_PRDATA_OUT" \
"PWDATA:PCKT_GEN_APB_SLAVE_PWDATA_IN" \
"PREADY:PCKT_GEN_APB_SLAVE_PREADY_OUT" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {TSN_APB_SLAVE} -port_bif_vlnv {AMBA:AMBA2:APB:r0p0} -port_bif_role {slave} -port_bif_mapping {\
"PADDR:TSN_APB_SLAVE_PADDR" \
"PSELx:TSN_APB_SLAVE_PSEL" \
"PENABLE:TSN_APB_SLAVE_PENABLE" \
"PWRITE:TSN_APB_SLAVE_PWRITE" \
"PRDATA:TSN_APB_SLAVE_PRDATA" \
"PWDATA:TSN_APB_SLAVE_PWDATA" \
"PREADY:TSN_APB_SLAVE_PREADY" \
"PSLVERR:TSN_APB_SLAVE_PSLVERR" } 

# Add BIBUF_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {BIBUF_0}



# Add CLKBUF_DIFF_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {CLKBUF_DIFF} -instance_name {CLKBUF_DIFF_0}



# Add CORE1588_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CORE1588_C0} -instance_name {CORE1588_C0_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CORE1588_C0_0:INTERNAL_TIMER} -pin_slices {[101:24]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CORE1588_C0_0:INTERNAL_TIMER} -pin_slices {[23:0]}



# Add COREAXI4PROTOCONV_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {COREAXI4PROTOCONV_C0} -instance_name {COREAXI4PROTOCONV_C0_0}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {COREAXI4PROTOCONV_C0_0:S2MM_AXI4S_TRGT} -pin_names {COREAXI4PROTOCONV_C0_0:T_AXI4S_TVALID}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {COREAXI4PROTOCONV_C0_0:S2MM_AXI4S_TRGT} -pin_names {COREAXI4PROTOCONV_C0_0:T_AXI4S_TREADY}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {COREAXI4PROTOCONV_C0_0:S2MM_AXI4S_TRGT} -pin_names {COREAXI4PROTOCONV_C0_0:T_AXI4S_TDATA}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {COREAXI4PROTOCONV_C0_0:S2MM_AXI4S_TRGT} -pin_names {COREAXI4PROTOCONV_C0_0:T_AXI4S_TKEEP}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {COREAXI4PROTOCONV_C0_0:S2MM_AXI4S_TRGT} -pin_names {COREAXI4PROTOCONV_C0_0:T_AXI4S_TLAST}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {COREAXI4PROTOCONV_C0_0:S2MM_AXI4S_TRGT} -pin_names {COREAXI4PROTOCONV_C0_0:T_AXI4S_TID}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {COREAXI4PROTOCONV_C0_0:S2MM_AXI4S_TRGT} -pin_names {COREAXI4PROTOCONV_C0_0:T_AXI4S_TDEST}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {COREAXI4PROTOCONV_C0_0:S2MM_AXI4S_TRGT} -pin_names {COREAXI4PROTOCONV_C0_0:T_AXI4S_TUSER}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {COREAXI4PROTOCONV_C0_0:MM2S_AXI4S_INITR} -pin_names {COREAXI4PROTOCONV_C0_0:I_AXI4S_TVALID}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {COREAXI4PROTOCONV_C0_0:MM2S_AXI4S_INITR} -pin_names {COREAXI4PROTOCONV_C0_0:I_AXI4S_TREADY}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {COREAXI4PROTOCONV_C0_0:MM2S_AXI4S_INITR} -pin_names {COREAXI4PROTOCONV_C0_0:I_AXI4S_TDATA}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {COREAXI4PROTOCONV_C0_0:MM2S_AXI4S_INITR} -pin_names {COREAXI4PROTOCONV_C0_0:I_AXI4S_TKEEP}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {COREAXI4PROTOCONV_C0_0:MM2S_AXI4S_INITR} -pin_names {COREAXI4PROTOCONV_C0_0:I_AXI4S_TLAST}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {COREAXI4PROTOCONV_C0_0:MM2S_AXI4S_INITR} -pin_names {COREAXI4PROTOCONV_C0_0:I_AXI4S_TID}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {COREAXI4PROTOCONV_C0_0:MM2S_AXI4S_INITR} -pin_names {COREAXI4PROTOCONV_C0_0:I_AXI4S_TDEST}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {COREAXI4PROTOCONV_C0_0:MM2S_AXI4S_INITR} -pin_names {COREAXI4PROTOCONV_C0_0:I_AXI4S_TUSER}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {COREAXI4PROTOCONV_C0_0:T_AXI4S_TID} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {COREAXI4PROTOCONV_C0_0:T_AXI4S_TDEST} -value {GND}



# Add CoreAXI4SInterconnect_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CoreAXI4SInterconnect_C0} -instance_name {CoreAXI4SInterconnect_C0_0}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {CoreAXI4SInterconnect_C0_0:AXI4S_TARGET0} -pin_names {CoreAXI4SInterconnect_C0_0:AXI4S_T0TVALID}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {CoreAXI4SInterconnect_C0_0:AXI4S_TARGET0} -pin_names {CoreAXI4SInterconnect_C0_0:AXI4S_T0TREADY}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {CoreAXI4SInterconnect_C0_0:AXI4S_TARGET0} -pin_names {CoreAXI4SInterconnect_C0_0:AXI4S_T0TDATA}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {CoreAXI4SInterconnect_C0_0:AXI4S_TARGET0} -pin_names {CoreAXI4SInterconnect_C0_0:AXI4S_T0TSTRB}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {CoreAXI4SInterconnect_C0_0:AXI4S_TARGET0} -pin_names {CoreAXI4SInterconnect_C0_0:AXI4S_T0TKEEP}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {CoreAXI4SInterconnect_C0_0:AXI4S_TARGET0} -pin_names {CoreAXI4SInterconnect_C0_0:AXI4S_T0TLAST}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {CoreAXI4SInterconnect_C0_0:AXI4S_TARGET1} -pin_names {CoreAXI4SInterconnect_C0_0:AXI4S_T1TVALID}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {CoreAXI4SInterconnect_C0_0:AXI4S_TARGET1} -pin_names {CoreAXI4SInterconnect_C0_0:AXI4S_T1TREADY}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {CoreAXI4SInterconnect_C0_0:AXI4S_TARGET1} -pin_names {CoreAXI4SInterconnect_C0_0:AXI4S_T1TDATA}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {CoreAXI4SInterconnect_C0_0:AXI4S_TARGET1} -pin_names {CoreAXI4SInterconnect_C0_0:AXI4S_T1TSTRB}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {CoreAXI4SInterconnect_C0_0:AXI4S_TARGET1} -pin_names {CoreAXI4SInterconnect_C0_0:AXI4S_T1TKEEP}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {CoreAXI4SInterconnect_C0_0:AXI4S_TARGET1} -pin_names {CoreAXI4SInterconnect_C0_0:AXI4S_T1TLAST}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {CoreAXI4SInterconnect_C0_0:AXI4S_INITIATOR0} -pin_names {CoreAXI4SInterconnect_C0_0:AXI4S_I0TVALID}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {CoreAXI4SInterconnect_C0_0:AXI4S_INITIATOR0} -pin_names {CoreAXI4SInterconnect_C0_0:AXI4S_I0TREADY}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {CoreAXI4SInterconnect_C0_0:AXI4S_INITIATOR0} -pin_names {CoreAXI4SInterconnect_C0_0:AXI4S_I0TDATA}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {CoreAXI4SInterconnect_C0_0:AXI4S_INITIATOR0} -pin_names {CoreAXI4SInterconnect_C0_0:AXI4S_I0TSTRB}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {CoreAXI4SInterconnect_C0_0:AXI4S_INITIATOR0} -pin_names {CoreAXI4SInterconnect_C0_0:AXI4S_I0TKEEP}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {CoreAXI4SInterconnect_C0_0:AXI4S_INITIATOR0} -pin_names {CoreAXI4SInterconnect_C0_0:AXI4S_I0TLAST}



# Add CORESGMII_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CORESGMII_C0} -instance_name {CORESGMII_C0_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CORESGMII_C0_0:INTLB}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CORESGMII_C0_0:ANX_CVALID}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CORESGMII_C0_0:SPEEDO}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CORESGMII_C0_0:ANX_STATE}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CORESGMII_C0_0:PCSRXD}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CORESGMII_C0_0:PCSRXK}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CORESGMII_C0_0:BCERR}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CORESGMII_C0_0:RDERR}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CORESGMII_C0_0:ANX_CDATA}



# Add CORETSN_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CORETSN_C0} -instance_name {CORETSN_C0_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CORETSN_C0_0:RD_RESET_FIFO_N} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CORETSN_C0_0:RD_RESET_FIFO_N} -pin_slices {[1:1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CORETSN_C0_0:RD_RESET_FIFO_N} -pin_slices {[2:2]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CORETSN_C0_0:RD_RESET_FIFO_N} -pin_slices {[3:3]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CORETSN_C0_0:RD_RESET_FIFO_N} -pin_slices {[4:4]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CORETSN_C0_0:RD_RESET_FIFO_N} -pin_slices {[5:5]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CORETSN_C0_0:RD_RESET_FIFO_N} -pin_slices {[6:6]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CORETSN_C0_0:RD_RESET_FIFO_N} -pin_slices {[7:7]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CORETSN_C0_0:WR_RESET_FIFO_N} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CORETSN_C0_0:WR_RESET_FIFO_N} -pin_slices {[1:1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CORETSN_C0_0:WR_RESET_FIFO_N} -pin_slices {[2:2]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CORETSN_C0_0:WR_RESET_FIFO_N} -pin_slices {[3:3]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CORETSN_C0_0:WR_RESET_FIFO_N} -pin_slices {[4:4]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CORETSN_C0_0:WR_RESET_FIFO_N} -pin_slices {[5:5]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CORETSN_C0_0:WR_RESET_FIFO_N} -pin_slices {[6:6]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CORETSN_C0_0:WR_RESET_FIFO_N} -pin_slices {[7:7]}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {CORETSN_C0_0:AXI4S0_TRGT} -pin_names {CORETSN_C0_0:AXI4S0_I_AXI4S_TVALID}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {CORETSN_C0_0:AXI4S0_TRGT} -pin_names {CORETSN_C0_0:AXI4S0_O_AXI4S_TREADY}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {CORETSN_C0_0:AXI4S0_TRGT} -pin_names {CORETSN_C0_0:AXI4S0_I_AXI4S_TDATA}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {CORETSN_C0_0:AXI4S0_TRGT} -pin_names {CORETSN_C0_0:AXI4S0_I_AXI4S_TKEEP}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {CORETSN_C0_0:AXI4S0_TRGT} -pin_names {CORETSN_C0_0:AXI4S0_I_AXI4S_TLAST}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {CORETSN_C0_0:AXI4S0_TRGT} -pin_names {CORETSN_C0_0:AXI4S0_I_AXI4S_TUSER}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {CORETSN_C0_0:AXI4S1_TRGT} -pin_names {CORETSN_C0_0:AXI4S1_I_AXI4S_TVALID}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {CORETSN_C0_0:AXI4S1_TRGT} -pin_names {CORETSN_C0_0:AXI4S1_O_AXI4S_TREADY}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {CORETSN_C0_0:AXI4S1_TRGT} -pin_names {CORETSN_C0_0:AXI4S1_I_AXI4S_TDATA}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {CORETSN_C0_0:AXI4S1_TRGT} -pin_names {CORETSN_C0_0:AXI4S1_I_AXI4S_TKEEP}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {CORETSN_C0_0:AXI4S1_TRGT} -pin_names {CORETSN_C0_0:AXI4S1_I_AXI4S_TLAST}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {CORETSN_C0_0:AXI4S1_TRGT} -pin_names {CORETSN_C0_0:AXI4S1_I_AXI4S_TUSER}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {CORETSN_C0_0:AXI4S0_INITR} -pin_names {CORETSN_C0_0:AXI4S0_O_AXI4S_TVALID}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {CORETSN_C0_0:AXI4S0_INITR} -pin_names {CORETSN_C0_0:AXI4S0_I_AXI4S_TREADY}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {CORETSN_C0_0:AXI4S0_INITR} -pin_names {CORETSN_C0_0:AXI4S0_O_AXI4S_TDATA}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {CORETSN_C0_0:AXI4S0_INITR} -pin_names {CORETSN_C0_0:AXI4S0_O_AXI4S_TKEEP}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {CORETSN_C0_0:AXI4S0_INITR} -pin_names {CORETSN_C0_0:AXI4S0_O_AXI4S_TLAST}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {CORETSN_C0_0:AXI4S0_INITR} -pin_names {CORETSN_C0_0:AXI4S0_O_AXI4S_TUSER}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {CORETSN_C0_0:AXI4S1_INITR} -pin_names {CORETSN_C0_0:AXI4S1_O_AXI4S_TVALID}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {CORETSN_C0_0:AXI4S1_INITR} -pin_names {CORETSN_C0_0:AXI4S1_I_AXI4S_TREADY}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {CORETSN_C0_0:AXI4S1_INITR} -pin_names {CORETSN_C0_0:AXI4S1_O_AXI4S_TDATA}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {CORETSN_C0_0:AXI4S1_INITR} -pin_names {CORETSN_C0_0:AXI4S1_O_AXI4S_TKEEP}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {CORETSN_C0_0:AXI4S1_INITR} -pin_names {CORETSN_C0_0:AXI4S1_O_AXI4S_TLAST}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {CORETSN_C0_0:AXI4S1_INITR} -pin_names {CORETSN_C0_0:AXI4S1_O_AXI4S_TUSER}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORETSN_C0_0:MII_COL_N} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORETSN_C0_0:MII_CRS_IN} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORETSN_C0_0:AXI4S1_I_AXI4S_TVALID} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORETSN_C0_0:AXI4S1_I_AXI4S_TLAST} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORETSN_C0_0:AXI4S1_I_AXI4S_TREADY} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORETSN_C0_0:AXI4S1_I_AXI4S_TDATA} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORETSN_C0_0:AXI4S1_I_AXI4S_TKEEP} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CORETSN_C0_0:AXI4S1_I_AXI4S_TUSER} -value {GND}



# Add DMA_INITIATOR_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {DMA_INITIATOR} -instance_name {DMA_INITIATOR_0}



# Add FIC0_INITIATOR_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {FIC0_INITIATOR} -instance_name {FIC0_INITIATOR_0}



# Add INV_0 instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {INV} -instance_name {INV_0}



# Add NAT_STR_CONV1_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {NAT_STR_CONV1} -hdl_file {hdl\D2S_conv.v} -instance_name {NAT_STR_CONV1_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {NAT_STR_CONV1_0:STR_RDY} -value {VCC}



# Add pckt_generator_checker_0 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {pckt_generator_checker} -instance_name {pckt_generator_checker_0}
# Exporting Parameters of instance pckt_generator_checker_0
sd_configure_core_instance -sd_name ${sd_name} -instance_name {pckt_generator_checker_0} -params {\
"ADDR_DONE:8" \
"ADDR_ERROR_PACKETS_LSB:96" \
"ADDR_ERROR_PACKETS_MSB:92" \
"ADDR_GOOD_PACKETS_LSB:88" \
"ADDR_GOOD_PACKETS_MSB:84" \
"ADDR_IDLE_CNT:36" \
"ADDR_MACDA0:28" \
"ADDR_MACDA1:32" \
"ADDR_MACSA0:20" \
"ADDR_MACSA1:24" \
"ADDR_MON_CTRL:80" \
"ADDR_NUMPKTS:12" \
"ADDR_PKTLENGTH:16" \
"ADDR_PKTSENT:76" \
"ADDR_RANDOMLENGTH:48" \
"ADDR_RCV_BYTE_CNT_LSB:104" \
"ADDR_RCV_BYTE_CNT_MSB:100" \
"ADDR_RNDSEED0:56" \
"ADDR_START:0" \
"ADDR_STOP:4" \
"ADDR_TXPKTCNT_LSB:44" \
"ADDR_TXPKTCNT_MSB:40" \
"ADDR_VLAN_WORD:120" \
"DA_SA:6" \
"DATA_TX:3" \
"EOP_TX:4" \
"ETH_PKT:116" \
"IDLE1:0" \
"IDLE_RCV:0" \
"IDLE_TX:0" \
"ITERATION:128" \
"LEN_TX:2" \
"LOOPBACK:124" \
"PTP_PKT:108" \
"PULSE_DETECTED:1" \
"SA:7" \
"SELECT_LINE:140" \
"SOFT_RST:132" \
"SOFT_RST_OUT:136" \
"SOP_TX:1" \
"VLAN_PKT:112" \
"VLAN_TAG:8" \
"WAIT_TX:5" \
"WAIT_TX1:9" \
"WAIT_TX2:10" }\
-validate_rules 0
sd_save_core_instance_config -sd_name ${sd_name} -instance_name {pckt_generator_checker_0}
sd_update_instance -sd_name ${sd_name} -instance_name {pckt_generator_checker_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {pckt_generator_checker_0:INTERRUPT_IN} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {pckt_generator_checker_0:PKT_RX_ERR_IN} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {pckt_generator_checker_0:RX_STAT_VLD_IN} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {pckt_generator_checker_0:pmac_full} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {pckt_generator_checker_0:ERR_TYPE_IN} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {pckt_generator_checker_0:RX_STAT_IN} -value {GND}



# Add PF_IOD_CDR_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_IOD_CDR_C0} -instance_name {PF_IOD_CDR_C0_0}



# Add PF_IOD_CDR_CCC_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_IOD_CDR_CCC_C0} -instance_name {PF_IOD_CDR_CCC_C0_0}
sd_show_bif_pins -sd_name ${sd_name} -bif_pin_name {PF_IOD_CDR_CCC_C0_0:CDR_CLOCKS} -pin_names {PF_IOD_CDR_CCC_C0_0:PLL_LOCK}



# Add PF_TX_PLL_C1_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_TX_PLL_C0} -instance_name {PF_TX_PLL_C1_0}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_TX_PLL_C1_0:PLL_LOCK}



# Add PF_XCVR_ERM_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_XCVR_ERM_C0} -instance_name {PF_XCVR_ERM_C0_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {PF_XCVR_ERM_C0_0:LANE0_TX_DATA} -value {GND}



# Add SSDetect_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {SSDetect} -hdl_file {hdl\SSDetect.v} -instance_name {SSDetect_0}



# Add STR_NAT_CONV_0 instance
sd_instantiate_hdl_module -sd_name ${sd_name} -hdl_module_name {STR_NAT_CONV} -hdl_file {hdl\S2D_conv.v} -instance_name {STR_NAT_CONV_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {STR_NAT_CONV_0:Pkt_RDY_OUT} -value {VCC}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"ACLK_125MHZ" "CORE1588_C0_0:RXCLK" "CORE1588_C0_0:TXCLK" "COREAXI4PROTOCONV_C0_0:ACLK" "CORESGMII_C0_0:RXCLK" "CORESGMII_C0_0:TXCLK" "CORETSN_C0_0:AXI_S0_CLK" "CORETSN_C0_0:AXI_S1_CLK" "CORETSN_C0_0:MAC_RX_CLK" "CORETSN_C0_0:MAC_SYS_CLK" "CORETSN_C0_0:MAC_TX_CLK" "CoreAXI4SInterconnect_C0_0:ACLK" "DMA_INITIATOR_0:ACLK" "FIC0_INITIATOR_0:ACLK" "NAT_STR_CONV1_0:CLK" "PF_TX_PLL_C1_0:JA_FAB_REF_CLK" "STR_NAT_CONV_0:CLK" "pckt_generator_checker_0:SYSCLK_IN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ARESETN_125MHZ" "CORE1588_C0_0:PTPRSTN" "CORE1588_C0_0:RXRSTN" "CORE1588_C0_0:TXRSTN" "COREAXI4PROTOCONV_C0_0:RESETN" "CORETSN_C0_0:AXIS1_RD_RESET_FIFO_N" "CORETSN_C0_0:AXIS1_WR_RESET_FIFO_N" "CORETSN_C0_0:AXI_S0_RESETN" "CORETSN_C0_0:AXI_S1_RESETN" "CORETSN_C0_0:MAC_RST_N" "CORETSN_C0_0:MAC_SYS_CLK_RSTN" "CORETSN_C0_0:RD_RESET_FIFO_N[0:0]" "CORETSN_C0_0:RD_RESET_FIFO_N[1:1]" "CORETSN_C0_0:RD_RESET_FIFO_N[2:2]" "CORETSN_C0_0:RD_RESET_FIFO_N[3:3]" "CORETSN_C0_0:RD_RESET_FIFO_N[4:4]" "CORETSN_C0_0:RD_RESET_FIFO_N[5:5]" "CORETSN_C0_0:RD_RESET_FIFO_N[6:6]" "CORETSN_C0_0:RD_RESET_FIFO_N[7:7]" "CORETSN_C0_0:WR_RESET_FIFO_N[0:0]" "CORETSN_C0_0:WR_RESET_FIFO_N[1:1]" "CORETSN_C0_0:WR_RESET_FIFO_N[2:2]" "CORETSN_C0_0:WR_RESET_FIFO_N[3:3]" "CORETSN_C0_0:WR_RESET_FIFO_N[4:4]" "CORETSN_C0_0:WR_RESET_FIFO_N[5:5]" "CORETSN_C0_0:WR_RESET_FIFO_N[6:6]" "CORETSN_C0_0:WR_RESET_FIFO_N[7:7]" "CoreAXI4SInterconnect_C0_0:RESETN" "DMA_INITIATOR_0:ARESETN" "FIC0_INITIATOR_0:ARESETN" "INV_0:A" "NAT_STR_CONV1_0:RSTN" "PF_IOD_CDR_C0_0:RST_N" "SSDetect_0:rst_b" "STR_NAT_CONV_0:RSTN" "pckt_generator_checker_0:SYSRST_N_IN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_0:D" "CORESGMII_C0_0:MDO" "CORETSN_C0_0:MDO" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_0:E" "CORESGMII_C0_0:MDOEN" "CORETSN_C0_0:MDOEN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_0:PAD" "PHY_MDIO" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BIBUF_0:Y" "CORESGMII_C0_0:MDI_EXT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLKBUF_DIFF_0:PADN" "PADN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLKBUF_DIFF_0:PADP" "PADP" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLKBUF_DIFF_0:Y" "PF_IOD_CDR_CCC_C0_0:REF_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORE1588_C0_0:COL" "CORESGMII_C0_0:COL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORE1588_C0_0:CRS" "CORESGMII_C0_0:CRS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORE1588_C0_0:PCLK" "CORETSN_C0_0:PCLK" "PCLK" "pckt_generator_checker_0:PCLK_IN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORE1588_C0_0:PRESETN" "CORETSN_C0_0:PRESETn" "PRESETn_CLK50" "pckt_generator_checker_0:PRESET_N_IN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORE1588_C0_0:PTP_CLK" "PF_XCVR_ERM_C0_0:LANE0_TX_CLK_R" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORE1588_C0_0:RXDV" "CORESGMII_C0_0:RXDV" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORE1588_C0_0:RXDV_MAC" "CORETSN_C0_0:MII_RXDV_IN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORE1588_C0_0:RXER" "CORESGMII_C0_0:RXER" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORE1588_C0_0:RXER_MAC" "CORETSN_C0_0:MII_RXER_IN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORE1588_C0_0:TXEN" "CORESGMII_C0_0:TXEN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORE1588_C0_0:TXEN_MAC" "CORETSN_C0_0:MII_TXEN_OUT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORE1588_C0_0:TXER" "CORESGMII_C0_0:TXER" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORE1588_C0_0:TXER_MAC" "CORETSN_C0_0:MII_TXER_OUT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREAXI4PROTOCONV_C0_0:I_AXI4S_TLAST" "CoreAXI4SInterconnect_C0_0:AXI4S_T0TLAST" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREAXI4PROTOCONV_C0_0:I_AXI4S_TREADY" "CoreAXI4SInterconnect_C0_0:AXI4S_T0TREADY" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREAXI4PROTOCONV_C0_0:I_AXI4S_TUSER" "CORETSN_C0_0:AXI4S0_I_AXI4S_TUSER" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREAXI4PROTOCONV_C0_0:I_AXI4S_TVALID" "CoreAXI4SInterconnect_C0_0:AXI4S_T0TVALID" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREAXI4PROTOCONV_C0_0:MM2S_INT" "MM2S_INT_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREAXI4PROTOCONV_C0_0:S2MM_INT" "S2MM_INT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREAXI4PROTOCONV_C0_0:T_AXI4S_TLAST" "CORETSN_C0_0:AXI4S0_O_AXI4S_TLAST" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREAXI4PROTOCONV_C0_0:T_AXI4S_TREADY" "CORETSN_C0_0:AXI4S0_I_AXI4S_TREADY" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREAXI4PROTOCONV_C0_0:T_AXI4S_TUSER" "CORETSN_C0_0:AXI4S0_O_AXI4S_TUSER" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREAXI4PROTOCONV_C0_0:T_AXI4S_TVALID" "CORETSN_C0_0:AXI4S0_O_AXI4S_TVALID" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORESGMII_C0_0:MDC" "CORETSN_C0_0:MDC" "MDC" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORESGMII_C0_0:MDI" "CORETSN_C0_0:MDI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORESGMII_C0_0:RESET" "INV_0:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORESGMII_C0_0:TBI_RX_CLK" "PF_IOD_CDR_C0_0:RX_CLK_R" "SSDetect_0:rck" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORESGMII_C0_0:TBI_TX_CLK" "PF_IOD_CDR_CCC_C0_0:TX_CLK_G" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORETSN_C0_0:AXI4S0_I_AXI4S_TLAST" "CoreAXI4SInterconnect_C0_0:AXI4S_I0TLAST" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORETSN_C0_0:AXI4S0_I_AXI4S_TVALID" "CoreAXI4SInterconnect_C0_0:AXI4S_I0TVALID" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORETSN_C0_0:AXI4S0_O_AXI4S_TREADY" "CoreAXI4SInterconnect_C0_0:AXI4S_I0TREADY" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORETSN_C0_0:AXI4S1_O_AXI4S_TLAST" "STR_NAT_CONV_0:STR_TLAST_IN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORETSN_C0_0:AXI4S1_O_AXI4S_TUSER" "STR_NAT_CONV_0:STR_TUSER_IN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORETSN_C0_0:AXI4S1_O_AXI4S_TVALID" "STR_NAT_CONV_0:STR_TVALID_IN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreAXI4SInterconnect_C0_0:AXI4S_T1TLAST" "NAT_STR_CONV1_0:STRS_TLAST" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreAXI4SInterconnect_C0_0:AXI4S_T1TREADY" "pckt_generator_checker_0:PKT_TX_FIFO_READY_IN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreAXI4SInterconnect_C0_0:AXI4S_T1TVALID" "NAT_STR_CONV1_0:STR_TVALID" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"IOD_CDR_CCC_PLL_LOCK" "PF_IOD_CDR_CCC_C0_0:PLL_LOCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"IOD_CDR_CCC_RST" "PF_IOD_CDR_CCC_C0_0:ARST_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_CDR_REF_CLK" "PF_TX_PLL_C1_0:REF_CLK" "PF_XCVR_ERM_C0_0:LANE0_CDR_REF_CLK_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_PCS_ARST_N" "PF_XCVR_ERM_C0_0:LANE0_PCS_ARST_N" "PF_XCVR_ERM_C0_0:LANE0_PMA_ARST_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_RXD_N" "PF_XCVR_ERM_C0_0:LANE0_RXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_RXD_P" "PF_XCVR_ERM_C0_0:LANE0_RXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_TXD_N" "PF_XCVR_ERM_C0_0:LANE0_TXD_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"LANE0_TXD_P" "PF_XCVR_ERM_C0_0:LANE0_TXD_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"NAT_STR_CONV1_0:Pkt_EOF" "pckt_generator_checker_0:PKT_TX_EOP_OUT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"NAT_STR_CONV1_0:Pkt_SOF" "pckt_generator_checker_0:PKT_TX_SOP_OUT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_IOD_CDR_C0_0:RX_N" "RX_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_IOD_CDR_C0_0:RX_P" "RX_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_IOD_CDR_C0_0:STREAM_START" "SSDetect_0:stream_start" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_IOD_CDR_C0_0:TX_N" "TX_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_IOD_CDR_C0_0:TX_P" "TX_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"STR_NAT_CONV_0:Pkt_EOF_OUT" "pckt_generator_checker_0:PKT_RX_EOP_IN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"STR_NAT_CONV_0:Pkt_SOF_OUT" "pckt_generator_checker_0:PKT_RX_SOP_IN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"STR_NAT_CONV_0:STR_RDY_IN" "pckt_generator_checker_0:PKT_RX_VAL_IN" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORE1588_C0_0:INTERNAL_TIMER[101:24]" "CORETSN_C0_0:BASE_TIME_1588" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORE1588_C0_0:RXD" "CORESGMII_C0_0:RXD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORE1588_C0_0:RXD_MAC" "CORETSN_C0_0:MII_RXD_IN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORE1588_C0_0:TXD" "CORESGMII_C0_0:TXD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORE1588_C0_0:TXD_MAC" "CORETSN_C0_0:MII_TXD_OUT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREAXI4PROTOCONV_C0_0:I_AXI4S_TDATA" "CoreAXI4SInterconnect_C0_0:AXI4S_T0TDATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREAXI4PROTOCONV_C0_0:I_AXI4S_TKEEP" "CoreAXI4SInterconnect_C0_0:AXI4S_T0TKEEP" "CoreAXI4SInterconnect_C0_0:AXI4S_T0TSTRB" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREAXI4PROTOCONV_C0_0:T_AXI4S_TDATA" "CORETSN_C0_0:AXI4S0_O_AXI4S_TDATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREAXI4PROTOCONV_C0_0:T_AXI4S_TKEEP" "CORETSN_C0_0:AXI4S0_O_AXI4S_TKEEP" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORESGMII_C0_0:RCG" "PF_IOD_CDR_C0_0:RX_DATA" "SSDetect_0:rx_data" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORESGMII_C0_0:TCG" "PF_IOD_CDR_C0_0:TX_DATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORETSN_C0_0:AXI4S0_I_AXI4S_TDATA" "CoreAXI4SInterconnect_C0_0:AXI4S_I0TDATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORETSN_C0_0:AXI4S0_I_AXI4S_TKEEP" "CoreAXI4SInterconnect_C0_0:AXI4S_I0TKEEP" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORETSN_C0_0:AXI4S1_O_AXI4S_TDATA" "STR_NAT_CONV_0:STR_TDATA_IN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORETSN_C0_0:AXI4S1_O_AXI4S_TKEEP" "STR_NAT_CONV_0:STR_TKEEP_IN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreAXI4SInterconnect_C0_0:AXI4S_T1TDATA" "NAT_STR_CONV1_0:STR_TDATA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreAXI4SInterconnect_C0_0:AXI4S_T1TKEEP" "CoreAXI4SInterconnect_C0_0:AXI4S_T1TSTRB" "NAT_STR_CONV1_0:STR_TKEEP" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"NAT_STR_CONV1_0:BC" "pckt_generator_checker_0:PKT_TX_MOD_OUT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"NAT_STR_CONV1_0:Pkt_DATA" "pckt_generator_checker_0:PKT_TX_DATA_OUT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"STR_NAT_CONV_0:BC_OUT" "pckt_generator_checker_0:PKT_RX_MOD_IN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"STR_NAT_CONV_0:Pkt_DATA_OUT" "pckt_generator_checker_0:PKT_RX_DATA_IN" }

# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB_1588" "CORE1588_C0_0:APB" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4mmaster0" "FIC0_INITIATOR_0:AXI4mmaster0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AXI4mslave0" "DMA_INITIATOR_0:AXI4mslave0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREAXI4PROTOCONV_C0_0:AXI4L_TRGT" "FIC0_INITIATOR_0:AXI4mslave2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREAXI4PROTOCONV_C0_0:MM2S_AXI4MM_INITR" "DMA_INITIATOR_0:AXI4mmaster1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"COREAXI4PROTOCONV_C0_0:S2MM_AXI4MM_INITR" "DMA_INITIATOR_0:AXI4mmaster2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CORETSN_C0_0:APB_SLAVE" "TSN_APB_SLAVE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCKT_GEN_APB_SLAVE" "pckt_generator_checker_0:BIF_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_IOD_CDR_C0_0:CDR_CLOCKS" "PF_IOD_CDR_CCC_C0_0:CDR_CLOCKS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_TX_PLL_C1_0:CLKS_TO_XCVR" "PF_XCVR_ERM_C0_0:CLKS_FROM_TXPLL_0" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the SmartDesign 
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign "FIC_0_PERIPHERALS"
generate_component -component_name ${sd_name}
