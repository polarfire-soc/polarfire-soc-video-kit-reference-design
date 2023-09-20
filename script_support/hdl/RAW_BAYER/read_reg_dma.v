// --*************************************************************************************************
// -- File Name                           : read_reg_dma.v
// -- Targeted device                     : Microsemi-SoC
// -- Author                              : India Solutions Team
// --
// -- COPYRIGHT 2021 BY MICROSEMI
// -- THE INFORMATION CONTAINED IN THIS DOCUMENT IS SUBJECT TO LICENSING RESTRICTIONS FROM MICROSEMI
// -- CORP. IF YOU ARE NOT IN POSSESSION OF WRITTEN AUTHORIZATION FROM MICROSEMI FOR USE OF THIS
// -- FILE, THEN THE FILE SHOULD BE IMMEDIATELY DESTROYED AND NO BACK-UP OF THE FILE SHOULD BE MADE.
// --
// --*************************************************************************************************

module read_reg_dma (
		 aclk,
		 aresetn,

		 mem_rd_addr,
		 mem_rd_data,
		 interrupt_status,
		 frame_counter,
		 frame_size_fifo,
		 buff_addr_fifo_rcount,
		 input_frame_counter,
		 frame_size_fifo_wcount,
		 line_gap,
		 ctrl_reg,
		 glbl_int_en,
		 frame_size_fifo_ren,
		 interrupt_en		 
		 );
   
`include "memory_map_dma.v"   
   
   // Clock and Reset interface----------------------------------------------------
   input 		  aclk; // clock
   input 		  aresetn; // This active-low reset
   
   //Memory interface
   input [31:0] 	  mem_rd_addr;
   output reg [31:0] 	  mem_rd_data;

   //Read Only registers
   input [INTERRUPT_STATUS_WIDTH-1:0] interrupt_status;
   input [FRAME_COUNTER_WIDTH-1:0] 	frame_counter;
   input [INPUT_FRAME_COUNTER_WIDTH-1:0] 	input_frame_counter;
   input [FRAME_SIZE_FIFO_WIDTH-1:0]  frame_size_fifo;
   input [BUFF_ADDR_FIFO_RCOUNT_WIDTH-1:0] buff_addr_fifo_rcount;
   input [FRAME_SIZE_FIFO_WCOUNT_WIDTH-1:0] frame_size_fifo_wcount;
 
   //Read Write registers
   input [CTRL_REG_WIDTH-1:0] 	      ctrl_reg;
   input [GLBL_INT_EN_WIDTH-1:0]      glbl_int_en;
   input [INTERRUPT_EN_WIDTH-1:0]     interrupt_en;
   input [LINE_GAP_WIDTH-1:0] 	      line_gap;
      
   output reg 			      frame_size_fifo_ren;
   
   ////////////////////////////////////////////////
   // Read registers based on input address
   ////////////////////////////////////////////////
   always@(mem_rd_addr[ADDR_DECODER_WIDTH-1:0])
       case (mem_rd_addr[ADDR_DECODER_WIDTH-1:0])
	 
	 CTRL_REG:
	   mem_rd_data <= ctrl_reg;

	 GLBL_INT_EN:
	   mem_rd_data <= glbl_int_en;	 

	 INTERRUPT_EN:
	   mem_rd_data <= interrupt_en;
	 
	 INTERRUPT_STATUS:
	   mem_rd_data <= interrupt_status;

	 IP_VER:
	   mem_rd_data <= 'h1;

	 FRAME_RESLN:
	   mem_rd_data <= {16'h0438, 16'h0780};

	 BUFF_ADDR_FIFO_RCOUNT:
	   mem_rd_data <= buff_addr_fifo_rcount;

	 FRAME_SIZE_FIFO_WCOUNT:
	   mem_rd_data <= frame_size_fifo_wcount;

	 FRAME_COUNTER:
	   mem_rd_data <= frame_counter;

	 INPUT_FRAME_COUNTER:
	   mem_rd_data <= input_frame_counter;
	 
	 FRAME_SIZE_FIFO: begin
	    mem_rd_data <= frame_size_fifo;
	    frame_size_fifo_ren <= 1; 
	 end
	 
	 LINE_GAP:
	   mem_rd_data <= line_gap;

	 default: begin
	    mem_rd_data <= 32'h0;
	    frame_size_fifo_ren <= 0;
	 end

       endcase // case (mem_rd_addr)
      
endmodule
