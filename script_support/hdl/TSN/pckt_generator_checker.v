//-------------------------------------------------------------------
//                                                                 
//  Microsemi Corporation Proprietary and Confidential
//  Copyright 2017 Microsemi Corporation. All rights reserved.
//                                                                  
//  ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN 
//  ACCORDANCE WITH THE MICROSEMI LICENSE AGREEMENT AND MUST BE APPROVED 
//  IN ADVANCE IN WRITING.
//
//-------------------------------------------------------------------
// Title       : <pckt_generator_checker.v>
// Created     : <December - 2016>
// Description : Ethernet Frames are transmitted onto the 10GMAC and 
//               loopback frames are captured 
// Revision     : <1.0> 
// Hierarchy   : pckt_generator_checker
//
// Target device: <Family:PolarFire> <Die:MPF300T> <Pkg:FCG1152>
//-------------------------------------------------------------------
 
 
module pckt_generator_checker(
 
 
//system clock
input wire SYSCLK_IN, //system clock
 
 
//system reset
input wire SYSRST_N_IN,
 
 
//APB slve inputs
input wire PCLK_IN, //pclk
input wire PRESET_N_IN, //APB Reset
input wire PWRITE_IN,  //APB Write Enable  
input wire PENABLE_IN, //APB Enable
input wire PSEL_IN,   //APB Select
input wire [31:0] PADDR_IN, //APB Address
input wire [31:0] PWDATA_IN, //APB write Data
 
 
//Outputs
output reg [31:0] PRDATA_OUT, //APB read Data
output wire  PREADY_OUT, //APB Ready
 
 
input wire INTERRUPT_IN, //APB Interrupt
 
 
// inputs 
input wire  PKT_TX_FIFO_READY_IN, //MAC TX FIFO READY In
input wire  PKT_RX_VAL_IN, //MAC RX ENABLE
input wire  PKT_RX_SOP_IN, //RX Start of packet
input wire [1:0] PKT_RX_MOD_IN, //Rx Packet Byte count
input wire  PKT_RX_ERR_IN, //Rx Error
input wire  PKT_RX_EOP_IN, //Rx End of Packet 
input wire [31:0] PKT_RX_DATA_IN, //Rx Data
input wire [3:0] ERR_TYPE_IN, //Error Type
input wire [23:0] RX_STAT_IN, //Rx statistics
input wire RX_STAT_VLD_IN, //Rx stats Enable
input wire pmac_full,
 
// OUTPUTS
output reg   PKT_TX_VAL_OUT, //MAC TX Enable  
output reg   PKT_TX_SOP_OUT, //TX Start of packet
output reg [1:0] PKT_TX_MOD_OUT, //TX Byte count
output    PKT_TX_EOP_OUT, //TX End of Packet
output reg [31:0] PKT_TX_DATA_OUT, //TX Data
output reg   PKT_RX_READY_OUT, //RX Ready
output reg [10:0] new_pmacpkt_len,
output reg new_pmacpkt_en,
output reg quit,
output reg soft_rst_out,
output reg sel_out
  );
 
 
//paameter declaration for the states of the packet
//Generator state machine 
parameter [3:0] IDLE_TX = 4'b0000; //0x00
parameter [3:0] SOP_TX = 4'b0001;  //0x01
parameter [3:0] LEN_TX = 4'b0010;  //0x02
parameter [3:0] DATA_TX = 4'b0011; //0x03
parameter [3:0] EOP_TX	= 4'b0100; //0x04
parameter [3:0] WAIT_TX = 4'b0101; //0x05
parameter [3:0] DA_SA =4'b0110;    //0x06
parameter [3:0] SA =4'b0111;       //0x07
parameter [3:0] VLAN_TAG=4'b1000;  //0x08
parameter [3:0] WAIT_TX1 =4'b1001; 
parameter [3:0] WAIT_TX2 =4'b1010;
//Parameter declaration for the states of
//Packet checker state machine
parameter [3:0] IDLE_RCV = 4'b0000;
//parameter declaration for the states of 
//APB Read/write Logic
parameter ADDR_START 		 = 8'h00;
parameter ADDR_STOP 		 = 8'h04;
parameter ADDR_DONE 		 = 8'h08;
parameter ADDR_NUMPKTS 	     = 8'h0C;
parameter ADDR_PKTLENGTH 	 = 8'h10;
parameter ADDR_MACSA0 		 = 8'h14;
parameter ADDR_MACSA1 		 = 8'h18;
parameter ADDR_MACDA0 		 = 8'h1C;
parameter ADDR_MACDA1 		 = 8'h20;
parameter ADDR_IDLE_CNT 	 = 8'h24;
parameter ADDR_TXPKTCNT_MSB  = 8'h28;
parameter ADDR_TXPKTCNT_LSB  = 8'h2C;
parameter ADDR_RANDOMLENGTH  = 8'h30;
parameter ADDR_RNDSEED0 	 = 8'h38;
 parameter ADDR_PKTSENT       = 8'h4C;
 parameter ADDR_VLAN_WORD     = 8'h78;
 
