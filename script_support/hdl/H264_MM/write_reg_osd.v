// --*************************************************************************************************
// -- File Name                           : write_reg_osd.v
// -- Targeted device                     : Microsemi-SoC
// -- Author                              : India Solutions Team
// --
// -- COPYRIGHT 2021 BY MICROSEMI
// -- THE INFORMATION CONTAINED IN THIS DOCUMENT IS SUBJECT TO LICENSING RESTRICTIONS FROM MICROSEMI
// -- CORP. IF YOU ARE NOT IN POSSESSION OF WRITTEN AUTHORIZATION FROM MICROSEMI FOR USE OF THIS
// -- FILE, THEN THE FILE SHOULD BE IMMEDIATELY DESTROYED AND NO BACK-UP OF THE FILE SHOULD BE MADE.
// --
// --*************************************************************************************************


module write_reg_osd (
		       aclk,
		       aresetn,

		       mem_wr_valid,
		       mem_wr_addr,
		       mem_wr_data,

		       osd_ip_en,
		       osd_ip_rstn,
		       coordinate,
		       rgb_color,
		       osd_num,
		       h_res,
		       v_res
		       );
   
`include "memory_map_osd.v"

   // Clock and Reset interface----------------------------------------------------
   input 	     aclk; // clock
   input 	     aresetn; // This active-low reset

   //Memory interface
   input 	     mem_wr_valid;
   input [31:0]      mem_wr_addr;
   input [31:0]      mem_wr_data;

   output reg 	     osd_ip_en;
   output 	     osd_ip_rstn;
   output reg [COORDINATE_WIDTH-1:0] coordinate;
   output reg [RGB_COLOR_WIDTH-1:0]  rgb_color;
   output reg [OSD_NUM_WIDTH-1:0]    osd_num;
   output reg [H_RES_WIDTH-1:0]      h_res;
   output reg [V_RES_WIDTH-1:0]      v_res;

   reg [CTRL_REG_WIDTH-1:0] 	       ctrl_reg;
   assign osd_ip_en = ctrl_reg[0];
   assign osd_ip_rstn = ctrl_reg[1];
   
   ////////////////////////////////////////////////
   // Write registers
   ////////////////////////////////////////////////
   always@(posedge aclk  or negedge aresetn)
     if(!aresetn) begin
	ctrl_reg <= 'h0;
	coordinate <= 'h00100010;
	rgb_color <= 'hFFFFFF;
	h_res <= 'h780;
	v_res <= 'h430;
     end
     else if (mem_wr_valid) 
       case (mem_wr_addr[ADDR_DECODER_WIDTH-1:0])
	 
	 CTRL_REG:
	   ctrl_reg <= mem_wr_data[CTRL_REG_WIDTH-1:0];

	 COORDINATE:
	   coordinate <= mem_wr_data[COORDINATE_WIDTH-1:0];

	 RGB_COLOR:
	   rgb_color <= mem_wr_data[RGB_COLOR_WIDTH-1:0];

	 OSD_NUM:
	   osd_num <= mem_wr_data[OSD_NUM_WIDTH-1:0];

	 H_RES:
	   h_res <= mem_wr_data[H_RES_WIDTH-1:0];
	 
	 V_RES:
	   v_res <= mem_wr_data[V_RES_WIDTH-1:0];

	 default:
	   ctrl_reg[CTRL_REG_WIDTH-1:1] <= 'h0;	    
	 
       endcase // case (mem_wr_addr)
     else
       ctrl_reg[CTRL_REG_WIDTH-1:1] <= 'h0;

   
endmodule
