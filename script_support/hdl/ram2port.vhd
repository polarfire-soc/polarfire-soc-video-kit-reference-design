library ieee;
use ieee.STD_logic_1164.all;
use ieee.NUMERIc_std.all;
use IEEE.std_logic_unsigned.all;
entity ram2PORT is
generic (G_BUFF_AWIDTH: INTEGER := 10;
G_DWIDTH: integer := 64); port (WCLOck_i: in std_logic;
rclock_i: in STD_LOGIC;
WE_i: in STD_LOGIC;
rd_addr_i: in std_logic_vector(G_BUFF_AWIDTH-1 downto 0);
WR_ADDR_I: in std_loGIC_VECTOR(G_BUFF_AWIDTH-1 downto 0);
wr_data_i: in STD_logic_vector(G_DWIDTH-1 downto 0);
RD_DATA_O: out STD_LOGIC_VECtor(G_DWIDTH-1 downto 0));
end RAM2port;

architecture RAM2PORT of ram2port is

type O0II is array ((2**g_buff_awidth)-1 downto 0) of sTD_LOGIC_VECTOR(g_dwidth-1 downto 0);

signal l0ii: std_logiC_VECTOR(g_buff_awidth-1 downto 0);

signal IO1L: o0ii;

attribute SYN_RAMSTYLE: STRING;

attribute syn_raMSTYLE of IO1L: signal is "lsram";

begin
rd_daTA_O <= IO1L(to_integer(UNSIGNED(l0ii)));
i0ii:
process (WCLock_i)
begin
if (RISING_EDGE(wclock_i)) then
if (WE_i = '1') then
IO1L(To_integer(UNSIGNED(wr_addr_i))) <= wr_data_i;
end if;
end if;
end process;
O1ii:
process (RCLOCK_I)
begin
if (rising_edge(RCLOCK_I)) then
L0II <= RD_addr_i;
end if;
end process;
end RAM2PORT;
