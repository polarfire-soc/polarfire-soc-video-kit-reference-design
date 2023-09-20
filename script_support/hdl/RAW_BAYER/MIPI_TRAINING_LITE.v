module MIPI_TRAINING_LITE 
#(
    parameter AUTO_RE_TRAINING = 1  // 0 : Manual Training ; 1 : Auto Re-training 
 )
(
// Input Signals
    input         CLK_I,                   // Input clock
    input         RESET_N_I,               // Async Reset
    input         PLL_LOCK_I,              // PLL Lock from CCC
    input [7 : 0] TAP_DELAYS_I,            // Delay Tap Adjust Value
    input [7 : 0] VALID_WIN_LEN_I,         // Valid window/eye openilengthng 
    input         IOD_EARLY_I,             // Indicates Early flag -- early to edge of clock
    input         IOD_LATE_I,              // Indicates Late flag  -- late to edge of clock
    input         IOD_OOR_I,               // out of Range from IOD
    input         LP_DATA_N_I,             // Low Power Signal
    input [3 : 0] FALSE_FLG_THRESHOLD_I,   // IOD Early/Late Flags Threshold at HS bursts

// Output Signals
    output        BIT_ALGN_CLR_FLAGS_O,    // Clear flag -- used to clear Early and Late signals to IOD
    output        BIT_ALGN_MOVE_O,         // Move flag 
    output        BIT_ALGN_DIRECTION_O,    // Direction of movement - up/downwards
    output        BIT_ALGN_LOAD_O,         // Load Flag -- Indicates to load Default values to IOD
    output        TRAINING_ACTIVE_O,       // start training signal
    output        DELAY_DONE_O,            // Delay done signal when it reaches input delay value 
    output        TRAINING_DONE_O,         // Training done signal
    output        IOD_EARLY_O,             // Ouput Early signal
    output        IOD_LATE_O,              // Output Late Signal
    output        IOD_OOR_O,               // Output OOR signal
    output [7:0]  TAP_CNT_FINAL_O          // Final Tap Delay Value
);


//------------------------------------------------
// Registers Declarations
//------------------------------------------------
reg [7:0]  win_len_reg;
reg [7:0]  tap_cnt;
reg [2:0]  wait_cnt;
reg [1:0]  cnt;
reg        lp_in_reg;
reg        bit_algn_start_reg;
reg        bit_algn_done_reg;
reg        bit_algn_clr_flgs_reg;
reg        bit_algn_load_reg;
reg        bit_algn_move_reg;
reg        bit_algn_dir_reg;
reg [7:0]  delay_data_reg;
reg        iod_early_r;
reg        iod_late_r;
reg        iod_OOR_r;
reg        delay_done_r;
reg [7:0]  win_valid_cnt;
reg        win_valid;
reg        no_early_no_late_flg;
reg [7:0]  valid_win_start_val;
reg [7:0]  valid_win_end_val;
reg [8:0]  tap_cnt_final;
reg        tap_pulse;
reg        early_first;      // If early first, decrement tap cnt
reg        late_first;       // If late first, increment tap cnt
reg [95:0] lp_shift_reg;
reg [48:0] iod_early_shift;
reg [48:0] iod_late_shift;
reg        re_train;
reg [3:0]  ely_flg_cnt;
reg [3:0]  lt_flg_cnt;
reg [3:0]  flg_threshold_reg;

//------------------------------------------------
// Nets Declarations
//------------------------------------------------

wire        delay_change;
wire        early_late_flg_w;
wire        win_valid_w;
wire        win_valid_start;
wire [7:0]  valid_win_end_val_w;
wire        lp_w;
wire        early_pulse;
wire        late_pulse;
wire        false_early_flg;
wire        false_late_flg;


//------------------------------------------------
// FSM States and Parameters Declarations
//------------------------------------------------
reg [2:0] state;

// States 
parameter ST_IDLE             = 0;
parameter ST_LOAD             = 1;
parameter ST_CLR_FLG          = 2;
parameter ST_TAP_CNT_INIT     = 3;
parameter ST_MOVE             = 4;
parameter ST_TAP_INCR         = 5;
parameter ST_TAP_DECRE        = 6;
parameter ST_DONE             = 7;


//------------------------------------------------
// Ouput / Continuous assignments
//------------------------------------------------
assign TRAINING_ACTIVE_O    = bit_algn_start_reg;
assign BIT_ALGN_CLR_FLAGS_O = bit_algn_clr_flgs_reg;
assign BIT_ALGN_LOAD_O      = bit_algn_load_reg;
assign BIT_ALGN_MOVE_O      = bit_algn_move_reg;
assign BIT_ALGN_DIRECTION_O = bit_algn_dir_reg;
assign IOD_EARLY_O          = iod_early_r;
assign IOD_LATE_O           = iod_late_r;
assign IOD_OOR_O            = iod_OOR_r;
assign DELAY_DONE_O         = delay_done_r;
assign TRAINING_DONE_O      = bit_algn_done_reg;
assign TAP_CNT_FINAL_O      = tap_cnt_final[7:0];

assign delay_change        = TAP_DELAYS_I != delay_data_reg;
assign early_late_flg_w    = iod_early_r || iod_late_r;
assign win_valid_w         = ((win_valid_cnt > 0) && (win_valid_cnt <= win_len_reg) && no_early_no_late_flg) ? 1'b1 : 1'b0;
assign win_valid_start     = win_valid_w && !win_valid;
assign valid_win_end_val_w = (tap_pulse) ? tap_cnt : valid_win_end_val;
assign lp_w                =  (lp_shift_reg[0] || lp_shift_reg[31] || lp_shift_reg[63] || lp_shift_reg[95]);
assign early_pulse         = (iod_early_shift[48] && ! early_first && !lp_w);
assign late_pulse          = (iod_late_shift[48] && ! late_first && !lp_w);
assign false_early_flg     = (ely_flg_cnt == flg_threshold_reg);
assign false_late_flg      = (lt_flg_cnt  == flg_threshold_reg);




//------------------------------------------------
// Input Register flop
//------------------------------------------------
always@(posedge CLK_I or negedge RESET_N_I)
begin
  if(! RESET_N_I)    
  begin
    lp_in_reg           <= 1'b1;
    delay_data_reg      <= 8'h14;
    win_len_reg         <= 0;
    win_valid           <= 1'b0;
    valid_win_start_val <= 0;
    valid_win_end_val   <= 0;
    tap_cnt_final       <= 0;
    lp_shift_reg        <= 96'hFFFFFFFFFFFFFFFFFFFFFFFF;
    early_first         <= 0;
    late_first          <= 0;
    re_train            <= 0;
    iod_early_shift     <= 0;
    iod_late_shift      <= 0;
    flg_threshold_reg   <= 0;
  end
  else
  begin
    lp_in_reg           <= LP_DATA_N_I;
    delay_data_reg      <= (!lp_w) ? TAP_DELAYS_I : delay_data_reg;
    win_len_reg         <= VALID_WIN_LEN_I;
    win_valid           <= win_valid_w;
    valid_win_start_val <= (win_valid_start) ? tap_cnt : valid_win_start_val;
    valid_win_end_val   <= valid_win_end_val_w;
    tap_cnt_final       <= tap_pulse ? (valid_win_start_val + valid_win_end_val_w) >> 1  : tap_cnt_final;
    lp_shift_reg        <= {lp_shift_reg[94:0],LP_DATA_N_I};
    early_first         <= (bit_algn_done_reg && !lp_w)? iod_early_shift[48] : 0;
    late_first          <= (bit_algn_done_reg && !lp_w)? iod_late_shift[48] : 0;
    re_train            <= tap_pulse ? 1'b0 : (early_first || late_first) ? 1'b1 : re_train;
    iod_early_shift     <= {iod_early_shift[47:0],IOD_EARLY_I};
    iod_late_shift      <= {iod_late_shift[47:0],IOD_LATE_I};
    flg_threshold_reg   <= FALSE_FLG_THRESHOLD_I;
  end
