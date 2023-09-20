/*=================================================================================================
File Name                           : DDR_Write_Native.v

Author                              : India Solutions Team

COPYRIGHT 2021 BY MICROCHIP
THE INFORMATION CONTAINED IN THIS DOCUMENT IS SUBJECT TO LICENSING RESTRICTIONS FROM MICROCHIP
CORP. IF YOU ARE NOT IN POSSESSION OF WRITTEN AUTHORIZATION FROM MICROCHIP FOR USE OF THIS
FILE, THEN THE FILE SHOULD BE IMMEDIATELY DESTROYED AND NO BACK-UP OF THE FILE SHOULD BE MADE.

=================================================================================================*/
module DDR_Write_Native#(
    parameter g_HORIZ_RESOL	            = 1920,
	parameter g_DDR_AXI_DWIDTH_I        = 32,
	parameter g_DDR_AXI_DWIDTH_O        = 512)
    (
    // Inputs
    input 			      rstn_i,
    input 			      sys_clk_i,
    input 			      ddr_clk_i,
    input 			      ddr_clk_rstn_i,
    input [15 :0] 		      line_gap_i,
    input [37 : 0] 		      frame_ddr_addr_i,
    input 			      frame_valid_i,
    input 			      write_ackn_i,
    input 			      write_done_i,
    input 			      data_valid_i,
    input [g_DDR_AXI_DWIDTH_I-1 : 0]  data_i,
    // Outputs
    output [7 : 0] 		      burst_size_o,
    output [37 : 0] 		      write_start_addr_o,
//    output [7  : 0]                     display_frame_addr_o,
    output 			      write_req_o,
    output 			      data_rdy_o,
    output [31:0] 		      frame_size_o,
    output [g_DDR_AXI_DWIDTH_O-1 : 0] data_o
    );

parameter   g_VIDEO_FIFO_DEPTH      = 2*((g_HORIZ_RESOL*g_DDR_AXI_DWIDTH_I)/g_DDR_AXI_DWIDTH_O);
parameter   g_FIFO_AWIDTH           = $clog2(g_VIDEO_FIFO_DEPTH);
//=================================================================================================
// Signal declarations
//=================================================================================================
wire    [7 : 0]                    beats_to_write_o_net_0;
wire    [g_DDR_AXI_DWIDTH_O-1 : 0]  data_packer_0_data_o_2;
wire                                data_packer_0_data_valid_o;
wire                                data_packer_0_fifo_reset_o;
wire    [15 : 0]                    data_packer_0_h_count_o;
wire                                data_packer_0_start_ddr_w_o;
wire    [7 : 0]                     display_frame_addr_o_0;
wire    [g_DDR_AXI_DWIDTH_O-1 : 0]  rdata_o_2;
wire                                rdata_rdy_o_net_0;
wire                                write_req_o_net_0;
wire    [37 : 0]                    write_start_addr_o_net_0;
wire                                AND2_0_Y;
wire 								sync_out1;
wire 								sync_out2;

//=================================================================================================
// Top level output port assignments
//=================================================================================================
 assign burst_size_o              = beats_to_write_o_net_0[7:0];
// assign display_frame_addr_o      = display_frame_addr_o_0;
 assign write_start_addr_o        = write_start_addr_o_net_0;
 assign write_req_o               = write_req_o_net_0;
 assign data_rdy_o                = rdata_rdy_o_net_0;
 assign data_o                    = rdata_o_2;

//=================================================================================================
// Asynchronous assignments
//=================================================================================================
assign AND2_0_Y                   = rstn_i & data_packer_0_fifo_reset_o;

//=================================================================================================
// Component instances
//=================================================================================================

//-------------------------------------------------------
// data_packer_0   
//-------------------------------------------------------

