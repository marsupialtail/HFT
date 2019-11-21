-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1.2 (lin64) Build 2615518 Fri Aug  9 15:53:29 MDT 2019
-- Date        : Wed Nov 13 16:49:14 2019
-- Host        : eecs-digital-37 running 64-bit Ubuntu 14.04.6 LTS
-- Command     : write_vhdl -force -mode synth_stub -rename_top design_1_util_vector_logic_0_0 -prefix
--               design_1_util_vector_logic_0_0_ design_1_util_vector_logic_0_0_stub.vhdl
-- Design      : design_1_util_vector_logic_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_util_vector_logic_0_0 is
  Port ( 
    Op1 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    Res : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );

end design_1_util_vector_logic_0_0;

architecture stub of design_1_util_vector_logic_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "Op1[7:0],Res[7:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "util_vector_logic_v2_0_1_util_vector_logic,Vivado 2019.1.2";
begin
end;
