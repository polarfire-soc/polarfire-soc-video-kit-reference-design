//=================================================================================================
//-- File Name                           : interrupt_controller_dma.v
//-- Targeted device                     : Microsemi-SoC
//-- Author                              : India Solutions Team
//--
//-- COPYRIGHT 2019 BY MICROSEMI
//-- THE INFORMATION CONTAINED IN THIS DOCUMENT IS SUBJECT TO LICENSING RESTRICTIONS FROM MICROSEMI
//-- CORP. IF YOU ARE NOT IN POSSESSION OF WRITTEN AUTHORIZATION FROM MICROSEMI FOR USE OF THIS
//-- FILE, THEN THE FILE SHOULD BE IMMEDIATELY DESTROYED AND NO BACK-UP OF THE FILE SHOULD BE MADE.
//--
//=================================================================================================

module interrupt_controller_dma 
  (
   rstn_i,
   sys_clk_i,

   interrupt_event_i,
   interrupt_en_i,
   interrupt_clear_i,
   global_interrupt_en_i,

   status_reg_o,
   interrupt_o,
   interrupt_overflow_o
   );

`include "memory_map_dma.v"

   
    // inputs 
    input 				 rstn_i;
    input 				 sys_clk_i;

    // input
    input [INTERRUPT_REG_WIDTH-1:0] 	 interrupt_event_i;
    input [INTERRUPT_REG_WIDTH-1:0] 	 interrupt_en_i;
    input [INTERRUPT_REG_WIDTH-1:0] 	 interrupt_clear_i;
    input 				 global_interrupt_en_i;

    // output
    output reg [INTERRUPT_REG_WIDTH-1:0] status_reg_o;
    
   output 				 interrupt_o;
   output reg [INTERRUPT_REG_WIDTH-1:0]  interrupt_overflow_o;

   reg [INTERRUPT_REG_WIDTH-1:0] 	 interrupt_event_dly [2:0];
   wire [INTERRUPT_REG_WIDTH-1:0] 	 interrupt_event_rising_edge;
   reg [INTERRUPT_REG_WIDTH-1:0] 	 event_status;   
   reg [4:0] 			 diff_cnt [INTERRUPT_REG_WIDTH-1:0];
   wire [INTERRUPT_REG_WIDTH-1:0] 	 diff_cnt_interrupt;   
   integer 				 i;
   genvar 				 j;
   
   ///////////////////////////////////////////////////
     //2 stage synchronizer for interrupt events
   ///////////////////////////////////////////////////   
   always@ (posedge sys_clk_i , negedge rstn_i )
     if (!rstn_i) begin
	interrupt_event_dly[0] <= 'h0;
	interrupt_event_dly[1] <= 'h0;
	interrupt_event_dly[2] <= 'h0;	
     end
     else begin
	interrupt_event_dly[0] <= interrupt_event_i;
	interrupt_event_dly[1] <= interrupt_event_dly[0];
	interrupt_event_dly[2] <= interrupt_event_dly[1];		
     end


   ///////////////////////////////////////////////////
   //Rising edge detector for interrupt event
   ///////////////////////////////////////////////////   
   for (j=0;j<INTERRUPT_REG_WIDTH; j=j+1)     
     assign interrupt_event_rising_edge[j] = interrupt_event_dly[1][j] & !interrupt_event_dly[2][j];
   
   
   ///////////////////////////////////////////////////
   //status register based on the interrupt clear
   //command received from the processor
   ///////////////////////////////////////////////////   
   always@ (posedge sys_clk_i , negedge rstn_i )
     if (!rstn_i) 
       status_reg_o <= 'h0;
     else begin
	for (i=0;i<INTERRUPT_REG_WIDTH; i=i+1) begin
	   if (interrupt_clear_i[i] && diff_cnt[i] == 'h1 && interrupt_event_rising_edge[i])
	     status_reg_o[i] <= 1'b1;
	   else if (interrupt_clear_i[i] && diff_cnt[i] == 'h1 && !event_status[i])
	     status_reg_o[i] <= 1'b0;	 	   
	   else if(interrupt_event_rising_edge[i] && interrupt_en_i[i] && global_interrupt_en_i)
	     status_reg_o[i] <= 1'b1;
	end
     end

   ///////////////////////////////////////////////////
   //Intermediate status register
   ///////////////////////////////////////////////////   
   always@ (posedge sys_clk_i , negedge rstn_i )
     if (!rstn_i) 
       event_status <= 'h0;
     else
       for (i=0;i<INTERRUPT_REG_WIDTH; i=i+1)
	 if (interrupt_en_i[i] && global_interrupt_en_i)
	   event_status[i] <= interrupt_event_rising_edge[i];
   


   ///////////////////////////////////////////////////
   //Intermediate status register
   ///////////////////////////////////////////////////   
   always@ (posedge sys_clk_i , negedge rstn_i )
     for (i=0;i<INTERRUPT_REG_WIDTH; i=i+1)     
       if (!rstn_i)
	 diff_cnt[i] <= 'h0;
       else if (interrupt_clear_i[i] && (diff_cnt[i] != 'h0) && !event_status[i]) 
	 diff_cnt[i] <= diff_cnt[i] - 1;
       else if (!interrupt_clear_i[i] && event_status[i])
	 diff_cnt[i] <= diff_cnt[i] + 1;


   ///////////////////////////////////////////////////
   //counter difference for each interrupt
   ///////////////////////////////////////////////////   
  
   for (j=0;j<INTERRUPT_REG_WIDTH; j=j+1)     
     assign diff_cnt_interrupt[j] = |diff_cnt[j];

   ///////////////////////////////////////////////////
   //Generating interrupt based on the counter
   ///////////////////////////////////////////////////   
   assign interrupt_o = |diff_cnt_interrupt;


   ///////////////////////////////////////////////////
   //Interrupt overflow error signal generation
   //when the diff count becomes max i.e. 5'b1_1111
   //This overflow flag doesn't auto reset
   ///////////////////////////////////////////////////
   always@ (posedge sys_clk_i , negedge rstn_i )
     if (!rstn_i)
       interrupt_overflow_o <= 'h0;
     else    
       for (i=0;i<INTERRUPT_REG_WIDTH; i=i+1)
	 if (!interrupt_overflow_o[i] && diff_cnt[i] == 5'h1f)
	   interrupt_overflow_o[i] <= 1'b1;
   


endmodule // interrupt_controller_dma