parameter ADDR_MON_CTRL 	 = 8'h50;
parameter ADDR_GOOD_PACKETS_MSB  = 8'h54;
parameter ADDR_GOOD_PACKETS_LSB  = 8'h58;
parameter ADDR_ERROR_PACKETS_MSB = 8'h5C;
parameter ADDR_ERROR_PACKETS_LSB = 8'h60;
parameter ADDR_RCV_BYTE_CNT_MSB = 8'h64;
parameter ADDR_RCV_BYTE_CNT_LSB = 8'h68;
 
 
parameter PTP_PKT =8'h6C;
parameter VLAN_PKT = 8'h70;
parameter ETH_PKT = 8'h74;
parameter LOOPBACK =8'h7C;
parameter ITERATION =8'h80;
parameter SOFT_RST =8'h84;    //soft reset for pkt generator
parameter SOFT_RST_OUT =8'h88;  // soft reset for video pipeline
parameter SELECT_LINE =8'h8c    ;    // select line input MUX selector 
 
 
///Internal signal Declarations
reg [10:0] pckt_length_reg;
wire [10:0] pckt_length_tx;
reg [31:0] no_of_Packets_reg;
reg ptp_gen;
reg [15:0] ETH_TYPE;
reg [2:0] PCP;
reg DEI;                                   
reg [11:0] VID;
reg vlan_gen;
reg start;
reg [2:0]start_q;
wire start_p;
reg stop;
reg [1:0]stop_q;
reg op_done;
reg [1:0] op_done_q;
reg clear_op_done;
reg [2:0] clear_op_done_q;
wire clear_op_done_p;
reg clear_mon_counters;
reg [2:0] clear_mon_counters_q;
wire mon_init;
reg loopback;
reg soft_rst ;

 
wire [2:0] byte_en;
reg [3:0] pckt_gen_fsm_state;
reg [3:0] pckt_recv_fsm_state;
reg [63:0] pckt_count;
reg [47:0] source_address;
reg [47:0] destination_address;
reg [11:0] count;
reg [63:0] tx_byte_count;
reg [15:0] wait_count;
reg [31:0] data_pattern;
wire    [7:0] DA5,DA4,DA3,DA2,DA1,DA0; 
wire    [7:0] SA5,SA4,SA3,SA2,SA1,SA0;  
wire [15:0] payload_length;
reg [15:0] idle_wait_cnt;
reg [63:0] good_pkts;
reg [63:0] bad_pkts;
reg [63:0] rcv_byte_cnt;
reg crc_checker_en;
wire crc_pass;
wire crc_done;
reg random_length;
reg [15:0] random_seed;
//reg [31:0] test_cntr;
reg [31:0] pckts_sent;
reg PKT_TX_EOP_OUT_R;
reg iteration;
 localparam INIT_VAL = 32'habcdef00; 
wire [2:0]byte_en_tx;
assign PREADY_OUT = 1'b1;
 
