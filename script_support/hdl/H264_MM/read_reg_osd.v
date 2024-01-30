// --*************************************************************************************************
// -- File Name                           : read_reg_osd.v
// -- Targeted device                     : Microsemi-SoC
// -- Author                              : India Solutions Team
// --
// -- COPYRIGHT 2021 BY MICROSEMI
// -- THE INFORMATION CONTAINED IN THIS DOCUMENT IS SUBJECT TO LICENSING RESTRICTIONS FROM MICROSEMI
// -- CORP. IF YOU ARE NOT IN POSSESSION OF WRITTEN AUTHORIZATION FROM MICROSEMI FOR USE OF THIS
// -- FILE, THEN THE FILE SHOULD BE IMMEDIATELY DESTROYED AND NO BACK-UP OF THE FILE SHOULD BE MADE.
// --
// --*************************************************************************************************

module read_reg_osd (
		      mem_rd_addr,
		      mem_rd_data,

		      ip_ver,
		      ctrl_reg
		      // coordinate,
		      // rgb_color,
		      // osd_num,
		      // h_res,
		      // v_res
		      );
   
`include "memory_map_osd.v"   
		 
   //Memory interface
   input [31:0] 	  mem_rd_addr;
   output reg [31:0] 	  mem_rd_data;

   input [IP_VER_WIDTH-1:0] ip_ver;
   input [CTRL_REG_WIDTH-1:0] ctrl_reg;   
   // input [COORDINATE_WIDTH-1:0]  coordinate;
   // input [RGB_COLOR_WIDTH-1:0] rgb_color;
   // input [OSD_NUM_WIDTH-1:0] osd_num;
   // input [H_RES_WIDTH-1:0] h_res;
   // input [V_RES_WIDTH-1:0] v_res;


   ////////////////////////////////////////////////
   // Read registers based on input address
   ////////////////////////////////////////////////
   always@(mem_rd_addr[ADDR_DECODER_WIDTH-1:0])
       case (mem_rd_addr[ADDR_DECODER_WIDTH-1:0])
	 
	 IP_VER:
	   mem_rd_data <= ip_ver;

	 CTRL_REG:
	   mem_rd_data <= ctrl_reg;

	 // COORDINATE:
	 //   mem_rd_data <= coordinate;

	 // RGB_COLOR:
	 //   mem_rd_data <= rgb_color;

	 // OSD_NUM:
	 //   mem_rd_data <= osd_num;

	 // H_RES:
	 //   mem_rd_data <= h_res;

	 // V_RES:
	 //   mem_rd_data <= v_res;
	 
	 default:
	   mem_rd_data <= 32'h0;

       endcase // case (mem_rd_addr)
      
endmodule
