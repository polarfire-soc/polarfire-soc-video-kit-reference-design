#!/usr/bin/tclsh

#This script selects the PolarFire SoC reference Libero SoC based design which needs
#to be generated


# ###################################################################################
# # // Process arguments passed by the user
# ###################################################################################

if { $::argc > 0 } {
        set i 1
        foreach arg $::argv {
                if {[string match "*:*" $arg]} {
                        set temp [split $arg ":"]
                        puts "Setting parameter [lindex $temp 0] to [lindex $temp 1]"
                        set [lindex $temp 0] "[lindex $temp 1]"
	        } else {
                        set $arg 1
                }
                incr i
        }
} else {
        puts "No command line argument passed"
}


# ###################################################################################
# # // Run the Libero SoC flow based on the input arguments passed by the user
# ###################################################################################

if {[info exists RAW_BAYER]} {
    puts "RAW_BAYER design has been selected"
    source ./MPFS_VIDEO_KIT_RAW_BAYER_REFERENCE_DESIGN.tcl
} else {
    puts "H264 design has been selected"
    source ./MPFS_VIDEO_KIT_H264_REFERENCE_DESIGN.tcl
} 
