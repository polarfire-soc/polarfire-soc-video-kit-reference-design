# Exporting Component Description of PF_TX_PLL_C1 to TCL
# Family: PolarFireSoC
# Part Number: MPFS250TS-1FCG1152I
# Create and Configure the core component PF_TX_PLL_C1
create_and_configure_core -core_vlnv {Actel:SgCore:PF_TX_PLL:2.0.304} -component_name {PF_TX_PLL_C0} -params {\
"CORE:PF_TX_PLL"  \
"INIT:0x0"  \
"TxPLL_AUX_LOW_SEL:true"  \
"TxPLL_AUX_OUT:125"  \
"TxPLL_BANDWIDTH:Low"  \
"TxPLL_CLK_125_EN:true"  \
"TxPLL_DYNAMIC_RECONFIG_INTERFACE_EN:true"  \
"TxPLL_EXT_WAVE_SEL:0"  \
"TxPLL_FAB_LOCK_EN:false"  \
"TxPLL_FAB_REF:200"  \
"TxPLL_INTEGER_MODE:false"  \
"TxPLL_JITTER_MODE_AT_POWERUP:true"  \
"TxPLL_JITTER_MODE_CUT_OFF_FREQ:5000"  \
"TxPLL_JITTER_MODE_OPTIMIZE_FOR:0"  \
"TxPLL_JITTER_MODE_REFCLK_FREQ:125"  \
"TxPLL_JITTER_MODE_REFCLK_SEL:FABRIC"  \
"TxPLL_JITTER_MODE_SEL:Custom Protocol Settings"  \
"TxPLL_JITTER_MODE_WANDER:15"  \
"TxPLL_LANE_ALIGNMENT_EN:false"  \
"TxPLL_MODE:JITTER"  \
"TxPLL_OUT:2500.000"  \
"TxPLL_REF:125"  \
"TxPLL_RN_FILTER:false"  \
"TxPLL_SOURCE:DEDICATED"  \
"TxPLL_SSM_DEPTH:0"  \
"TxPLL_SSM_DIVVAL:1"  \
"TxPLL_SSM_DOWN_SPREAD:false"  \
"TxPLL_SSM_FREQ:64"  \
"TxPLL_SSM_RAND_PATTERN:0"  \
"VCOFREQUENCY:1600"   }
# Exporting Component Description of PF_TX_PLL_C1 to TCL done
