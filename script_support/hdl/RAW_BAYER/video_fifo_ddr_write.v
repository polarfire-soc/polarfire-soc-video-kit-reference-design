//=================================================================================================
//-- File Name                           : video_fifo_ddr_write.v

//-- Targeted device                     : Microsemi-SoC
//-- Author                              : India Solutions Team
//--
//-- COPYRIGHT 2021 BY MICROCHIP
//-- THE INFORMATION CONTAINED IN THIS DOCUMENT IS SUBJECT TO LICENSING RESTRICTIONS FROM MICROCHIP
//-- CORP. IF YOU ARE NOT IN POSSESSION OF WRITTEN AUTHORIZATION FROM MICROCHIP FOR USE OF THIS
//-- FILE, THEN THE FILE SHOULD BE IMMEDIATELY DESTROYED AND NO BACK-UP OF THE FILE SHOULD BE MADE.
//--
//=================================================================================================
module video_fifo_ddr_write#(
    //Video format selection
    parameter   g_VIDEO_FIFO_AWIDTH = 12,
    parameter   g_DDR_AXI_DWIDTH    = 512)
    (
	input 								rstn_i,
    input                               wclk_i,
    input                               wrstn_i,
    input                               wen_i,
    input [g_DDR_AXI_DWIDTH-1 : 0]      wdata_i,
    input                               rclk_i,
	input                               rrstn_i,
	input                               ren_i,
    output                              wfull_o,
	output                              wafull_o,
	output [g_VIDEO_FIFO_AWIDTH-1 : 0]  wdata_count_o,
	output [g_DDR_AXI_DWIDTH-1 : 0]     rdata_o,
	output                              rdata_rdy_o,
	output                              rempty_o,
	output                              raempty_o,
	output                              rhempty_o,
	output [g_VIDEO_FIFO_AWIDTH-1 : 0]  rdata_count_o
    );
    
    
//-=================================================================================================
// Parameter declarations
//--================================================================================================
parameter   AFULL_THRESHOLD	            = (2**(g_VIDEO_FIFO_AWIDTH))-1;
parameter   AEMPTY_THRESHOLD	        = 10;   
parameter   HALF_EMPTY_THRESHOLD        = (2**(g_VIDEO_FIFO_AWIDTH)) >> 1;
//-=================================================================================================
// Signal declarations
//--================================================================================================
reg  [g_VIDEO_FIFO_AWIDTH : 0]      rbin;
reg  [g_VIDEO_FIFO_AWIDTH : 0]      rptr;
reg  [g_VIDEO_FIFO_AWIDTH : 0]      rwptr1;
reg  [g_VIDEO_FIFO_AWIDTH : 0]      rwptr2;

reg                                 rempty;
reg                                 s_ren;
reg                                 raempty;
reg                                 wfull;
reg                                 wafull;
reg                                 fifo_hempty;
reg  [g_VIDEO_FIFO_AWIDTH : 0]      rwbin;
reg  [g_VIDEO_FIFO_AWIDTH : 0]      rdata_count;
reg  [g_VIDEO_FIFO_AWIDTH : 0]      wbin;
reg  [g_VIDEO_FIFO_AWIDTH : 0]      wptr;
wire [g_VIDEO_FIFO_AWIDTH : 0]      s_wrptr2_tmp;

reg  [g_VIDEO_FIFO_AWIDTH : 0]      wrptr1;
reg  [g_VIDEO_FIFO_AWIDTH : 0]      wrptr2;
reg  [g_VIDEO_FIFO_AWIDTH : 0]      wrbin;
reg  [g_VIDEO_FIFO_AWIDTH : 0]      wdata_count;

