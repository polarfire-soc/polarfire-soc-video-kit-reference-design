#Importing and Linking all the HDL source files used in the design
import_files -library work -hdl_source ./script_support/hdl/H264/apb_wrapper.vhd
import_files -library work -hdl_source ./script_support/hdl/H264/data_packer_h264.vhd
import_files -library work -hdl_source ./script_support/hdl/H264/ddr_write_controller_enc.v
import_files -library work -hdl_source ./script_support/hdl/H264/frame_controls_gen.v
import_files -library work -hdl_source ./script_support/hdl/H264/intensity_average.vhd
import_files -library work -hdl_source ./script_support/hdl/H264/ram2port.vhd
import_files -library work -hdl_source ./script_support/hdl/H264/video_fifo.vhd
import_files -library work -hdl_source ./script_support/hdl/H264/CR_OSD.v

