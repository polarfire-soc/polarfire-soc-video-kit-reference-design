/*=================================================================================================
-- File Name                           : ddr_write_controller_enc.v
-- Targeted device                     : Microsemi-SoC
-- Author                              : India Solutions Team
--
-- COPYRIGHT 2019 BY MICROSEMI
-- THE INFORMATION CONTAINED IN THIS DOCUMENT IS SUBJECT TO LICENSING RESTRICTIONS FROM MICROSEMI
-- CORP. IF YOU ARE NOT IN POSSESSION OF WRITTEN AUTHORIZATION FROM MICROSEMI FOR USE OF THIS
-- FILE, THEN THE FILE SHOULD BE IMMEDIATELY DESTROYED AND NO BACK-UP OF THE FILE SHOULD BE MADE.
--
--===============================================================================================*/

module ddr_write_controller_enc #(parameter g_DDR_AXI_AWIDTH = 32) (
    input              reset_i, //System Reset
    input              sys_clk_i, // System clock
    input              wrclk_reset_i, //Write clock reset
    input              wrclk_i, //Write clock 
    input      [11:0]  fifo_count_i, //Fifo count
    input              eof_i, //End of Frame
    
    //from apb wrapper
    input              encoder_en_i,//enable or start
    input              clr_intr_i,//clear interrupt from apb

    input              write_ackn_i, //Write Acknowledgement
    input              write_done_i, //Write Done
    input      [9:0]   frame_ddr_addr_i, //Frame address to write
    output             fifo_reset_o,
    
    output wire        read_fifo_o, //Read Request to FIFO
    output wire        frm_interrupt_o,//interrupt to MSS
    
    //to apb wrapper
    output wire [1:0]  frame_idx_o, //frame index
    output wire [31:0] frame_size_o, //Frame Size
    
    //to arbiter
    output wire                        write_req_o, //Write Request to DDR
    output wire [g_DDR_AXI_AWIDTH-1:0] write_start_addr_o, //DDR memory address to write data
    output wire [7:0]                  write_length_o  //Write Burst size

    );

  localparam  IDLE = 2'b00,
              WRITE_REQUESTING = 2'b01,
              WRITING = 2'b10;

  reg  [1:0]   s_state;
  reg          s_eof_wrclk;
  reg  [15:0]  s_eof_sync_reg;
  reg          s_eof_reg;
  wire         s_set_eof_reg;
  reg          s_clr_eof_reg;
  reg          s_write_req;
  reg          s_read_fifo;
  reg [g_DDR_AXI_AWIDTH-1:0] s_write_start_addr;
  reg [15:0]   s_counter;
  reg [15:0]   s_count_max;
  reg [19:0]   s_line_counter;
  reg          s_frm_intr;
  reg [1:0]    s_clr_intr_r;//double flop
  reg [1:0]    s_frame_index;
  reg [1:0]    s_disp_frame_index;
  reg          s_last_data_in_frame;
  reg [31:0]   s_frame_size;
  reg [31:0]   s_frame_size_out;
  reg          encoder_en_dly1;

assign write_req_o          = s_write_req;
assign write_start_addr_o   = s_write_start_addr;
assign write_length_o       = s_count_max - 1'b1;
assign read_fifo_o          = s_read_fifo;
assign frame_size_o         = s_frame_size_out ;
assign frame_idx_o          = s_disp_frame_index;
assign frm_interrupt_o      = s_frm_intr;
assign fifo_reset_o         = ~(encoder_en_i & (~ encoder_en_dly1));

assign s_disp_frame_index = s_frame_index - 1'b1 ;
assign s_write_start_addr = {frame_ddr_addr_i[9:0], s_frame_index, s_line_counter};
assign s_set_eof_reg      = s_eof_sync_reg[15] ^ s_eof_sync_reg[14] ;

/*------------------------------------------------------------------------
-- Name       : EOF_SYNC
-- Description: Process to delay signal and find rising edge
------------------------------------------------------------------------*/
  always @( posedge wrclk_i or  negedge wrclk_reset_i)
  begin
    if (!wrclk_reset_i)   s_eof_wrclk <= 1'b0 ;
    else if (eof_i)       s_eof_wrclk <= ~s_eof_wrclk ;
  end

