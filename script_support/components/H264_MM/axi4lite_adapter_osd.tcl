# Exporting core axi4lite_adapter_osd to TCL
# Exporting Create HDL core command for module axi4lite_adapter_osd
create_hdl_core -file {hdl/axi4lite_adapter_osd.v} -module {axi4lite_adapter_osd} -library {work} -package {}
# Exporting BIF information of  HDL core command for module axi4lite_adapter_osd
hdl_core_add_bif -hdl_core_name {axi4lite_adapter_osd} -bif_definition {AXI4:AMBA:AMBA4:slave} -bif_name {AXI4L_OSD} -signal_map {\
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
