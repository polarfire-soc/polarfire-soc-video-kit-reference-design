//=================================================================================================
//-- File Name                           : data_packer.v

//-- Targeted device                     : Microsemi-SoC
//-- Author                              : India Solutions Team
//--
//-- COPYRIGHT 2021 BY MICROSEMI
//-- THE INFORMATION CONTAINED IN THIS DOCUMENT IS SUBJECT TO LICENSING RESTRICTIONS FROM MICROSEMI
//-- CORP. IF YOU ARE NOT IN POSSESSION OF WRITTEN AUTHORIZATION FROM MICROSEMI FOR USE OF THIS
//-- FILE, THEN THE FILE SHOULD BE IMMEDIATELY DESTROYED AND NO BACK-UP OF THE FILE SHOULD BE MADE.
//--
//=================================================================================================
module data_packer#(
	parameter g_DDR_AXI_DWIDTH_I = 32,
	parameter g_DDR_AXI_DWIDTH_O = 512)
   (	
	// System reset
	input 				  rstn_i,

	// System clock
	input 				  sys_clk_i,

	// enable
	input 				  data_valid_i,

	//Frame end input
	input 				  frame_valid_i,

	// Data Input
	input [g_DDR_AXI_DWIDTH_I-1 : 0]  data_i,

	// Data Enable
	output 				  data_valid_o,

	// Start DDR write
	output 				  start_ddr_w_o,

	// FIFO reset
	output 				  fifo_reset_o,

	//Horizontal count detected
	output [15 : 0] 		  h_count_o,

	output reg [31:0] 			  frame_size_o, 

	// Data output
	output [g_DDR_AXI_DWIDTH_O-1 : 0] data_o
    );

//=================================================================================================
// Parameter declarations
//=================================================================================================   
  parameter s_counter_max  = g_DDR_AXI_DWIDTH_O >> ($clog2(g_DDR_AXI_DWIDTH_I));
  parameter s_cntr_bits    = $clog2(s_counter_max);
  
//=================================================================================================
// Signal declarations
//=================================================================================================
  reg [s_cntr_bits-1  : 0]   	    s_counter;
  reg [15 : 0]		 				s_h_count;
  reg [15 : 0]		 				s_h_count_latch;
  reg [g_DDR_AXI_DWIDTH_O-1 : 0]	s_data_pack;
  reg [3  : 0]		 				s_dv_fe_ctr;
  reg 		 						s_data_valid_dly1;
  reg 		 						s_data_valid_dly2;
  wire 		 						s_data_valid_fe;
  reg 		 						s_frame_valid_dly1;
  reg 		 						s_frame_valid_dly2;
  wire 		 						s_frame_valid_re;
  reg		 						s_dv_fe_ctr_en;
  reg		 						s_ddr_start;
  wire [s_cntr_bits-1 :0] 					s_counter_max_m1;

  wire								dummy1;
//=================================================================================================
// Top level output port assignments
//=================================================================================================
  assign data_valid_o  = (s_counter == s_counter_max_m1) ? 1'b1 : 1'b0;
  assign data_o        = s_data_pack;
  assign h_count_o     = s_h_count_latch;
  assign start_ddr_w_o = s_ddr_start;
  assign fifo_reset_o  = !(s_frame_valid_re);
  
//=================================================================================================
// Asynchronous blocks
//=================================================================================================
  assign s_data_valid_fe   	    = s_data_valid_dly1 & (!data_valid_i);
  assign s_frame_valid_re    	    = s_frame_valid_dly1 & (!s_frame_valid_dly2);
  assign {dummy1,s_counter_max_m1}  = s_counter_max[s_cntr_bits:0]-1;
//=================================================================================================
//=================================================================================================
// Synchronous blocks
//=================================================================================================