wire                                wen;
wire [g_VIDEO_FIFO_AWIDTH-1 : 0]    raddr;
wire [g_VIDEO_FIFO_AWIDTH-1 : 0]    waddr;
wire [g_VIDEO_FIFO_AWIDTH : 0]      rbnext;
wire [g_VIDEO_FIFO_AWIDTH : 0]      rgnext;
wire [g_VIDEO_FIFO_AWIDTH : 0]      wbnext;
wire [g_VIDEO_FIFO_AWIDTH : 0]      wgnext;
wire [g_VIDEO_FIFO_AWIDTH : 0]      wdiff_bus;
wire [g_VIDEO_FIFO_AWIDTH : 0]      rdiff_bus;

integer i,j;

wire									dummy1,dummy2,dummy3,dummy4;
reg               dummy5,dummy6;

//=================================================================================================
// Top level output port assignments
//=================================================================================================
assign  rdata_rdy_o		= s_ren;
assign  rdata_count_o	= rdata_count[g_VIDEO_FIFO_AWIDTH-1 : 0];
assign  wfull_o			= wfull;
assign  wafull_o        = wafull;
assign  rhempty_o       = fifo_hempty;
assign  wdata_count_o   = wdata_count[g_VIDEO_FIFO_AWIDTH-1 : 0];
assign  rempty_o	    = rempty;    
assign  raempty_o 		= raempty;
    
//=================================================================================================
// Asynchronous blocks
//=================================================================================================
assign  raddr           	= rbin[g_VIDEO_FIFO_AWIDTH-1 : 0];                          /* Memory read address pointer */
assign  {dummy1,rbnext}     = rbin + (ren_i & (!rempty));                               /* Increment binary counter */
//assign  rgnext          = ({1'b0,rbnext[g_VIDEO_FIFO_AWIDTH:1]}) ^ rbnext;        /* Binary to Gray conversion */
assign  rgnext          	= (rbnext>>1) ^ rbnext;        /* Binary to Gray conversion */
assign  wen	            	= (wen_i == 1 & wfull == 0) ? 1 : 0;                        /* Write to memory only when FIFO is not full */
assign  waddr           	= wbin[g_VIDEO_FIFO_AWIDTH-1 : 0];                          /* Memory write address pointer */
assign  {dummy2,wbnext}     = wbin + (wen_i & (!wfull));                                /* Increment binary counter */
//assign  wgnext          = ({1'b0,wbnext[g_VIDEO_FIFO_AWIDTH:1]}) ^ wbnext;        /* Binary to Gray conversion */
assign  wgnext          	= (wbnext >> 1) ^ wbnext;        /* Binary to Gray conversion */
assign  {dummy3,rdiff_bus} 	= rwbin - rbin;
assign  {dummy4,wdiff_bus}	= wbin - wrbin;
assign  s_wrptr2_tmp		= {~(wrptr2[g_VIDEO_FIFO_AWIDTH : g_VIDEO_FIFO_AWIDTH-1]), wrptr2[g_VIDEO_FIFO_AWIDTH-2 : 0]};    
    
//--------------------------------------------------------------------------
// Name       : GRAY2BIN_CONV
// Description: Process converts gray code to binary
//--------------------------------------------------------------------------
always@(rwbin,rwptr2) begin 
    rwbin[g_VIDEO_FIFO_AWIDTH]	<= rwptr2[g_VIDEO_FIFO_AWIDTH];
    for(i = g_VIDEO_FIFO_AWIDTH[31:0]-1; i>=0; i = i-1) begin 
    //for(i = 0; i<=g_VIDEO_FIFO_AWIDTH-1; i = i+1) begin 
        rwbin[i]    <= rwptr2[i] ^ rwbin[i+1];
    end
end

//--------------------------------------------------------------------------
// Name       : GRAY2BIN_CONV
// Description: Process implements gray to binary conversion
//--------------------------------------------------------------------------
always@(wrbin,wrptr2) begin 
    wrbin[g_VIDEO_FIFO_AWIDTH]	<= wrptr2[g_VIDEO_FIFO_AWIDTH];
    for(j = g_VIDEO_FIFO_AWIDTH[31:0]-1; j>=0; j = j-1) begin 
    //for(i = 0; i<=g_VIDEO_FIFO_AWIDTH-1; i = i+1) begin 
        wrbin[j]    <= wrptr2[j] ^ wrbin[j+1];
    end
