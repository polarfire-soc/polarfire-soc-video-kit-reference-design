// --*************************************************************************************************
// -- File Name                           : write_reg_mipi.v
// -- Targeted device                     : Microsemi-SoC
// -- Author                              : India Solutions Team
// --
// -- COPYRIGHT 2021 BY MICROSEMI
// -- THE INFORMATION CONTAINED IN THIS DOCUMENT IS SUBJECT TO LICENSING RESTRICTIONS FROM MICROSEMI
// -- CORP. IF YOU ARE NOT IN POSSESSION OF WRITTEN AUTHORIZATION FROM MICROSEMI FOR USE OF THIS
// -- FILE, THEN THE FILE SHOULD BE IMMEDIATELY DESTROYED AND NO BACK-UP OF THE FILE SHOULD BE MADE.
// --
// --*************************************************************************************************


module write_reg_mipi (
		       aclk,
		       aresetn,

		       mem_wr_valid,
		       mem_wr_addr,
		       mem_wr_data,

		       ctrl_reg,
		       glbl_int_en,
		       int_en,
		       int_status_clr
		       );
   
`include "memory_map_mipi.v"

   // Clock and Reset interface----------------------------------------------------
   input 	     aclk; // clock
   input 	     aresetn; // This active-low reset

   //Memory interface
   input 	     mem_wr_valid;
   input [31:0]      mem_wr_addr;
   input [31:0]      mem_wr_data;

   output reg [CTRL_REG_WIDTH-1:0] ctrl_reg;
   output reg [GLBL_INT_EN_WIDTH-1:0] glbl_int_en;
   output reg [INT_EN_WIDTH-1:0]      int_en;
   output reg [INT_STATUS_WIDTH-1:0]  int_status_clr;
   
   ////////////////////////////////////////////////
   // Write registers
   ////////////////////////////////////////////////
   always@(posedge aclk  or negedge aresetn)
     if(!aresetn) begin
	ctrl_reg <= 'h0;
	glbl_int_en <= 'h0;
	int_en <= 'h0;
     end
     else if (mem_wr_valid) 
       case (mem_wr_addr[ADDR_DECODER_WIDTH-1:0])
	 
	 CTRL_REG:
	   ctrl_reg <= mem_wr_data[CTRL_REG_WIDTH-1:0];

	 GLBL_INT_EN:
	   glbl_int_en <= mem_wr_data[GLBL_INT_EN_WIDTH-1:0];

	 INT_EN:
	   int_en <= mem_wr_data[INT_EN_WIDTH-1:0];

	 default:
	   ctrl_reg[CTRL_REG_WIDTH-1:1] <= 'h0;	    
	 
       endcase // case (mem_wr_addr)
     else
       ctrl_reg[CTRL_REG_WIDTH-1:1] <= 'h0;
   


   ////////////////////////////////////////////////
   // Updating status register
   ////////////////////////////////////////////////
   always@(posedge aclk or negedge aresetn)
     if (!aresetn)
       int_status_clr <= 'h0;
     else begin
	if (mem_wr_valid && mem_wr_addr[ADDR_DECODER_WIDTH-1:0] == INT_STATUS)
	  int_status_clr <= mem_wr_data[INT_STATUS_WIDTH-1:0];
	else
	  int_status_clr <= 'h0;
     end


   
   // ////////////////////////////////////////////////
   // // Registering the write pulse to W1CREG1 4 stages
   // ////////////////////////////////////////////////
   // always@(posedge aclk or negedge aresetn)
   //   if (!aresetn) begin 
   // 	w1creg1_dly[0] <= 'h0;
   // 	w1creg1_dly[1] <= 'h0;
   // 	w1creg1_dly[2] <= 'h0;
   // 	w1creg1_dly[3] <= 'h0;
   //   end
   //   else begin
   // 	if (mem_wr_valid && mem_wr_addr == W1CREG1)
   // 	  w1creg1_dly[0] <= mem_wr_data;
   // 	else
   // 	  w1creg1_dly[0] <= 'h0;
   // 	w1creg1_dly[1] <= w1creg1_dly[0];
   // 	w1creg1_dly[2] <= w1creg1_dly[1];
   // 	w1creg1_dly[3] <= w1creg1_dly[2];
   //   end

   // ///////////////////////////////////////////////////
   // // Stretching the W1CREG1 write pulse to 4 clocks
   // //////////////////////////////////////////////////
   // assign w1creg1 = w1creg1_dly[0] | w1creg1_dly[1] | w1creg1_dly[2] | w1creg1_dly[3] ;
   

   
endmodule