/*------------------------------------------------------------------------
-- Name       : SIGNAL_DELAY
-- Description: Process to delay signal and find rising edge
------------------------------------------------------------------------*/
  always @ (posedge sys_clk_i or negedge reset_i)
  begin
	if (!reset_i) begin
		s_eof_sync_reg     <= 11'd0 ;
		s_eof_reg          <= 1'b0 ;
        encoder_en_dly1    <= 1'b0 ;
        s_clr_intr_r       <= 0;
	end
	else begin
		s_eof_sync_reg     <= {s_eof_sync_reg[14:0], s_eof_wrclk} ;
        encoder_en_dly1    <= encoder_en_i;
        s_clr_intr_r       <= {s_clr_intr_r[0],clr_intr_i};
        
		if (s_set_eof_reg)      s_eof_reg <= 1'b1;
		else if (s_clr_eof_reg) s_eof_reg <= 1'b0;
	end
  end

/*------------------------------------------------------------------------
-- Name       : CORDIC_FSM_PROC
-- Description: FSM implements cordic operations
------------------------------------------------------------------------*/
  always @ (posedge sys_clk_i or negedge reset_i)
  begin
	if (!reset_i) begin
		s_state        <= IDLE;
		s_write_req    <= 1'b0;
		s_read_fifo    <= 1'b0;
		s_count_max    <= 16'd0 ;
		s_counter      <= 16'd0 ;
        s_frm_intr     <= 1'b0;
		s_frame_index  <= 2'd0 ;
		s_line_counter <= 20'd0 ;
		s_last_data_in_frame <= 1'b0 ;
		s_clr_eof_reg <= 1'b0;
		s_frame_size  <= 32'd0 ;
		s_frame_size_out <= 32'd0 ;
    end
	else begin                         
		case({s_state})
			IDLE : begin
				s_write_req <= 1'b0 ;
				s_read_fifo <= 1'b0 ;
				s_counter   <= 16'd0 ;
				s_clr_eof_reg <=  s_eof_reg && (fifo_count_i == 0) & !s_clr_eof_reg ;

				if (s_clr_eof_reg && encoder_en_i) begin       
                    s_frm_intr    <= 1'b1;
					s_frame_index <=  s_frame_index + 1'b1 ;
					s_frame_size_out <=  s_frame_size ;
					s_frame_size <= 16'd0 ;
					s_line_counter <= 16'd0 ;
                end
                else if (encoder_en_i == 0) begin
                    s_frame_size <= 16'd0 ;
                    s_frame_size_out <= 32'd0 ;
                    s_line_counter <= 16'd0 ;
                    s_frame_index  <= 2'd0 ;
				end
                else if (s_clr_intr_r[1]) begin
                    s_frm_intr     <= 1'b0;
                end    
          
				if (!s_clr_eof_reg && ((s_eof_reg && (|fifo_count_i)) || (|fifo_count_i[10:4]))) begin
					s_count_max <= {4'd0, fifo_count_i} ;
					s_state     <= WRITE_REQUESTING ;
					s_last_data_in_frame <= s_eof_reg ;
				end
			end
			WRITE_REQUESTING : begin
				if(write_ackn_i) begin
					s_write_req <= 1'b0;
					s_state     <= WRITING;
				end
				else begin
					s_write_req <= 1'b1 ;
				end
			end
			WRITING : begin
				if(write_done_i) begin     
					s_read_fifo    <= 1'b0;
					s_state        <= IDLE;
					s_clr_eof_reg  <= s_last_data_in_frame ;
					s_line_counter <= s_line_counter + {s_count_max, 3'b000} ;
					s_frame_size   <= s_frame_size + {s_count_max, 3'b000} ;
				end
				else if(s_counter >= s_count_max) begin
					s_read_fifo <= 1'b0;
				end
				else begin
					s_counter   <= s_counter + 1'b1;
					s_read_fifo <= 1'b1;
				end
			end
			default : s_state <= IDLE;
		endcase
	end
end

endmodule