data_packer#(
    .g_DDR_AXI_DWIDTH_I     ( g_DDR_AXI_DWIDTH_I    ),
	.g_DDR_AXI_DWIDTH_O     ( g_DDR_AXI_DWIDTH_O    )
    )
    data_packer_0( 
        // Inputs
        .rstn_i        ( rstn_i                        ),
        .sys_clk_i     ( sys_clk_i                      ),
        .data_valid_i  ( data_valid_i                   ),
        .frame_valid_i  ( frame_valid_i                    ),
        .data_i        ( data_i                         ),
        // Outputs
        .data_valid_o  ( data_packer_0_data_valid_o     ),
        .start_ddr_w_o ( data_packer_0_start_ddr_w_o    ),
        .fifo_reset_o  ( data_packer_0_fifo_reset_o     ),
        .h_count_o     ( data_packer_0_h_count_o        ),
        .frame_size_o (frame_size_o ),
        .data_o        ( data_packer_0_data_o_2         ) 
    );  
    
//-------------------------------------------------------    
// DDR_write_contr_0
//-------------------------------------------------------

DDR_write_controller#(
	.g_DDR_AXI_DWIDTH_I  ( g_DDR_AXI_DWIDTH_I   ),
	.g_DDR_AXI_DWIDTH_O  ( g_DDR_AXI_DWIDTH_O   )
    )
    DDR_write_contr_0( 
        // Inputs
        .rstn_i               ( ddr_clk_rstn_i                         ),
        .sys_clk_i            ( ddr_clk_i                         ),
        .c_LINE_GAP           ( line_gap_i                          ),
        .start_i              ( data_packer_0_start_ddr_w_o         ),
        .write_ackn_i         ( write_ackn_i                        ),
        .write_done_i         ( write_done_i                        ),
        .frame_valid_i          ( frame_valid_i                         ),
        .horiz_resolution_i   ( data_packer_0_h_count_o             ),
        .frame_ddr_addr_i     ( frame_ddr_addr_i                    ),
        // Outputs
        .write_req_o          ( write_req_o_net_0                   ),
        .read_fifo_o          ( DDR_write_contr_0_read_fifo_o       ),
//        .display_frame_addr_o ( display_frame_addr_o_0              ),
        .write_start_addr_o   ( write_start_addr_o_net_0            ),
        .write_length_o       ( beats_to_write_o_net_0              ) 
        );   
    
//-------------------------------------------------------   
//video_fifo_0 
//-------------------------------------------------------

video_fifo_ddr_write#( 
    .g_VIDEO_FIFO_AWIDTH            ( g_FIFO_AWIDTH              ),
    .g_DDR_AXI_DWIDTH               ( g_DDR_AXI_DWIDTH_O         )
    )
    video_fifo_w( 
        // Inputs
		.rstn_i	       ( rstn_i							),
        .wclk_i        ( sys_clk_i                      ),
        .wrstn_i       ( sync_out1                       ),
        .wen_i         ( data_packer_0_data_valid_o     ),
        .rclk_i        ( ddr_clk_i                    ),
        .rrstn_i       ( sync_out2                       ),
        .ren_i         ( DDR_write_contr_0_read_fifo_o  ),
        .wdata_i       ( data_packer_0_data_o_2         ),
        // Outputs
        .wfull_o       (    ),
        .wafull_o      (    ),
        .rdata_rdy_o   ( rdata_rdy_o_net_0              ),
        .rempty_o      (    ),
        .raempty_o     (    ),
        .rhempty_o     (    ),
        .wdata_count_o (    ),
        .rdata_o       ( rdata_o_2                      ),
        .rdata_count_o (    ) 
        );  
     
//-------------------------------------------------------   
//synchronizer_circuit_ddr_write 
//-------------------------------------------------------

 synchronizer_circuit_ddr_write sync1(
	// inputs 
	.rstn_i			(rstn_i							), 
	.sys_clk		(sys_clk_i							),
	.data_in		(AND2_0_Y							),
	// output
	.sync_out		(sync_out1							)
	);

//-------------------------------------------------------   
//synchronizer_circuit_ddr_write 
//-------------------------------------------------------

 synchronizer_circuit_ddr_write sync2(
	// inputs 
	.rstn_i			(ddr_clk_rstn_i							), 
	.sys_clk		(ddr_clk_i						),
	.data_in		(AND2_0_Y							),
	// output
	.sync_out		(sync_out2							)
	);
      
      
endmodule

