//=================================================================================================
//-- File Name                           : debug_counters_dma.v
//-- Targeted device                     : Microsemi-SoC
//-- Author                              : India Solutions Team
//--
//-- COPYRIGHT 2019 BY MICROSEMI
//-- THE INFORMATION CONTAINED IN THIS DOCUMENT IS SUBJECT TO LICENSING RESTRICTIONS FROM MICROSEMI
//-- CORP. IF YOU ARE NOT IN POSSESSION OF WRITTEN AUTHORIZATION FROM MICROSEMI FOR USE OF THIS
//-- FILE, THEN THE FILE SHOULD BE IMMEDIATELY DESTROYED AND NO BACK-UP OF THE FILE SHOULD BE MADE.
//--
//=================================================================================================

module debug_counters_dma 
  (
   rstn_i,
   sys_clk_i,

   interrupt_i,
   buff_addr_fifo_wen_i,
   frame_processed_count_o,
   buff_addr_frm_processor_o
   );

`include "memory_map_dma.v"

   
   // inputs 
   input 				 rstn_i;
   input 				 sys_clk_i;

   // input
   input 				 interrupt_i;
   input 				 buff_addr_fifo_wen_i;   
	 
   // output
   output reg [FRAME_COUNTER_WIDTH-1:0]  frame_processed_count_o;
   output reg [INPUT_FRAME_COUNTER_WIDTH-1:0] buff_addr_frm_processor_o;
   
   reg 					 interrupt_i_dly;
   wire 				 interrupt_i_re;
   
   ///////////////////////////////////////////////////
   //Number of frames processed
   ///////////////////////////////////////////////////   
   always@ (posedge sys_clk_i , negedge rstn_i )
     if (!rstn_i) 
       interrupt_i_dly <=0;
     else
       interrupt_i_dly <= interrupt_i;
   


   assign interrupt_i_re = interrupt_i & !interrupt_i_dly;
   
   
   ///////////////////////////////////////////////////
   //Number of frames processed
   ///////////////////////////////////////////////////   
   always@ (posedge sys_clk_i , negedge rstn_i )
     if (!rstn_i) 
       frame_processed_count_o <= 'h0;
     else 
	if (interrupt_i_re)
	  frame_processed_count_o <= frame_processed_count_o + 1;



      ///////////////////////////////////////////////////
   //Number of frames processed
   ///////////////////////////////////////////////////   
   always@ (posedge sys_clk_i , negedge rstn_i )
     if (!rstn_i) 
       buff_addr_frm_processor_o <= 'h0;
     else 
	if (buff_addr_fifo_wen_i)
	  buff_addr_frm_processor_o <= buff_addr_frm_processor_o + 1;


   
endmodule // debug_counters_dma

