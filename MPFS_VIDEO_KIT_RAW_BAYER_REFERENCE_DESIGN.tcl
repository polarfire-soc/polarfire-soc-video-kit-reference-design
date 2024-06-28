##################################################################################
##################################################################################
#
# // PFSoC Video Kit Libero design
#
##################################################################################
##################################################################################

##################################################################################
##################################################################################
# // Check Libero version and path length to verify project can be created
##################################################################################
##################################################################################
set libero_version 2023.2
set my_platform "Linux"

if {[string compare [string range [get_libero_version] 0 5] "$libero_version"]==0} {
    puts "Libero $libero_version detected."
} else {
    error "Incorrect Libero version. Please use Libero $libero_version to run these scripts."
}


if { [lindex $tcl_platform(os) 0]  == "Windows" } {    
	if {[string length [pwd]] < 90} {
		puts "Project path length ok."
	} else {
		error "Path to project is too long, please reduce the path and try again."
	}
set my_platform "Windows"
}

###################################################################################
# // Process arguments
###################################################################################

if { $::argc > 0 } {
        set i 1
        foreach arg $::argv {
                if {[string match "*:*" $arg]} {
                        set temp [split $arg ":"]
                        puts "Setting parameter [lindex $temp 0] to [lindex $temp 1]"
                        set [lindex $temp 0] "[lindex $temp 1]"
	        } else {
                        set $arg 1
	                puts "set $arg to 1"
                }
                incr i
        }
} else {
        puts "No command line argument passed"
}

###################################################################################
# // Set required variables and add functions
###################################################################################

set install_loc [defvar_get -name ACTEL_SW_DIR]
set mss_config_loc "$install_loc/bin64/pfsoc_mss"
set local_dir [pwd]
set src_path ./script_support/
set constraint_path ./script_support/constraints/RAW_BAYER
set project_name "VKPFSOC_RAW_BAYER"
set project_dir "${project_name}"
source ./script_support/additional_configurations/functions_RAW_BAYER.tcl

###################################################################################
# // Create Libero project
###################################################################################
new_project \
	-location $project_dir \
	-name $project_name \
	-project_description {} \
	-block_mode 0 \
	-standalone_peripheral_initialization 0 \
	-instantiate_in_smartdesign 1 \
	-ondemand_build_dh 1 \
	-use_relative_path 0 \
	-linked_files_root_dir_env {} \
	-hdl {VERILOG} \
	-family {PolarFireSoC} \
	-die {MPFS250TS} \
	-package {FCG1152} \
	-speed {-1} \
	-die_voltage {1.05} \
	-part_range {IND} \
        -adv_options {IO_DEFT_STD:LVCMOS 1.8V} \
        -adv_options {RESERVEMIGRATIONPINS:1} \
	-adv_options {RESTRICTPROBEPINS:1} \
	-adv_options {RESTRICTSPIPINS:0} \
	-adv_options {SYSTEM_CONTROLLER_SUSPEND_MODE:0} \
	-adv_options {TEMPR:IND} \
	-adv_options {VCCI_1.2_VOLTR:IND} \
	-adv_options {VCCI_1.5_VOLTR:IND} \
	-adv_options {VCCI_1.8_VOLTR:IND} \
	-adv_options {VCCI_2.5_VOLTR:IND} \
	-adv_options {VCCI_3.3_VOLTR:IND} \
	-adv_options {VOLTR:IND}


# #
# #// Download required cores
# #

download_core -vlnv {Actel:DirectCore:COREAXI4INTERCONNECT:2.8.103} -location {www.microchip-ip.com/repositories/DirectCore}
download_core -vlnv {Actel:DirectCore:CORERESET_PF:2.3.100} -location {www.microchip-ip.com/repositories/DirectCore}
download_core -vlnv {Microsemi:SgCore:PFSOC_INIT_MONITOR:1.0.307} -location {www.microchip-ip.com/repositories/SgCore}
download_core -vlnv {Actel:SgCore:PF_CCC:2.2.220} -location {www.microchip-ip.com/repositories/SgCore}
download_core -vlnv {Actel:SgCore:PF_CLK_DIV:1.0.103} -location {www.microchip-ip.com/repositories/SgCore}
download_core -vlnv {Actel:SystemBuilder:PF_IOD_GENERIC_RX:2.1.110} -location {www.microchip-ip.com/repositories/SgCore}
download_core -vlnv {Actel:SgCore:PF_OSC:1.0.102} -location {www.microchip-ip.com/repositories/SgCore}
download_core -vlnv {Actel:SgCore:PF_XCVR_REF_CLK:1.0.103} -location {www.microchip-ip.com/repositories/SgCore}
download_core -vlnv {Microchip:SolutionCore:mipicsi2rxdecoderPF:5.0.0} -location {www.microchip-ip.com/repositories/DirectCore}
download_core -vlnv {Microchip:SolutionCore:MIPI_TRAINING_LITE:1.0.0} -location {www.microchip-ip.com/repositories/DirectCore}
download_core -vlnv {Microchip:SolutionCore:VDMA:1.0.0} -location {www.microchip-ip.com/repositories/DirectCore}


