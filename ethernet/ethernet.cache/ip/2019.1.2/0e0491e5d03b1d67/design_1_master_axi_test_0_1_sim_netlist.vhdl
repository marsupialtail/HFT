-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1.2 (lin64) Build 2615518 Fri Aug  9 15:53:29 MDT 2019
-- Date        : Tue Nov 19 18:33:03 2019
-- Host        : eecs-digital-37 running 64-bit Ubuntu 14.04.6 LTS
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_master_axi_test_0_1_sim_netlist.vhdl
-- Design      : design_1_master_axi_test_0_1
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_master_axi_test_v1_0_S00_AXIS is
  port (
    mst_exec_state_reg_0 : out STD_LOGIC;
    s00_axis_aclk : in STD_LOGIC;
    m00_axis_tready : in STD_LOGIC;
    s00_axis_tvalid : in STD_LOGIC;
    s00_axis_tlast : in STD_LOGIC;
    s00_axis_aresetn : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_master_axi_test_v1_0_S00_AXIS;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_master_axi_test_v1_0_S00_AXIS is
  signal fifo_wren : STD_LOGIC;
  signal mst_exec_state_i_1_n_0 : STD_LOGIC;
  signal \^mst_exec_state_reg_0\ : STD_LOGIC;
  signal write_pointer : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \write_pointer[0]_i_1_n_0\ : STD_LOGIC;
  signal \write_pointer[1]_i_1_n_0\ : STD_LOGIC;
  signal \write_pointer[2]_i_1_n_0\ : STD_LOGIC;
  signal writes_done : STD_LOGIC;
  signal writes_done_i_1_n_0 : STD_LOGIC;
  signal writes_done_i_2_n_0 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of mst_exec_state_i_1 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \write_pointer[2]_i_2\ : label is "soft_lutpair0";
begin
  mst_exec_state_reg_0 <= \^mst_exec_state_reg_0\;
mst_exec_state_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"08F80000"
    )
        port map (
      I0 => m00_axis_tready,
      I1 => s00_axis_tvalid,
      I2 => \^mst_exec_state_reg_0\,
      I3 => writes_done,
      I4 => s00_axis_aresetn,
      O => mst_exec_state_i_1_n_0
    );
mst_exec_state_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => '1',
      D => mst_exec_state_i_1_n_0,
      Q => \^mst_exec_state_reg_0\,
      R => '0'
    );
\write_pointer[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAA0000"
    )
        port map (
      I0 => write_pointer(0),
      I1 => m00_axis_tready,
      I2 => s00_axis_tvalid,
      I3 => \^mst_exec_state_reg_0\,
      I4 => s00_axis_aresetn,
      O => \write_pointer[0]_i_1_n_0\
    );
\write_pointer[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAA00000000"
    )
        port map (
      I0 => write_pointer(1),
      I1 => \^mst_exec_state_reg_0\,
      I2 => s00_axis_tvalid,
      I3 => m00_axis_tready,
      I4 => write_pointer(0),
      I5 => s00_axis_aresetn,
      O => \write_pointer[1]_i_1_n_0\
    );
\write_pointer[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAA0000"
    )
        port map (
      I0 => write_pointer(2),
      I1 => fifo_wren,
      I2 => write_pointer(1),
      I3 => write_pointer(0),
      I4 => s00_axis_aresetn,
      O => \write_pointer[2]_i_1_n_0\
    );
\write_pointer[2]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => m00_axis_tready,
      I1 => s00_axis_tvalid,
      I2 => \^mst_exec_state_reg_0\,
      O => fifo_wren
    );
\write_pointer_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => '1',
      D => \write_pointer[0]_i_1_n_0\,
      Q => write_pointer(0),
      R => '0'
    );
\write_pointer_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => '1',
      D => \write_pointer[1]_i_1_n_0\,
      Q => write_pointer(1),
      R => '0'
    );
\write_pointer_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => '1',
      D => \write_pointer[2]_i_1_n_0\,
      Q => write_pointer(2),
      R => '0'
    );
writes_done_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF2AAA00000000"
    )
        port map (
      I0 => writes_done,
      I1 => m00_axis_tready,
      I2 => s00_axis_tvalid,
      I3 => \^mst_exec_state_reg_0\,
      I4 => writes_done_i_2_n_0,
      I5 => s00_axis_aresetn,
      O => writes_done_i_1_n_0
    );
writes_done_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF80"
    )
        port map (
      I0 => write_pointer(2),
      I1 => write_pointer(0),
      I2 => write_pointer(1),
      I3 => s00_axis_tlast,
      O => writes_done_i_2_n_0
    );
