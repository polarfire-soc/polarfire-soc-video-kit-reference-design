//=================================================================================================
//-- File Name                           : DDR_write_controller.v
//-- Targeted device                     : Microsemi-SoC
//-- Author                              : India Solutions Team
//--
//-- COPYRIGHT 2019 BY MICROSEMI
//-- THE INFORMATION CONTAINED IN THIS DOCUMENT IS SUBJECT TO LICENSING RESTRICTIONS FROM MICROSEMI
//-- CORP. IF YOU ARE NOT IN POSSESSION OF WRITTEN AUTHORIZATION FROM MICROSEMI FOR USE OF THIS
//-- FILE, THEN THE FILE SHOULD BE IMMEDIATELY DESTROYED AND NO BACK-UP OF THE FILE SHOULD BE MADE.
//--
//=================================================================================================
module DDR_write_controller#(
			     parameter g_DDR_AXI_DWIDTH_I = 32,
			     parameter g_DDR_AXI_DWIDTH_O = 512)
   (

    input 	    rstn_i, // System reset   
    input 	    sys_clk_i, // System clock   
    input [15 : 0]  c_LINE_GAP, // Line gap   
    input 	    start_i, // write enable
    input 	    write_ackn_i, // write Acknowledgment input          
    input 	    write_done_i, // write done input                 
    input 	    frame_valid_i, // frame end signal from video source
    input [15 : 0]  horiz_resolution_i, // Horizontal pixel resolution
    input [37 : 0]  frame_ddr_addr_i, //Frame DDR address

    output 	    write_req_o, // write request to DDR
    output reg 	    read_fifo_o, // Read request to fifo    
    output [37 : 0] write_start_addr_o, // DDR write START ADDRESS       
    output [7 : 0] write_length_o // Number of Bytes to write
    );


   //=================================================================================================
   // parameter declarations
   //=================================================================================================
   parameter	IDLE						= 2'd0;
   parameter	WRITE_REQUESTING			= 2'd1;
   parameter	WRITING						= 2'd2;
   parameter	s_shift						= g_DDR_AXI_DWIDTH_O >> ($clog2(g_DDR_AXI_DWIDTH_I));
   parameter   s_shift_bits 				= ($clog2(s_shift));

   //=================================================================================================
   // Signal declarations
   //=================================================================================================
   reg [1  : 0]     s_state;   
   reg 		    s_frame_valid_dly1;	
   reg 		    s_frame_valid_dly2;	
   wire 	    s_frame_valid_re;
   reg 		    s_start_dly1;	
   reg 		    s_start_dly2;	
   wire 	    s_start_fe;	
   reg 		    s_write_req;	
   reg [15 : 0]     s_counter;
   reg [15 : 0]     s_count_max;
   reg [37:0] 	    frame_addr_reg;
   reg 		    write_ackn_dly;
   wire 	    write_ackn_re;
   //=================================================================================================
   //	 Top level output port assignments
   //=================================================================================================
   assign write_req_o					= s_write_req;
   assign write_start_addr_o			= frame_addr_reg; 
   assign write_length_o				= s_count_max[7:0] - 1;

   //=================================================================================================
   // 	Asynchronous blocks
   //=================================================================================================
   assign s_frame_valid_re				= s_frame_valid_dly1 & (!s_frame_valid_dly2);
   assign write_ackn_re = write_ackn_i & (!write_ackn_dly);   
   assign s_start_fe		    		= s_start_dly2 & (!s_start_dly1);
   
   //=================================================================================================
   //	 Synchronous blocks
   //-=================================================================================================

   //--------------------------------------------------------------------------
   // Name       : SIGNAL_DELAY
   // Description: Registering write acknowledge signal
   //--------------------------------------------------------------------------
   always@(posedge sys_clk_i, negedge rstn_i) 
     if(!rstn_i)
       write_ackn_dly <= 0;
     else 
       write_ackn_dly <= write_ackn_i;   

   
   //--------------------------------------------------------------------------
   // Name       : SIGNAL_DELAY
   // Description: Process to delay signal and find rising edge
   //--------------------------------------------------------------------------
   always@(posedge sys_clk_i, negedge rstn_i) begin 
      if(!rstn_i) begin 
	 s_frame_valid_dly1	<= 0;
	 s_frame_valid_dly2	<= 0;
	 s_start_dly1	    <= 0;
	 s_start_dly2	    <= 0;
      end
      else begin 
	 s_frame_valid_dly1	<= frame_valid_i;
	 s_frame_valid_dly2	<= s_frame_valid_dly1;			
	 s_start_dly1	    <= start_i;			
	 s_start_dly2	    <= s_start_dly1;	
      end
   end

   //--------------------------------------------------------------------------
   // Name       : CORDIC_FSM_PROC
   // Description: FSM implements cordic operations
   //--------------------------------------------------------------------------
   always@(posedge sys_clk_i, negedge rstn_i) begin 
      if(!rstn_i) begin 
	 s_state  			<= IDLE;			
	 s_write_req			<= 0;
	 read_fifo_o 		<= 0;
	 s_count_max			<= 0;
	 s_counter			<= 0;
	 frame_addr_reg <= 0;	 
      end
      else begin 
	 case(s_state)
	   IDLE	:
	     begin		
		s_write_req		<= 0;
		read_fifo_o 	<= 0;
		s_counter		<= 0;
		if(s_frame_valid_re == 1) 					
		  frame_addr_reg <= frame_ddr_addr_i;		   
		if(s_start_fe == 1) begin 
		   s_count_max	<= horiz_resolution_i >> s_shift_bits;
		   s_state 	<= WRITE_REQUESTING;
		end
	     end
	   
	   WRITE_REQUESTING	:
	     begin
		if(write_ackn_i == 1) begin 
		   s_write_req	<= 0;
		   s_state 	<= WRITING;
		end
		else 
		  s_write_req	<= 1;
	     end
	   
	   WRITING	:
	     begin 
		if(write_done_i == 1) begin 
		   s_state 			<= IDLE;
		   frame_addr_reg <= frame_addr_reg + c_LINE_GAP;
		end
		else if(s_counter >= s_count_max) 
		  read_fifo_o 		<= 0;
		else begin 
		   s_counter 			<= s_counter + 1;
		   read_fifo_o			<= 1;
		end
	     end
	   
	   default	:
	     s_state <= IDLE;
	 endcase
      end
   end


endmodule
