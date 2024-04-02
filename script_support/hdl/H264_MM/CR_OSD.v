// --*************************************************************************************************
// -- File Name                           : axi4lite_if_osd.v
// -- Targeted device                     : Microsemi-SoC
// -- Author                              : India Solutions Team
// --
// -- COPYRIGHT 2021 BY MICROSEMI
// -- THE INFORMATION CONTAINED IN THIS DOCUMENT IS SUBJECT TO LICENSING RESTRICTIONS FROM MICROSEMI
// -- CORP. IF YOU ARE NOT IN POSSESSION OF WRITTEN AUTHORIZATION FROM MICROSEMI FOR USE OF THIS
// -- FILE, THEN THE FILE SHOULD BE IMMEDIATELY DESTROYED AND NO BACK-UP OF THE FILE SHOULD BE MADE.
// --
// --*************************************************************************************************

module CR_OSD (
	       // Clock and Reset interface----------------------------------------------------
	       input		 aclk, // clock
	       input		 aresetn, // This active-low reset
	       //write address channel
	       input wire	 awvalid, // AXI4-Lite write address valid. This signal indicates that valid write address and control information are available.
	       output reg	 awready, // AXI4-Lite write address ready. This signal indicates that the target is ready to accept an address and associated control signals.
	       input wire [31:0] awaddr, // AXI4-Lite write address.
	       //write data channel
	       input wire [31:0] wdata, // AXI4-Lite write data.
	       input wire	 wvalid, // AXI4-Lite write valid.
	       output reg	 wready, // AXI4-Lite Write ready.
	       //write response channel
	       output [1:0]	 bresp, // AXI4-Lite write response.
	       output reg	 bvalid, // AXI4-Lite write response valid.
	       input wire	 bready, // AXI4-Lite response ready.
	       //read address channel
	       input wire [31:0] araddr, // AXI4-Lite read address. The read address gives the address of the first transfer in a read burst transaction.  
	       input wire	 arvalid, // AXI4-Lite read address valid. This signal indicates that the channel is signaling valid read address and control information. 
	       output reg	 arready, // AXI4-Lite response ready. This signal indicates that the slave is ready to accept an address and associated control signals.
	       //read data and response channel
	       input wire	 rready, 
	       output [31:0]	 rdata, // AXI4-Lite read data.
	       output [1:0]	 rresp, // AXI4-Lite read response.
	       output reg	 rvalid, // AXI4-Lite read valid. This signal indicates that the channel is signaling the required read data.

	       input DATA_VALID_I,
	       input FRAME_END_I,
	       input RESETN_I,
	       input SYS_CLK_I,
	       input [7:0] r_i,
	       input [7:0] g_i,
	       input [7:0] b_i,

	       output reg data_valid_o,
	       output [7:0] r_o,
	       output [7:0] g_o,
	       output [7:0] b_o	       
	       );

   wire			    w_aresetn;   
   wire			    w_osd_ip_en;
   wire			    w_osd_ip_rstn;
   wire [31:0]		    w_coordinate;
   wire [23:0]		    w_rgb_color;
   wire [11:0]		    w_osd_num;
   wire [15:0]		    w_hres;
   wire [15:0]		    w_vres;   

   assign w_aresetn = RESETN_I && (~w_osd_ip_rstn);
   
   axi4lite_if_osd axi4lite_if_osd (.*,
				    .osd_ip_en(w_osd_ip_en),
				    .osd_ip_rstn(w_osd_ip_rstn),
				    .coordinate(w_coordinate),
				    .rgb_color(w_rgb_color),
				    .osd_num(w_osd_num),
				    .h_res(w_hres),
				    .v_res(w_vres)
				    );
   
   CR_OSD_top CR_OSD_top (
			  .DATA_VALID_I(DATA_VALID_I),
			  .FRAME_END_I(FRAME_END_I),
			  .RESETN_I(w_aresetn),
			  .SYS_CLK_I(SYS_CLK_I),
			  .OSD_EN_I(w_osd_ip_en),
			  .r_i(r_i),
			  .g_i(g_i),
			  .b_i(b_i),
			  .hres_i(w_hres),
			  .vres_i(w_vres),
			  .coordinate_i(w_coordinate),
			  .num_i(w_osd_num),
			  .text_color_rgb_i(w_rgb_color),
			  .data_valid_o(data_valid_o),
			  .r_o(r_o),
			  .g_o(g_o),
			  .b_o(b_o)
			  );
   

endmodule // CR_OSD



// --*************************************************************************************************
// -- File Name                           : axi4lite_if_osd.v
// -- Targeted device                     : Microsemi-SoC
// -- Author                              : India Solutions Team
// --
// -- COPYRIGHT 2021 BY MICROSEMI
// -- THE INFORMATION CONTAINED IN THIS DOCUMENT IS SUBJECT TO LICENSING RESTRICTIONS FROM MICROSEMI
// -- CORP. IF YOU ARE NOT IN POSSESSION OF WRITTEN AUTHORIZATION FROM MICROSEMI FOR USE OF THIS
// -- FILE, THEN THE FILE SHOULD BE IMMEDIATELY DESTROYED AND NO BACK-UP OF THE FILE SHOULD BE MADE.
// --
// --*************************************************************************************************

