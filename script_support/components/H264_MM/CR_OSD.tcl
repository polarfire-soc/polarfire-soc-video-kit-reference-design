# Exporting core CR_OSD to TCL
# Exporting Create HDL core command for module CR_OSD
create_hdl_core -file {hdl/CR_OSD.v} -module {CR_OSD} -library {work} -package {}
# Exporting BIF information of  HDL core command for module CR_OSD
hdl_core_add_bif -hdl_core_name {CR_OSD} -bif_definition {AXI4:AMBA:AMBA4:slave} -bif_name {AXI4L_OSD} -signal_map {\
"AWADDR:awaddr" \
"AWVALID:awvalid" \
"AWREADY:awready" \
"WDATA:wdata" \
"WVALID:wvalid" \
"WREADY:wready" \
"BRESP:bresp" \
"BVALID:bvalid" \
"BREADY:bready" \
"ARADDR:araddr" \
"ARVALID:arvalid" \
"ARREADY:arready" \
"RDATA:rdata" \
"RRESP:rresp" \
"RVALID:rvalid" \
"RREADY:rready" }
