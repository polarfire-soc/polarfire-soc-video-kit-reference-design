//=================================================================================================
//-- File Name                           : dma_controller.v
//-- Targeted device                     : Microsemi-SoC
//-- Author                              : India Solutions Team
//--
//-- COPYRIGHT 2019 BY MICROSEMI
//-- THE INFORMATION CONTAINED IN THIS DOCUMENT IS SUBJECT TO LICENSING RESTRICTIONS FROM MICROSEMI
//-- CORP. IF YOU ARE NOT IN POSSESSION OF WRITTEN AUTHORIZATION FROM MICROSEMI FOR USE OF THIS
//-- FILE, THEN THE FILE SHOULD BE IMMEDIATELY DESTROYED AND NO BACK-UP OF THE FILE SHOULD BE MADE.
//--
//=================================================================================================

module dma_controller (
    // inputs 
    input 	      rstn_i,
    input 	      sys_clk_i, //video source clock

    // input
    input 	      fifo_empty_i,
    input [31:0]      fifo_data_i,
    input 	      fifo_data_valid_i,
    input 	      frame_start_i,

    output reg 	      fifo_rd_o,
    output reg 	      ddr_wr_en_o,
    output reg [31:0] ddr_wr_addr_o,
    output 	      frame_end_interrupt_o,
    output reg 	      dma_ready_o, //fifo empty flag inversion
    output reg 	      frame_size_fifo_wr_o,
    output reg 	      frame_start_o   
	    );


   //----------------------------------------------------------------   
   //Parameter declarations
   //----------------------------------------------------------------   
   parameter WAIT_FOR_FIFO_DATA = 'd0;
   parameter WAIT_FOR_FRAME_START = 'd1;
   parameter WRITING = 'd2;
   parameter CHECK_FIFO_EMPTY = 'd3;
   
   //----------------------------------------------------------------   
   // Wire and Reg declarations
   //----------------------------------------------------------------   
   reg [1:0] 				 r_state; //state machine variable
   reg 					 interrupt_event_trig; //trigger to generate the interrupt event
   reg [3:0] 				 interrupt_event_trig_dly;
   reg [3:0] 				 frame_start_dly;
   integer 				 i;


   assign frame_size_fifo_wr_o = interrupt_event_trig;   
   
   //----------------------------------------------------------------   
   // DMA ready 
   //----------------------------------------------------------------   
   always@ (posedge sys_clk_i , negedge rstn_i )
     if (!rstn_i)
       dma_ready_o <= 'b0;
     else
       dma_ready_o <= ~fifo_empty_i;
   //----------------------------------------------------------------



   //----------------------------------------------------------------   
   // Interrupt event 4 clock pulse generator based on the trigger
   //----------------------------------------------------------------   
   always@ (posedge sys_clk_i , negedge rstn_i )
     if (!rstn_i) 
	for (i=0;i<4;i=i+1)
	  interrupt_event_trig_dly[i] <= 'h0;
     else
       begin
	  interrupt_event_trig_dly[0] <= interrupt_event_trig;
	  for (i=1; i<4;i=i+1)
	    interrupt_event_trig_dly[i] <= interrupt_event_trig_dly[i-1];
       end

   assign frame_end_interrupt_o = interrupt_event_trig_dly[0] | interrupt_event_trig_dly[1] |
			      interrupt_event_trig_dly[2] | interrupt_event_trig_dly[3];
   //----------------------------------------------------------------


   //----------------------------------------------------------------   
   // Interrupt event 4 clock pulse generator based on the trigger
   //----------------------------------------------------------------   
   always@ (posedge sys_clk_i , negedge rstn_i )
     if (!rstn_i) 
	for (i=0;i<4;i=i+1)
	  frame_start_dly[i] <= 'h0;
     else
       begin
	  frame_start_dly[0] <= frame_start_i;
	  for (i=1; i<4;i=i+1)
	    frame_start_dly[i] <= frame_start_dly[i-1];
       end

   assign frame_start_o = frame_start_dly[0] | frame_start_dly[1] |
			      frame_start_dly[2] | frame_start_dly[3];
   //----------------------------------------------------------------
   



   
   //----------------------------------------------------------------   
   // FSM            : dma_state_machie
   // Description    : This state machine waits for the buffer address to be
   // available at the input fifo interface. Once buffer address is received,
   // it then waits for the frame start. After receiving the frame start signal
   // from the external video source, it passes the ddr write address and 
   // enables the ddr write block. When once again the frame start is received
   // from the video source, it checks for the input fifo empty interface and
   // according changes its state. The interrupt event is generated during this
   // state transition which is 4 clocks wide pulse.
   // Also, frame start signal is generated which is 4 clocks wide.
   //----------------------------------------------------------------
   always@ (posedge sys_clk_i , negedge rstn_i )
     if (!rstn_i) begin
	r_state <= WAIT_FOR_FIFO_DATA;
	fifo_rd_o <= 0;
	ddr_wr_addr_o <= 'h0;	
	ddr_wr_en_o <= 0;
	interrupt_event_trig <= 0;	       	
     end
     else 
	case (r_state)
	  
	  WAIT_FOR_FIFO_DATA:
	    begin
	       fifo_rd_o <= 0;
	       //ddr_wr_addr_o <= 'h0;		       
	       ddr_wr_en_o <= 0;	       
	       interrupt_event_trig <= 0;
	       if (!fifo_empty_i) begin
		  r_state <= WAIT_FOR_FRAME_START;
		  fifo_rd_o <= 1;
	       end
	       
	    end
	  
	  WAIT_FOR_FRAME_START:
	    begin
	       fifo_rd_o <= 0;
	       if (fifo_data_valid_i)
		 ddr_wr_addr_o <= fifo_data_i;	
	       
	       if (frame_start_i)
		 r_state <= WRITING;
	    end
	  

	  WRITING:
	    begin
	       fifo_rd_o <= 0;       
	       ddr_wr_en_o <= 1;
	       interrupt_event_trig <= 0;

	       if (fifo_data_valid_i)
		 ddr_wr_addr_o <= fifo_data_i;	
	       
	       if (frame_start_i)
		 r_state <= CHECK_FIFO_EMPTY;
	    end

	  
	  CHECK_FIFO_EMPTY:
	    begin
	       ddr_wr_en_o <= 0;	       
	       interrupt_event_trig <= 1;	       
	       if (!fifo_empty_i) begin
		  fifo_rd_o <= 1;       		  
		 r_state <= WRITING;
		  end
	       else
		 r_state <= WAIT_FOR_FIFO_DATA;

	    end	  
	  
	  default:
	       r_state <= WAIT_FOR_FIFO_DATA;

	endcase // case (r_state)
	




endmodule // dma_controller


