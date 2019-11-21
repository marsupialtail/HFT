// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1.2 (lin64) Build 2615518 Fri Aug  9 15:53:29 MDT 2019
// Date        : Wed Nov 13 17:00:37 2019
// Host        : eecs-digital-37 running 64-bit Ubuntu 14.04.6 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_master_axi_test_0_0_stub.v
// Design      : design_1_master_axi_test_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "master_axi_test_v1_0,Vivado 2019.1.2" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(s00_axis_tdata, s00_axis_tstrb, 
  s00_axis_tlast, s00_axis_tvalid, s00_axis_tready, s00_axis_aclk, s00_axis_aresetn, 
  m00_axis_tdata, m00_axis_tstrb, m00_axis_tlast, m00_axis_tvalid, m00_axis_tready, 
  m00_axis_aclk, m00_axis_aresetn)
/* synthesis syn_black_box black_box_pad_pin="s00_axis_tdata[31:0],s00_axis_tstrb[3:0],s00_axis_tlast,s00_axis_tvalid,s00_axis_tready,s00_axis_aclk,s00_axis_aresetn,m00_axis_tdata[31:0],m00_axis_tstrb[3:0],m00_axis_tlast,m00_axis_tvalid,m00_axis_tready,m00_axis_aclk,m00_axis_aresetn" */;
  input [31:0]s00_axis_tdata;
  input [3:0]s00_axis_tstrb;
  input s00_axis_tlast;
  input s00_axis_tvalid;
  output s00_axis_tready;
  input s00_axis_aclk;
  input s00_axis_aresetn;
  output [31:0]m00_axis_tdata;
  output [3:0]m00_axis_tstrb;
  output m00_axis_tlast;
  output m00_axis_tvalid;
  input m00_axis_tready;
  input m00_axis_aclk;
  input m00_axis_aresetn;
endmodule
