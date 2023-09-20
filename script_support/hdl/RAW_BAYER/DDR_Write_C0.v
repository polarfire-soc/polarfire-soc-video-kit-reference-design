//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Tue Jul 25 10:04:48 2023
// Version: 2023.1 2023.1.0.6
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

//////////////////////////////////////////////////////////////////////
// Component Description (Tcl) 
//////////////////////////////////////////////////////////////////////
/*
# Exporting Component Description of DDR_Write_C0 to TCL
# Family: PolarFireSoC
# Part Number: MPFS250TS-1FCG1152I
# Create and Configure the core component DDR_Write_C0
create_and_configure_core -core_vlnv {Microsemi:SolutionCore:DDR_Write:1.1.0} -component_name {DDR_Write_C0} -params {\
"g_AXI4S_FORMAT:0"  \
"g_DDR_AXI_DWIDTH_I:8"  \
"g_DDR_AXI_DWIDTH_O:512"  \
"g_FORMAT:0"  \
"g_HORIZ_RESOL:1920"   }
# Exporting Component Description of DDR_Write_C0 to TCL done
*/

// DDR_Write_C0
module DDR_Write_C0(
    // Inputs
    data_i,
    data_valid_i,
    ddr_clk_i,
    ddr_clk_rstn_i,
    frame_ddr_addr_i,
    frame_valid_i,
    line_gap_i,
    pixel_clk_i,
    pixel_rstn_i,
    write_ackn_i,
    write_done_i,
    // Outputs
    burst_size_o,
    data_o,
    data_rdy_o,
frame_size_o,		    
//    display_frame_addr_o,
    write_req_o,
    write_start_addr_o
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  [7:0]   data_i;
input          data_valid_i;
input          ddr_clk_i;
input          ddr_clk_rstn_i;
input  [37:0]   frame_ddr_addr_i;
input          frame_valid_i;
input  [15:0]  line_gap_i;
input          pixel_clk_i;
input          pixel_rstn_i;
input          write_ackn_i;
input          write_done_i;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output [7:0]   burst_size_o;
output [511:0] data_o;
   output [31:0] frame_size_o;  
output         data_rdy_o;
//output [7:0]   display_frame_addr_o;
output         write_req_o;
output [37:0]  write_start_addr_o;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   [7:0]   burst_size_o_net_0;
wire   [7:0]   data_i;
wire   [511:0] data_o_net_0;
wire           data_rdy_o_net_0;
wire           data_valid_i;
wire           ddr_clk_i;
wire           ddr_clk_rstn_i;
wire   [7:0]   display_frame_addr_o_net_0;
wire   [37:0]   frame_ddr_addr_i;
wire           frame_valid_i;
wire   [15:0]  line_gap_i;
wire           pixel_clk_i;
wire           pixel_rstn_i;
wire           write_ackn_i;
wire           write_done_i;
wire           write_req_o_net_0;
wire   [37:0]  write_start_addr_o_net_0;
wire           write_req_o_net_1;
wire           data_rdy_o_net_1;
wire   [7:0]   burst_size_o_net_1;
wire   [37:0]  write_start_addr_o_net_1;
wire   [7:0]   display_frame_addr_o_net_1;
wire   [511:0] data_o_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire           GND_net;
wire   [7:0]   TDATA_I_const_net_0;
wire   [3:0]   TUSER_I_const_net_0;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net             = 1'b0;
assign TDATA_I_const_net_0 = 8'h00;
assign TUSER_I_const_net_0 = 4'h0;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign write_req_o_net_1          = write_req_o_net_0;
assign write_req_o                = write_req_o_net_1;
assign data_rdy_o_net_1           = data_rdy_o_net_0;
assign data_rdy_o                 = data_rdy_o_net_1;
assign burst_size_o_net_1         = burst_size_o_net_0;
assign burst_size_o[7:0]          = burst_size_o_net_1;
assign write_start_addr_o_net_1   = write_start_addr_o_net_0;
assign write_start_addr_o[37:0]   = write_start_addr_o_net_1;
assign display_frame_addr_o_net_1 = display_frame_addr_o_net_0;
//assign display_frame_addr_o[7:0]  = display_frame_addr_o_net_1;
assign data_o_net_1               = data_o_net_0;
assign data_o[511:0]              = data_o_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------DDR_Write   -   Microsemi:SolutionCore:DDR_Write:1.1.0
DDR_Write #( 
        .g_AXI4S_FORMAT     ( 0 ),
        .g_DDR_AXI_DWIDTH_I ( 8 ),
        .g_DDR_AXI_DWIDTH_O ( 512 ),
        .g_FORMAT           ( 0 ),
        .g_HORIZ_RESOL      ( 1920 ) )
DDR_Write_C0_0(
        // Inputs
        .rstn_i               ( pixel_rstn_i ),
        .pixel_clk_i          ( pixel_clk_i ),
        .ddr_clk_i            ( ddr_clk_i ),
        .ddr_clk_rstn_i       ( ddr_clk_rstn_i ),
        .frame_valid_i        ( frame_valid_i ),
        .write_ackn_i         ( write_ackn_i ),
        .write_done_i         ( write_done_i ),
        .data_valid_i         ( data_valid_i ),
        .AWREADY_I            ( GND_net ), // tied to 1'b0 from definition
        .BUSER_I              ( GND_net ), // tied to 1'b0 from definition
        .TVALID_I             ( GND_net ), // tied to 1'b0 from definition
        .line_gap_i           ( line_gap_i ),
        .frame_ddr_addr_i     ( frame_ddr_addr_i ),
        .data_i               ( data_i ),
        .TDATA_I              ( TDATA_I_const_net_0 ), // tied to 8'h00 from definition
        .TUSER_I              ( TUSER_I_const_net_0 ), // tied to 4'h0 from definition
        // Outputs
        .TREADY_O             (  ),
        .WVALID_O             (  ),
        .WLAST_O              (  ),
        .AWVALID_O            (  ),
        .write_req_o          ( write_req_o_net_0 ),
        .data_rdy_o           ( data_rdy_o_net_0 ),
	       .frame_size_o (frame_size_o),
        .WDATA_O              (  ),
        .AWADDR_O             (  ),
        .AWSIZE_O             (  ),
        .burst_size_o         ( burst_size_o_net_0 ),
        .write_start_addr_o   ( write_start_addr_o_net_0 ),
//        .display_frame_addr_o ( display_frame_addr_o_net_0 ),
        .data_o               ( data_o_net_0 ) 
        );


endmodule