module axi4lite_if_osd
  (
   // Clock and Reset interface----------------------------------------------------
   input	     aclk, // clock
   input	     aresetn, // This active-low reset
   //write address channel
   input wire	     awvalid, // AXI4-Lite write address valid. This signal indicates that valid write address and control information are available.
   output reg	     awready, // AXI4-Lite write address ready. This signal indicates that the target is ready to accept an address and associated control signals.
   input wire [31:0] awaddr, // AXI4-Lite write address.
   //write data channel
   input wire [31:0] wdata, // AXI4-Lite write data.
   input wire	     wvalid, // AXI4-Lite write valid.
   output reg	     wready, // AXI4-Lite Write ready.
   //write response channel
   output [1:0]	     bresp, // AXI4-Lite write response.
   output reg	     bvalid, // AXI4-Lite write response valid.
   input wire	     bready, // AXI4-Lite response ready.
   //read address channel
   input wire [31:0] araddr, // AXI4-Lite read address. The read address gives the address of the first transfer in a read burst transaction.  
   input wire	     arvalid, // AXI4-Lite read address valid. This signal indicates that the channel is signaling valid read address and control information. 
   output reg	     arready, // AXI4-Lite response ready. This signal indicates that the slave is ready to accept an address and associated control signals.
   //read data and response channel
   input wire	     rready, 
   output [31:0]     rdata, // AXI4-Lite read data.
   output [1:0]	     rresp, // AXI4-Lite read response.
   output reg	     rvalid, // AXI4-Lite read valid. This signal indicates that the channel is signaling the required read data.

   output reg	     osd_ip_en,
   output	     osd_ip_rstn,
   output reg [31:0] coordinate,
   output reg [23:0] rgb_color,
   output reg [11:0] osd_num,
   output reg [15:0] h_res,
   output reg [15:0] v_res
   );
   
   wire		     mem_wr_valid;
   wire [31:0]	     mem_wr_addr;
   wire [31:0]	     mem_wr_data;
   wire		     mem_rd_req;   
   wire [31:0]	     mem_rd_data;
   wire		     mem_rd_data_valid;
   wire [31:0] 	     mem_rd_addr;
   wire		     w_aresetn;
   wire [1:0]	     w_ctrl_reg;   
   
   assign w_aresetn = aresetn && (~osd_ip_rstn);   
   assign w_ctrl_reg[0] = osd_ip_en;
   assign w_ctrl_reg[1] = osd_ip_rstn;
   
   axi4lite_adapter_osd axi4lite_adapter_osd (.*);
   write_reg_osd write_reg_osd (.*, .aresetn(w_aresetn));
   read_reg_osd read_reg_osd (.*, .ctrl_reg(w_ctrl_reg)); 
   
endmodule // axi4lite_if_osd


