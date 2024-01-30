# Exporting Component Description of VDMA_C0 to TCL
# Family: PolarFireSoC
# Part Number: MPFS250TS-1FCG1152I
# Create and Configure the core component VDMA_C0
create_and_configure_core \
    -core_vlnv $vdma_ip_vlnv \
    -component_name {VDMA_C0} -params {\
"g_IP_DW:8"   }
# Exporting Component Description of VDMA_C0 to TCL done
