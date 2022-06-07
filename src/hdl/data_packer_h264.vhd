--=================================================================================================
-- File Name                           : data_packer_h264.vhd
-- Targeted device                     : Microsemi-SoC
-- Author                              : India Solutions Team
--
-- COPYRIGHT 2019 BY MICROSEMI
-- THE INFORMATION CONTAINED IN THIS DOCUMENT IS SUBJECT TO LICENSING RESTRICTIONS FROM MICROSEMI
-- CORP. IF YOU ARE NOT IN POSSESSION OF WRITTEN AUTHORIZATION FROM MICROSEMI FOR USE OF THIS
-- FILE, THEN THE FILE SHOULD BE IMMEDIATELY DESTROYED AND NO BACK-UP OF THE FILE SHOULD BE MADE.
--
--=================================================================================================

--=================================================================================================
-- Libraries
--=================================================================================================
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.math_real."ceil";
use IEEE.math_real."log2";
--=================================================================================================
-- data_packer_h264 entity declaration
--=================================================================================================
entity data_packer_h264 is
  generic(
-- Generic list
    g_IP_DW          : integer := 8; -- input data width should be powers of 2
    g_OP_DW          : integer := 512   -- output data width 
    );
  port(
-- Port list
    -- System reset
    reset_i : in std_logic;

    -- System clock
    sys_clk_i : in std_logic;

    -- enable
    data_valid_i : in std_logic;

    --Frame end input
    frame_end_i : in std_logic;
    
    --buffer write done from write controller
    buf_wr_done_i : in std_logic;

    -- Data Input
    data_i : in std_logic_vector(g_IP_DW-1 downto 0);

    -- Data Enable
    data_valid_o : out std_logic;

    -- Start DDR write
    start_ddr_w_o : out std_logic;

    --burst length
    s_wlen_o : out std_logic_vector(7 downto 0);

    -- Data output
    data_o : out std_logic_vector(g_OP_DW-1 downto 0)

    );
end data_packer_h264;

--=================================================================================================
-- data_packer_h264 architecture body
--=================================================================================================

architecture data_packer_h264 of data_packer_h264 is

--=================================================================================================
-- Component declarations
--=================================================================================================
--NA--
--=================================================================================================
-- Synthesis Attributes
--=================================================================================================
--NA--
--=================================================================================================
-- Signal declarations
--=================================================================================================
  CONSTANT C_MC             : INTEGER := g_OP_DW / g_IP_DW;--max count
  CONSTANT C_CW             : INTEGER := integer(ceil(log2(real(C_MC))));--counter width
  CONSTANT C_MAX_WLEN       : INTEGER := 32;--max burst length/ number of data valids
  TYPE DATA_ARRAY IS ARRAY (0 to C_MC-1) OF STD_LOGIC_VECTOR(g_IP_DW-1 DOWNTO 0);
  signal s_data_arr	        : DATA_ARRAY;
  signal s_counter          : std_logic_vector(C_CW-1 downto 0); -- input data count
  signal s_data_pack        : std_logic_vector(g_OP_DW-1 downto 0);  
  signal s_h_count          : std_logic_vector(7 downto 0); -- outpt data count
  signal s_wlen             : std_logic_vector(7 downto 0);
  signal s_frame_end_sr     : std_logic_vector(5 downto 0);  
  signal s_frame_end_re     : std_logic;
  signal s_frame_end_re_dly : std_logic;
  signal s_buf_wr_done_dly1 : std_logic;
  signal s_buf_wr_done_dly2 : std_logic;  
  signal s_wstrt            : std_logic;
  signal s_wstrt_ctr_en     : std_logic;
  signal s_wstrt_ctr        : std_logic_vector(2 downto 0);
  signal s_ddr_start        : std_logic;
  signal s_ones             : std_logic_vector(C_CW-1 downto 0);

begin

--=================================================================================================
-- Top level output port assignments
--=================================================================================================  
  data_o        <= s_data_pack;
  s_wlen_o      <= s_wlen;
  start_ddr_w_o <= s_ddr_start;
--=================================================================================================
-- Generate blocks
--=================================================================================================
--------------------------------------------------------------------------
-- Name       : GENERATE_DATA_PACK
-- Description: data packing
--------------------------------------------------------------------------  
GENERATE_DATA_PACK: FOR I IN 0 TO C_MC-1 GENERATE
  s_data_pack(g_IP_DW*(I+1)-1 DOWNTO g_IP_DW*I) <= s_data_arr(I);
  DATA_PACK_PROC:
    PROCESS(SYS_CLK_I,RESET_I)
    BEGIN
       IF (RESET_I = '0') THEN
          s_data_arr(I)          <= (OTHERS=>'0'); 
       ELSIF rising_edge(SYS_CLK_I) THEN
          IF(data_valid_i = '1' AND s_counter = 0) THEN
             IF (I > 0) THEN
               s_data_arr(I)     <= (OTHERS=>'0');
             ELSE
               s_data_arr(I)     <= data_i;
             END IF;  
          ELSIF(data_valid_i = '1' AND s_counter = I) THEN
             s_data_arr(I)       <= data_i; 
          END IF;
       END IF;
    END PROCESS;
END GENERATE GENERATE_DATA_PACK;
--=================================================================================================
-- Asynchronous blocks
--=================================================================================================
  s_frame_end_re <= s_frame_end_sr(4) and not(s_frame_end_sr(5));
  s_ones         <= (others => '1');
--=================================================================================================
-- Synchronous blocks
--=================================================================================================

