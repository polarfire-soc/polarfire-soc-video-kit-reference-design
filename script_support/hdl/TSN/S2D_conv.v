///////////////////////////////////////////////////////////////////////////////////////////////////
// Company: <Name>
//
// File: S2D_conv.v
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

module STR_NAT_CONV( 
  input CLK,
  input RSTN,
  //STREAM SIGNALS
  output STR_RDY_IN,
  input [31:0] STR_TDATA_IN,
  input [3:0]  STR_TKEEP_IN,
  input        STR_TLAST_IN,
  input [0:0]  STR_TUSER_IN,
  input        STR_TVALID_IN,
  //Packt SIGNALS
  input Pkt_RDY_OUT ,
 
  output [31:0] Pkt_DATA_OUT,
  output        Pkt_SOF_OUT,
  output        Pkt_EOF_OUT,
  output [1:0]  BC_OUT
);
 
 reg [1:0] bc_out_temp;
reg [31:0] data_out;
 
logic s1_sof;
logic s1_eof;
logic s1_ps;
logic s1_ready;
localparam S0 = 1'b0;
localparam S1 = 1'b1;
 
always @(posedge CLK or negedge RSTN)
  if(~RSTN)
    data_out <= 32'd0;
  else begin
    data_out <= STR_TDATA_IN;
  end
 
/*always @(posedge CLK or negedge RSTN)
  if(~RSTN)
    s1_ready <= '0;
  else begin
    if( STR_TVALID_IN )
      s1_ready <= '1;
    else
      s1_ready <= '0;
  end */
always @(posedge CLK or negedge RSTN)
  if(~RSTN)begin
    s1_sof <= '0;  
    s1_ps <= S0;
    s1_eof <= '0;
    s1_ready <= '0;
  end else begin
    case(s1_ps)
      S0:begin
        s1_sof<= '0;
        s1_eof <= '0;
        s1_ready <= '0;
        if(STR_TVALID_IN)begin
          s1_sof <= 1'b1;
          s1_ps <= S1;
          s1_ready <= '1;
        end
      end
      S1:begin
        s1_sof <= 1'b0;
        s1_eof <= 1'b0; 
        s1_ready <= '1;
        if(STR_TVALID_IN & STR_TLAST_IN)begin
          s1_eof <= 1'b1;
          s1_ps <= S0;
          s1_ready <= '1;
        end 
      end
 
      
    endcase
  end 
  
 always @(posedge CLK or negedge RSTN)
  if(~RSTN)
    bc_out_temp <= 32'd0;
  else begin
    bc_out_temp <= (STR_TKEEP_IN == 4'b1111)? 2'd0 :((STR_TKEEP_IN== 4'b0111)?2'd1 :((STR_TKEEP_IN == 4'b0011)?2'd2 : 2'd3));
  end 
  

assign Pkt_SOF_OUT = s1_sof;
assign Pkt_EOF_OUT = s1_eof;
assign Pkt_DATA_OUT = data_out;
//assign BC_OUT = (STR_TKEEP_IN == 4'b1111)? 2'd0 :((STR_TKEEP_IN== 4'b0111)?2'd1 :((STR_TKEEP_IN == 4'b0011)?2'd2 : 2'd3));
assign BC_OUT = bc_out_temp;
assign STR_RDY_IN = s1_ready ;
 
endmodule