module axi4lite_adapter_osd  
  (
   // Clock and Reset interface----------------------------------------------------
   input wire 	     aclk, // clock
   input wire 	     aresetn, // This active-low reset
   //write address channel
   input wire 	     awvalid, // AXI4-Lite write address valid. This signal indicates that valid write address and control information are available.
   output reg 	     awready, // AXI4-Lite write address ready. This signal indicates that the target is ready to accept an address and associated control signals.
   input wire [31:0] awaddr, // AXI4-Lite write address.
   //write data channel
   input wire [31:0] wdata, // AXI4-Lite write data.
   input wire 	     wvalid, // AXI4-Lite write valid.
   output reg 	     wready, // AXI4-Lite Write ready.
  //write response channel
   output reg [1:0]  bresp, // AXI4-Lite write response.
   output reg 	     bvalid, // AXI4-Lite write response valid.
   input wire 	     bready, // AXI4-Lite response ready.
  //read address channel
   input wire [31:0] araddr, // AXI4-Lite read address. The read address gives the address of the first transfer in a read burst transaction.  
   input wire 	     arvalid, // AXI4-Lite read address valid. This signal indicates that the channel is signaling valid read address and control information. 
   output reg 	     arready, // AXI4-Lite response ready. This signal indicates that the slave is ready to accept an address and associated control signals.
  //read data and response channel
   input wire 	     rready, 
   output reg [31:0] rdata, // AXI4-Lite read data.
   output wire [1:0] rresp, // AXI4-Lite read response.
   output reg 	     rvalid, // AXI4-Lite read valid. This signal indicates that the channel is signaling the required read data.

   //Memory interface
   output reg	     mem_wr_valid,
   output reg [31:0] mem_wr_addr,
   output reg [31:0] mem_wr_data,
   output reg	     mem_rd_req,
   output [31:0]     mem_rd_addr,
   input	     mem_rd_data_valid,
   input [31:0]	     mem_rd_data
   );      

   reg [31:0]	     awaddr_reg;
   reg [31:0]	     araddr_reg;            
   wire		     raddr_phs_cmp;   

   //------------------------------------------------------------------------------------
   // AXI4 Lite Write Address channel
   //------------------------------------------------------------------------------------   

   ////////////////////////////////////////////////
   // AWREADY generation
   ////////////////////////////////////////////////
   always@(posedge aclk  or negedge aresetn)
     begin
	if(!aresetn)
     	  awready  <= 1'b1;
	else if (bvalid && bready)
          awready  <= 1'b1;
	else if(awvalid && awready)
          awready  <= 1'b0;
     end
   

   ////////////////////////////////////////////////
   // Storing the valid AWADDR 
   ////////////////////////////////////////////////
   always@(posedge aclk or negedge aresetn)
     begin
	if(!aresetn)
          awaddr_reg  <= 'd0;
	else if(awvalid && awready)
          awaddr_reg  <= awaddr;
     end


   //------------------------------------------------------------------------------------
   // AXI4 Lite Write Data channel
   //------------------------------------------------------------------------------------   

   ////////////////////////////////////////////////
   // Generating WREADY
   ////////////////////////////////////////////////
   always@(posedge aclk or negedge aresetn)
     begin
	if(!aresetn)
          wready  <= 1'd0;
	else if (wvalid && wready)
          wready  <= 1'd0;
	else if(awvalid && awready)
          wready  <= 1'd1;
     end


   ////////////////////////////////////////////////
   // Writing the memory with valid data 
   ////////////////////////////////////////////////   
   assign mem_wr_addr = awaddr_reg;
   assign mem_wr_data = wdata;
   assign mem_wr_valid = (wvalid == 1'b1 && wready == 1'b1);


   //------------------------------------------------------------------------------------
   // AXI4 Lite Write Response channel
   //------------------------------------------------------------------------------------   

   ////////////////////////////////////////////////
   // Generating BVALID
   ////////////////////////////////////////////////   
   always@(posedge aclk or negedge aresetn)
     begin
	if(!aresetn)
          bvalid  <= 1'd0;
	else if(bvalid == 1'b1 && bready == 1'b1)
          bvalid  <= 1'd0;
	else if(wvalid == 1'b1 && wready == 1'b1 )
          bvalid  <= 1'b1;
     end

   assign bresp = 'd0; //Giving OK response for all strobe and protection conditions
   
   //------------------------------------------------------------------------------------
   // AXI4 Lite Read Address channel
   //------------------------------------------------------------------------------------   

   ////////////////////////////////////////////////
   // Generating ARREADY
   ////////////////////////////////////////////////      
   always@(posedge aclk or negedge aresetn)
     begin
	if(!aresetn)
          arready  <= 1'd1;
	else if(rvalid && rready)
          arready  <= 1'd1;
	else if(raddr_phs_cmp)
          arready  <= 1'b0;
     end

   assign raddr_phs_cmp = (arvalid && arready);

   ////////////////////////////////////////////////
   // Generating memory read request
   ////////////////////////////////////////////////         
   always@(posedge aclk or negedge aresetn)
     if(!aresetn)
       mem_rd_req <= 'h0;   
     else
       mem_rd_req <= arvalid && arready;
   

   
   ////////////////////////////////////////////////
   // Registering valid read address
   ////////////////////////////////////////////////         
   always@(posedge aclk or negedge aresetn)
     if(!aresetn)
       araddr_reg <= 'd0;
     else if(arvalid && arready)
       araddr_reg <= araddr; 

   assign mem_rd_addr = araddr_reg; 
   
   //------------------------------------------------------------------------------------
   // AXI4 Lite Read Data channel
   //------------------------------------------------------------------------------------   

   ////////////////////////////////////////////////
   // RVALID generation
   ////////////////////////////////////////////////         
   always@(posedge aclk or negedge aresetn)
     if(!aresetn)
       rvalid <= 'b0;   
     else if(rvalid && rready) //hold rvalid high till rready is asserted
       rvalid <= 'b0;
     else if (mem_rd_data_valid)
       rvalid <= 1'b1;
   
   assign rdata = mem_rd_data; //connect the the mem data directly to axi4 lite bus
   assign rresp = 2'h0; //return read OK response
      
endmodule


//Address values of the registers
localparam ADDR_DECODER_WIDTH = 8;
//Read Only
localparam IP_VER = 32'h0;
//Read Write
localparam CTRL_REG = 32'h4;
//Read Only
localparam COORDINATE = 32'h8;
//Write Only
localparam RGB_COLOR = 32'hC;
//Read Only
localparam OSD_NUM = 32'h10;
//Write Only
localparam H_RES = 32'h14;
//Write Only
localparam V_RES = 32'h18;


// --*************************************************************************************************
// -- File Name                           : write_reg_osd.v
// -- Targeted device                     : Microsemi-SoC
// -- Author                              : India Solutions Team
// --
// -- COPYRIGHT 2021 BY MICROSEMI
// -- THE INFORMATION CONTAINED IN THIS DOCUMENT IS SUBJECT TO LICENSING RESTRICTIONS FROM MICROSEMI
// -- CORP. IF YOU ARE NOT IN POSSESSION OF WRITTEN AUTHORIZATION FROM MICROSEMI FOR USE OF THIS
// -- FILE, THEN THE FILE SHOULD BE IMMEDIATELY DESTROYED AND NO BACK-UP OF THE FILE SHOULD BE MADE.
// --
// --*************************************************************************************************


