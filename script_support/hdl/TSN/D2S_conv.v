///////////////////////////////////////////////////////////////////////////////////////////////////
// Company: <Name>
//
// File: D2S_conv.v
// File history:
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//
// Description: 
//
// <Description here>
//
// Targeted device: <Family::PolarFireSoC> <Die::MPFS250TS> <Package::FCVG784>
// Author: <Name>
//
/////////////////////////////////////////////////////////////////////////////////////////////////// 

//`timescale <time_units> / <precision>

module NAT_STR_CONV1( 
  input CLK,
  input RSTN,
  
  //STREAM SIGNALS
  input STR_RDY,
  
  output [31:0] STR_TDATA,
  output [3:0]  STR_TKEEP,
  output        STRS_TLAST,
  output [0:0]  STR_TUSER,
  output        STR_TVALID,
 
  //Packt SIGNALS
  output Pkt_RDY ,

  input [31:0] Pkt_DATA,
  input        Pkt_SOF,
  input        Pkt_EOF,
  input [1:0]  BC
);

reg valid_out; 



    
always @(posedge CLK or negedge RSTN ) begin
    if(~RSTN)
        valid_out <= 1'b0;  
    else if (Pkt_EOF == 1) 
        valid_out <=1'b0;
    else if (Pkt_SOF == 1)
        valid_out <= 1'b1;    
end

     
assign STR_TVALID = (valid_out|Pkt_SOF) ;
assign STR_TDATA = Pkt_DATA;
assign STR_TUSER = '0;
assign STR_TKEEP = (BC == 2'd0)? 4'b1111 :((BC== 2'd1)?4'b0111 :(BC == 2'd2)?4'b0011 : 4'b0001);
assign STRS_TLAST = Pkt_EOF  ;
assign Pkt_RDY = STR_RDY ;
 
endmodule
