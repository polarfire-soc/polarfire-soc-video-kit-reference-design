# Exporting core pckt_generator_checker to TCL
# Exporting Create HDL core command for module pckt_generator_checker
create_hdl_core -file {hdl/pckt_generator_checker.v} -module {pckt_generator_checker} -library {work} -package {}
# Exporting BIF information of  HDL core command for module pckt_generator_checker
hdl_core_add_bif -hdl_core_name {pckt_generator_checker} -bif_definition {APB:AMBA:AMBA2:slave} -bif_name {BIF_1} -signal_map {\
"PADDR:PADDR_IN" \
"PSELx:PSEL_IN" \
"PENABLE:PENABLE_IN" \
"PWRITE:PWRITE_IN" \
"PRDATA:PRDATA_OUT" \
"PWDATA:PWDATA_IN" \
"PREADY:PREADY_OUT" }
