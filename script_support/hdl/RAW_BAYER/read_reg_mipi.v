// --*************************************************************************************************
// -- File Name                           : read_reg_mipi.v
// -- Targeted device                     : Microsemi-SoC
// -- Author                              : India Solutions Team
// --
// -- COPYRIGHT 2021 BY MICROSEMI
// -- THE INFORMATION CONTAINED IN THIS DOCUMENT IS SUBJECT TO LICENSING RESTRICTIONS FROM MICROSEMI
// -- CORP. IF YOU ARE NOT IN POSSESSION OF WRITTEN AUTHORIZATION FROM MICROSEMI FOR USE OF THIS
// -- FILE, THEN THE FILE SHOULD BE IMMEDIATELY DESTROYED AND NO BACK-UP OF THE FILE SHOULD BE MADE.
// --
// --*************************************************************************************************

module read_reg_mipi (
		 aclk,
		 aresetn,

		 mem_rd_addr,
		 mem_rd_data,

		      ip_ver,
		      ctrl_reg,
		      lane_config,
		      data_width,
		      no_of_pixels,
		      no_of_vc,
		      input_data_invert,
		      fifo_size,
		      frame_resolution,
		      glbl_int_en,
		      int_status,
		      int_en,
		      mipi_clk_status,
		      mipi_cam_lanes_config,
		      mipi_cam_data_type,
		      word_count	      
		 );
   
`include "memory_map_mipi.v"   
		 
   // Clock and Reset interface----------------------------------------------------
   input 		  aclk; // clock
   input 		  aresetn; // This active-low reset
   
   //Memory interface
   input [31:0] 	  mem_rd_addr;
   output reg [31:0] 	  mem_rd_data;

   input [IP_VER_WIDTH-1:0] ip_ver;
   input [CTRL_REG_WIDTH-1:0] 	      ctrl_reg;   
   input [LANE_CONFIG_WIDTH-1:0] lane_config;
   input [DATA_WIDTH_WIDTH-1:0]  data_width;
   input [NO_OF_PIXELS_WIDTH-1:0] no_of_pixels;
   input [NO_OF_VC_WIDTH-1:0] 	  no_of_vc;
   input [INPUT_DATA_INVERT_WIDTH-1:0] input_data_invert;
   input [FIFO_SIZE_WIDTH-1:0] 	       fifo_size;
   input [FRAME_RESOLUTION_WIDTH-1:0]  frame_resolution;
   input [INT_STATUS_WIDTH-1:0]        int_status;
   input [GLBL_INT_EN_WIDTH-1:0]        glbl_int_en;   
   input [INT_EN_WIDTH-1:0]        int_en;   
   input [MIPI_CLK_STATUS_WIDTH-1:0]   mipi_clk_status;
   input [MIPI_CAM_LANES_CONFIG_WIDTH-1:0]   mipi_cam_lanes_config;
   input [MIPI_CAM_DATA_TYPE_WIDTH-1:0] mipi_cam_data_type;
   input [WORD_COUNT_WIDTH-1:0] 	word_count;
   

   ////////////////////////////////////////////////
   // Read registers based on input address
   ////////////////////////////////////////////////
   always@(mem_rd_addr[ADDR_DECODER_WIDTH-1:0])
       case (mem_rd_addr[ADDR_DECODER_WIDTH-1:0])
	 
	 IP_VER:
	   mem_rd_data <= ip_ver;

	 CTRL_REG:
	   mem_rd_data <= ctrl_reg;

	 LANE_CONFIG:
	   mem_rd_data <= lane_config;

	 DATA_WIDTH:
	   mem_rd_data <= data_width;

	 NO_OF_PIXELS:
	   mem_rd_data <= no_of_pixels;

	 NO_OF_VC:
	   mem_rd_data <= no_of_vc;

	 INPUT_DATA_INVERT:
	   mem_rd_data <= input_data_invert;

	 FIFO_SIZE:
	   mem_rd_data <= fifo_size;

	 FRAME_RESOLUTION:
	   mem_rd_data <= frame_resolution;

	 INT_STATUS:
	   mem_rd_data <= int_status;

	 GLBL_INT_EN:
	   mem_rd_data <= int_status;
	 
	 INT_EN:
	   mem_rd_data <= int_en;
	 
	 MIPI_CLK_STATUS:
	   mem_rd_data <= mipi_clk_status;

	 MIPI_CAM_LANES_CONFIG:
	   mem_rd_data <= mipi_cam_lanes_config;

	 MIPI_CAM_DATA_TYPE:
	   mem_rd_data <= mipi_cam_data_type;

	 WORD_COUNT:
	   mem_rd_data <= word_count;
	 
	 
	 default:
	   mem_rd_data <= 32'h0;

       endcase // case (mem_rd_addr)
      
endmodule
