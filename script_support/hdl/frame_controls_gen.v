// frame_controls_gen.v
/*************************************************************************************************************************************
--
-- File Name    : frame_controls_gen.v 
-- Description  : generates frame control signals

-- COPYRIGHT 2022 BY MICROSEMI 
-- THE INFORMATION CONTAINED IN THIS DOCUMENT IS SUBJECT TO LICENSING RESTRICTIONS 
-- FROM MICROSEMI CORP.  IF YOU ARE NOT IN POSSESSION OF WRITTEN AUTHORIZATION FROM 
-- MICROSEMI FOR USE OF THIS FILE, THEN THE FILE SHOULD BE IMMEDIATELY DESTROYED AND 
-- NO BACK-UP OF THE FILE SHOULD BE MADE. 
--
--*************************************************************************************************************************************/
`timescale 1ns/1ps
module frame_controls_gen
  (
   input                sys_clk_i,
   input                resetn_i,
   input                encoder_en_i, //from MSS GPIO
   input                frame_start_i,
   input      [15:0]    hres_i,
   input      [15:0]    vres_i,
   input                data_valid_i,
   input      [7:0]     data_r_i,
   input      [7:0]     data_g_i,
   input      [7:0]     data_b_i,   
   output reg           data_valid_r1_o, //registering for scaler to RBG2YCB timing
   output reg [7:0]     data_r_r1_o, 
   output reg [7:0]     data_g_r1_o,
   output reg [7:0]     data_b_r1_o,
   output               frame_start_r1_o, //to reset scaler IP
   output reg [15:0]    h_scale_factor_o,
   output reg [15:0]    v_scale_factor_o,
   output reg           encoder_en_o,
   output reg           frame_start_encoder_o,
   output               eof_encoder_o
 ); 

/************************************************************************
    Local parameters
*************************************************************************/

/************************************************************************
    Register/Wire Declarations
*************************************************************************/
reg [15:0]  hres_eof;
reg [15:0]  vres_eof;
reg         res_change;
reg [19:0]  frame_start_sr;
wire        frame_start_re;
/************************************************************************
	Module Instantiations
*************************************************************************/

/************************************************************************
    Top level output port assignments
    delay1  eof_encoder_o
    delay4  encoder_en_o
    delay18 frame_start_encoder_o
*************************************************************************/
assign frame_start_r1_o  = frame_start_sr[0];
assign eof_encoder_o     = (frame_start_sr[0] | frame_start_sr[1]) & encoder_en_o;
assign frame_start_encoder_o = frame_start_sr[19] | frame_start_sr[18];
/************************************************************************
	Internal assignments			 
*************************************************************************/
assign frame_start_re = frame_start_sr[0] & (~frame_start_i);     
/************************************************************************
    latch encoder en on frame start
*************************************************************************/  
always@(posedge sys_clk_i, negedge resetn_i)
  if (~resetn_i)
    encoder_en_o  <= 0;
  else if (res_change && frame_start_sr[2]) //to regenerate sps&pps
    encoder_en_o  <= 0;
  else if ( frame_start_sr[3] & (~frame_start_sr[4]) )
    encoder_en_o  <= encoder_en_i;
/************************************************************************
    H scale factors 1920x1072 , 1280x720, 960x544,  640x480 and 432x240
*************************************************************************/  
always@(posedge sys_clk_i, negedge resetn_i)
  if (!resetn_i)  
    h_scale_factor_o    <= 1535;
  else if (frame_start_i)
    if (hres_i == 1920)  
      h_scale_factor_o  <=  1023;
    else if (hres_i == 1280)   
      h_scale_factor_o  <=  1535;
    else if (hres_i == 960)  
      h_scale_factor_o  <=  2046; 
    else if (hres_i == 640)
      h_scale_factor_o  <=  3070;
    else //432
      h_scale_factor_o  <=  4548;      
         
/************************************************************************
    V scale factors
*************************************************************************/  
always@(posedge sys_clk_i, negedge resetn_i)
  if (!resetn_i)
    v_scale_factor_o    <= 1534;
  else if (frame_start_i)
    if (vres_i == 1072)   
      v_scale_factor_o  <= 1030; 
    else if (vres_i == 720)   
      v_scale_factor_o  <= 1534;
    else if (vres_i == 544)   
      v_scale_factor_o  <= 2031;
    else if (vres_i == 480)
      v_scale_factor_o  <= 2031;
    else //240
      v_scale_factor_o  <= 4603;
      
/************************************************************************
    Process to register on frame start
*************************************************************************/  
always@(posedge sys_clk_i, negedge resetn_i)
  if (!resetn_i)  
  begin
    hres_eof   <= 1280;
    vres_eof   <= 720;
    res_change <= 1'b0;
  end
  else if (frame_start_i)
  begin
    hres_eof   <= hres_i;
    vres_eof   <= vres_i;
    if ((hres_eof != hres_i) || (vres_eof != vres_i))
      res_change  <= 1'b1;
    else
      res_change  <= 1'b0;  
  end
/************************************************************************
    Process to register signals
*************************************************************************/  
always@(posedge sys_clk_i, negedge resetn_i)
  if (!resetn_i)  
  begin
    frame_start_sr  <= 0;   
    data_valid_r1_o <= 0;
    data_r_r1_o     <= 0;
    data_g_r1_o     <= 0;
    data_b_r1_o     <= 0;
  end   
  else
  begin
    frame_start_sr  <= {frame_start_sr[18:0],frame_start_i};
    data_valid_r1_o <= data_valid_i;
    data_r_r1_o     <= data_r_i;
    data_g_r1_o     <= data_g_i;
    data_b_r1_o     <= data_b_i;
  end

endmodule