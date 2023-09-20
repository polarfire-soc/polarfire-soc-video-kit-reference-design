//Address values of the registers
//Address values of the registers
localparam ADDR_DECODER_WIDTH = 8;
localparam INTERRUPT_REG_WIDTH = 8;


//Read Only
localparam IP_VER = 32'h0;
localparam IP_VER_WIDTH = 3;

//Read Only
localparam LANE_CONFIG = 32'h8;
localparam LANE_CONFIG_WIDTH = 8;

//Read Only
localparam DATA_WIDTH = 32'hC;
localparam DATA_WIDTH_WIDTH = 8;

//Read Only
localparam NO_OF_PIXELS = 32'h10;
localparam NO_OF_PIXELS_WIDTH = 3;

//Read Only
localparam NO_OF_VC = 32'h14;
localparam NO_OF_VC_WIDTH = 8;

//Read Only
localparam INPUT_DATA_INVERT = 32'h18;
localparam INPUT_DATA_INVERT_WIDTH = 1;

//Read Only
localparam FIFO_SIZE = 32'h1C;
localparam FIFO_SIZE_WIDTH = 4;

//Read Only
localparam FRAME_RESOLUTION = 32'h20;
localparam FRAME_RESOLUTION_WIDTH = 32;

//Read Only
localparam MIPI_CLK_STATUS = 32'h30;
localparam MIPI_CLK_STATUS_WIDTH = 1;

//Read Only
localparam MIPI_CAM_LANES_CONFIG = 32'h60;
localparam MIPI_CAM_LANES_CONFIG_WIDTH = 4;

//Read Only
localparam MIPI_CAM_DATA_TYPE = 32'h5C;
localparam MIPI_CAM_DATA_TYPE_WIDTH = 8;

//Read Only
localparam WORD_COUNT = 32'h58;
localparam WORD_COUNT_WIDTH = 16;







//Read Write
localparam CTRL_REG = 32'h4;
localparam CTRL_REG_WIDTH = 2;

//Read Write 
localparam GLBL_INT_EN = 32'h24;
localparam GLBL_INT_EN_WIDTH = 1;

//Read Write 
localparam INT_STATUS = 32'h28;
localparam INT_STATUS_WIDTH = 8;

//Read Write 
localparam INT_EN = 32'h2C;
localparam INT_EN_WIDTH = 8;













// //Read Only
// localparam MIPI_DATA_LANE_STATUS_0 = 32'h34;
// localparam MIPI_DATA_LANE_STATUS_0_WIDTH = 4;

// //Read Only
// localparam MIPI_DATA_LANE_STATUS_1 = 32'h38;
// localparam MIPI_DATA_LANE_STATUS_1_WIDTH = 4;

// //Read Only
// localparam MIPI_DATA_LANE_STATUS_2 = 32'h3C;
// localparam MIPI_DATA_LANE_STATUS_2_WIDTH = 4;

// //Read Only
// localparam MIPI_DATA_LANE_STATUS_3 = 32'h40;
// localparam MIPI_DATA_LANE_STATUS_3_WIDTH = 4;

// //Read Only
// localparam MIPI_DATA_LANE_STATUS_4 = 32'h44;
// localparam MIPI_DATA_LANE_STATUS_4_WIDTH = 4;

// //Read Only
// localparam MIPI_DATA_LANE_STATUS_5 = 32'h48;
// localparam MIPI_DATA_LANE_STATUS_5_WIDTH = 4;

// //Read Only
// localparam MIPI_DATA_LANE_STATUS_6 = 32'h4C;
// localparam MIPI_DATA_LANE_STATUS_6_WIDTH = 4;

// //Read Only
// localparam MIPI_DATA_LANE_STATUS_7 = 32'h50;
// localparam MIPI_DATA_LANE_STATUS_7_WIDTH = 4;

// //Write Only
// localparam MIPI_DATA_LANE_STATUS_CLR = 32'h54;
// localparam MIPI_DATA_LANE_STATUS_CLR_WIDTH = 8;