assign  new_pmacpkt_len = pckt_length_reg+11'd4;
assign PKT_TX_EOP_OUT =PKT_TX_EOP_OUT_R & PKT_TX_FIFO_READY_IN;
assign byte_en_tx[2:0]  = 3'b100 - PKT_TX_MOD_OUT[1:0]; 
//APB write Logic
always @(posedge PCLK_IN ) 
begin
	if (!PRESET_N_IN)begin
		start <= 1'b0;
		stop <= 1'b0;
        pckts_sent <=0;
		clear_op_done <= 1'b0;
		no_of_Packets_reg <= 0;
		pckt_length_reg <= 0;
		source_address[47:0] <= 48'h0; 
		destination_address[47:0] <= 48'h0;
		idle_wait_cnt <= 16'h0;
		clear_mon_counters <= 1'b0;
		crc_checker_en <= 1'b0;
		random_length <= 1'b0;  
		random_seed <= 16'h5EED;
       ETH_TYPE <= '0; 
        PCP<='0;
        DEI<='0;                                   
        VID<='0;
        loopback <='0;
        soft_rst<='0;
        sel_out <='0;
        soft_rst_out<='0;
        iteration <=1'b0;
  	end	else if(PSEL_IN & PENABLE_IN & PWRITE_IN) begin
    		case(PADDR_IN[7:0])
				ADDR_START         : start <= PWDATA_IN[0];
				ADDR_STOP          : stop <= PWDATA_IN[0];
				ADDR_DONE          : clear_op_done <= PWDATA_IN[0]; // clearing status register data        @ FIC32_0 address 3000_0008
    			ADDR_NUMPKTS       : no_of_Packets_reg   <= PWDATA_IN; // latching number of packets input  (0-continuous transmission )     @ FIC32_0 address 3000_000C
    			ADDR_PKTLENGTH     : pckt_length_reg[10:0] <= PWDATA_IN[10:0]; // latching packet length      @ FIC32_0 address 3000_0010
                ADDR_PKTSENT       : pckts_sent <= PWDATA_IN; 
				ADDR_MACSA0        : source_address[31:0] <= PWDATA_IN[31:0];
				ADDR_MACSA1        : source_address[47:32] <= PWDATA_IN[15:0];
				ADDR_MACDA0        : destination_address[31:0] <= PWDATA_IN[31:0];
				ADDR_MACDA1        : destination_address[47:32] <= PWDATA_IN[15:0];
				ADDR_IDLE_CNT      : idle_wait_cnt <= PWDATA_IN[15:0];
				ADDR_RANDOMLENGTH  : random_length <= PWDATA_IN[0];
				ADDR_RNDSEED0      : random_seed <= PWDATA_IN[15:0];
				ADDR_MON_CTRL      : begin
                                     	clear_mon_counters <= PWDATA_IN[0];
                                        crc_checker_en <= PWDATA_IN[1];
									 end
                PTP_PKT            :  ptp_gen <=  PWDATA_IN[0];    
                VLAN_PKT           :  vlan_gen <=  PWDATA_IN[0];     
                ADDR_VLAN_WORD     :  {ETH_TYPE,PCP,DEI,VID}  <= PWDATA_IN;  
                LOOPBACK           :  loopback <= PWDATA_IN[0];   
                ITERATION          : iteration <= PWDATA_IN[0];
                SOFT_RST           : soft_rst <= PWDATA_IN[0];
                SOFT_RST_OUT       : soft_rst_out<=PWDATA_IN[0];
                SELECT_LINE            :sel_out <=PWDATA_IN[0];
            default : begin
 
 
            end
			endcase
	end
	else begin
		start <= 1'b0;
		clear_op_done <= 1'b0;
		clear_mon_counters <= 1'b0;
	end
end
wire [7:0] ETH_BYTE0;
wire [7:0] ETH_BYTE1;
wire [7:0] PCP_BYTE;
wire [7:0] VID_BYTE;
 
 assign ETH_BYTE0 = ETH_TYPE[15:8];
  assign ETH_BYTE1 = ETH_TYPE[7:0];
 assign  PCP_BYTE = {PCP,DEI,VID[11:8]};
 assign VID_BYTE =VID[7:0];
 
 
