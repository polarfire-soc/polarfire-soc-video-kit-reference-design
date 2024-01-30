//Address values of the registers
localparam ADDR_DECODER_WIDTH = 8;

//Read Only
localparam IP_VER = 32'h0;
localparam IP_VER_WIDTH = 24;

//Read Write
localparam CTRL_REG = 32'h4;
localparam CTRL_REG_WIDTH = 2;

//Read Only
localparam COORDINATE = 32'h8;
localparam COORDINATE_WIDTH = 32;

//Write Only
localparam RGB_COLOR = 32'hC;
localparam RGB_COLOR_WIDTH = 24;

//Read Only
localparam OSD_NUM = 32'h10;
localparam OSD_NUM_WIDTH = 12;

//Write Only
localparam H_RES = 32'h14;
localparam H_RES_WIDTH = 16;

//Write Only
localparam V_RES = 32'h18;
localparam V_RES_WIDTH = 16;