end


//------------------------------------------------
// State Machine Logic
//------------------------------------------------
generate if (AUTO_RE_TRAINING == 0)
begin
  always@(posedge CLK_I or negedge RESET_N_I)
  begin
    if(! RESET_N_I)
    begin
      state                 <= ST_IDLE;
      bit_algn_start_reg    <= 1'b0;
      bit_algn_clr_flgs_reg <= 1'b0;
      bit_algn_load_reg     <= 1'b0;
      bit_algn_move_reg     <= 1'b0;
      bit_algn_dir_reg      <= 1'b1;
      tap_cnt               <= 8'd0;
      wait_cnt              <= 3'd0;
      cnt                   <= 2'd0;
      iod_early_r           <= 1'b0;
      iod_late_r            <= 1'b0;
      iod_OOR_r             <= 1'b0;
      delay_done_r          <= 0;
    end
    else 
    begin
      if(PLL_LOCK_I && !lp_w)
      begin
        case(state)
          ST_IDLE:
          begin
            if(&cnt)
            begin
              state                 <= ST_LOAD;
              bit_algn_start_reg    <= 1'b1;
              bit_algn_clr_flgs_reg <= 1'b1;
              bit_algn_load_reg     <= 1'b1;
              bit_algn_move_reg     <= 1'b0;
              bit_algn_dir_reg      <= 1'b1;
              tap_cnt               <= 0;
              wait_cnt              <= 0;
              cnt                   <= cnt + 1;
              iod_early_r           <= 1'b0;
              iod_late_r            <= 1'b0;
              iod_OOR_r             <= 1'b0;
              delay_done_r          <= 0;
            end
            else
            begin
              state                 <= state;
              bit_algn_start_reg    <= bit_algn_start_reg;
              bit_algn_clr_flgs_reg <= bit_algn_clr_flgs_reg;
              bit_algn_load_reg     <= bit_algn_load_reg;
              bit_algn_move_reg     <= bit_algn_move_reg;
              bit_algn_dir_reg      <= bit_algn_dir_reg;
              tap_cnt               <= 8'd0;
              wait_cnt              <= 3'd0;
              cnt                   <= cnt + 1'b1;
              iod_early_r           <= 1'b0;
              iod_late_r            <= 1'b0;
              iod_OOR_r             <= 1'b0;
              delay_done_r          <= 0;
            end
          end

          ST_LOAD:
          begin
            if(&cnt)
            begin
              state                 <= ST_TAP_CNT_INIT;
              bit_algn_start_reg    <= 1'b1;
              bit_algn_clr_flgs_reg <= 1'b0;
              bit_algn_load_reg     <= 1'b0;
              bit_algn_move_reg     <= 1'b0;
              bit_algn_dir_reg      <= 1'b1;
              tap_cnt               <= 0;
              wait_cnt              <= 0;
              cnt                   <= cnt + 1;
              iod_early_r           <= iod_early_r;
              iod_late_r            <= iod_late_r;
              iod_OOR_r             <= iod_OOR_r;
              delay_done_r          <= 0;
            end
            else
            begin
              state                 <= state;
              bit_algn_start_reg    <= bit_algn_start_reg;
              bit_algn_clr_flgs_reg <= bit_algn_clr_flgs_reg;
              bit_algn_load_reg     <= bit_algn_load_reg;
              bit_algn_move_reg     <= bit_algn_move_reg;
              bit_algn_dir_reg      <= bit_algn_dir_reg;
              tap_cnt               <= 0;
              wait_cnt              <= 0;
              cnt                   <= cnt + 1;
              iod_early_r           <= iod_early_r;
              iod_late_r            <= iod_late_r;
              iod_OOR_r             <= iod_OOR_r;
              delay_done_r          <= 0;
            end  
          end

          ST_TAP_CNT_INIT:
          begin
            if((delay_data_reg == 0) && !delay_done_r)
            begin
              state                 <= ST_DONE;
              bit_algn_start_reg    <= 1'b1;
              bit_algn_clr_flgs_reg <= 1'b1;
              bit_algn_load_reg     <= 1'b0;
              bit_algn_move_reg     <= 1'b0;
              bit_algn_dir_reg      <= 1'b1;
              tap_cnt               <= tap_cnt;
              wait_cnt              <= 0;
              cnt                   <= 0;
              iod_early_r           <= iod_early_r;
              iod_late_r            <= iod_late_r;
              iod_OOR_r             <= iod_OOR_r;
              delay_done_r          <= delay_done_r;
            end
            else if(&wait_cnt)
            begin
              state                 <= ST_MOVE;
              bit_algn_start_reg    <= 1'b1;
              bit_algn_clr_flgs_reg <= 1'b0;
              bit_algn_load_reg     <= 1'b0;
              bit_algn_move_reg     <= 1'b0;
              bit_algn_dir_reg      <= bit_algn_dir_reg;
              tap_cnt               <= tap_cnt;
              wait_cnt              <= 0;
              cnt                   <= cnt + 1;
              iod_early_r           <= iod_early_r;
              iod_late_r            <= iod_late_r;
              iod_OOR_r             <= iod_OOR_r;
              delay_done_r          <= 0;
            end
            else
            begin
              state                 <= state;
              bit_algn_start_reg    <= bit_algn_start_reg;
              bit_algn_clr_flgs_reg <= 1'b0;
              bit_algn_load_reg     <= 1'b0;
              bit_algn_move_reg     <= 1'b0;
              bit_algn_dir_reg      <= bit_algn_dir_reg;
              tap_cnt               <= tap_cnt;
              wait_cnt              <= wait_cnt + 1;
              cnt                   <= cnt + 1;
              iod_early_r           <= iod_early_r;
              iod_late_r            <= iod_late_r;
              iod_OOR_r             <= iod_OOR_r;
              delay_done_r          <= 0;
            end  
          end

          ST_MOVE:
          begin
            state                 <= ST_CLR_FLG;
            bit_algn_start_reg    <= bit_algn_start_reg;
            bit_algn_clr_flgs_reg <= 1'b0;
            bit_algn_load_reg     <= 1'b0;
            bit_algn_move_reg     <= 1'b1;
            bit_algn_dir_reg      <= bit_algn_dir_reg;
            tap_cnt               <= bit_algn_dir_reg ? tap_cnt + 1 : tap_cnt - 1;
            wait_cnt              <= wait_cnt;
            cnt                   <= 0;
            iod_early_r           <= iod_early_r;
            iod_late_r            <= iod_late_r;
            iod_OOR_r             <= iod_OOR_r;
            delay_done_r          <= 0;
          end

          ST_CLR_FLG:
          begin
            if(&cnt)
            begin
              state                 <= bit_algn_dir_reg ? ST_TAP_INCR : ST_TAP_DECRE;
              bit_algn_start_reg    <= 1'b1;
              bit_algn_clr_flgs_reg <= 1'b1;
              bit_algn_load_reg     <= 1'b0;
              bit_algn_move_reg     <= 1'b0;
              bit_algn_dir_reg      <= bit_algn_dir_reg;
              tap_cnt               <= tap_cnt;
              wait_cnt              <= 0;
              cnt                   <= cnt + 1;
              iod_early_r           <= iod_early_r;
              iod_late_r            <= iod_late_r;
              iod_OOR_r             <= iod_OOR_r;
              delay_done_r          <= 0;
            end
            else
            begin
              state                 <= state;
              bit_algn_start_reg    <= 1'b1;
              bit_algn_clr_flgs_reg <= 1'b0;
              bit_algn_load_reg     <= 1'b0;
              bit_algn_move_reg     <= 1'b1;
              bit_algn_dir_reg      <= bit_algn_dir_reg;
              tap_cnt               <= tap_cnt;
              wait_cnt              <= 0;
              cnt                   <= cnt + 1;
              iod_early_r           <= iod_early_r;
              iod_late_r            <= iod_late_r;
              iod_OOR_r             <= iod_OOR_r;
              delay_done_r          <= 0;
            end  
          end

          ST_TAP_INCR:
          begin
            if((tap_cnt == delay_data_reg) && (&wait_cnt))
            begin
              state                 <= ST_DONE;
              bit_algn_start_reg    <= 1'b1;
              bit_algn_clr_flgs_reg <= 1'b0;
              bit_algn_load_reg     <= 1'b0;
              bit_algn_move_reg     <= 1'b0;
              bit_algn_dir_reg      <= 1'b1;
              tap_cnt               <= tap_cnt;
              wait_cnt              <= 0;
              cnt                   <= cnt + 1;
              iod_early_r           <= iod_early_r;
              iod_late_r            <= iod_late_r;
              iod_OOR_r             <= iod_OOR_r;
              delay_done_r          <= 0;
            end
            else if(&wait_cnt && IOD_OOR_I)
            begin
              state                 <= ST_IDLE;
              bit_algn_start_reg    <= 1'b1;
              bit_algn_clr_flgs_reg <= 1'b0;
              bit_algn_load_reg     <= 1'b0;
              bit_algn_move_reg     <= 1'b0;
              bit_algn_dir_reg      <= bit_algn_dir_reg;
              tap_cnt               <= tap_cnt;
              wait_cnt              <= 0;
              cnt                   <= cnt + 1;
              iod_early_r           <= iod_early_r;
              iod_late_r            <= iod_late_r;
              iod_OOR_r             <= iod_OOR_r;
              delay_done_r          <= 0;
            end
            else if(&wait_cnt)
            begin
              state                 <= ST_MOVE;
              bit_algn_start_reg    <= 1'b1;
              bit_algn_clr_flgs_reg <= 1'b0;
              bit_algn_load_reg     <= 1'b0;
              bit_algn_move_reg     <= 1'b0;
              bit_algn_dir_reg      <= bit_algn_dir_reg;
              tap_cnt               <= tap_cnt;
              wait_cnt              <= 0;
              cnt                   <= cnt + 1;
              iod_early_r           <= iod_early_r;
              iod_late_r            <= iod_late_r;
              iod_OOR_r             <= iod_OOR_r;
              delay_done_r          <= 0;
            end
            else if(&cnt)
            begin
              state                 <= state;
              bit_algn_start_reg    <= 1'b1;
              bit_algn_clr_flgs_reg <= 1'b0;
              bit_algn_load_reg     <= 1'b0;
              bit_algn_move_reg     <= 1'b0;
              bit_algn_dir_reg      <= bit_algn_dir_reg;
              tap_cnt               <= tap_cnt;
              wait_cnt              <= wait_cnt + 1;
              cnt                   <= cnt;
              iod_early_r           <= iod_early_r;
              iod_late_r            <= iod_late_r;
              iod_OOR_r             <= iod_OOR_r;
              delay_done_r          <= 0;
            end
            else
            begin
              state                 <= state;
              bit_algn_start_reg    <= bit_algn_start_reg;
              bit_algn_clr_flgs_reg <= 1'b1;
              bit_algn_load_reg     <= 1'b0;
              bit_algn_move_reg     <= 1'b0;
              bit_algn_dir_reg      <= bit_algn_dir_reg;
              tap_cnt               <= tap_cnt;
              wait_cnt              <= wait_cnt + 1;
              cnt                   <= cnt + 1;
              iod_early_r           <= iod_early_r;
              iod_late_r            <= iod_late_r;
              iod_OOR_r             <= iod_OOR_r;
              delay_done_r          <= 0;
            end  
          end

          ST_TAP_DECRE:
          begin
            if((tap_cnt == delay_data_reg) && (&wait_cnt))
            begin
              state                 <= ST_DONE;
              bit_algn_start_reg    <= 1'b1;
              bit_algn_clr_flgs_reg <= 1'b0;
              bit_algn_load_reg     <= 1'b0;
              bit_algn_move_reg     <= 1'b0;
              bit_algn_dir_reg      <= 1'b0;
              tap_cnt               <= tap_cnt;
              wait_cnt              <= 0;
              cnt                   <= cnt + 1;
              iod_early_r           <= iod_early_r;
              iod_late_r            <= iod_late_r;
              iod_OOR_r             <= iod_OOR_r;
              delay_done_r          <= 0;
            end
            else if(&wait_cnt && IOD_OOR_I)
            begin
              state                 <= ST_IDLE;
              bit_algn_start_reg    <= 1'b1;
              bit_algn_clr_flgs_reg <= 1'b0;
              bit_algn_load_reg     <= 1'b0;
              bit_algn_move_reg     <= 1'b0;
              bit_algn_dir_reg      <= bit_algn_dir_reg;
              tap_cnt               <= tap_cnt;
              wait_cnt              <= 0;
              cnt                   <= cnt + 1;
              iod_early_r           <= iod_early_r;
              iod_late_r            <= iod_late_r;
              iod_OOR_r             <= iod_OOR_r;
              delay_done_r          <= 0;
            end
            else if(&wait_cnt)
            begin
              state                 <= ST_MOVE;
              bit_algn_start_reg    <= 1'b1;
              bit_algn_clr_flgs_reg <= 1'b0;
              bit_algn_load_reg     <= 1'b0;
              bit_algn_move_reg     <= 1'b0;
              bit_algn_dir_reg      <= bit_algn_dir_reg;
              tap_cnt               <= tap_cnt;
              wait_cnt              <= 0;
              cnt                   <= cnt + 1;
              iod_early_r           <= iod_early_r;
              iod_late_r            <= iod_late_r;
              iod_OOR_r             <= iod_OOR_r;
              delay_done_r          <= 0;
            end
            else if(&cnt)
            begin
              state                 <= state;
              bit_algn_start_reg    <= 1'b1;
              bit_algn_clr_flgs_reg <= 1'b0;
              bit_algn_load_reg     <= 1'b0;
              bit_algn_move_reg     <= 1'b0;
              bit_algn_dir_reg      <= bit_algn_dir_reg;
              tap_cnt               <= tap_cnt;
              wait_cnt              <= wait_cnt + 1;
              cnt                   <= cnt;
              iod_early_r           <= iod_early_r;
              iod_late_r            <= iod_late_r;
              iod_OOR_r             <= iod_OOR_r;
              delay_done_r          <= 0;
            end
            else
            begin
              state                 <= state;
              bit_algn_start_reg    <= bit_algn_start_reg;
              bit_algn_clr_flgs_reg <= 1'b1;
              bit_algn_load_reg     <= 1'b0;
              bit_algn_move_reg     <= 1'b0;
              bit_algn_dir_reg      <= bit_algn_dir_reg;
              tap_cnt               <= tap_cnt;
              wait_cnt              <= wait_cnt + 1;
              cnt                   <= cnt + 1;
              iod_early_r           <= iod_early_r;
              iod_late_r            <= iod_late_r;
              iod_OOR_r             <= iod_OOR_r;
              delay_done_r          <= 0;
            end  
          end

          ST_DONE:
          begin
            if(delay_change)
            begin
              state                 <= ST_TAP_CNT_INIT;
              bit_algn_start_reg    <= 1'b1;
              bit_algn_clr_flgs_reg <= 1'b0;
              bit_algn_load_reg     <= 1'b0;
              bit_algn_move_reg     <= 1'b0;
              bit_algn_dir_reg      <= (tap_cnt > TAP_DELAYS_I) ? 1'b0 : 1'b1;
              tap_cnt               <= tap_cnt;
              wait_cnt              <= 0;
              cnt                   <= 0;
              iod_early_r           <= 0;
              iod_late_r            <= 0;
              iod_OOR_r             <= IOD_OOR_I;
              delay_done_r          <= 0;
            end
            else
            begin
              state                 <= ST_DONE;
              bit_algn_start_reg    <= 1'b0;
              bit_algn_clr_flgs_reg <= 1'b0;
              bit_algn_load_reg     <= 1'b0;
              bit_algn_move_reg     <= 1'b0;
              bit_algn_dir_reg      <= bit_algn_dir_reg;
              tap_cnt               <= tap_cnt;
              wait_cnt              <= 0;
              cnt                   <= 0;
              iod_early_r           <= (lp_w) ? 1'b0 : iod_early_shift[48];
              iod_late_r            <= (lp_w) ? 1'b0 : iod_late_shift[48];
              iod_OOR_r             <= IOD_OOR_I;
              delay_done_r          <= 1;
            end
          end
        
          default:
          begin
            state                 <= ST_IDLE;
            bit_algn_start_reg    <= 1'b1;
            bit_algn_clr_flgs_reg <= 1'b0;
            bit_algn_load_reg     <= 1'b0;
            bit_algn_move_reg     <= 1'b0;
            bit_algn_dir_reg      <= 1'b1;
            tap_cnt               <= 0;
            wait_cnt              <= 0;
            cnt                   <= 0;
            iod_early_r           <= 0;
            iod_late_r            <= 0;
            iod_OOR_r             <= 0;
            delay_done_r          <= 0;
          end
        endcase
      end
      else
      begin
        state                 <= state;
        bit_algn_start_reg    <= bit_algn_start_reg;
        bit_algn_clr_flgs_reg <= 1'b1;
        bit_algn_load_reg     <= 1'b0;
        bit_algn_move_reg     <= 1'b0;
        bit_algn_dir_reg      <= bit_algn_dir_reg;
        tap_cnt               <= tap_cnt;
        wait_cnt              <= 3'd0;
        cnt                   <= 2'd0;
        iod_early_r           <= 1'b0;
        iod_late_r            <= 1'b0;
        iod_OOR_r             <= 1'b0;
        delay_done_r          <= delay_done_r;
          
      end    
    end
  end