module write_reg_osd (
		      
		      // Clock and Reset interface----------------------------------------------------
		      input		aclk, // clock
		      input		aresetn, // This active-low reset

		      //Memory interface
		      input		mem_wr_valid,
		      input [31:0]	mem_wr_addr,
		      input [31:0]	mem_wr_data,

		      output reg	osd_ip_en,
		      output		osd_ip_rstn,
		      output reg [31:0]	coordinate,
		      output reg [23:0]	rgb_color,
		      output reg [11:0]	osd_num,
		      output reg [15:0]	h_res,
		      output reg [15:0]	v_res
		      )/* synthesis syn_preserve = 1 */; 
   

   reg [1:0] 	       ctrl_reg;
   assign osd_ip_en = ctrl_reg[0];
   assign osd_ip_rstn = ctrl_reg[1];
   
   ////////////////////////////////////////////////
   // Write registers
   ////////////////////////////////////////////////
   always@(posedge aclk  or negedge aresetn)
     if(!aresetn) begin
	ctrl_reg <= 'h1;
	coordinate <= 'h00100010;
	rgb_color <= 'hFFFFFF;
	h_res <= 'h780;
	v_res <= 'h430;
     end
     else if (mem_wr_valid) 
       case (mem_wr_addr[ADDR_DECODER_WIDTH-1:0])
	 
	 CTRL_REG:
	   ctrl_reg <= mem_wr_data[1:0];

	 COORDINATE:
	   coordinate <= mem_wr_data[31:0];

	 RGB_COLOR:
	   rgb_color <= mem_wr_data[23:0];

	 OSD_NUM:
	   osd_num <= mem_wr_data[11:0];

	 H_RES:
	   h_res <= mem_wr_data[15:0];
	 
	 V_RES:
	   v_res <= mem_wr_data[15:0];

	 default:
	   ctrl_reg[1:1] <= 'h0;	    
	 
       endcase // case (mem_wr_addr)
     else
       ctrl_reg[1:1] <= 'h0;

   
endmodule


// --*************************************************************************************************
// -- File Name                           : read_reg_osd.v
// -- Targeted device                     : Microsemi-SoC
// -- Author                              : India Solutions Team
// --
// -- COPYRIGHT 2021 BY MICROSEMI
// -- THE INFORMATION CONTAINED IN THIS DOCUMENT IS SUBJECT TO LICENSING RESTRICTIONS FROM MICROSEMI
// -- CORP. IF YOU ARE NOT IN POSSESSION OF WRITTEN AUTHORIZATION FROM MICROSEMI FOR USE OF THIS
// -- FILE, THEN THE FILE SHOULD BE IMMEDIATELY DESTROYED AND NO BACK-UP OF THE FILE SHOULD BE MADE.
// --
// --*************************************************************************************************

