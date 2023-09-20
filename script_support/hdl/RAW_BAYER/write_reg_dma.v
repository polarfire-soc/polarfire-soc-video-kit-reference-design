// --*************************************************************************************************
// -- File Name                           : write_reg_dma.v
// -- Targeted device                     : Microsemi-SoC
// -- Author                              : India Solutions Team
// --
// -- COPYRIGHT 2021 BY MICROSEMI
// -- THE INFORMATION CONTAINED IN THIS DOCUMENT IS SUBJECT TO LICENSING RESTRICTIONS FROM MICROSEMI
// -- CORP. IF YOU ARE NOT IN POSSESSION OF WRITTEN AUTHORIZATION FROM MICROSEMI FOR USE OF THIS
// -- FILE, THEN THE FILE SHOULD BE IMMEDIATELY DESTROYED AND NO BACK-UP OF THE FILE SHOULD BE MADE.
// --
// --*************************************************************************************************


module write_reg_dma (
		  aclk,
		  aresetn,

		  mem_wr_valid,
		  mem_wr_addr,
		  mem_wr_data,
		  
		  line_gap,
		  buff_addr_fifo_data,
		  buff_addr_fifo_wen,
		  ctrl_reg,
		  glbl_int_en,
		  interrupt_en,
		  interrupt_status_clr
		  );
   
`include "memory_map_dma.v"      

   // Clock and Reset interface----------------------------------------------------
   input 	     aclk; // clock
   input 	     aresetn; // This active-low reset

   //Memory interface
   input 	     mem_wr_valid;
   input [31:0]      mem_wr_addr;
   input [31:0]      mem_wr_data;

   //Write Only registers
   output reg [LINE_GAP_WIDTH-1:0] line_gap;
   output reg [BUFF_ADDR_FIFO_WIDTH-1:0] buff_addr_fifo_data;
   output reg 				 buff_addr_fifo_wen;
   
   //Read Write registers
   output reg [CTRL_REG_WIDTH-1:0] 	 ctrl_reg;
   output reg [GLBL_INT_EN_WIDTH-1:0] 	 glbl_int_en;
   output reg [INTERRUPT_EN_WIDTH-1:0] 	 interrupt_en;
   
   //Status register clear
   output reg [INTERRUPT_STATUS_WIDTH-1:0] interrupt_status_clr;
   
   ////////////////////////////////////////////////
   // Write registers
   ////////////////////////////////////////////////
   always@(posedge aclk  or negedge aresetn)
     if(!aresetn) begin
	line_gap <= 'h2000;
	buff_addr_fifo_data <= 'h0;
	buff_addr_fifo_wen <= 1'b0;
	ctrl_reg <= 'h0;
	glbl_int_en <= 'h0;
	interrupt_en <= 'h0;
     end
     else if (mem_wr_valid) 
       case (mem_wr_addr[ADDR_DECODER_WIDTH-1:0])
	 
	 LINE_GAP:
	   line_gap <= mem_wr_data[LINE_GAP_WIDTH-1:0];

	 BUFF_ADDR_FIFO:begin
	    buff_addr_fifo_data <= mem_wr_data;
	    buff_addr_fifo_wen <= 1'b1;	    
	 end

	 CTRL_REG:
	   ctrl_reg <= mem_wr_data[CTRL_REG_WIDTH-1:0];

	 GLBL_INT_EN:
	   glbl_int_en <= mem_wr_data[GLBL_INT_EN-1:0];

	 INTERRUPT_EN:
	   interrupt_en <= mem_wr_data[INTERRUPT_EN_WIDTH-1:0];

	 default: begin
	    buff_addr_fifo_wen <= 1'b0;
	    ctrl_reg[CTRL_REG_WIDTH-1:1] <= 'h0;	    
	 end
	 
       endcase // case (mem_wr_addr)

     else begin
	buff_addr_fifo_wen <= 1'b0;
	ctrl_reg[CTRL_REG_WIDTH-1:1] <= 'h0;
     end // else: !if(mem_wr_valid)
   
       

   ////////////////////////////////////////////////
   // Updating status register
   ////////////////////////////////////////////////
   always@(posedge aclk or negedge aresetn)
     if (!aresetn)
       interrupt_status_clr <= 'h0;
     else begin
	if (mem_wr_valid && mem_wr_addr[ADDR_DECODER_WIDTH-1:0] == INTERRUPT_STATUS)
	  interrupt_status_clr <= mem_wr_data[INTERRUPT_STATUS_WIDTH-1:0];
	else
	  interrupt_status_clr <= 'h0;
     end


endmodule
