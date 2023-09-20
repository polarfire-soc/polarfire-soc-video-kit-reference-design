//Address values of the registers
localparam ADDR_DECODER_WIDTH = 8;
localparam INTERRUPT_REG_WIDTH = 5;

//Read Only
localparam IP_VER = 32'h0;
localparam IP_VER_WIDTH = 3;

//Read-Write
localparam CTRL_REG = 32'h4;
localparam CTRL_REG_WIDTH = 3;

//Read-Write
localparam GLBL_INT_EN = 32'h8;
localparam GLBL_INT_EN_WIDTH = 1;

//Read-Only
localparam INTERRUPT_STATUS = 32'hc;
localparam INTERRUPT_STATUS_WIDTH = 5;

//Read-Write
localparam INTERRUPT_EN = 32'h10;
localparam INTERRUPT_EN_WIDTH = 5;

//Read-Only
localparam FRAME_RESLN = 32'h14;
localparam FRAME_RESLN_WIDTH = 32;

//Write-Only
localparam LINE_GAP = 32'h18;
localparam LINE_GAP_WIDTH = 16;

//Write-Only
localparam BUFF_ADDR_FIFO = 32'h1C;
localparam BUFF_ADDR_FIFO_WIDTH = 32;

//Read-Only
localparam BUFF_ADDR_FIFO_RCOUNT = 32'h20;
localparam BUFF_ADDR_FIFO_RCOUNT_WIDTH = 5;

//Read-Only
localparam FRAME_SIZE_FIFO = 32'h24;
localparam FRAME_SIZE_FIFO_WIDTH = 32;

//Read-Only
localparam FRAME_SIZE_FIFO_WCOUNT = 32'h28;
localparam FRAME_SIZE_FIFO_WCOUNT_WIDTH = 5;


//Read-Only
localparam FRAME_COUNTER = 32'h2C;
localparam FRAME_COUNTER_WIDTH = 11;

//Read-Only
localparam INPUT_FRAME_COUNTER = 32'h30;
localparam INPUT_FRAME_COUNTER_WIDTH = 11;
