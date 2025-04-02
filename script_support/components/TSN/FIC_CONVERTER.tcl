# Creating SmartDesign "FIC_CONVERTER"
set sd_name {FIC_CONVERTER}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave16_PREADYS16} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave16_PSLVERRS16} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave2_PREADYS2} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave2_PSLVERRS2} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave3_PREADYS3} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave3_PSLVERRS3} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC3_APB3_master_PENABLE} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC3_APB3_master_PSEL} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC3_APB3_master_PWRITE} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave16_PSELS16} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave2_PENABLES} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave2_PSELS2} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave2_PWRITES} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APBmslave3_PSELS3} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC3_APB3_master_PREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC3_APB3_master_PSLVERR} -port_direction {OUT}


# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {APBmslave16_PRDATAS16} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {APBmslave2_PRDATAS2} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {APBmslave3_PRDATAS3} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC3_APB3_master_PADDR} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC3_APB3_master_PWDATA} -port_direction {IN} -port_range {[31:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {APBmslave2_PADDRS} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {APBmslave2_PWDATAS} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {FIC3_APB3_master_PRDATA} -port_direction {OUT} -port_range {[31:0]}


# Create top level Bus interface Ports
sd_create_bif_port -sd_name ${sd_name} -port_name {FIC3_APB3_master} -port_bif_vlnv {AMBA:AMBA2:APB:r0p0} -port_bif_role {mirroredMaster} -port_bif_mapping {\
"PADDR:FIC3_APB3_master_PADDR" \
"PSELx:FIC3_APB3_master_PSEL" \
"PENABLE:FIC3_APB3_master_PENABLE" \
"PWRITE:FIC3_APB3_master_PWRITE" \
"PRDATA:FIC3_APB3_master_PRDATA" \
"PWDATA:FIC3_APB3_master_PWDATA" \
"PREADY:FIC3_APB3_master_PREADY" \
"PSLVERR:FIC3_APB3_master_PSLVERR" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {APBmslave2} -port_bif_vlnv {AMBA:AMBA2:APB:r0p0} -port_bif_role {mirroredSlave} -port_bif_mapping {\
"PADDR:APBmslave2_PADDRS" \
"PSELx:APBmslave2_PSELS2" \
"PENABLE:APBmslave2_PENABLES" \
"PWRITE:APBmslave2_PWRITES" \
"PRDATA:APBmslave2_PRDATAS2" \
"PWDATA:APBmslave2_PWDATAS" \
"PREADY:APBmslave2_PREADYS2" \
"PSLVERR:APBmslave2_PSLVERRS2" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {APBmslave16} -port_bif_vlnv {AMBA:AMBA2:APB:r0p0} -port_bif_role {mirroredSlave} -port_bif_mapping {\
"PADDR:APBmslave2_PADDRS" \
"PSELx:APBmslave16_PSELS16" \
"PENABLE:APBmslave2_PENABLES" \
"PWRITE:APBmslave2_PWRITES" \
"PRDATA:APBmslave16_PRDATAS16" \
"PWDATA:APBmslave2_PWDATAS" \
"PREADY:APBmslave16_PREADYS16" \
"PSLVERR:APBmslave16_PSLVERRS16" } 

sd_create_bif_port -sd_name ${sd_name} -port_name {APBmslave3} -port_bif_vlnv {AMBA:AMBA2:APB:r0p0} -port_bif_role {mirroredSlave} -port_bif_mapping {\
"PADDR:APBmslave2_PADDRS" \
"PSELx:APBmslave3_PSELS3" \
"PENABLE:APBmslave2_PENABLES" \
"PWRITE:APBmslave2_PWRITES" \
"PRDATA:APBmslave3_PRDATAS3" \
"PWDATA:APBmslave2_PWDATAS" \
"PREADY:APBmslave3_PREADYS3" \
"PSLVERR:APBmslave3_PSLVERRS3" } 

# Add CoreAPB3_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CoreAPB3_C0} -instance_name {CoreAPB3_C0_0}





# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"APBmslave16" "CoreAPB3_C0_0:APBmslave16" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"APBmslave2" "CoreAPB3_C0_0:APBmslave2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"APBmslave3" "CoreAPB3_C0_0:APBmslave3" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreAPB3_C0_0:APB3mmaster" "FIC3_APB3_master" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the SmartDesign 
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign "FIC_CONVERTER"
generate_component -component_name ${sd_name}
