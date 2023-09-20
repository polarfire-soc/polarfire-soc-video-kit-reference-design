# Exporting core axi4lite_adapter_dma to TCL
# Exporting Create HDL core command for module axi4lite_adapter_dma
create_hdl_core -file {hdl/axi4lite_adapter_dma.v} -module {axi4lite_adapter_dma} -library {work} -package {}
# Exporting BIF information of  HDL core command for module axi4lite_adapter_dma
hdl_core_add_bif -hdl_core_name {axi4lite_adapter_dma} -bif_definition {AXI4:AMBA:AMBA4:slave} -bif_name {AXI4L_dma} -signal_map {\
"AWADDR:awaddr" \
"AWPROT:awprot" \
"AWVALID:awvalid" \
"AWREADY:awready" \
"WDATA:wdata" \
"WSTRB:wstrb" \
"WVALID:wvalid" \
"WREADY:wready" \
"BRESP:bresp" \
"BVALID:bvalid" \
"BREADY:bready" \
"ARADDR:araddr" \
"ARPROT:arprot" \
"ARVALID:arvalid" \
"ARREADY:arready" \
"RDATA:rdata" \
"RRESP:rresp" \
"RVALID:rvalid" \
"RREADY:rready" }