--------------------------------------------------------------------------
-- Name       : DELAY
-- Description: Process delays input signals
--------------------------------------------------------------------------
  DELAY :
  process(SYS_CLK_I, RESET_I)
  begin
    if RESET_I = '0' then
      s_frame_end_sr <= (others => '0');
      s_frame_end_re_dly <= '0';
      s_buf_wr_done_dly1 <= '0';
      s_buf_wr_done_dly2 <= '0';
    elsif rising_edge(SYS_CLK_I) then
      s_frame_end_sr     <= s_frame_end_sr(4 downto 0) & frame_end_i;
      s_frame_end_re_dly <= s_frame_end_re;
      s_buf_wr_done_dly1 <= buf_wr_done_i;
      s_buf_wr_done_dly2 <= s_buf_wr_done_dly1;
    end if;
  end process;

--------------------------------------------------------------------------
-- Name       : H_COUNTER
-- Description: Counter to count horizontal pixels
--------------------------------------------------------------------------
  H_COUNTER :
  process(SYS_CLK_I, RESET_I)
  begin
    if RESET_I = '0' then
      s_h_count <= (others => '0');
    elsif rising_edge(SYS_CLK_I) then      
      if(s_h_count = C_MAX_WLEN OR (s_frame_end_re_dly = '1' AND s_buf_wr_done_dly2 = '1') )then --
        s_h_count <= (others => '0');
      elsif(data_valid_o = '1')then --assuming min 1 cycle gap between each data_valid_o
        s_h_count <= s_h_count + '1';  
      end if;
    end if;
  end process;

--------------------------------------------------------------------------
-- Name       : WLEN_PROC
-- Description: Process latches s_h_count
--------------------------------------------------------------------------
  WLEN_PROC :
  process(SYS_CLK_I, RESET_I)
  begin
    if RESET_I = '0' then
      s_wlen  <= (others => '0');
      s_wstrt <= '0';
    elsif rising_edge(SYS_CLK_I) then
      if(s_buf_wr_done_dly2 = '1' AND s_frame_end_re = '1' AND s_counter /= 0)then
        s_wlen    <= s_h_count + 1;
        s_wstrt   <= '1';
      elsif (s_buf_wr_done_dly2 = '1' AND s_frame_end_re = '1' AND s_h_count /= 0) then
        s_wlen    <= s_h_count;
        s_wstrt   <= '1';      
      elsif(s_h_count = C_MAX_WLEN)then
        s_wlen    <= std_logic_vector(to_unsigned(C_MAX_WLEN,8)); 
        s_wstrt   <= '1'; 
      else
        s_wstrt   <= '0';  
      end if;
    end if;
  end process;

--------------------------------------------------------------------------
-- Name       : DATA_VALID_FE_COUNTER
-- Description: PROCESS to extend data_valid falling edge signal to 4 clock cycles
--------------------------------------------------------------------------
  DATA_VALID_FE_COUNTER :
  process(SYS_CLK_I, RESET_I)
  begin
    if RESET_I = '0' then
      s_wstrt_ctr      <= (others => '0');
      s_wstrt_ctr_en   <= '0';
      s_ddr_start <= '0';
    elsif rising_edge(SYS_CLK_I) then
      if(s_wstrt = '1')then
        s_wstrt_ctr_en   <= '1';
        s_ddr_start <= '1';
      elsif(s_wstrt_ctr = x"4")then
        s_wstrt_ctr_en   <= '0';
        s_ddr_start <= '0';
      end if;
      
      if(s_wstrt_ctr_en = '1')then
        s_wstrt_ctr <= s_wstrt_ctr + '1';
      else
        s_wstrt_ctr <= (others => '0');
      end if;

    end if;
  end process;

--------------------------------------------------------------------------
-- Name       : DATA_COUNTER
-- Description: Counter to count data
--------------------------------------------------------------------------
  DATA_COUNTER :
  process(SYS_CLK_I, RESET_I)
  begin
    if RESET_I = '0' then
      s_counter <= (others => '0');
    elsif rising_edge(SYS_CLK_I) then
      if(data_valid_i = '1')then
        s_counter <= s_counter + '1';
      elsif (s_frame_end_re = '1') then
        s_counter <= (others => '0');  
      end if;
    end if;
  end process;

--------------------------------------------------------------------------
-- Name       : DATA_VALID
-- Description: Process to generate data valid output
--------------------------------------------------------------------------
  DATA_VALID :
  process(SYS_CLK_I, RESET_I)
  begin
    if RESET_I = '0' then
      data_valid_o <= '0';
    elsif rising_edge(SYS_CLK_I) then
      if ((data_valid_i = '1' AND s_counter = s_ones) OR 
         (s_frame_end_re = '1' AND s_counter /= 0)) then
        data_valid_o  <= '1';
      else
        data_valid_o  <= '0';
      end if;
    end if;
  end process;  
--------------------------------------------------------------------------
-- Name       : DATA_ASSIGN
-- Description: Process assigns data based on counter value
--------------------------------------------------------------------------
  --DATA_ASSIGN :
  --process(SYS_CLK_I, RESET_I)
  --begin
    --if RESET_I = '0' then
      --s_data_pack <= (others => '0');
    --elsif rising_edge(SYS_CLK_I) then
      --if(data_valid_i = '1' AND s_counter = 0) then
        --s_data_pack(g_OP_DW-g_IP_DW-1 downto 0)       <= (others => '0');
        --s_data_pack(g_OP_DW-1 downto g_OP_DW-g_IP_DW) <= data_i;
      --elsif(data_valid_i = '1') then
        --s_data_pack <= data_i & s_data_pack(g_OP_DW-1 downto g_IP_DW);   
      --elsif(s_data_align = '1') then   
        --s_data_pack <= x"00" & s_data_pack(g_OP_DW-1 downto g_IP_DW)
      --end if;
    --end if;
  --end process;
--=================================================================================================
-- Component Instantiations
--=================================================================================================
--NA--
end data_packer_h264;