module read_reg_osd (
		     // Clock and Reset interface----------------------------------------------------
		     input	       aclk, // clock
		     input	       aresetn, //Reset initiated by processor
		     //Memory interface
		     input	       mem_rd_req,
		     input [31:0]      mem_rd_addr,
		     output reg [31:0] mem_rd_data,
		     output reg	       mem_rd_data_valid,		     
		     input [1:0]       ctrl_reg
	       )/* synthesis syn_noprune = 1 */;

      reg [1:0]		  r_mem_rd_req_dly;

   ////////////////////////////////////////////////
   // Delaying the mem read request and generating data valid
   ////////////////////////////////////////////////
   always@ (posedge aclk , negedge aresetn) 
     if (!aresetn) begin
	r_mem_rd_req_dly <= 'h0;
	mem_rd_data_valid <= 'h0;
     end
     else begin
	r_mem_rd_req_dly <= {r_mem_rd_req_dly[0], mem_rd_req};
	mem_rd_data_valid <= r_mem_rd_req_dly[1];
     end   
   
   ////////////////////////////////////////////////
   // Read registers based on input address
   ////////////////////////////////////////////////
   always@(posedge aclk, negedge aresetn)
     if (!aresetn)
       mem_rd_data <= 'h0;
     else if (r_mem_rd_req_dly[1])
       case (mem_rd_addr[ADDR_DECODER_WIDTH-1:0])
	 
	 IP_VER:
	   mem_rd_data <= 32'h01;

	 CTRL_REG:
	   mem_rd_data <= {30'h0, ctrl_reg};

	 default:
	   mem_rd_data <= 32'h0;

       endcase // case (mem_rd_addr)
      
endmodule



////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2022, Microchip Corporation
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of the <organization> nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL MICROCHIP CORPORATIONM BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
// APACHE LICENSE
// Copyright (c) 2022, Microchip Corporation 
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
////////////////////////////////////////////////////////////////////////////////
//compression ratio on screen display
module CR_OSD_top(
  // Input
  input         DATA_VALID_I,
  input         FRAME_END_I,
  input         RESETN_I,
  input         SYS_CLK_I,
  input         OSD_EN_I,
  input  [7:0]  r_i,
  input  [7:0]  g_i,
  input  [7:0]  b_i,
  input  [15:0] hres_i,
  input  [15:0] vres_i,
  input  [31:0] coordinate_i,
  input  [11:0] num_i,
  input  [23:0] text_color_rgb_i,
  // Output
  output reg    data_valid_o,
  output [7:0]  b_o,
  output [7:0]  g_o,
  output [7:0]  r_o
);

localparam G_OSD_LEN = 15'd400;//25 chars * 16 pixels per char
localparam G_VGAP = 15'd20;//16 pixels per char + 4
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   [19:0]  CH_ROM_0_dout;
wire   [15:0]  HV_COUNTER_0_H_COUNT_O;
wire           HV_COUNTER_0_LINE_END_O;
wire   [15:0]  HV_COUNTER_0_V_COUNT_O;
wire   [7:0]   NUM_ROM_0_dout;
wire   [9:0]   obj_generator_0_mem_addr_o;
wire           obj_generator_0_mem_rd_o;
wire           obj_generator_0_text_valid_o;
wire   [9:0]   obj_generator_num_0_mem_addr_o;
wire           obj_generator_num_0_mem_rd_o;
wire           obj_generator_num_0_text_valid_o;
wire           OR2_0_Y;
wire   [23:16] text_color_rgb_i_slice_0;
wire   [15:8]  text_color_rgb_i_slice_1;
wire   [7:0]   text_color_rgb_i_slice_2;

reg    [31:0]  coordinate_r;
reg    [31:0]  coordinate_r2;
always@(posedge SYS_CLK_I, negedge RESETN_I)
  if(!RESETN_I) begin
    coordinate_r  <= 32'h00040004;
    coordinate_r2 <= 32'h00040004;
    data_valid_o  <= 0;
  end
  else
  begin
    coordinate_r2 <= coordinate_r;
    data_valid_o  <= DATA_VALID_I;
    if ( coordinate_i[15:0] > vres_i - G_VGAP )
      coordinate_r[15:0] <= vres_i - G_VGAP;
    else
      coordinate_r[15:0] <= coordinate_i[15:0];
    if ( coordinate_i[31:16] > hres_i - G_OSD_LEN )
      coordinate_r[31:16] <= hres_i - G_OSD_LEN;
    else
      coordinate_r[31:16] <= coordinate_i[31:16];
  end

//--------------------------------------------------------------------
// Slices assignments
//--------------------------------------------------------------------
assign text_color_rgb_i_slice_0 = text_color_rgb_i[23:16];
assign text_color_rgb_i_slice_1 = text_color_rgb_i[15:8];
assign text_color_rgb_i_slice_2 = text_color_rgb_i[7:0];
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------CH_ROM
CH_ROM CH_ROM_0(
        // Inputs
        .clk  ( SYS_CLK_I ),
        .en   ( obj_generator_0_mem_rd_o ),
        .addr ( obj_generator_0_mem_addr_o ),
        // Outputs
        .dout ( CH_ROM_0_dout ) 
        );

//--------HV_COUNTER
HV_COUNTER HV_COUNTER_0(
        // Inputs
        .resetn_i      ( RESETN_I ),
        .sys_clk_i     ( SYS_CLK_I ),
        .DATA_ENABLE_I ( DATA_VALID_I ),
        .FRAME_END_I   ( FRAME_END_I ),
        // Outputs
        .LINE_END_O    ( HV_COUNTER_0_LINE_END_O ),
        .H_COUNT_O     ( HV_COUNTER_0_H_COUNT_O ),
        .V_COUNT_O     ( HV_COUNTER_0_V_COUNT_O ) 
        );

//--------NUM_ROM
NUM_ROM NUM_ROM_0(
        // Inputs
        .clk  ( SYS_CLK_I ),
        .en   ( obj_generator_num_0_mem_rd_o ),
        .addr ( obj_generator_num_0_mem_addr_o ),
        // Outputs
        .dout ( NUM_ROM_0_dout ) 
        );

//--------obj_generator
obj_generator obj_generator_0(
        // Inputs
        .resetn_i      ( RESETN_I ),
        .sys_clk_i    ( SYS_CLK_I ),
        .line_end_i   ( HV_COUNTER_0_LINE_END_O ),
        .h_counter_i  ( HV_COUNTER_0_H_COUNT_O ),
        .v_counter_i  ( HV_COUNTER_0_V_COUNT_O ),
        .ram_data_i   ( CH_ROM_0_dout ),
        .coordinate_i ( coordinate_r2 ),
        // Outputs
        .mem_rd_o     ( obj_generator_0_mem_rd_o ),
        .text_valid_o ( obj_generator_0_text_valid_o ),
        .mem_addr_o   ( obj_generator_0_mem_addr_o ) 
        );

//--------obj_generator_num
obj_generator_num obj_generator_num_0(
        // Inputs
        .resetn_i      ( RESETN_I ),
        .sys_clk_i    ( SYS_CLK_I ),
        .line_end_i   ( HV_COUNTER_0_LINE_END_O ),
        .h_counter_i  ( HV_COUNTER_0_H_COUNT_O ),
        .v_counter_i  ( HV_COUNTER_0_V_COUNT_O ),
        .num_i        ( num_i ),
        .ram_data_i   ( NUM_ROM_0_dout ),
        .coordinate_i ( coordinate_r2 ),
        // Outputs
        .mem_rd_o     ( obj_generator_num_0_mem_rd_o ),
        .text_valid_o ( obj_generator_num_0_text_valid_o ),
        .mem_addr_o   ( obj_generator_num_0_mem_addr_o ) 
        );

//--------OR2
OR2 OR2_0(
        // Inputs
        .A ( obj_generator_0_text_valid_o ),
        .B ( obj_generator_num_0_text_valid_o ),
        // Outputs
        .Y ( OR2_0_Y ) 
        );

//--------text_out
text_out text_out_0(
        // Inputs
        .resetn_i       ( RESETN_I ),
        .sys_clk_i      ( SYS_CLK_I ),
        .txt_vld_i      ( OR2_0_Y & OSD_EN_I),
        .r_i            ( r_i ),
        .g_i            ( g_i ),
        .b_i            ( b_i ),
        .text_color_r_i ( text_color_rgb_i_slice_0 ),
        .text_color_g_i ( text_color_rgb_i_slice_1 ),
        .text_color_b_i ( text_color_rgb_i_slice_2 ),
        // Outputs
        .r_o            ( r_o ),
        .g_o            ( g_o ),
        .b_o            ( b_o )
        );

endmodule // CR_OSD_top

//pixel,line counter
module HV_COUNTER (
  input         resetn_i     ,
  input         sys_clk_i    ,
  input         DATA_ENABLE_I,
  input         FRAME_END_I  ,
  output        LINE_END_O   ,
  output [15:0] H_COUNT_O    ,
  output [15:0] V_COUNT_O  
  );
/************************************************************************
    Register/Wire Declarations
*************************************************************************/
reg  [15:0] s_h_counter;
reg  [15:0] s_v_counter;
reg         s_data_en_dly;
wire        s_data_en_ne;
/************************************************************************
    Top level ouput port assignments
*************************************************************************/
assign H_COUNT_O  = s_h_counter;
assign V_COUNT_O  = s_v_counter;
assign LINE_END_O = s_data_en_ne;
/************************************************************************
	Internal assignments			 
*************************************************************************/
assign s_data_en_ne  = (~ DATA_ENABLE_I) & (s_data_en_dly);
/************************************************************************
    horizontal counter
*************************************************************************/  
always@(posedge sys_clk_i, negedge resetn_i)
  if (!resetn_i)
    s_h_counter    <= 0;
  else if (FRAME_END_I == 1 || DATA_ENABLE_I == 0)
    s_h_counter    <= 0;
  else
    s_h_counter    <= s_h_counter + 1;
/************************************************************************
    vertical  counter
*************************************************************************/  
always@(posedge sys_clk_i, negedge resetn_i)
  if (!resetn_i)
    s_v_counter    <= 0;
  else if (FRAME_END_I)
    s_v_counter    <= 0;
  else if (s_data_en_ne)
    s_v_counter    <= s_v_counter + 1;
/************************************************************************
    Delays the sgnals
*************************************************************************/  
always@(posedge sys_clk_i, negedge resetn_i)
  if (!resetn_i)
    s_data_en_dly    <= 0;
  else
    s_data_en_dly    <= DATA_ENABLE_I;    
endmodule  

//obj_generator for text
module obj_generator#(
  parameter g_NUM_OF_CHAR = 25,
  parameter g_ADDR_WIDTH  = 10)