end

//=================================================================================================
// Synchronous blocks
//=================================================================================================

//--------------------------------------------------------------------------
// Name       : READ_PTR_ASSIGN_PROC
// Description: Process reads data
//--------------------------------------------------------------------------
always@(posedge rclk_i, negedge rstn_i) begin 
	if(!rstn_i) begin 
		s_ren       <= 0;
	end else
    if(!rrstn_i) begin 
        s_ren       <= 0;
    end
    else begin 
        s_ren       <= ren_i;
    end
end

//--------------------------------------------------------------------------
// Name       : READ_PTR_ASSIGN_PROC
// Description: Process reads data
//--------------------------------------------------------------------------
always@(posedge rclk_i, negedge rstn_i) begin 
	if(!rstn_i) begin 
		rbin       <= 0;
        rptr       <= 0;
	end else 
    if(!rrstn_i) begin 
        rbin       <= 0;
        rptr       <= 0;
    end
    else begin 
        rbin       <= rbnext;
        rptr       <= rgnext;
    end
end

//--------------------------------------------------------------------------
// Name       : SYNC_WRPTR_RDCLK_PROC
// Description: Process synchronizes write pointer to read clock domain
//--------------------------------------------------------------------------
always@(posedge rclk_i, negedge rstn_i) begin 
	if(!rstn_i) begin 
		rwptr1       <= 0;
        rwptr2       <= 0;
	end else
    if(!rrstn_i) begin 
        rwptr1       <= 0;
        rwptr2       <= 0;
    end
    else begin 
        rwptr1       <= wptr;
        rwptr2       <= rwptr1;
    end
end

//--------------------------------------------------------------------------
// Name       : REMPTY_ASSIGN_PROC
// Description: Process assigns read empty when next rptr equals synchronized wptr
//--------------------------------------------------------------------------
always@(posedge rclk_i, negedge rstn_i) begin 
	if(!rstn_i) begin 
		rempty       <= 1;
	end else
    if(!rrstn_i) begin 
        rempty       <= 1;
    end
    else begin 
        if(rgnext == rwptr2) begin 
            rempty      <= 1;
        end
        else begin 
            rempty      <= 0;
        end
    end
end

//--------------------------------------------------------------------------
// Name       : DATACNT_PROC
// Description: Process counts data in FIFO (diff between write and read ptr)
//--------------------------------------------------------------------------
always@(posedge rclk_i, negedge rstn_i) begin 
	if(!rstn_i) begin 
		rdata_count       <= 0;
		dummy5			  <= 0;
	end else
    if(!rrstn_i) begin 
        rdata_count       <= 0;
		dummy5			  <= 0;
    end
    else begin 
        {dummy5,rdata_count} <= (rwbin - rbin);
    end
end

//--------------------------------------------------------------------------
// Name       : READ_EMPTY_ASSIGN
// Description: Process detects read buffer empty
//--------------------------------------------------------------------------
always@(posedge rclk_i, negedge rstn_i) begin 
	if(!rstn_i) begin 
		raempty       <= 1;
	end else
    if(!rrstn_i) begin 
        raempty       <= 1;
    end
    else begin 
        if(AEMPTY_THRESHOLD[g_VIDEO_FIFO_AWIDTH : 0] >= rdiff_bus) begin 
            raempty     <= 1;
        end
        else begin 
            raempty     <= 0;
        end
    end
end

//--------------------------------------------------------------------------
// Name       : HALFEMPTY_PROC
// Description: Process assigns fifo half empty signal
//--------------------------------------------------------------------------
always@(posedge rclk_i, negedge rstn_i) begin 
	if(!rstn_i) begin 
		fifo_hempty       <= 1;
	end else
    if(!rrstn_i) begin 
        fifo_hempty       <= 1;
    end
    else begin 
        if(HALF_EMPTY_THRESHOLD[g_VIDEO_FIFO_AWIDTH : 0] >= rdiff_bus) begin 
            fifo_hempty     <= 1;
        end
        else begin 
            fifo_hempty     <= 0;
        end
    end
