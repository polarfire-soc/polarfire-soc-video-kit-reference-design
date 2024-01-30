#Importing and Linking all the HDL source files used in the design
import_files -library work -hdl_source ./script_support/hdl/H264_MM/CR_OSD.v
import_files -library work -hdl_source ./script_support/hdl/H264_MM/axi4lite_adapter_osd.v
import_files -library work -hdl_source ./script_support/hdl/H264_MM/read_reg_osd.v
import_files -library work -hdl_source ./script_support/hdl/H264_MM/write_reg_osd.v
import_files -library work -hdl_source ./script_support/hdl/H264_MM/memory_map_osd.v