//APB read Logic
always @(*)
begin
	if (!PRESET_N_IN)
		PRDATA_OUT <= 0;
	else if(PSEL_IN & !PWRITE_IN & PENABLE_IN) begin
    		case(PADDR_IN[7:0])
				ADDR_START         : PRDATA_OUT <= {31'b0,start};
				ADDR_STOP          : PRDATA_OUT <= {31'b0,stop};
    			ADDR_DONE          : PRDATA_OUT <= {31'b0,op_done_q[1]};  
    			ADDR_NUMPKTS       : PRDATA_OUT <= no_of_Packets_reg;   
    			ADDR_PKTLENGTH     : PRDATA_OUT <= {21'b0,pckt_length_reg[10:0]};  
                ADDR_PKTSENT       : PRDATA_OUT <= pckts_sent ;  
				ADDR_MACSA0        : PRDATA_OUT <= source_address[31:0]; 
				ADDR_MACSA1        : PRDATA_OUT <= {16'h0,source_address[47:32]}; 
				ADDR_MACDA0        : PRDATA_OUT <= destination_address[31:0]; 
				ADDR_MACDA1        : PRDATA_OUT <= {16'h0,destination_address[47:32]}; 
				ADDR_IDLE_CNT      : PRDATA_OUT <= {16'h0,idle_wait_cnt[15:0]};
				ADDR_TXPKTCNT_MSB  : PRDATA_OUT <= pckt_count[63:32];
				ADDR_TXPKTCNT_LSB  : PRDATA_OUT <= pckt_count[31:0];
				ADDR_RANDOMLENGTH  : PRDATA_OUT <= {31'b0,random_length};
				ADDR_RNDSEED0      : PRDATA_OUT <= {16'h0000,random_seed[15:0]};
				ADDR_MON_CTRL      : PRDATA_OUT <= {30'b0,crc_checker_en,clear_mon_counters};
				ADDR_GOOD_PACKETS_MSB  : PRDATA_OUT <= good_pkts[63:32];
				ADDR_GOOD_PACKETS_LSB  : PRDATA_OUT <= good_pkts[31:0];
				ADDR_ERROR_PACKETS_MSB : PRDATA_OUT <= bad_pkts[63:32];
				ADDR_ERROR_PACKETS_LSB : PRDATA_OUT <= bad_pkts[31:0];
				ADDR_RCV_BYTE_CNT_MSB : PRDATA_OUT <= rcv_byte_cnt[63:32];
				ADDR_RCV_BYTE_CNT_LSB : PRDATA_OUT <= rcv_byte_cnt[31:0];
                PTP_PKT            : PRDATA_OUT <= {31'b0,ptp_gen}  ;   
                VLAN_PKT           : PRDATA_OUT <={31'b0,vlan_gen}  ; 
                ADDR_VLAN_WORD        : PRDATA_OUT <={ETH_TYPE,PCP,DEI,VID}   ;
                LOOPBACK           :  PRDATA_OUT <= {31'b0,loopback};  
                ITERATION          : PRDATA_OUT  <= {31'b0,iteration};
                SOFT_RST          : PRDATA_OUT <={31'b0,soft_rst};
                SOFT_RST_OUT       : PRDATA_OUT<= {31'b0,soft_rst_out};
                SELECT_LINE             :PRDATA_OUT<= {31'b0,sel_out};
				default : PRDATA_OUT <= 0;
			endcase
	end	else begin
		PRDATA_OUT <= 0;
	end
end
 
 
always @(posedge PCLK_IN) 
begin
	if (!PRESET_N_IN)begin
		op_done_q[1:0] <= 2'b00;
  	end	else begin
		op_done_q[1:0] <= {op_done_q[0],op_done};
	end
end
 
 
 
assign {DA5,DA4,DA3,DA2,DA1,DA0} = destination_address[47:0];
assign {SA5,SA4,SA3,SA2,SA1,SA0} = source_address[47:0];
assign payload_length[15:0] = {5'b00000,(pckt_length_reg[10:0] - 11'b00000001110)};
assign pckt_length_tx = pckt_length_reg;
//process to generate the packet generator start and stop control signal
always @ (posedge SYSCLK_IN)
begin
	if (!SYSRST_N_IN)
	begin
		start_q[2:0] <= 3'b000;
		clear_mon_counters_q[2:0] <= 3'b000;
		clear_op_done_q[2:0] <= 3'b000;
		stop_q[1:0] <= 2'b00;
        //pckts_sent <=0;
    end else begin
		start_q[2:0] <= {start_q[1:0],start};
		clear_mon_counters_q[2:0] <= {clear_mon_counters_q[1:0],clear_mon_counters};
		clear_op_done_q[2:0] <= {clear_op_done_q[1:0] ,clear_op_done};
		stop_q[1:0] <= {stop_q[0],stop};
        
        /*if (pckt_gen_fsm_state == DATA_TX && PKT_TX_FIFO_READY_IN == 1'b1) begin 
            pckts_sent <= pckts_sent +1;
        end
                
        if (pckts_sent >= 10)
            pckt_gen_fsm_state <= IDLE_TX; 
            pckts_sent <= 0; */
            
        end 
	end
 
 
 
assign start_p = {start_q[1] & !start_q[2]};
assign mon_init ={clear_mon_counters_q[1]&!clear_mon_counters_q[2]};
assign clear_op_done_p = {clear_op_done_q[1]&!clear_op_done_q[2]};
reg [31:0] pck_send_count ;
 
 
//PACKET GENERATION STATE MACHINE
always @ (posedge SYSCLK_IN)
//always @ (negedge SYSCLK_IN)
begin
	if (!SYSRST_N_IN | soft_rst)
	begin
		pckt_gen_fsm_state <= IDLE_TX;
		PKT_TX_VAL_OUT <=1'b0;
		PKT_TX_SOP_OUT <=1'b0;
		PKT_TX_MOD_OUT <= 2'b00;
        PKT_TX_EOP_OUT_R <= 1'b0;
		PKT_TX_DATA_OUT <= 32'h0;
		count <= 16'h0000;
        tx_byte_count <=64'd0;
        wait_count <= 16'h0000;
		op_done <= 1'b0;
		pckt_count <= 64'h0;
		data_pattern <= 32'h0;
        pck_send_count <=32'd0;
      //  test_cntr<=32'd0;
	end
	else begin

 
	case (pckt_gen_fsm_state)
		IDLE_TX : begin
					PKT_TX_VAL_OUT <=1'b0;
					PKT_TX_SOP_OUT <=1'b0;
					PKT_TX_MOD_OUT <= 2'b00;
        			PKT_TX_EOP_OUT_R <= 1'b0;
					PKT_TX_DATA_OUT <= 32'h0;
			        wait_count <= 16'h0000;
					data_pattern <= 32'h0;
                    quit <=1'b0;
           
                    if ((start_p == 1'b1 && loopback==1'b0) || iteration ==1'b1  ) begin
						pckt_gen_fsm_state <= WAIT_TX1;
						op_done <= 1'b0;  
						pckt_count <= 64'h0;
					end
        
					else begin
						pckt_gen_fsm_state <= IDLE_TX;
                        if (loopback==1'b1) begin 
                        PKT_TX_VAL_OUT <=PKT_RX_VAL_IN;
					    PKT_TX_SOP_OUT <=PKT_RX_SOP_IN;
					    PKT_TX_MOD_OUT <= PKT_RX_MOD_IN;
        			    PKT_TX_EOP_OUT_R <= PKT_RX_EOP_IN;
                        PKT_TX_DATA_OUT <= PKT_RX_DATA_IN;
                        
                        end
                        else begin
						if (mon_init) begin
							pckt_count <= 64'h0;
						end else begin
							pckt_count <= pckt_count;
						end
						if 	(clear_op_done_p == 1'b1) begin
							op_done <= 1'b0;
                        end
                       end 
					end
					count <= 16'h0000;
				end
 
 
		SOP_TX : begin
                new_pmacpkt_en <=1'b1;
				PKT_TX_SOP_OUT <=1'b1;
				PKT_TX_MOD_OUT <= 2'b00;
        		PKT_TX_EOP_OUT_R <= 1'b0;
           
				wait_count <= 16'h0000;
				data_pattern <= 64'h0;
				if (PKT_TX_FIFO_READY_IN == 1'b1) begin
                    PKT_TX_DATA_OUT <= {SA4,SA5,DA0,DA1}; 
					PKT_TX_VAL_OUT <=1'b1;
                    PKT_TX_SOP_OUT <=1'b0;
				    pckt_gen_fsm_state <=DA_SA;
					count <= count + 12'd4;
                    tx_byte_count <=tx_byte_count+64'd4;
				end else begin
					PKT_TX_VAL_OUT <=1'b0;
					count <= count;	
                    tx_byte_count <=tx_byte_count;
					pckt_gen_fsm_state <= SOP_TX;	
				end
			   end
 
		DA_SA : begin
                new_pmacpkt_en <=1'b0;
				PKT_TX_SOP_OUT <=1'b0;
				PKT_TX_MOD_OUT <= 2'b00;
        		PKT_TX_EOP_OUT_R <= 1'b0;
            //    PKT_TX_DATA_OUT <= {SA1,SA0,DA5,DA4,DA3,DA2,DA1,DA0};
			 //   PKT_TX_DATA_OUT <= {SA1,SA0,DA5,DA4};
               // PKT_TX_DATA_OUT <=test_cntr ;
 
				wait_count <= 16'h0000;
				data_pattern <= 64'h0;
				if (PKT_TX_FIFO_READY_IN == 1'b1) begin
					PKT_TX_VAL_OUT <=1'b1;
                    PKT_TX_DATA_OUT <=  {SA0,SA1,SA2,SA3};
                    tx_byte_count <=tx_byte_count+64'd4;
                    count <= count + 12'd4;
			       if(vlan_gen ==1'b1) 
                        pckt_gen_fsm_state <=VLAN_TAG;
                   else begin
                        pckt_gen_fsm_state <=LEN_TX;
                        count <= 16'h0004;
                      //    tx_byte_count <=tx_byte_count+64'd4;
                        end 
                end
                else begin
					PKT_TX_VAL_OUT <=1'b0;
					count <= 16'h0000;	
                      tx_byte_count <=tx_byte_count;
					pckt_gen_fsm_state <= DA_SA;	
				end
			   end  
          
	/*	SA : begin
				PKT_TX_SOP_OUT <=1'b0;
				PKT_TX_MOD_OUT <= 3'b000;
        		PKT_TX_EOP_OUT <= 1'b0;
            //    PKT_TX_DATA_OUT <= {SA1,SA0,DA5,DA4,DA3,DA2,DA1,DA0};
			 //  PKT_TX_DATA_OUT <= {SA5,SA4,SA3,SA2};
             //  PKT_TX_DATA_OUT <=test_cntr ;
				wait_count <= 16'h0000;
				data_pattern <= 64'h0;
				if (PKT_TX_FIFO_READY_IN == 1'b1) begin
					PKT_TX_VAL_OUT <=1'b1;
                        PKT_TX_DATA_OUT <= 32'h00000c0f;
				//	pckt_gen_fsm_state <= LEN_TX;
				    if(vlan_gen ==1'b1)
                    pckt_gen_fsm_state <=VLAN_TAG;
			        else begin
				    pckt_gen_fsm_state <=LEN_TX;
                    end
                    count <= 16'h0004;
				end 
                else begin
					PKT_TX_VAL_OUT <=1'b0;
					count <= 16'h0000;	
					pckt_gen_fsm_state <= SA;	
				end
			   end*/
 
 
      VLAN_TAG: begin
				PKT_TX_SOP_OUT <=1'b0;
				PKT_TX_MOD_OUT <= 2'b00;
        		PKT_TX_EOP_OUT_R <= 1'b0;
 
				wait_count <= 16'h0000;
				data_pattern <= 64'h0;
				if (PKT_TX_FIFO_READY_IN == 1'b1) begin
					PKT_TX_VAL_OUT <=1'b1;
                     PKT_TX_DATA_OUT <= {VID_BYTE,PCP_BYTE,ETH_BYTE1,ETH_BYTE0};
				//	pckt_gen_fsm_state <= LEN_TX;
				   pckt_gen_fsm_state <=LEN_TX;
					 count <= count + 12'd4;
                      tx_byte_count <=tx_byte_count+64'd4;
				end else begin
					PKT_TX_VAL_OUT <=1'b0;
					count <= 16'h0000;	
                      tx_byte_count <=tx_byte_count;
					pckt_gen_fsm_state <= VLAN_TAG;	
				end
			   end 		   
 
 
 
		LEN_TX : begin
				PKT_TX_SOP_OUT <=1'b0;
				PKT_TX_MOD_OUT <= 2'b00;
        		PKT_TX_EOP_OUT_R <= 1'b0;
				data_pattern <= 32'h00000001;
                wait_count <= 16'h0000;
		
              
                if (pckt_count == pckts_sent) begin  // If pckt_count reaches 5
                    pckt_gen_fsm_state <= IDLE_TX; 
                end 
                else if (PKT_TX_FIFO_READY_IN == 1'b1) begin
                       if(ptp_gen==1'b1)
                     //   PKT_TX_DATA_OUT <= {VID_BYTE,PCP_BYTE,8'hF7,8'h88};
                       PKT_TX_DATA_OUT <= {VID_BYTE,PCP_BYTE,ETH_BYTE1,ETH_BYTE0};
                       else begin
                        PKT_TX_DATA_OUT <= {pckt_count[15:0],payload_length[15:0]};
                        end
                        PKT_TX_VAL_OUT <= 1'b1; 
                        pckt_gen_fsm_state <= DATA_TX; 
                        count <= count + 12'd4;
                          tx_byte_count <=tx_byte_count+64'd4;
                    end 
                    else begin 
                        PKT_TX_VAL_OUT <= 1'b0; 
                        count <= 16'h0000;
                         tx_byte_count <=tx_byte_count; 
                        pckt_gen_fsm_state <= LEN_TX; 
                    end
			   end
 
 
		DATA_TX : begin
				PKT_TX_SOP_OUT <=1'b0;
				PKT_TX_MOD_OUT <= 2'b00;
        		PKT_TX_EOP_OUT_R <= 1'b0;
                wait_count <= 16'h0000;
                
				if (PKT_TX_FIFO_READY_IN == 1'b1 ) begin
					PKT_TX_VAL_OUT <=1'b1;
					count <= count +16'h0004;
                      tx_byte_count <=tx_byte_count+64'd4;
                    PKT_TX_DATA_OUT <= data_pattern;
					data_pattern <= data_pattern + 32'h00000001;
                    
                    if (count < (pckt_length_tx-11'b00000001000)) begin
						pckt_gen_fsm_state <= DATA_TX;
                       
					end
                    else begin
						pckt_gen_fsm_state <= EOP_TX; 
					end
				end
                else begin
					PKT_TX_VAL_OUT <=1'b0;
					count <= count;
                      tx_byte_count <=tx_byte_count;
					data_pattern <= data_pattern;
                   
					pckt_gen_fsm_state <= DATA_TX;	
				end
				end
 
 
		EOP_TX : begin	
				PKT_TX_SOP_OUT <=1'b0;
			//	PKT_TX_MOD_OUT <= (4'b1000-(pckt_length_tx % 4));
        		PKT_TX_MOD_OUT <= (3'b100-(pckt_length_tx % 4));
                wait_count <=  16'h0000;
             
				if (PKT_TX_FIFO_READY_IN == 1'b1) begin
					PKT_TX_VAL_OUT <=1'b1;
                    PKT_TX_DATA_OUT <= 32'h00000e0d;
                    PKT_TX_EOP_OUT_R <= 1'b1;
					pckt_gen_fsm_state <= WAIT_TX2;
					data_pattern <= 32'h0;
					count <= 16'h0000;
                //    tx_byte_count <=(tx_byte_count+(pckt_length_tx % 4));
                
                       if((pckt_length_tx % 4)==0)
                         tx_byte_count <=tx_byte_count+64'd4 ;
                        else 
                       tx_byte_count <=(tx_byte_count+(pckt_length_tx % 4));
                       
                    end else begin
					PKT_TX_VAL_OUT <=1'b0;
					count <= count;
                      tx_byte_count <=tx_byte_count;
					data_pattern <= data_pattern;
					pckt_gen_fsm_state <= EOP_TX;
				end
	  		   end
               
        WAIT_TX2 : begin       
                 if (PKT_TX_FIFO_READY_IN == 1'b1) begin
                    PKT_TX_VAL_OUT <=1'b0;
					PKT_TX_SOP_OUT <=1'b0;
					PKT_TX_MOD_OUT <= 2'b00;
        			PKT_TX_EOP_OUT_R <= 1'b0;
					data_pattern <= 32'h0;
					PKT_TX_DATA_OUT <= 32'h0;
                    pckt_gen_fsm_state <= WAIT_TX;
                    end
                 end   
 
		WAIT_TX : begin
					
                   
					if (wait_count < idle_wait_cnt) begin
						pckt_gen_fsm_state <= WAIT_TX;
						wait_count <= wait_count + 16'h0001;
					end	else begin
						if (stop_q[1]) begin
							pckt_gen_fsm_state <= IDLE_TX;
							op_done <= 1'b1;
						end
                        else begin
                            if (pckt_count == pckts_sent-1) begin
                                pckt_gen_fsm_state <= IDLE_TX;
                                quit <=1'b1;
								op_done <= 1'b1;
							end
                            else if((pckt_count < no_of_Packets_reg-32'h00000001 )&& pmac_full==1'b0) begin
								pckt_gen_fsm_state <= WAIT_TX1; 
								op_done <= 1'b0;
							end	
                            else begin
								pckt_gen_fsm_state <= IDLE_TX;
								op_done <= 1'b1;
							end
						end
						pckt_count <= pckt_count + 64'h00000001;
						wait_count <= 16'h0000;
					end	
	  			end
 
 
 WAIT_TX1: begin
                PKT_TX_SOP_OUT <=1'b1;
                pck_send_count<=pck_send_count+1'b1;
				PKT_TX_MOD_OUT <= 2'b00;
        		PKT_TX_EOP_OUT_R <= 1'b0;
                PKT_TX_DATA_OUT <={DA2,DA3,DA4,DA5}; 
                  tx_byte_count <=tx_byte_count+64'd4;
           //     PKT_TX_DATA_OUT <= INIT_VAL; //32'habcdef00;
				wait_count <= 16'h0000;
				data_pattern <= 64'h0;  
                count <=12'd4 ;
                pckt_gen_fsm_state <= SOP_TX;
        end 
 
		default : begin 
					PKT_TX_VAL_OUT <=1'b0;
					PKT_TX_SOP_OUT <=1'b0;
					PKT_TX_MOD_OUT <= 2'b00;
        			PKT_TX_EOP_OUT_R <= 1'b0;
					data_pattern <= 32'h0;
					PKT_TX_DATA_OUT <= 32'h0;
					PKT_TX_DATA_OUT <={DA2,DA3,DA4,DA5};
					count <= 16'h0000;
                      tx_byte_count <=64'd0;
					op_done <= 1'b0;
					pckt_count <= 64'h0;
		            wait_count <= 16'h0000;
           
				  end
	endcase
	end
end
 
reg PKT_RX_READY_OUT_int; 
//PACKET RECEPTION STATE MACHINE
always @ (posedge SYSCLK_IN)
begin
	if (!SYSRST_N_IN| soft_rst)
	begin
		pckt_recv_fsm_state <= IDLE_RCV;
		PKT_RX_READY_OUT_int <= 1'b0;
	end
	else begin
	//PKT_RX_READY_OUT <= 1'b1;
    if(PKT_RX_SOP_IN ==1)
        PKT_RX_READY_OUT_int <= 1'b1;
    else
        if(PKT_RX_EOP_IN ==1)
        PKT_RX_READY_OUT_int <= 1'b0;
	end
end
assign PKT_RX_READY_OUT = (PKT_RX_READY_OUT_int|PKT_RX_SOP_IN) ;
 
 
 
// ____________________________________________
//	Received packet counter Logic
// ____________________________________________
  reg detected;
reg [7:0]rst_count; 
always @ (posedge SYSCLK_IN)
//always @ (negedge SYSCLK_IN)
   begin
      if (!SYSRST_N_IN | soft_rst) begin
          good_pkts <= 64'h0;
      	  bad_pkts <= 64'h0;
		  rcv_byte_cnt <= 64'h0;
          rst_count <=8'd0;
      end else begin
		if(mon_init) begin
          good_pkts <= 64'h0;
          bad_pkts <= 64'h0;
		  rcv_byte_cnt <= 64'h0;
          rst_count <=8'd0;
	  	end else begin
			if (!crc_checker_en) begin
          		if (PKT_RX_VAL_IN & PKT_RX_EOP_IN & !PKT_RX_ERR_IN) begin
	 	 			good_pkts <= good_pkts + 64'h1;
         		end else if (PKT_RX_VAL_IN & PKT_RX_EOP_IN & PKT_RX_ERR_IN) begin 
					bad_pkts <= bad_pkts + 64'h1;
		  		end
			end else begin
				if (crc_done & crc_pass) begin
					good_pkts <= good_pkts + 64'h1;
				end else if(crc_done & !crc_pass) begin
					bad_pkts <= bad_pkts + 64'h1;
				end
			end
			if(PKT_RX_VAL_IN) begin
				if (!PKT_RX_EOP_IN) begin
                     if(detected) begin 
                       rcv_byte_cnt <= rcv_byte_cnt + 64'h8; 
                       end
                    else  begin
                     rcv_byte_cnt <= rcv_byte_cnt + 64'h4;
                      end
				end else begin
					//if (byte_en == 3'b000) begin
						//rcv_byte_cnt <= rcv_byte_cnt +  64'h4;
                        //rst_count <=8'd0;
                    //end else begin
						rcv_byte_cnt <= rcv_byte_cnt + byte_en[2:0];
                       // rcv_byte_cnt <= rcv_byte_cnt;
                     //   rst_count <=rst_count +8'd4;
				//	end
                     
				end
                
			end
		end
      end
   end
 
 
// To check back to back EOP and SOP occurances

 parameter IDLE1 =1'b0;
 parameter PULSE_DETECTED =1'b1;

 reg current_state;
 reg  next_state;
always @(posedge SYSCLK_IN) begin
    if (~SYSRST_N_IN | soft_rst) begin
        current_state <= IDLE1;
    end else begin
        current_state <= next_state;
    end
end

// Combinational logic for next state and output
always @(*) begin
    // Default values
    next_state = current_state;
    detected = 1'b0;


        case (current_state)
            IDLE1: begin
                 detected = 1'b0;
                if (PKT_RX_EOP_IN) begin
                    next_state = PULSE_DETECTED;
                end else  begin
                    next_state = IDLE1;
                end
            end

            PULSE_DETECTED: begin
                if (PKT_RX_SOP_IN) begin
                    detected = 1'b1;
                    next_state = IDLE1;
                end else begin
                    detected = 1'b0;
                    next_state = IDLE1;
                end
            end   
            endcase
 end
 
assign byte_en[2:0]  = 3'b100 - PKT_RX_MOD_IN[1:0];

endmodule