end

//------------------------------------------------
// Generate else block -- Auto Re-Training - 1
//------------------------------------------------
else 
begin
  always@(posedge CLK_I or negedge RESET_N_I)
  begin
    if(! RESET_N_I)
    begin
      state                 <= ST_IDLE;
      bit_algn_start_reg    <= 1'b0;
      bit_algn_done_reg     <= 1'b0;
      bit_algn_clr_flgs_reg <= 1'b0;
      bit_algn_load_reg     <= 1'b0;
      bit_algn_move_reg     <= 1'b0;
      bit_algn_dir_reg      <= 1'b1;
      tap_cnt               <= 8'd0;
      wait_cnt              <= 3'd0;
      cnt                   <= 2'd0;
      iod_early_r           <= 1'b0;
      iod_late_r            <= 1'b0;
      iod_OOR_r             <= 1'b0;
      delay_done_r          <= 1'b0;
      win_valid_cnt         <= 0;
      no_early_no_late_flg  <= 0;
      tap_pulse             <= 0;
      ely_flg_cnt           <= 0;
      lt_flg_cnt            <= 0;
    end
    else
    begin
      if(PLL_LOCK_I && !lp_w)
      begin
        iod_early_r <= iod_early_shift[48];
        iod_late_r  <= iod_late_shift[48];
        iod_OOR_r   <= IOD_OOR_I;
        
        case(state)
          ST_IDLE:
          begin
            if(&cnt)
            begin
              state                 <= ST_LOAD;
              bit_algn_start_reg    <= 1'b1;
              bit_algn_done_reg     <= 1'b0;
              bit_algn_clr_flgs_reg <= 1'b1;
              bit_algn_load_reg     <= 1'b1;
              bit_algn_move_reg     <= 1'b0;
              bit_algn_dir_reg      <= 1'b1;
              tap_cnt               <= 8'd0;
              wait_cnt              <= 3'd0;
              cnt                   <= cnt + 1'b1;
              delay_done_r          <= 1'b0;
              win_valid_cnt         <= 0;
              no_early_no_late_flg  <= 0;
              tap_pulse             <= 0;
              ely_flg_cnt           <= 0;
              lt_flg_cnt            <= 0;
            end
            else
            begin
              state                 <= ST_IDLE;
              bit_algn_start_reg    <= bit_algn_start_reg;
              bit_algn_done_reg     <= bit_algn_done_reg;
              bit_algn_clr_flgs_reg <= bit_algn_clr_flgs_reg;
              bit_algn_load_reg     <= bit_algn_load_reg;
              bit_algn_move_reg     <= bit_algn_move_reg;
              bit_algn_dir_reg      <= bit_algn_dir_reg;
              tap_cnt               <= 8'd0;
              wait_cnt              <= 3'd0;
              cnt                   <= cnt + 1'b1;
              delay_done_r          <= 1'b0;
              win_valid_cnt         <= 0;
              no_early_no_late_flg  <= 0;
              tap_pulse             <= 0;
              ely_flg_cnt           <= 0;
              lt_flg_cnt            <= 0;
            end  
          end

          ST_LOAD:
          begin
            if(&cnt)
            begin
              state                 <= ST_TAP_CNT_INIT;
              bit_algn_start_reg    <= 1'b1;
              bit_algn_done_reg     <= 1'b0;
              bit_algn_clr_flgs_reg <= 1'b0;
              bit_algn_load_reg     <= 1'b0;
              bit_algn_move_reg     <= 1'b0;
              bit_algn_dir_reg      <= 1'b1;
              tap_cnt               <= 8'd0;
              wait_cnt              <= 3'd0;
              cnt                   <= cnt + 1'b1;
              delay_done_r          <= 1'b0;
              win_valid_cnt         <= 0;
              no_early_no_late_flg  <= 0;
              tap_pulse             <= 0;
              ely_flg_cnt           <= 0;
              lt_flg_cnt            <= 0;
            end
            else
            begin
              state                 <= ST_LOAD;
              bit_algn_start_reg    <= bit_algn_start_reg;
              bit_algn_done_reg     <= bit_algn_done_reg;
              bit_algn_clr_flgs_reg <= bit_algn_clr_flgs_reg;
              bit_algn_load_reg     <= bit_algn_load_reg;
              bit_algn_move_reg     <= bit_algn_move_reg;
              bit_algn_dir_reg      <= bit_algn_dir_reg;
              tap_cnt               <= 8'd0;
              wait_cnt              <= 3'd0;
              cnt                   <= cnt + 1'b1;
              delay_done_r          <= 1'b0;
              win_valid_cnt         <= 0;
              no_early_no_late_flg  <= 0;
              tap_pulse             <= 0;
              ely_flg_cnt           <= 0;
              lt_flg_cnt            <= 0;
            end
          end

          ST_CLR_FLG:
          begin
           if(&cnt)
           begin
             state                 <= bit_algn_dir_reg ? ST_TAP_INCR : ST_TAP_DECRE;
             bit_algn_start_reg    <= 1'b1;
             bit_algn_done_reg     <= 1'b0;
             bit_algn_clr_flgs_reg <= 1'b1;
             bit_algn_load_reg     <= 1'b0;
             bit_algn_move_reg     <= 1'b0;
             bit_algn_dir_reg      <= bit_algn_dir_reg;
             tap_cnt               <= tap_cnt;
             wait_cnt              <= 0;
             cnt                   <= cnt + 1;
             delay_done_r          <= delay_done_r;
             win_valid_cnt         <= no_early_no_late_flg ? win_valid_cnt : 0;
             no_early_no_late_flg  <= !early_late_flg_w;
             tap_pulse             <= 0;
             ely_flg_cnt           <= 0;
             lt_flg_cnt            <= 0;
           end
           else
           begin
             state                 <= state;
             bit_algn_start_reg    <= 1'b1;
             bit_algn_done_reg     <= 1'b0;
             bit_algn_clr_flgs_reg <= 1'b0;
             bit_algn_load_reg     <= 1'b0;
             bit_algn_move_reg     <= 1'b1;
             bit_algn_dir_reg      <= bit_algn_dir_reg;
             tap_cnt               <= tap_cnt;
             wait_cnt              <= 0;
             cnt                   <= cnt + 1;
             delay_done_r          <= delay_done_r;
             win_valid_cnt         <= no_early_no_late_flg ? win_valid_cnt : 0;
             no_early_no_late_flg  <= !early_late_flg_w;
             tap_pulse             <= 0;
             ely_flg_cnt           <= 0;
             lt_flg_cnt            <= 0;
           end  
          end

          ST_TAP_CNT_INIT:
          begin
            if((delay_data_reg == 0) && !delay_done_r)
            begin
              state                 <= ST_DONE;
              bit_algn_start_reg    <= 1'b1;
              bit_algn_done_reg     <= 1'b0;
              bit_algn_clr_flgs_reg <= 1'b1;
              bit_algn_load_reg     <= 1'b0;
              bit_algn_move_reg     <= 1'b0;
              bit_algn_dir_reg      <= 1'b1;
              tap_cnt               <= tap_cnt;
              wait_cnt              <= 0;
              cnt                   <= 0;
              delay_done_r          <= delay_done_r;
              win_valid_cnt         <= win_valid_cnt;
              no_early_no_late_flg  <= !early_late_flg_w;
              tap_pulse             <= 0;
              ely_flg_cnt           <= 0;
              lt_flg_cnt            <= 0;
            end
            else if(&wait_cnt)
            begin
              state                 <= ST_MOVE;
              bit_algn_start_reg    <= 1'b1;
              bit_algn_done_reg     <= 1'b0;
              bit_algn_clr_flgs_reg <= 1'b0;
              bit_algn_load_reg     <= 1'b0;
              bit_algn_move_reg     <= 1'b0;
              bit_algn_dir_reg      <= bit_algn_dir_reg;
              tap_cnt               <= tap_cnt;
              wait_cnt              <= 3'd0;
              cnt                   <= cnt + 1'b1;
              delay_done_r          <= delay_done_r;
              win_valid_cnt         <= no_early_no_late_flg ? win_valid_cnt : 0;
              no_early_no_late_flg  <= !early_late_flg_w;
              tap_pulse             <= 0;
              ely_flg_cnt           <= 0;
              lt_flg_cnt            <= 0;
            end
            else
            begin
              state                 <= ST_TAP_CNT_INIT;
              bit_algn_start_reg    <= bit_algn_start_reg;
              bit_algn_done_reg     <= bit_algn_done_reg;
              bit_algn_clr_flgs_reg <= 1'b0;
              bit_algn_load_reg     <= 1'b0;
              bit_algn_move_reg     <= 1'b0;
              bit_algn_dir_reg      <= bit_algn_dir_reg;
              tap_cnt               <= tap_cnt;
              wait_cnt              <= wait_cnt + 1'b1;
              cnt                   <= cnt + 1'b1;
              delay_done_r          <= delay_done_r;
              win_valid_cnt         <= no_early_no_late_flg ? win_valid_cnt : 0;
              no_early_no_late_flg  <= !early_late_flg_w;
              tap_pulse             <= 0;
              ely_flg_cnt           <= 0;
              lt_flg_cnt            <= 0;
            end
          end

          ST_MOVE:
          begin
            if(delay_done_r)
            begin
              if(!lp_in_reg)
              begin
                state                 <= ST_CLR_FLG;
                bit_algn_start_reg    <= bit_algn_start_reg;
                bit_algn_done_reg     <= bit_algn_done_reg;
                bit_algn_clr_flgs_reg <= 1'b0;
                bit_algn_load_reg     <= 1'b0;
                bit_algn_move_reg     <= 1'b1;
                bit_algn_dir_reg      <= bit_algn_dir_reg;
                tap_cnt               <= bit_algn_dir_reg ? tap_cnt + 1 : tap_cnt - 1;
                wait_cnt              <= wait_cnt;
                cnt                   <= 0;
                delay_done_r          <= delay_done_r;
                win_valid_cnt         <= (win_valid_cnt == win_len_reg) ? win_valid_cnt : no_early_no_late_flg ? win_valid_cnt + 1 : 0;
                no_early_no_late_flg  <= !early_late_flg_w;
                tap_pulse             <= 0;
                ely_flg_cnt           <= 0;
                lt_flg_cnt            <= 0;
              end
              else
              begin
                state                 <= ST_MOVE;
                bit_algn_start_reg    <= bit_algn_start_reg;
                bit_algn_done_reg     <= bit_algn_done_reg;
                bit_algn_clr_flgs_reg <= 1'b1;
                bit_algn_load_reg     <= 1'b0;
                bit_algn_move_reg     <= 1'b0;
                bit_algn_dir_reg      <= bit_algn_dir_reg;
                tap_cnt               <= tap_cnt;
                wait_cnt              <= 0;
                cnt                   <= 0;
                delay_done_r          <= delay_done_r;
                win_valid_cnt         <= no_early_no_late_flg ? win_valid_cnt : 0;
                no_early_no_late_flg  <= !early_late_flg_w;
                tap_pulse             <= 0;
                ely_flg_cnt           <= 0;
                lt_flg_cnt            <= 0;
              end
            end
            else
            begin
              state                 <= ST_CLR_FLG;
              bit_algn_start_reg    <= bit_algn_start_reg;
              bit_algn_done_reg     <= bit_algn_done_reg;
              bit_algn_clr_flgs_reg <= 1'b0;
              bit_algn_load_reg     <= 1'b0;
              bit_algn_move_reg     <= 1'b1;
              bit_algn_dir_reg      <= bit_algn_dir_reg;
              tap_cnt               <= bit_algn_dir_reg ? tap_cnt + 1 : tap_cnt - 1;
              wait_cnt              <= wait_cnt;
              cnt                   <= 0;
              delay_done_r          <= delay_done_r;
              win_valid_cnt         <= no_early_no_late_flg ? win_valid_cnt : 0;
              no_early_no_late_flg  <= !early_late_flg_w;
              tap_pulse             <= 0;
              ely_flg_cnt           <= 0;
              lt_flg_cnt            <= 0;
            end
          end

          ST_TAP_INCR:
          begin
            if((tap_cnt == delay_data_reg) && (&wait_cnt) && !delay_done_r)
            begin
              state                 <= ST_DONE;
              bit_algn_start_reg    <= 1'b1;
              bit_algn_done_reg     <= 1'b0;
              bit_algn_clr_flgs_reg <= 1'b1;
              bit_algn_load_reg     <= 1'b0;
              bit_algn_move_reg     <= 1'b0;
              bit_algn_dir_reg      <= 1'b1;
              tap_cnt               <= tap_cnt;
              wait_cnt              <= 0;
              cnt                   <= cnt + 1;
              delay_done_r          <= delay_done_r;
              win_valid_cnt         <= win_valid_cnt;
              no_early_no_late_flg  <= !early_late_flg_w;
              tap_pulse             <= 0;
              ely_flg_cnt           <= 0;
              lt_flg_cnt            <= 0;
            end
            else if((tap_cnt == tap_cnt_final) && (&wait_cnt) && delay_done_r)
            begin
              state                 <= ST_DONE;
              bit_algn_start_reg    <= 1'b0;
              bit_algn_done_reg     <= 1'b1;
              bit_algn_clr_flgs_reg <= 1'b0;
              bit_algn_load_reg     <= 1'b0;
              bit_algn_move_reg     <= 1'b0;
              bit_algn_dir_reg      <= 1'b1;
              tap_cnt               <= tap_cnt;
              wait_cnt              <= 0;
              cnt                   <= cnt + 1;
              delay_done_r          <= delay_done_r;
              win_valid_cnt         <= win_valid_cnt;
              no_early_no_late_flg  <= !early_late_flg_w;
              tap_pulse             <= 0;
              ely_flg_cnt           <= 0;
              lt_flg_cnt            <= 0;
            end
            else if((win_valid_cnt == win_len_reg) && (&wait_cnt) && delay_done_r)
            begin
              state                 <= ST_TAP_CNT_INIT;
              bit_algn_start_reg    <= 1'b1;
              bit_algn_done_reg     <= 1'b0;
              bit_algn_clr_flgs_reg <= 1'b1;
              bit_algn_load_reg     <= 1'b0;
              bit_algn_move_reg     <= 1'b0;
              bit_algn_dir_reg      <= 1'b0;
              tap_cnt               <= tap_cnt;
              wait_cnt              <= 0;
              cnt                   <= cnt + 1;
              delay_done_r          <= delay_done_r;
              win_valid_cnt         <= win_valid_cnt;
              no_early_no_late_flg  <= !early_late_flg_w;
              tap_pulse             <= 1;
              ely_flg_cnt           <= 0;
              lt_flg_cnt            <= 0;
            end
            else if(&wait_cnt && iod_OOR_r)
            begin
              state                 <= ST_IDLE;
              bit_algn_start_reg    <= 1'b1;
              bit_algn_done_reg     <= 1'b0;
              bit_algn_clr_flgs_reg <= 1'b0;
              bit_algn_load_reg     <= 1'b0;
              bit_algn_move_reg     <= 1'b0;
              bit_algn_dir_reg      <= bit_algn_dir_reg;
              tap_cnt               <= tap_cnt;
              wait_cnt              <= 0;
              cnt                   <= cnt + 1;
              delay_done_r          <= delay_done_r;
              win_valid_cnt         <= win_valid_cnt;
              no_early_no_late_flg  <= !early_late_flg_w;
              tap_pulse             <= 0;
              ely_flg_cnt           <= 0;
              lt_flg_cnt            <= 0;
            end
            else if(&wait_cnt)
            begin
              state                 <= ST_MOVE;
              bit_algn_start_reg    <= 1'b1;
              bit_algn_done_reg     <= 1'b0;
              bit_algn_clr_flgs_reg <= 1'b0;
              bit_algn_load_reg     <= 1'b0;
              bit_algn_move_reg     <= 1'b0;
              bit_algn_dir_reg      <= bit_algn_dir_reg;
              tap_cnt               <= tap_cnt;
              wait_cnt              <= 0;
              cnt                   <= cnt + 1;
              delay_done_r          <= delay_done_r;
              win_valid_cnt         <= win_valid_cnt;
              no_early_no_late_flg  <= !early_late_flg_w;
              tap_pulse             <= 0;
              ely_flg_cnt           <= 0;
              lt_flg_cnt            <= 0;
            end
            else if(&cnt)
            begin
              state                 <= state;
              bit_algn_start_reg    <= 1'b1;
              bit_algn_done_reg     <= 1'b0;
              bit_algn_clr_flgs_reg <= 1'b0;
              bit_algn_load_reg     <= 1'b0;
              bit_algn_move_reg     <= 1'b0;
              bit_algn_dir_reg      <= bit_algn_dir_reg;
              tap_cnt               <= tap_cnt;
              wait_cnt              <= wait_cnt + 1;
              cnt                   <= cnt;
              delay_done_r          <= delay_done_r;
              win_valid_cnt         <= win_valid_cnt;
              no_early_no_late_flg  <= !early_late_flg_w;
              tap_pulse             <= 0;
              ely_flg_cnt           <= 0;
              lt_flg_cnt            <= 0;
            end
            else
            begin
              state                 <= state;
              bit_algn_start_reg    <= bit_algn_start_reg;
              bit_algn_done_reg     <= bit_algn_done_reg;
              bit_algn_clr_flgs_reg <= 1'b1;
              bit_algn_load_reg     <= 1'b0;
              bit_algn_move_reg     <= 1'b0;
              bit_algn_dir_reg      <= bit_algn_dir_reg;
              tap_cnt               <= tap_cnt;
              wait_cnt              <= wait_cnt + 1;
              cnt                   <= cnt + 1;
              delay_done_r          <= delay_done_r;
              win_valid_cnt         <= no_early_no_late_flg ? win_valid_cnt : 0;
              no_early_no_late_flg  <= !early_late_flg_w;
              tap_pulse             <= 0;
              ely_flg_cnt           <= 0;
              lt_flg_cnt            <= 0;
            end  
          end

          ST_TAP_DECRE:
          begin
            if((tap_cnt == delay_data_reg) && (&wait_cnt) && !delay_done_r)
            begin
              state                 <= ST_DONE;
              bit_algn_start_reg    <= 1'b1;
              bit_algn_done_reg     <= 1'b0;
              bit_algn_clr_flgs_reg <= 1'b0;
              bit_algn_load_reg     <= 1'b0;
              bit_algn_move_reg     <= 1'b0;
              bit_algn_dir_reg      <= 1'b0;
              tap_cnt               <= tap_cnt;
              wait_cnt              <= 0;
              cnt                   <= cnt + 1;
              delay_done_r          <= delay_done_r;
              win_valid_cnt         <= win_valid_cnt;
              no_early_no_late_flg  <= !early_late_flg_w;
              tap_pulse             <= 0;
              ely_flg_cnt           <= 0;
              lt_flg_cnt            <= 0;
            end
            else if((tap_cnt == tap_cnt_final) && (&wait_cnt) && delay_done_r)
            begin
              state                 <= ST_DONE;
              bit_algn_start_reg    <= 1'b0;
              bit_algn_done_reg     <= 1'b1;
              bit_algn_clr_flgs_reg <= 1'b0;
              bit_algn_load_reg     <= 1'b0;
              bit_algn_move_reg     <= 1'b0;
              bit_algn_dir_reg      <= 1'b0;
              tap_cnt               <= tap_cnt;
              wait_cnt              <= 0;
              cnt                   <= cnt + 1;
              delay_done_r          <= delay_done_r;
              win_valid_cnt         <= win_valid_cnt;
              no_early_no_late_flg  <= !early_late_flg_w;
              tap_pulse             <= 0;
              ely_flg_cnt           <= 0;
              lt_flg_cnt            <= 0;
            end
            else if((win_valid_cnt == win_len_reg) && (&wait_cnt) && re_train)
            begin
              state                 <= ST_TAP_CNT_INIT;
              bit_algn_start_reg    <= 1'b1;
              bit_algn_done_reg     <= 1'b0;
              bit_algn_clr_flgs_reg <= 1'b1;
              bit_algn_load_reg     <= 1'b0;
              bit_algn_move_reg     <= 1'b0;
              bit_algn_dir_reg      <= 1'b1;
              tap_cnt               <= tap_cnt;
              wait_cnt              <= 0;
              cnt                   <= cnt + 1;
              delay_done_r          <= delay_done_r;
              win_valid_cnt         <= 0;
              no_early_no_late_flg  <= !early_late_flg_w;
              tap_pulse             <= 1;
              ely_flg_cnt           <= 0;
              lt_flg_cnt            <= 0;
            end
            else if(&wait_cnt && iod_OOR_r)
            begin
              state                 <= ST_IDLE;
              bit_algn_start_reg    <= 1'b1;
              bit_algn_done_reg     <= 1'b0;
              bit_algn_clr_flgs_reg <= 1'b0;
              bit_algn_load_reg     <= 1'b0;
              bit_algn_move_reg     <= 1'b0;
              bit_algn_dir_reg      <= bit_algn_dir_reg;
              tap_cnt               <= tap_cnt;
              wait_cnt              <= 0;
              cnt                   <= cnt + 1;
              delay_done_r          <= delay_done_r;
              win_valid_cnt         <= win_valid_cnt;
              no_early_no_late_flg  <= !early_late_flg_w;
              tap_pulse             <= 0;
              ely_flg_cnt           <= 0;
              lt_flg_cnt            <= 0;
            end
            else if(&wait_cnt)
            begin
              state                 <= ST_MOVE;
              bit_algn_start_reg    <= 1'b1;
              bit_algn_done_reg     <= 1'b0;
              bit_algn_clr_flgs_reg <= 1'b0;
              bit_algn_load_reg     <= 1'b0;
              bit_algn_move_reg     <= 1'b0;
              bit_algn_dir_reg      <= bit_algn_dir_reg;
              tap_cnt               <= tap_cnt;
              wait_cnt              <= 0;
              cnt                   <= cnt + 1;
              delay_done_r          <= delay_done_r;
              win_valid_cnt         <= win_valid_cnt;
              no_early_no_late_flg  <= !early_late_flg_w;
              tap_pulse             <= 0;
              ely_flg_cnt           <= 0;
              lt_flg_cnt            <= 0;
            end
            else if(&cnt)
            begin
              state                 <= state;
              bit_algn_start_reg    <= 1'b1;
              bit_algn_done_reg     <= 1'b0;
              bit_algn_clr_flgs_reg <= 1'b0;
              bit_algn_load_reg     <= 1'b0;
              bit_algn_move_reg     <= 1'b0;
              bit_algn_dir_reg      <= bit_algn_dir_reg;
              tap_cnt               <= tap_cnt;
              wait_cnt              <= wait_cnt + 1;
              cnt                   <= cnt;
              delay_done_r          <= delay_done_r;
              win_valid_cnt         <= win_valid_cnt;
              no_early_no_late_flg  <= !early_late_flg_w;
              tap_pulse             <= 0;
              ely_flg_cnt           <= 0;
              lt_flg_cnt            <= 0;
            end
            else
            begin
              state                 <= state;
              bit_algn_start_reg    <= bit_algn_start_reg;
              bit_algn_done_reg     <= bit_algn_done_reg;
              bit_algn_clr_flgs_reg <= 1'b1;
              bit_algn_load_reg     <= 1'b0;
              bit_algn_move_reg     <= 1'b0;
              bit_algn_dir_reg      <= bit_algn_dir_reg;
              tap_cnt               <= tap_cnt;
              wait_cnt              <= wait_cnt + 1;
              cnt                   <= cnt + 1;
              delay_done_r          <= delay_done_r;
              win_valid_cnt         <= no_early_no_late_flg ? win_valid_cnt : 0;
              no_early_no_late_flg  <= !early_late_flg_w;
              tap_pulse             <= 0;
              ely_flg_cnt           <= 0;
              lt_flg_cnt            <= 0;
            end  
          end

          ST_DONE:
          begin
            if(delay_change)
            begin
              state                 <= ST_TAP_CNT_INIT;
              bit_algn_start_reg    <= 1'b1;
              bit_algn_done_reg     <= bit_algn_done_reg;
              bit_algn_clr_flgs_reg <= 1'b0;
              bit_algn_load_reg     <= 1'b0;
              bit_algn_move_reg     <= 1'b0;
              bit_algn_dir_reg      <= (tap_cnt > TAP_DELAYS_I) ? 1'b0 : 1'b1;
              tap_cnt               <= tap_cnt;
              wait_cnt              <= 0;
              cnt                   <= 0;
              delay_done_r          <= 1'b0;
              win_valid_cnt         <= win_valid_cnt;
              no_early_no_late_flg  <= 0;
              tap_pulse             <= 0;
              ely_flg_cnt           <= 0;
              lt_flg_cnt            <= 0;
            end
            else if(false_late_flg)
            begin
              state                 <= bit_algn_done_reg ? ST_TAP_CNT_INIT : ST_DONE;
              bit_algn_start_reg    <= bit_algn_start_reg;
              bit_algn_done_reg     <= 1'b0;
              bit_algn_clr_flgs_reg <= 1'b0;
              bit_algn_load_reg     <= 1'b0;
              bit_algn_move_reg     <= 1'b0;
              bit_algn_dir_reg      <= 1'b1;
              tap_cnt               <= tap_cnt;
              wait_cnt              <= 0;
              cnt                   <= 0;
              delay_done_r          <= 1'b1;
              win_valid_cnt         <= bit_algn_done_reg ? 0 : win_valid_cnt;
              no_early_no_late_flg  <= !early_late_flg_w;
              tap_pulse             <= 0;
              ely_flg_cnt           <= 0;
              lt_flg_cnt            <= 0;
            end
            else if(false_early_flg)
            begin
              state                 <= bit_algn_done_reg ? ST_TAP_CNT_INIT : ST_DONE;
              bit_algn_start_reg    <= bit_algn_start_reg;
              bit_algn_done_reg     <= 1'b0;
              bit_algn_clr_flgs_reg <= 1'b0;
              bit_algn_load_reg     <= 1'b0;
              bit_algn_move_reg     <= 1'b0;
              bit_algn_dir_reg      <= 1'b0;
              tap_cnt               <= tap_cnt;
              wait_cnt              <= 0;
              cnt                   <= 0;
              delay_done_r          <= 1'b1;
              win_valid_cnt         <= bit_algn_done_reg ? 0 : win_valid_cnt;
              no_early_no_late_flg  <= !early_late_flg_w;
              tap_pulse             <= 0;
              ely_flg_cnt           <= 0;
              lt_flg_cnt            <= 0;
            end
            else if(delay_done_r && !lp_in_reg)
            begin
              state                 <= bit_algn_done_reg ? ST_DONE : ST_TAP_CNT_INIT;
              bit_algn_start_reg    <= bit_algn_start_reg;
              bit_algn_done_reg     <= bit_algn_done_reg;
              bit_algn_clr_flgs_reg <= (early_first || late_first) ? 1'b1 : 1'b0;
              bit_algn_load_reg     <= 1'b0;
              bit_algn_move_reg     <= 1'b0;
              bit_algn_dir_reg      <= bit_algn_dir_reg;
              tap_cnt               <= tap_cnt;
              wait_cnt              <= 0;
              cnt                   <= 0;
              delay_done_r          <= 1'b1;
              win_valid_cnt         <= bit_algn_done_reg ? 0 : win_valid_cnt;
              no_early_no_late_flg  <= !early_late_flg_w;
              tap_pulse             <= 0;
              ely_flg_cnt           <= (bit_algn_done_reg && early_pulse) ? ely_flg_cnt + 1 : ely_flg_cnt;
              lt_flg_cnt            <= (bit_algn_done_reg && late_pulse) ? lt_flg_cnt + 1 : lt_flg_cnt;
            end
            else
            begin
              state                 <= ST_DONE;
              bit_algn_start_reg    <= bit_algn_start_reg;
              bit_algn_done_reg     <= bit_algn_done_reg;
              bit_algn_clr_flgs_reg <= (early_first || late_first) ? 1'b1 : 1'b0;
              bit_algn_load_reg     <= 1'b0;
              bit_algn_move_reg     <= 1'b0;
              bit_algn_dir_reg      <= bit_algn_dir_reg;
              tap_cnt               <= tap_cnt;
              wait_cnt              <= 0;
              cnt                   <= 0;
              delay_done_r          <= 1'b1;
              win_valid_cnt         <= 0;
              no_early_no_late_flg  <= !early_late_flg_w;
              tap_pulse             <= 0;
              ely_flg_cnt           <= (bit_algn_done_reg && early_pulse) ? ely_flg_cnt + 1 : ely_flg_cnt;
              lt_flg_cnt            <= (bit_algn_done_reg && late_pulse) ? lt_flg_cnt + 1 : lt_flg_cnt;
            end
          end

          default:
          begin
            state                 <= ST_IDLE;
            bit_algn_start_reg    <= 1'b1;
            bit_algn_done_reg     <= 1'b0;
            bit_algn_clr_flgs_reg <= 1'b0;
            bit_algn_load_reg     <= 1'b0;
            bit_algn_move_reg     <= 1'b0;
            bit_algn_dir_reg      <= 1'b1;
            tap_cnt               <= 0;
            wait_cnt              <= 0;
            cnt                   <= 0;
            iod_early_r           <= 0;
            iod_late_r            <= 0;
            iod_OOR_r             <= 0;
            delay_done_r          <= 1'b0;
            win_valid_cnt         <= 0;
            no_early_no_late_flg  <= 0;
            tap_pulse             <= 0;
            ely_flg_cnt           <= 0;
            lt_flg_cnt            <= 0;
          end
        endcase
      end
      else
      begin
         state                 <= state;
          bit_algn_start_reg    <= bit_algn_start_reg;
          bit_algn_clr_flgs_reg <= 1'b1;
          bit_algn_done_reg     <= bit_algn_done_reg;
          bit_algn_load_reg     <= 1'b0;
          bit_algn_move_reg     <= 1'b0;
          bit_algn_dir_reg      <= bit_algn_dir_reg;
          tap_cnt               <= tap_cnt;
          wait_cnt              <= wait_cnt;
          cnt                   <= cnt;
          delay_done_r          <= delay_done_r;
          win_valid_cnt         <= win_valid_cnt;
          no_early_no_late_flg  <= !early_late_flg_w;
          tap_pulse             <= tap_pulse;
          ely_flg_cnt           <= 0;
          lt_flg_cnt            <= 0;
      end
    end
  end
end
endgenerate


endmodule