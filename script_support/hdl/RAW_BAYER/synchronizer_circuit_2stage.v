//=================================================================================================
//-- File Name                           : synchronizer_circuit_2stage.v
//-- Targeted device                     : Microsemi-SoC
//-- Author                              : India Solutions Team
//--
//-- COPYRIGHT 2019 BY MICROSEMI
//-- THE INFORMATION CONTAINED IN THIS DOCUMENT IS SUBJECT TO LICENSING RESTRICTIONS FROM MICROSEMI
//-- CORP. IF YOU ARE NOT IN POSSESSION OF WRITTEN AUTHORIZATION FROM MICROSEMI FOR USE OF THIS
//-- FILE, THEN THE FILE SHOULD BE IMMEDIATELY DESTROYED AND NO BACK-UP OF THE FILE SHOULD BE MADE.
//--
//=================================================================================================

module synchronizer_circuit_2stage( 
				       // inputs 
				       input rstn_i,
				       input sys_clk_i,
				       input data_in_i,
				       // output
				       output reg sync_out_o);
   
   reg					     s_data_in;
   
   always@ (posedge sys_clk_i , negedge rstn_i )
     begin
	if (!rstn_i)
	  begin
	     s_data_in <= 0;
	     sync_out_o  <= 0;
	  end
	else
	  begin
	     s_data_in <= data_in_i;
	     sync_out_o  <= s_data_in;
	  end
     end 
endmodule