(
  input                       resetn_i,
  input                       sys_clk_i,
  input                       line_end_i,
  input  [15:0]               h_counter_i, 
  input  [15:0]               v_counter_i,
  input  [19:0]               ram_data_i,
  input  [31:0]               coordinate_i,
  output                      mem_rd_o  ,
  output [g_ADDR_WIDTH-1 : 0] mem_addr_o,  
  output                      text_valid_o 
  
  );
/************************************************************************
    Register/Wire Declarations
*************************************************************************/
  reg  [g_ADDR_WIDTH-1 : 0] s_addr_offset;
  reg  [g_ADDR_WIDTH-1 : 0] s_addr_counter;
  reg  [4:0]                s_data_bus_width_counter ;
  wire        s_obj1_valid;
  reg         s_data_bit;
  wire [15:0] s_x_coordinate;
  wire [15:0] s_y_coordinate;
/************************************************************************
    Top level ouput port assignments
*************************************************************************/  
assign  mem_addr_o     = s_addr_counter;
assign  mem_rd_o       = 1'b1;
assign  text_valid_o   = s_data_bit & s_obj1_valid;
/************************************************************************
	Internal assignments			 
*************************************************************************/
assign  s_x_coordinate = coordinate_i[31:16];
assign  s_y_coordinate = coordinate_i[15:0];
assign  s_obj1_valid   = (h_counter_i >= s_x_coordinate &&
                          h_counter_i < (s_x_coordinate + (16*g_NUM_OF_CHAR)) &&
                          v_counter_i >= s_y_coordinate &&
                          v_counter_i < (s_y_coordinate + 16)) ? 1'b1 : 1'b0 ;
assign s_data_bit      = ram_data_i[s_data_bus_width_counter];  
/************************************************************************
    address offset
*************************************************************************/  
always@(posedge sys_clk_i, negedge resetn_i)
  if (!resetn_i)
    s_addr_offset    <= 0;
  else begin
    if (h_counter_i == s_x_coordinate && v_counter_i == s_y_coordinate) 
      s_addr_offset <= 0;
    else if (line_end_i == 1 && v_counter_i[0] == 1) 
      s_addr_offset <= s_addr_offset + 10;
  end    

/************************************************************************
    address counter
*************************************************************************/  
always@(posedge sys_clk_i, negedge resetn_i)
  if (!resetn_i)
    s_addr_counter    <= 0;
  else begin
    if (h_counter_i == s_x_coordinate && v_counter_i == s_y_coordinate)
      s_addr_counter <= 0;
    else if (h_counter_i == 0) 
      s_addr_counter <= s_addr_offset;
    else if (s_obj1_valid == 1 && s_data_bus_width_counter == 0 && h_counter_i[0] == 0) 
        s_addr_counter <= s_addr_counter + 1;
  end      
