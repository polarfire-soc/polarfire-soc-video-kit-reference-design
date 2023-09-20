// --*************************************************************************************************
// -- File Name                           : axi4lite_adapter_mipi.v
// -- Targeted device                     : Microsemi-SoC
// -- Author                              : India Solutions Team
// --
// -- COPYRIGHT 2021 BY MICROSEMI
// -- THE INFORMATION CONTAINED IN THIS DOCUMENT IS SUBJECT TO LICENSING RESTRICTIONS FROM MICROSEMI
// -- CORP. IF YOU ARE NOT IN POSSESSION OF WRITTEN AUTHORIZATION FROM MICROSEMI FOR USE OF THIS
// -- FILE, THEN THE FILE SHOULD BE IMMEDIATELY DESTROYED AND NO BACK-UP OF THE FILE SHOULD BE MADE.
// --
// --*************************************************************************************************

module axi4lite_adapter_mipi  
  (
   // Clock and Reset interface----------------------------------------------------
   input wire 	     aclk, // clock
   input wire 	     aresetn, // This active-low reset
   //write address channel
   input wire 	     awvalid, // AXI4-Lite write address valid. This signal indicates that valid write address and control information are available.
   output reg 	     awready, // AXI4-Lite write address ready. This signal indicates that the target is ready to accept an address and associated control signals.
   input wire [31:0] awaddr, // AXI4-Lite write address.
   input [2:0] 	     awprot, //AXI4-Lite write protection attribute
   //write data channel
   input wire [31:0] wdata, // AXI4-Lite write data.
   input wire [3:0]  wstrb,
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
   input wire [2:0]  arprot, //AXI4-Lite read protection
  //read data and response channel
   input wire 	     rready, 
   output reg [31:0] rdata, // AXI4-Lite read data.
   output wire [1:0] rresp, // AXI4-Lite read response.
   output reg 	     rvalid, // AXI4-Lite read valid. This signal indicates that the channel is signaling the required read data.
   //Memory interface
   output reg 	     mem_wr_valid,
   output reg [31:0] mem_wr_addr,
   output reg [31:0] mem_wr_data,
   output [31:0]     mem_rd_addr,
   input [31:0]	     mem_rd_data
   );      

   reg [31:0] 	     awaddr_reg;
   reg [31:0] 	     araddr_reg;            
   wire 	     raddr_phs_cmp;   

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
     else if(arvalid && arready) 
       rvalid <= 'b1;
     else if(rvalid && rready) //hold rvalid high till rready is asserted
       rvalid <= 'b0;   

   assign rdata = mem_rd_data; //connect the the mem data directly to axi4 lite bus
   assign rresp = 2'h0; //return read OK response
      
endmodule
