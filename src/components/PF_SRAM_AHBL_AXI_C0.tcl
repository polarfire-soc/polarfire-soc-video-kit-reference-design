# Exporting Component Description of PF_SRAM_AHBL_AXI_C0 to TCL
# Family: PolarFireSoC
# Part Number: MPFS250T_ES-1FCG1152E
# Create and Configure the core component PF_SRAM_AHBL_AXI_C0
create_and_configure_core -core_vlnv {Actel:SystemBuilder:PF_SRAM_AHBL_AXI:1.2.108} -component_name {PF_SRAM_AHBL_AXI_C0} -params {\
"AXI4_AWIDTH:32" \
"AXI4_DWIDTH:64" \
"AXI4_IDWIDTH:8" \
"AXI4_IFTYPE_RD:T" \
"AXI4_IFTYPE_WR:T" \
"AXI4_WRAP_SUPPORT:F" \
"BYTEENABLES:1" \
"BYTE_ENABLE_WIDTH:8" \
"B_REN_POLARITY:2" \
"CASCADE:1" \
"ECC_OPTIONS:0" \
"FABRIC_INTERFACE_TYPE:1" \
"IMPORT_FILE:" \
"INIT_RAM:F" \
"LPM_HINT:0" \
"PIPELINE_OPTIONS:1" \
"RDEPTH:1024" \
"RWIDTH:80" \
"USE_NATIVE_INTERFACE:F" \
"WDEPTH:1024" \
"WWIDTH:80" }
# Exporting Component Description of PF_SRAM_AHBL_AXI_C0 to TCL done