//--------------------------------------------------------------------------
// Name       : DELAY
// Description: Process delays input signals
//--------------------------------------------------------------------------
always@(posedge sys_clk_i, negedge rstn_i) begin 
	if(!rstn_i) begin 
		s_data_valid_dly1  <= 0;
		s_data_valid_dly2  <= 0;
		s_frame_valid_dly1   <= 0;
		s_frame_valid_dly2   <= 0;
	end
	else begin 
		s_data_valid_dly1  <= data_valid_i;
		s_data_valid_dly2  <= s_data_valid_dly1;
		s_frame_valid_dly1   <= frame_valid_i;
		s_frame_valid_dly2   <= s_frame_valid_dly1;
	end
end

//--------------------------------------------------------------------------
// Name       : H_COUNTER
// Description: Counter to count horizontal pixels
//--------------------------------------------------------------------------
always@(posedge sys_clk_i, negedge rstn_i) begin 
	if(!rstn_i) begin 
		s_h_count <= 0;
	end
	else begin 
		if(data_valid_i == 1)begin 
			s_h_count <= s_h_count + 1;
		end
		else if(s_data_valid_fe == 1)begin 
			s_h_count <= 0;
		end
	
	end
end
	
//--------------------------------------------------------------------------
// Name       : BYTE_COUNT_LATCH_PROC
// Description: Process latches s_h_count output at falling edge of data enable
//--------------------------------------------------------------------------	
always@(posedge sys_clk_i, negedge rstn_i) begin 
	if(!rstn_i) begin 
		s_h_count_latch <= 0;
	end
	else begin 
		if(s_data_valid_fe == 1)begin
			s_h_count_latch <= s_h_count;
		end
	end
end	


   //--------------------------------------------------------------------------
   // Name: Frame size calculator
   // Description: Frame size is calculated for every frame 
   //--------------------------------------------------------------------------	
   always@(posedge sys_clk_i, negedge rstn_i) 
     if(!rstn_i) 
       frame_size_o <= 0;	 
     else 
       if(s_data_valid_fe == 1)
	 frame_size_o <= frame_size_o + s_h_count;
       else if(!s_frame_valid_dly2)
     	 frame_size_o <= 0;	 

	
   //--------------------------------------------------------------------------
   // Name       : DATA_VALID_FE_COUNTER
   // Description: PROCESS to extend data_valid falling edge signal to 4 clock cycles
   //--------------------------------------------------------------------------	
   always@(posedge sys_clk_i, negedge rstn_i) begin 
      if(!rstn_i) begin 
	 s_dv_fe_ctr      <= 0;
	 s_dv_fe_ctr_en   <= 0;
	 s_ddr_start 	 <= 0;
      end
      else begin 
	 if(s_data_valid_fe == 1)begin 
	    s_dv_fe_ctr_en   <= 1;
	    s_ddr_start 	 <= 1;
	 end
	 else if(s_dv_fe_ctr == 4'h4)begin 
	    s_dv_fe_ctr_en   <= 0;
	    s_ddr_start 	 <= 0;
	 end
	 
	 if(s_dv_fe_ctr_en == 1) begin 
	    s_dv_fe_ctr <= s_dv_fe_ctr + 1;
	 end
	 else begin 
	    s_dv_fe_ctr <= 0;
	 end
      end
   end	
	
//--------------------------------------------------------------------------
// Name       : DATA_COUNTER
// Description: Counter to count data
//--------------------------------------------------------------------------	
always@(posedge sys_clk_i, negedge rstn_i) begin 
	if(!rstn_i) begin 
		s_counter      <= 0;
	end
	else begin 
		if(s_data_valid_dly1 == 1)begin 
			s_counter <= s_counter + 1;
		end
		else begin 
			s_counter <= 0;
		end
	end
end		

//--------------------------------------------------------------------------
// Name       : DATA_ASSIGN
// Description: Process assigns data based on counter value
//--------------------------------------------------------------------------
always@(posedge sys_clk_i, negedge rstn_i) begin 
	if(!rstn_i) begin 
		s_data_pack      <= 0;
	end
	else begin 
		if(data_valid_i == 1)begin 
			s_data_pack <= {data_i , s_data_pack[g_DDR_AXI_DWIDTH_O-1 : g_DDR_AXI_DWIDTH_I]};
		end
	end
end	

endmodule