writes_done_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => '1',
      D => writes_done_i_1_n_0,
      Q => writes_done,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_master_axi_test_v1_0 is
  port (
    mst_exec_state_reg : out STD_LOGIC;
    s00_axis_aclk : in STD_LOGIC;
    m00_axis_tready : in STD_LOGIC;
    s00_axis_tvalid : in STD_LOGIC;
    s00_axis_tlast : in STD_LOGIC;
    s00_axis_aresetn : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_master_axi_test_v1_0;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_master_axi_test_v1_0 is
begin
master_axi_test_v1_0_S00_AXIS_inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_master_axi_test_v1_0_S00_AXIS
     port map (
      m00_axis_tready => m00_axis_tready,
      mst_exec_state_reg_0 => mst_exec_state_reg,
      s00_axis_aclk => s00_axis_aclk,
      s00_axis_aresetn => s00_axis_aresetn,
      s00_axis_tlast => s00_axis_tlast,
      s00_axis_tvalid => s00_axis_tvalid
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    s00_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axis_tstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axis_tlast : in STD_LOGIC;
    s00_axis_tvalid : in STD_LOGIC;
    s00_axis_tready : out STD_LOGIC;
    s00_axis_aclk : in STD_LOGIC;
    s00_axis_aresetn : in STD_LOGIC;
    m00_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m00_axis_tstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m00_axis_tlast : out STD_LOGIC;
    m00_axis_tvalid : out STD_LOGIC;
    m00_axis_tready : in STD_LOGIC;
    m00_axis_aclk : in STD_LOGIC;
    m00_axis_aresetn : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "design_1_master_axi_test_0_1,master_axi_test_v1_0,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "master_axi_test_v1_0,Vivado 2019.1.2";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  signal \^s00_axis_tdata\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^s00_axis_tlast\ : STD_LOGIC;
  signal \^s00_axis_tstrb\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of m00_axis_aclk : signal is "xilinx.com:signal:clock:1.0 M00_AXIS_CLK CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of m00_axis_aclk : signal is "XIL_INTERFACENAME M00_AXIS_CLK, ASSOCIATED_BUSIF M00_AXIS, ASSOCIATED_RESET m00_axis_aresetn, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_1_clk_out1, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of m00_axis_aresetn : signal is "xilinx.com:signal:reset:1.0 M00_AXIS_RST RST";
  attribute X_INTERFACE_PARAMETER of m00_axis_aresetn : signal is "XIL_INTERFACENAME M00_AXIS_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of m00_axis_tlast : signal is "xilinx.com:interface:axis:1.0 M00_AXIS TLAST";
  attribute X_INTERFACE_INFO of m00_axis_tready : signal is "xilinx.com:interface:axis:1.0 M00_AXIS TREADY";
  attribute X_INTERFACE_PARAMETER of m00_axis_tready : signal is "XIL_INTERFACENAME M00_AXIS, WIZ_DATA_WIDTH 32, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_1_clk_out1, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of m00_axis_tvalid : signal is "xilinx.com:interface:axis:1.0 M00_AXIS TVALID";
  attribute X_INTERFACE_INFO of s00_axis_aclk : signal is "xilinx.com:signal:clock:1.0 S00_AXIS_CLK CLK";
  attribute X_INTERFACE_PARAMETER of s00_axis_aclk : signal is "XIL_INTERFACENAME S00_AXIS_CLK, ASSOCIATED_BUSIF S00_AXIS, ASSOCIATED_RESET s00_axis_aresetn, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_1_clk_out1, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axis_aresetn : signal is "xilinx.com:signal:reset:1.0 S00_AXIS_RST RST";
  attribute X_INTERFACE_PARAMETER of s00_axis_aresetn : signal is "XIL_INTERFACENAME S00_AXIS_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axis_tlast : signal is "xilinx.com:interface:axis:1.0 S00_AXIS TLAST";
  attribute X_INTERFACE_INFO of s00_axis_tready : signal is "xilinx.com:interface:axis:1.0 S00_AXIS TREADY";
  attribute X_INTERFACE_PARAMETER of s00_axis_tready : signal is "XIL_INTERFACENAME S00_AXIS, WIZ_DATA_WIDTH 32, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_1_clk_out1, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s00_axis_tvalid : signal is "xilinx.com:interface:axis:1.0 S00_AXIS TVALID";
  attribute X_INTERFACE_INFO of m00_axis_tdata : signal is "xilinx.com:interface:axis:1.0 M00_AXIS TDATA";
  attribute X_INTERFACE_INFO of m00_axis_tstrb : signal is "xilinx.com:interface:axis:1.0 M00_AXIS TSTRB";
  attribute X_INTERFACE_INFO of s00_axis_tdata : signal is "xilinx.com:interface:axis:1.0 S00_AXIS TDATA";
  attribute X_INTERFACE_INFO of s00_axis_tstrb : signal is "xilinx.com:interface:axis:1.0 S00_AXIS TSTRB";
begin
  \^s00_axis_tdata\(31 downto 0) <= s00_axis_tdata(31 downto 0);
  \^s00_axis_tlast\ <= s00_axis_tlast;
  \^s00_axis_tstrb\(3 downto 0) <= s00_axis_tstrb(3 downto 0);
  m00_axis_tdata(31 downto 0) <= \^s00_axis_tdata\(31 downto 0);
  m00_axis_tlast <= \^s00_axis_tlast\;
  m00_axis_tstrb(3 downto 0) <= \^s00_axis_tstrb\(3 downto 0);
inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_master_axi_test_v1_0
     port map (
      m00_axis_tready => m00_axis_tready,
      mst_exec_state_reg => s00_axis_tready,
      s00_axis_aclk => s00_axis_aclk,
      s00_axis_aresetn => s00_axis_aresetn,
      s00_axis_tlast => \^s00_axis_tlast\,
      s00_axis_tvalid => s00_axis_tvalid
    );
m00_axis_tvalid_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s00_axis_tvalid,
      I1 => m00_axis_tready,
      O => m00_axis_tvalid
    );
end STRUCTURE;