/************************************************************************
    address bus width counter
*************************************************************************/  
always@(posedge sys_clk_i, negedge resetn_i)
  if (!resetn_i)
    s_data_bus_width_counter    <= 19;
  else begin
    if (
        (h_counter_i == s_x_coordinate && v_counter_i == s_y_coordinate) ||
        (s_data_bus_width_counter == 0 && h_counter_i[0] == 1)) 
      s_data_bus_width_counter <= 19;
    else if (s_obj1_valid == 1 && s_data_bus_width_counter > 0 && h_counter_i[0] == 1)
      s_data_bus_width_counter <= s_data_bus_width_counter - 1;
  end      
endmodule

//obj_generator for numbers
module obj_generator_num#(
  parameter g_NUM_OF_CHAR = 3,
  parameter g_ADDR_WIDTH  = 10)
(
  input                       resetn_i     ,
  input                       sys_clk_i    ,  
  input                       line_end_i,
  input  [15:0]               h_counter_i, 
  input  [15:0]               v_counter_i, 
    
  //input number each four bits represent a digit
  input  [11:0]               num_i,
  input  [7:0]                ram_data_i,
  input  [31:0]               coordinate_i,
  output                      mem_rd_o  ,
  output [g_ADDR_WIDTH-1 : 0] mem_addr_o,  
  output                      text_valid_o 
  
  );
/************************************************************************
    Register/Wire Declarations
*************************************************************************/
  reg  [g_ADDR_WIDTH-1 : 0] s_addr_offset;
  reg  [g_ADDR_WIDTH-1 : 0] s_addr_counter;
  reg  [7:0]                s_num1_addr;
  reg  [7:0]                s_num2_addr;
  reg  [7:0]                s_num3_addr;
  reg  [4:0]                s_data_bus_width_counter ;
  wire                      s_obj1_valid;
  reg                       s_data_bit;
  wire [15:0]               s_x_coordinate;
  wire [15:0]               s_y_coordinate;
/************************************************************************
    Top level ouput port assignments
*************************************************************************/  
assign  mem_addr_o     = s_addr_counter;
assign  mem_rd_o       = 1'b1;
assign  text_valid_o   = s_data_bit & s_obj1_valid;
/************************************************************************
	Internal assignments			 
*************************************************************************/
assign  s_x_coordinate = coordinate_i[31:16]  + 288;//18 chars offset - 18*16;;
assign  s_y_coordinate = coordinate_i[15:0];
assign  s_obj1_valid   = (h_counter_i >= s_x_coordinate &&
                          h_counter_i < (s_x_coordinate + (16*g_NUM_OF_CHAR)) &&
                          v_counter_i >= s_y_coordinate &&
                          v_counter_i < (s_y_coordinate + 16)) ? 1'b1 : 1'b0 ;
assign s_data_bit      = ram_data_i[s_data_bus_width_counter];  
/************************************************************************
    address offset
*************************************************************************/  
always@(posedge sys_clk_i, negedge resetn_i)
  if (!resetn_i)
    s_addr_offset    <= 0;
  else begin
    if (h_counter_i == s_x_coordinate-3 && v_counter_i == s_y_coordinate) 
      s_addr_offset <= 0;
    else if (line_end_i == 1 && v_counter_i[0] == 1) 
      s_addr_offset <= s_addr_offset + 1;
  end    

/************************************************************************
    address counter
*************************************************************************/  
always@(posedge sys_clk_i, negedge resetn_i)
  if (!resetn_i)
    s_addr_counter    <= 0;
  else begin
    if (h_counter_i == s_x_coordinate-2)
      s_addr_counter <=  s_num1_addr + s_addr_offset;
    else if (h_counter_i == s_x_coordinate-2+16)  
      s_addr_counter <= s_num2_addr + s_addr_offset;
    else if (h_counter_i == s_x_coordinate-2+32)  
      s_addr_counter <= s_num3_addr + s_addr_offset;
  end      
/************************************************************************
    address bus width counter
*************************************************************************/  
always@(posedge sys_clk_i, negedge resetn_i)
  if (!resetn_i)
    s_data_bus_width_counter    <= 7;
  else begin
    if ((h_counter_i == s_x_coordinate && v_counter_i == s_y_coordinate) ||
        (s_data_bus_width_counter == 0 && h_counter_i[0] == 1)) 
      s_data_bus_width_counter <= 7;
    else if (s_obj1_valid == 1 && s_data_bus_width_counter > 0 && h_counter_i[0] == 1)
      s_data_bus_width_counter <= s_data_bus_width_counter - 1;
  end      