# Copy source files
file mkdir $project_dir/MSS_VIDEO_KIT/
file copy $src_path/MSS_VIDEO_KIT/RAW_BAYER/ $project_dir/MSS_VIDEO_KIT/

#
# // Generate base design
#
exec $mss_config_loc -GENERATE -CONFIGURATION_FILE:$project_dir/MSS_VIDEO_KIT/RAW_BAYER/MSS_VIDEO_KIT_RAW_BAYER.cfg -OUTPUT_DIR:${project_dir}/MSS_VIDEO_KIT/RAW_BAYER/
import_mss_component -file "$project_dir/MSS_VIDEO_KIT/RAW_BAYER/MSS_VIDEO_KIT_RAW_BAYER.cxz"

#This Tcl file sources other Tcl files to build the design(on which recursive export is run) in a bottom-up fashion

#Sourcing the Tcl file in which all the HDL source files used in the design are imported or linked
source ${src_path}/hdl_source_RAW_BAYER.tcl
build_design_hierarchy

#Sourcing the Tclfiles for creating individual ${src_path}/components under the top level
source ${src_path}/components/RAW_BAYER/CORERESET_PF_C0.tcl
source ${src_path}/components/RAW_BAYER/INIT_MONITOR.tcl
source ${src_path}/components/RAW_BAYER/PF_CCC_C0.tcl
source ${src_path}/components/RAW_BAYER/PF_CLK_DIV_C0.tcl
source ${src_path}/components/RAW_BAYER/PF_OSC_C0.tcl
source ${src_path}/components/RAW_BAYER/PF_XCVR_REF_CLK_C0.tcl
source ${src_path}/components/RAW_BAYER/CLOCKS_AND_RESETS.tcl
source ${src_path}/components/RAW_BAYER/COREAXI4INTERCONNECT_C0.tcl
source ${src_path}/components/RAW_BAYER/FIC_CONVERTER.tcl
source ${src_path}/components/RAW_BAYER/CORERESET_PF_C1.tcl
source ${src_path}/components/RAW_BAYER/MIPI_TRAINING_LITE_C0.tcl
source ${src_path}/components/RAW_BAYER/PF_IOD_GENERIC_RX_C0.tcl
source ${src_path}/components/RAW_BAYER/CAM_IOD_TIP_TOP.tcl
source ${src_path}/components/RAW_BAYER/CORERESET_PF_C2.tcl
source ${src_path}/components/RAW_BAYER/CORERESET_PF_C3.tcl
source ${src_path}/components/RAW_BAYER/PF_CCC_C1.tcl
source ${src_path}/components/RAW_BAYER/mipicsi2rxdecoderPF_C0.tcl
source ${src_path}/components/RAW_BAYER/IMX334_IF_TOP.tcl
source ${src_path}/components/RAW_BAYER/VDMA_C0.tcl
source ${src_path}/components/RAW_BAYER/Video_Pipeline.tcl
source ${src_path}/components/RAW_BAYER/VKPFSOC_RAW_BAYER.tcl
build_design_hierarchy
set_root -module ${project_name}::work


#
# // Import I/O constraints
#
import_files \
	-convert_EDN_to_HDL 0 \
	-io_pdc "${constraint_path}/io/user.pdc" \

set_as_target -type {io_pdc} -file "${constraint_path}/io/user.pdc"

#
# // Import floor planning constraints
#
import_files \
    -convert_EDN_to_HDL 0 \
    -fp_pdc "${constraint_path}/fp/user.pdc"

#
# // Import timing constraint
#

import_files \
	-convert_EDN_to_HDL 0 \
	-sdc "${constraint_path}/user.sdc"
set_as_target -type {sdc} -file "${constraint_path}/user.sdc"

#
# // Derive timing constraints
#
derive_constraints_sdc 


# #
# # // Associate imported constraints with the design flow
# #
organize_tool_files -tool {SYNTHESIZE} \
    -file "${project_dir}/constraint/${project_name}_derived_constraints.sdc"\
    -module ${project_name}::work \
    -input_type {constraint}

organize_tool_files -tool {PLACEROUTE} \
    -file "${project_dir}/constraint/io/user.pdc" \
    -file "${project_dir}/constraint/${project_name}_derived_constraints.sdc"\
    -file "${project_dir}/constraint/user.sdc" \
    -file "${project_dir}/constraint/fp/user.pdc" \
    -module ${project_name}::work \
    -input_type {constraint}


set_as_target -type {io_pdc} -file "${project_dir}/constraint/io/user.pdc"
save_project

organize_tool_files -tool {VERIFYTIMING} \
    -file "${project_dir}/constraint/user.sdc" \
    -file "${project_dir}/constraint/${project_name}_derived_constraints.sdc" \
    -module ${project_name}::work \
    -input_type {constraint}


