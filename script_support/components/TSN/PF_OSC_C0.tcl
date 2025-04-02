# Exporting Component Description of PF_OSC_C0 to TCL
# Family: PolarFireSoC
# Part Number: MPFS250TS-1FCG1152I
# Create and Configure the core component PF_OSC_C0
create_and_configure_core -core_vlnv {Actel:SgCore:PF_OSC:1.0.102} -component_name {PF_OSC_C0} -params {\
"RCOSC_2MHZ_CLK_DIV_EN:true"  \
"RCOSC_2MHZ_GL_EN:false"  \
"RCOSC_2MHZ_NGMUX_EN:false"  \
"RCOSC_160MHZ_CLK_DIV_EN:false"  \
"RCOSC_160MHZ_GL_EN:false"  \
"RCOSC_160MHZ_NGMUX_EN:false"   }
# Exporting Component Description of PF_OSC_C0 to TCL done