/************************************************************************
    digit address offset
*************************************************************************/  
always@(posedge sys_clk_i, negedge resetn_i)
  if (!resetn_i) begin
    s_num1_addr    <= 0;
    s_num2_addr    <= 0;
    s_num3_addr    <= 0;
  end
  else if (h_counter_i == 0 && v_counter_i == 0) begin
    s_num1_addr <= {num_i[11:8] , 3'b0}; //each digit takes 8 bytes
    s_num2_addr <= {num_i[7 :4]  , 3'b0};
    s_num3_addr <= {num_i[3 :0]  , 3'b0};
  end      
endmodule
  
// Characters ROM.v
module CH_ROM(clk,en,addr,dout);
input clk;
input en;
input [9:0] addr;
output reg [19:0] dout;

reg [19:0] mem [0:79] = '{ 20'h1f3e6,
                             20'h37c78,
                             20'h7e3e3,
                             20'he7f3e,
                             20'h41007,
                             20'h81c7f,
                             20'h7f3e0,
                             20'h0    ,
                             20'h0    ,
                             20'h0    ,
                             20'h20415,
                             20'h54244,
                             20'h40404,
                             20'h841  ,
                             20'h61004,
                             20'h42208,
                             20'h8410 ,
                             20'h0    ,
                             20'h0    ,
                             20'h0    ,
                             20'h20414,
                             20'h94244,
                             20'h40404,
                             20'h841  ,
                             20'h61004,
                             20'h44108,
                             20'h8410 ,
                             20'h0    ,
                             20'h0    ,
                             20'h0    ,
                             20'h40414,
                             20'h9424c,
                             20'h7c3c3,
                             20'hc0841,
                             20'h51004,
                             20'hc4108,
                             20'h8410 ,
                             20'h0    ,
                             20'h0    ,
                             20'h0    ,
                             20'h40414,
                             20'h17c70,
                             20'h40020,
                             20'h20841,
                             20'h49007,
                             20'h7f08 ,
                             20'h8410 ,
                             20'h0    ,
                             20'h0    ,
                             20'h0    ,
                             20'h60414,
                             20'h14048,
                             20'h40020,
                             20'h20841,
                             20'h45004,
                             20'h84108,
                             20'h8410 ,
                             20'h0    ,
                             20'h0    ,
                             20'h0    ,
                             20'h20414,
                             20'h14044,
                             20'h40020,
                             20'h20841,
                             20'h43004,
                             20'h44108,
                             20'h8410 ,
                             20'h0    ,
                             20'h0    ,
                             20'h0    ,
                             20'h1f3e4,
                             20'h14042,
                             20'h7e7c7,
                             20'hc7f3e,
                             20'h41004,
                             20'h24108,
                             20'h7f3e0,
                             20'h0    ,
                             20'h0    ,
                             20'h0};

always@(posedge clk)
begin
  if(en)
    dout <= mem[addr];
end
endmodule

// Numbers ROM.v
module NUM_ROM(clk,en,addr,dout);
input clk;
input en;
input [9:0] addr;
output reg [7:0] dout;

reg [7:0] mem [0:79] =   '{8'h3e,
                           8'h43,
                           8'h45,
                           8'h49,
                           8'h51,
                           8'h61,
                           8'h41,
                           8'h3e,
                           8'h08,
                           8'h18,
                           8'h28,
                           8'h48,
                           8'h08,
                           8'h08,
                           8'h08,
                           8'h7f,
                           8'h7c,
                           8'h02,
                           8'h01,
                           8'h01,
                           8'h3e,
                           8'h40,
                           8'h40,
                           8'h7f,
                           8'h7c,
                           8'h02,
                           8'h01,
                           8'h01,
                           8'h7e,
                           8'h01,
                           8'h01,
                           8'h7e,
                           8'h06,
                           8'h0e,
                           8'h1a,
                           8'h22,
                           8'h7f,
                           8'h02,
                           8'h02,
                           8'h02,
                           8'h7e,
                           8'h40,
                           8'h40,
                           8'h7e,
                           8'h01,
                           8'h01,
                           8'h01,
                           8'h7e,
                           8'h1e,
                           8'h20,
                           8'h40,
                           8'h7e,
                           8'h41,
                           8'h41,
                           8'h22,
                           8'h1c,
                           8'h7f,
                           8'h01,
                           8'h02,
                           8'h04,
                           8'h08,
                           8'h10,
                           8'h20,
                           8'h40,
                           8'h3e,
                           8'h41,
                           8'h41,
                           8'h3e,
                           8'h41,
                           8'h41,
                           8'h41,
                           8'h3e,
                           8'h3f,
                           8'h41,
                           8'h41,
                           8'h41,
                           8'h3f,
                           8'h01,
                           8'h01,
                           8'h01};
                           
always@(posedge clk)
begin
  if(en)
    dout <= mem[addr];
end
endmodule

// text_out.v
module text_out (
  input            resetn_i,
  input            sys_clk_i,
  input            txt_vld_i,
  input      [7:0] r_i,
  input      [7:0] g_i,
  input      [7:0] b_i,
  input      [7:0] text_color_r_i,
  input      [7:0] text_color_g_i,
  input      [7:0] text_color_b_i,
  output reg [7:0] r_o,
  output reg [7:0] g_o,
  output reg [7:0] b_o
  );
  
/************************************************************************
    data output
*************************************************************************/
always@(posedge sys_clk_i, negedge resetn_i)
  if (!resetn_i)
  begin
    r_o <= 0;
    g_o <= 0;
    b_o <= 0;
  end
  else
  begin
    r_o <= txt_vld_i ? text_color_r_i : r_i;
    g_o <= txt_vld_i ? text_color_g_i : g_i;
    b_o <= txt_vld_i ? text_color_b_i : b_i;
  end
endmodule