end

//---------------WRITE SECTION----------------------//
//--------------------------------------------------------------------------
// Name       : BIN_GRAY_CTR_PROC
// Description: Process implements binary and gray counters
//--------------------------------------------------------------------------
always@(posedge wclk_i) begin 
	if(!rstn_i) begin 
		wbin       <= 0;
        wptr       <= 0;
	end else
    if(!wrstn_i) begin 
        wbin       <= 0;
        wptr       <= 0;
    end
    else begin 
        wbin       <= wbnext;
        wptr       <= wgnext;
    end
end

//--------------------------------------------------------------------------
// Name       : SYNC_READ_PTR
// Description: Syncronizes read pointer into write clock domain
//--------------------------------------------------------------------------
always@(posedge wclk_i, negedge rstn_i) begin 
	if(!rstn_i) begin 
		wrptr1       <= 0;
        wrptr2       <= 0;
	end else
    if(!wrstn_i) begin 
        wrptr1       <= 0;
        wrptr2       <= 0;
    end
    else begin 
        wrptr1       <= rptr;
        wrptr2       <= wrptr1;
    end
end

// FIFO is full when following 3 condition are true
// 1. The wptr and the synchronized rptr MSB's are not equal
// 2. The wptr and the synchronized rptr 2nd MSB's are not equal
// 3. All other wptr and synchronized rptr bits must be equal

//--------------------------------------------------------------------------
// Name       : FIFO_FULL_ASSIGN
// Description: Synchronizes read pointer into write clock domain
//--------------------------------------------------------------------------
always@(posedge wclk_i, negedge rstn_i) begin
	if(!rstn_i) begin 
		wfull       <= 0;
	end else
    if(!wrstn_i) begin 
        wfull       <= 0;
    end
    else begin 
        if(wgnext == s_wrptr2_tmp)begin 
            wfull	<= 1;
        end
        else begin 
            wfull	<= 0;
        end
    end
end

//--------------------------------------------------------------------------
// Name       : FIFO_COUNT
// Description: Data available in FIFO is difference between write and read pointer
//--------------------------------------------------------------------------
always@(posedge wclk_i, negedge rstn_i) begin 
	if(!rstn_i) begin 
		wdata_count       <= 0;
		dummy6			  <= 0;
	end else
    if(!wrstn_i) begin 
        wdata_count       <= 0;
		dummy6			  <= 0;
    end
    else begin 
       {dummy6,wdata_count}	<= wbin - wrbin;
    end
end

//--------------------------------------------------------------------------
// Name       : WA_FULL_ASSIGN
// Description: Assigns wafull signal
//--------------------------------------------------------------------------
always@(posedge wclk_i, negedge rstn_i) begin 
	if(!rstn_i) begin 
		wafull       <= 0;
	end else
    if(!wrstn_i) begin 
        wafull       <= 0;
    end
    else begin 
        if(wdiff_bus >= AFULL_THRESHOLD[g_VIDEO_FIFO_AWIDTH : 0])begin 
            wafull	<= 1;
        end
        else begin 
            wafull	<= 0;
        end
    end
end

//=================================================================================================
// Module Instantiations
//=================================================================================================

//--------------------------------------------------------------------------
// ram2port_inst
//--------------------------------------------------------------------------
ram2port_ddr_write #(
           .g_BUFF_AWIDTH   ( g_VIDEO_FIFO_AWIDTH      ),
           .g_DWIDTH    	( g_DDR_AXI_DWIDTH         )
          )
    ram2portdw_inst(
        .wr_data_i	   	    ( wdata_i   ),
        .rd_addr_i        	( raddr     ),
        .wr_addr_i        	( waddr     ),
        .we_i         		( wen       ),
        .wclk_i        	    ( wclk_i  	),
        .rclk_i        	    ( rclk_i  	),
        .rd_data_o       	( rdata_o   )
    );
    

endmodule

