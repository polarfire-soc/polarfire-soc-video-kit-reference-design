///////////////////////////////////////////////////////////////////////////////////////////////////
// Company: <Name>
//
// File: SSDetect.v
// File history:
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//
// Description: 
//
// <Description here>
//
// Targeted device: <Family::PolarFire> <Die::MPF300TS> <Package::FCG1152>
// Author: <Name>
//
/////////////////////////////////////////////////////////////////////////////////////////////////// 

`timescale 1ns / 1ps 

module SSDetect( rst_b, rck, rx_data, stream_start );
input           rst_b;
input           rck;
input [9:0] rx_data;  // from RX_P
output stream_start;

function is_match (input [6:0] x, input [6:0] y);
begin
   is_match = (x == y) | (x == ~y);
end
endfunction

reg [1:0] rx_start;

assign stream_start = rx_start[0];  // CDR starts after RX data detects two consecutive non-static words

always @(posedge rck or negedge rst_b) begin  // SAR 101393, use negedge clock
   if (!rst_b) begin
      rx_start <= 2'd0;
   end
   else if (!rx_start[0]) begin  // two consecutive non-static words
      rx_start <= is_match(rx_data[6:0], 0) ? 2'd0 : {1'b1, rx_start[1]};
   end
end


endmodule