#
# //Configure the tools
#
configure_tool \
    -name {PLACEROUTE} \
    -params {DELAY_ANALYSIS:MAX} \
    -params {EFFORT_LEVEL:false} \
    -params {GB_DEMOTION:true} \
    -params {INCRPLACEANDROUTE:false} \
    -params {IOREG_COMBINING:false} \
    -params {MULTI_PASS_CRITERIA:VIOLATIONS} \
    -params {MULTI_PASS_LAYOUT:false} \
    -params {NUM_MULTI_PASSES:5} \
    -params {PDPR:false} \
    -params {RANDOM_SEED:0} \
    -params {REPAIR_MIN_DELAY:false} \
    -params {REPLICATION:true} \
    -params {SLACK_CRITERIA:WORST_SLACK} \
    -params {SPECIFIC_CLOCK:} \
    -params {START_SEED_INDEX:1} \
    -params {STOP_ON_FIRST_PASS:false} \
    -params {TDPR:true}


configure_tool \
    -name {VERIFYTIMING} \
    -params {CONSTRAINTS_COVERAGE:1} \
    -params {FORMAT:XML} \
    -params {MAX_EXPANDED_PATHS_TIMING:1} \
    -params {MAX_EXPANDED_PATHS_VIOLATION:0} \
    -params {MAX_PARALLEL_PATHS_TIMING:1} \
    -params {MAX_PARALLEL_PATHS_VIOLATION:1} \
    -params {MAX_PATHS_INTERACTIVE_REPORT:1000} \
    -params {MAX_PATHS_TIMING:5} \
    -params {MAX_PATHS_VIOLATION:20} \
    -params {MAX_TIMING_FAST_HV_LT:1} \
    -params {MAX_TIMING_MULTI_CORNER:1} \
    -params {MAX_TIMING_SLOW_LV_HT:1} \
    -params {MAX_TIMING_SLOW_LV_LT:1} \
    -params {MAX_TIMING_VIOLATIONS_FAST_HV_LT:1} \
    -params {MAX_TIMING_VIOLATIONS_MULTI_CORNER:1} \
    -params {MAX_TIMING_VIOLATIONS_SLOW_LV_HT:1} \
    -params {MAX_TIMING_VIOLATIONS_SLOW_LV_LT:1} \
    -params {MIN_TIMING_FAST_HV_LT:1} \
    -params {MIN_TIMING_MULTI_CORNER:1} \
    -params {MIN_TIMING_SLOW_LV_HT:1} \
    -params {MIN_TIMING_SLOW_LV_LT:1} \
    -params {MIN_TIMING_VIOLATIONS_FAST_HV_LT:1} \
    -params {MIN_TIMING_VIOLATIONS_MULTI_CORNER:1} \
    -params {MIN_TIMING_VIOLATIONS_SLOW_LV_HT:1} \
    -params {MIN_TIMING_VIOLATIONS_SLOW_LV_LT:1} \
    -params {SLACK_THRESHOLD_VIOLATION:0.0} \
    -params {SMART_INTERACTIVE:1}


#
# // Run the design flow and add eNVM clients
#

if {[info exists SYNTHESIZE]} {
    run_tool -name {SYNTHESIZE}
}

if {[info exists PLACEROUTE]} {
    run_tool -name {PLACEROUTE}
}

if {[info exists VERIFY_TIMING]} {
    run_tool -name {VERIFYTIMING}
}

if {[info exists HSS_UPDATE]} {
    create_eNVM_config "$project_dir/MSS_VIDEO_KIT/RAW_BAYER/ENVM.cfg" MSS_VIDEO_KIT/RAW_BAYER/hss-envm-wrapper-bm1-p0.hex
    run_tool -name {GENERATEPROGRAMMINGDATA}
    configure_envm -cfg_file "$project_dir/MSS_VIDEO_KIT/RAW_BAYER/ENVM.cfg"
}

if {[info exists SPIFLASH_DATA]} {
    if {$my_platform == "Linux"} {
	if {[catch {exec python generate_overlays_spiclient_data.py RAW_BAYER} issue]} {}
    } else {
	file copy $local_dir/script_support/dtso_overlay/RAW_BAYER/mpfs_video_bayer.dtbo $local_dir/mpfs_dtbo.bin
	if {[catch {exec cmd.exe /c "wsl.exe -e python generate_overlays_spiclient_data.py RAW_BAYER"} issue]} {}
    }
    create_spiflash "$project_dir/MSS_VIDEO_KIT/RAW_BAYER/spiflash.cfg" $local_dir
    run_tool -name {GENERATEPROGRAMMINGDATA}
    configure_spiflash -cfg_file "$project_dir/MSS_VIDEO_KIT/RAW_BAYER/spiflash.cfg"
}

if {[info exists GENERATE_PROGRAMMING_DATA]} {
    run_tool -name {GENERATEPROGRAMMINGDATA}
}

if {[info exists PROGRAM]} {
    if !{[info exists HSS_UPDATE]} {
	run_tool -name {GENERATEPROGRAMMINGDATA}
    }    
    run_tool -name {PROGRAMDEVICE}
}

if {[info exists EXPORT_FPE]} {
    if {[info exists HSS_UPDATE]} {
            export_fpe_job $project_name $local_dir "ENVM FABRIC SNVM"
    } else {
            export_fpe_job $project_name $local_dir "FABRIC SNVM"
    }
}

save_project
