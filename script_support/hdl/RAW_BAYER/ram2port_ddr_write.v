//=================================================================================================
//-- File Name                           : ram2port_ddr_write.v

//-- Targeted device                     : Microsemi-SoC
//-- Author                              : India Solutions Team
//--
//-- COPYRIGHT 2021 BY MICROCHIP
//-- THE INFORMATION CONTAINED IN THIS DOCUMENT IS SUBJECT TO LICENSING RESTRICTIONS FROM MICROCHIP
//-- CORP. IF YOU ARE NOT IN POSSESSION OF WRITTEN AUTHORIZATION FROM MICROCHIP FOR USE OF THIS
//-- FILE, THEN THE FILE SHOULD BE IMMEDIATELY DESTROYED AND NO BACK-UP OF THE FILE SHOULD BE MADE.
//--
//=================================================================================================
module ram2port_ddr_write#(
    // Video format selection
    parameter g_BUFF_AWIDTH     = 10,
    parameter g_DWIDTH       	= 64)
    ( 
    //Read and Write clocks
    input                         wclk_i,
	input                         rclk_i,
	//Write Enable
	input                         we_i,
	//Read and Write Addresses
	input   [g_BUFF_AWIDTH-1 : 0] rd_addr_i,
	input   [g_BUFF_AWIDTH-1 : 0] wr_addr_i,
	//Write data input
    input   [g_DWIDTH-1 : 0]      wr_data_i,
	//Read data outputs
	output [g_DWIDTH-1 : 0]      rd_data_o
    );

//=================================================================================================
// Signal declarations
//=================================================================================================
reg  [g_DWIDTH-1 : 0]            ram [0:2**g_BUFF_AWIDTH-1] /*synthesis syn_ramstyle="lsram" */;
reg  [g_BUFF_AWIDTH-1 : 0]       rd_addr_reg;
    
//=================================================================================================
// Top level output port assignments
//=================================================================================================
assign rd_data_o	= ram[rd_addr_reg];

//-=================================================================================================
// Synchronous blocks
//=================================================================================================
//--------------------------------------------------------------------------
// Name       : WRITE_PROC
// Description: Process writes data into RAM
//--------------------------------------------------------------------------    
always@(posedge wclk_i) begin 
    if(we_i == 1) begin 
        ram[wr_addr_i]  <= wr_data_i;
    end
end

//--------------------------------------------------------------------------
// Name       : READ_PROC
// Description: Process reads data from RAM
//--------------------------------------------------------------------------
always@(posedge rclk_i) begin 
    rd_addr_reg  <= rd_addr_i;
end
    
endmodule

