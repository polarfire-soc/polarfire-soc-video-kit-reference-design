#Importing and Linking all the HDL source files used in the design
import_files -library work -hdl_source ./script_support/hdl/RAW_BAYER/axi4lite_adapter_dma.v
import_files -library work -hdl_source ./script_support/hdl/RAW_BAYER/read_reg_dma.v
import_files -library work -hdl_source ./script_support/hdl/RAW_BAYER/write_reg_dma.v
import_files -library work -hdl_source ./script_support/hdl/RAW_BAYER/debug_counters_dma.v
import_files -library work -hdl_source ./script_support/hdl/RAW_BAYER/DDR_write_controller.v
import_files -library work -hdl_source ./script_support/hdl/RAW_BAYER/data_packer.v
import_files -library work -hdl_source ./script_support/hdl/RAW_BAYER/ram2port_ddr_write.v
import_files -library work -hdl_source ./script_support/hdl/RAW_BAYER/video_fifo_ddr_write.v
import_files -library work -hdl_source ./script_support/hdl/RAW_BAYER/synchronizer_circuit_ddr_write.v
import_files -library work -hdl_source ./script_support/hdl/RAW_BAYER/DDR_Write_Native.v
import_files -library work -hdl_source ./script_support/hdl/RAW_BAYER/DDR_Write.v
import_files -library work -hdl_source ./script_support/hdl/RAW_BAYER/DDR_Write_C0.v
import_files -library work -hdl_source ./script_support/hdl/RAW_BAYER/async_fifo.v
import_files -library work -hdl_source ./script_support/hdl/RAW_BAYER/dma_controller.v
import_files -library work -hdl_source ./script_support/hdl/RAW_BAYER/synchronizer_circuit_2stage.v
import_files -library work -hdl_source ./script_support/hdl/RAW_BAYER/interrupt_controller_dma.v
import_files -library work -hdl_source ./script_support/hdl/RAW_BAYER/MIPI_TRAINING_LITE.v
import_files -library work -hdl_source ./script_support/hdl/RAW_BAYER/axi4lite_adapter_mipi.v
import_files -library work -hdl_source ./script_support/hdl/RAW_BAYER/read_reg_mipi.v
import_files -library work -hdl_source ./script_support/hdl/RAW_BAYER/write_reg_mipi.v
import_files -library work -hdl_source ./script_support/hdl/RAW_BAYER/interrupt_controller_mipi.v
import_files -library work -hdl_source ./script_support/hdl/RAW_BAYER/memory_map_dma.v
import_files -library work -hdl_source ./script_support/hdl/RAW_BAYER/memory_map_mipi.v
