#Importing and Linking all the HDL source files used in the design
import_files -library work -hdl_source src/hdl/apb_wrapper.vhd
import_files -library work -hdl_source src/hdl/data_packer_h264.vhd
import_files -library work -hdl_source src/hdl/ddr_write_controller_enc.v
import_files -library work -hdl_source src/hdl/frame_controls_gen.v
import_files -library work -hdl_source src/hdl/intensity_average.vhd
import_files -library work -hdl_source src/hdl/ram2port.vhd
import_files -library work -hdl_source src/hdl/video_fifo.vhd

