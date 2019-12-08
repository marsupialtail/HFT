// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1.2 (lin64) Build 2615518 Fri Aug  9 15:53:29 MDT 2019
// Date        : Sun Dec  1 15:28:14 2019
// Host        : EECS-DIGITAL-41 running 64-bit Ubuntu 16.04.6 LTS
// Command     : write_verilog -force -mode funcsim
//               /afs/athena.mit.edu/user/z/i/ziheng/cordic/cordic.srcs/sources_1/ip/xbip_dsp48_macro_0/xbip_dsp48_macro_0_sim_netlist.v
// Design      : xbip_dsp48_macro_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "xbip_dsp48_macro_0,xbip_dsp48_macro_v3_0_17,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "xbip_dsp48_macro_v3_0_17,Vivado 2019.1.2" *) 
(* NotValidForBitStream *)
module xbip_dsp48_macro_0
   (SEL,
    A,
    B,
    C,
    P);
  (* x_interface_info = "xilinx.com:signal:data:1.0 sel_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME sel_intf, LAYERED_METADATA undef" *) input [1:0]SEL;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [15:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [15:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 c_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME c_intf, LAYERED_METADATA undef" *) input [15:0]C;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [32:0]P;

  wire [15:0]A;
  wire [15:0]B;
  wire [15:0]C;
  wire [32:0]P;
  wire [1:0]SEL;
  wire NLW_U0_CARRYCASCOUT_UNCONNECTED;
  wire NLW_U0_CARRYOUT_UNCONNECTED;
  wire [29:0]NLW_U0_ACOUT_UNCONNECTED;
  wire [17:0]NLW_U0_BCOUT_UNCONNECTED;
  wire [47:0]NLW_U0_PCOUT_UNCONNECTED;

  (* C_A_WIDTH = "16" *) 
  (* C_B_WIDTH = "16" *) 
  (* C_CONCAT_WIDTH = "48" *) 
  (* C_CONSTANT_1 = "1" *) 
  (* C_C_WIDTH = "16" *) 
  (* C_D_WIDTH = "18" *) 
  (* C_HAS_A = "1" *) 
  (* C_HAS_ACIN = "0" *) 
  (* C_HAS_ACOUT = "0" *) 
  (* C_HAS_B = "1" *) 
  (* C_HAS_BCIN = "0" *) 
  (* C_HAS_BCOUT = "0" *) 
  (* C_HAS_C = "1" *) 
  (* C_HAS_CARRYCASCIN = "0" *) 
  (* C_HAS_CARRYCASCOUT = "0" *) 
  (* C_HAS_CARRYIN = "0" *) 
  (* C_HAS_CARRYOUT = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_CEA = "0" *) 
  (* C_HAS_CEB = "0" *) 
  (* C_HAS_CEC = "0" *) 
  (* C_HAS_CECONCAT = "0" *) 
  (* C_HAS_CED = "0" *) 
  (* C_HAS_CEM = "0" *) 
  (* C_HAS_CEP = "0" *) 
  (* C_HAS_CESEL = "0" *) 
  (* C_HAS_CONCAT = "0" *) 
  (* C_HAS_D = "0" *) 
  (* C_HAS_INDEP_CE = "0" *) 
  (* C_HAS_INDEP_SCLR = "0" *) 
  (* C_HAS_PCIN = "0" *) 
  (* C_HAS_PCOUT = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SCLRA = "0" *) 
  (* C_HAS_SCLRB = "0" *) 
  (* C_HAS_SCLRC = "0" *) 
  (* C_HAS_SCLRCONCAT = "0" *) 
  (* C_HAS_SCLRD = "0" *) 
  (* C_HAS_SCLRM = "0" *) 
  (* C_HAS_SCLRP = "0" *) 
  (* C_HAS_SCLRSEL = "0" *) 
  (* C_LATENCY = "64" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_OPMODES = "000100100000010100000000,000000000011010100000001,000100100011010100000001" *) 
  (* C_P_LSB = "0" *) 
  (* C_P_MSB = "32" *) 
  (* C_REG_CONFIG = "00000000000000000000000000000000" *) 
  (* C_SEL_WIDTH = "2" *) 
  (* C_TEST_CORE = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  xbip_dsp48_macro_0_xbip_dsp48_macro_v3_0_17 U0
       (.A(A),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_U0_ACOUT_UNCONNECTED[29:0]),
        .B(B),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_U0_BCOUT_UNCONNECTED[17:0]),
        .C(C),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_U0_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYOUT(NLW_U0_CARRYOUT_UNCONNECTED),
        .CE(1'b1),
        .CEA(1'b1),
        .CEA1(1'b1),
        .CEA2(1'b1),
        .CEA3(1'b1),
        .CEA4(1'b1),
        .CEB(1'b1),
        .CEB1(1'b1),
        .CEB2(1'b1),
        .CEB3(1'b1),
        .CEB4(1'b1),
        .CEC(1'b1),
        .CEC1(1'b1),
        .CEC2(1'b1),
        .CEC3(1'b1),
        .CEC4(1'b1),
        .CEC5(1'b1),
        .CECONCAT(1'b1),
        .CECONCAT3(1'b1),
        .CECONCAT4(1'b1),
        .CECONCAT5(1'b1),
        .CED(1'b1),
        .CED1(1'b1),
        .CED2(1'b1),
        .CED3(1'b1),
        .CEM(1'b1),
        .CEP(1'b1),
        .CESEL(1'b1),
        .CESEL1(1'b1),
        .CESEL2(1'b1),
        .CESEL3(1'b1),
        .CESEL4(1'b1),
        .CESEL5(1'b1),
        .CLK(1'b1),
        .CONCAT({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .P(P),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(NLW_U0_PCOUT_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .SCLRA(1'b0),
        .SCLRB(1'b0),
        .SCLRC(1'b0),
        .SCLRCONCAT(1'b0),
        .SCLRD(1'b0),
        .SCLRM(1'b0),
        .SCLRP(1'b0),
        .SCLRSEL(1'b0),
        .SEL(SEL));
endmodule

(* C_A_WIDTH = "16" *) (* C_B_WIDTH = "16" *) (* C_CONCAT_WIDTH = "48" *) 
(* C_CONSTANT_1 = "1" *) (* C_C_WIDTH = "16" *) (* C_D_WIDTH = "18" *) 
(* C_HAS_A = "1" *) (* C_HAS_ACIN = "0" *) (* C_HAS_ACOUT = "0" *) 
(* C_HAS_B = "1" *) (* C_HAS_BCIN = "0" *) (* C_HAS_BCOUT = "0" *) 
(* C_HAS_C = "1" *) (* C_HAS_CARRYCASCIN = "0" *) (* C_HAS_CARRYCASCOUT = "0" *) 
(* C_HAS_CARRYIN = "0" *) (* C_HAS_CARRYOUT = "0" *) (* C_HAS_CE = "0" *) 
(* C_HAS_CEA = "0" *) (* C_HAS_CEB = "0" *) (* C_HAS_CEC = "0" *) 
(* C_HAS_CECONCAT = "0" *) (* C_HAS_CED = "0" *) (* C_HAS_CEM = "0" *) 
(* C_HAS_CEP = "0" *) (* C_HAS_CESEL = "0" *) (* C_HAS_CONCAT = "0" *) 
(* C_HAS_D = "0" *) (* C_HAS_INDEP_CE = "0" *) (* C_HAS_INDEP_SCLR = "0" *) 
(* C_HAS_PCIN = "0" *) (* C_HAS_PCOUT = "0" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_SCLRA = "0" *) (* C_HAS_SCLRB = "0" *) (* C_HAS_SCLRC = "0" *) 
(* C_HAS_SCLRCONCAT = "0" *) (* C_HAS_SCLRD = "0" *) (* C_HAS_SCLRM = "0" *) 
(* C_HAS_SCLRP = "0" *) (* C_HAS_SCLRSEL = "0" *) (* C_LATENCY = "64" *) 
(* C_MODEL_TYPE = "0" *) (* C_OPMODES = "000100100000010100000000,000000000011010100000001,000100100011010100000001" *) (* C_P_LSB = "0" *) 
(* C_P_MSB = "32" *) (* C_REG_CONFIG = "00000000000000000000000000000000" *) (* C_SEL_WIDTH = "2" *) 
(* C_TEST_CORE = "0" *) (* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "artix7" *) 
(* ORIG_REF_NAME = "xbip_dsp48_macro_v3_0_17" *) (* downgradeipidentifiedwarnings = "yes" *) 
module xbip_dsp48_macro_0_xbip_dsp48_macro_v3_0_17
   (CLK,
    CE,
    SCLR,
    SEL,
    CARRYCASCIN,
    CARRYIN,
    PCIN,
    ACIN,
    BCIN,
    A,
    B,
    C,
    D,
    CONCAT,
    ACOUT,
    BCOUT,
    CARRYOUT,
    CARRYCASCOUT,
    PCOUT,
    P,
    CED,
    CED1,
    CED2,
    CED3,
    CEA,
    CEA1,
    CEA2,
    CEA3,
    CEA4,
    CEB,
    CEB1,
    CEB2,
    CEB3,
    CEB4,
    CECONCAT,
    CECONCAT3,
    CECONCAT4,
    CECONCAT5,
    CEC,
    CEC1,
    CEC2,
    CEC3,
    CEC4,
    CEC5,
    CEM,
    CEP,
    CESEL,
    CESEL1,
    CESEL2,
    CESEL3,
    CESEL4,
    CESEL5,
    SCLRD,
    SCLRA,
    SCLRB,
    SCLRCONCAT,
    SCLRC,
    SCLRM,
    SCLRP,
    SCLRSEL);
  input CLK;
  input CE;
  input SCLR;
  input [1:0]SEL;
  input CARRYCASCIN;
  input CARRYIN;
  input [47:0]PCIN;
  input [29:0]ACIN;
  input [17:0]BCIN;
  input [15:0]A;
  input [15:0]B;
  input [15:0]C;
  input [17:0]D;
  input [47:0]CONCAT;
  output [29:0]ACOUT;
  output [17:0]BCOUT;
  output CARRYOUT;
  output CARRYCASCOUT;
  output [47:0]PCOUT;
  output [32:0]P;
  input CED;
  input CED1;
  input CED2;
  input CED3;
  input CEA;
  input CEA1;
  input CEA2;
  input CEA3;
  input CEA4;
  input CEB;
  input CEB1;
  input CEB2;
  input CEB3;
  input CEB4;
  input CECONCAT;
  input CECONCAT3;
  input CECONCAT4;
  input CECONCAT5;
  input CEC;
  input CEC1;
  input CEC2;
  input CEC3;
  input CEC4;
  input CEC5;
  input CEM;
  input CEP;
  input CESEL;
  input CESEL1;
  input CESEL2;
  input CESEL3;
  input CESEL4;
  input CESEL5;
  input SCLRD;
  input SCLRA;
  input SCLRB;
  input SCLRCONCAT;
  input SCLRC;
  input SCLRM;
  input SCLRP;
  input SCLRSEL;

  wire \<const0> ;
  wire [15:0]A;
  wire [15:0]B;
  wire [15:0]C;
  wire [32:0]P;
  wire [1:0]SEL;
  wire NLW_i_synth_CARRYCASCOUT_UNCONNECTED;
  wire NLW_i_synth_CARRYOUT_UNCONNECTED;
  wire [29:0]NLW_i_synth_ACOUT_UNCONNECTED;
  wire [17:0]NLW_i_synth_BCOUT_UNCONNECTED;
  wire [47:0]NLW_i_synth_PCOUT_UNCONNECTED;

  assign ACOUT[29] = \<const0> ;
  assign ACOUT[28] = \<const0> ;
  assign ACOUT[27] = \<const0> ;
  assign ACOUT[26] = \<const0> ;
  assign ACOUT[25] = \<const0> ;
  assign ACOUT[24] = \<const0> ;
  assign ACOUT[23] = \<const0> ;
  assign ACOUT[22] = \<const0> ;
  assign ACOUT[21] = \<const0> ;
  assign ACOUT[20] = \<const0> ;
  assign ACOUT[19] = \<const0> ;
  assign ACOUT[18] = \<const0> ;
  assign ACOUT[17] = \<const0> ;
  assign ACOUT[16] = \<const0> ;
  assign ACOUT[15] = \<const0> ;
  assign ACOUT[14] = \<const0> ;
  assign ACOUT[13] = \<const0> ;
  assign ACOUT[12] = \<const0> ;
  assign ACOUT[11] = \<const0> ;
  assign ACOUT[10] = \<const0> ;
  assign ACOUT[9] = \<const0> ;
  assign ACOUT[8] = \<const0> ;
  assign ACOUT[7] = \<const0> ;
  assign ACOUT[6] = \<const0> ;
  assign ACOUT[5] = \<const0> ;
  assign ACOUT[4] = \<const0> ;
  assign ACOUT[3] = \<const0> ;
  assign ACOUT[2] = \<const0> ;
  assign ACOUT[1] = \<const0> ;
  assign ACOUT[0] = \<const0> ;
  assign BCOUT[17] = \<const0> ;
  assign BCOUT[16] = \<const0> ;
  assign BCOUT[15] = \<const0> ;
  assign BCOUT[14] = \<const0> ;
  assign BCOUT[13] = \<const0> ;
  assign BCOUT[12] = \<const0> ;
  assign BCOUT[11] = \<const0> ;
  assign BCOUT[10] = \<const0> ;
  assign BCOUT[9] = \<const0> ;
  assign BCOUT[8] = \<const0> ;
  assign BCOUT[7] = \<const0> ;
  assign BCOUT[6] = \<const0> ;
  assign BCOUT[5] = \<const0> ;
  assign BCOUT[4] = \<const0> ;
  assign BCOUT[3] = \<const0> ;
  assign BCOUT[2] = \<const0> ;
  assign BCOUT[1] = \<const0> ;
  assign BCOUT[0] = \<const0> ;
  assign CARRYCASCOUT = \<const0> ;
  assign CARRYOUT = \<const0> ;
  assign PCOUT[47] = \<const0> ;
  assign PCOUT[46] = \<const0> ;
  assign PCOUT[45] = \<const0> ;
  assign PCOUT[44] = \<const0> ;
  assign PCOUT[43] = \<const0> ;
  assign PCOUT[42] = \<const0> ;
  assign PCOUT[41] = \<const0> ;
  assign PCOUT[40] = \<const0> ;
  assign PCOUT[39] = \<const0> ;
  assign PCOUT[38] = \<const0> ;
  assign PCOUT[37] = \<const0> ;
  assign PCOUT[36] = \<const0> ;
  assign PCOUT[35] = \<const0> ;
  assign PCOUT[34] = \<const0> ;
  assign PCOUT[33] = \<const0> ;
  assign PCOUT[32] = \<const0> ;
  assign PCOUT[31] = \<const0> ;
  assign PCOUT[30] = \<const0> ;
  assign PCOUT[29] = \<const0> ;
  assign PCOUT[28] = \<const0> ;
  assign PCOUT[27] = \<const0> ;
  assign PCOUT[26] = \<const0> ;
  assign PCOUT[25] = \<const0> ;
  assign PCOUT[24] = \<const0> ;
  assign PCOUT[23] = \<const0> ;
  assign PCOUT[22] = \<const0> ;
  assign PCOUT[21] = \<const0> ;
  assign PCOUT[20] = \<const0> ;
  assign PCOUT[19] = \<const0> ;
  assign PCOUT[18] = \<const0> ;
  assign PCOUT[17] = \<const0> ;
  assign PCOUT[16] = \<const0> ;
  assign PCOUT[15] = \<const0> ;
  assign PCOUT[14] = \<const0> ;
  assign PCOUT[13] = \<const0> ;
  assign PCOUT[12] = \<const0> ;
  assign PCOUT[11] = \<const0> ;
  assign PCOUT[10] = \<const0> ;
  assign PCOUT[9] = \<const0> ;
  assign PCOUT[8] = \<const0> ;
  assign PCOUT[7] = \<const0> ;
  assign PCOUT[6] = \<const0> ;
  assign PCOUT[5] = \<const0> ;
  assign PCOUT[4] = \<const0> ;
  assign PCOUT[3] = \<const0> ;
  assign PCOUT[2] = \<const0> ;
  assign PCOUT[1] = \<const0> ;
  assign PCOUT[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_A_WIDTH = "16" *) 
  (* C_B_WIDTH = "16" *) 
  (* C_CONCAT_WIDTH = "48" *) 
  (* C_CONSTANT_1 = "1" *) 
  (* C_C_WIDTH = "16" *) 
  (* C_D_WIDTH = "18" *) 
  (* C_HAS_A = "1" *) 
  (* C_HAS_ACIN = "0" *) 
  (* C_HAS_ACOUT = "0" *) 
  (* C_HAS_B = "1" *) 
  (* C_HAS_BCIN = "0" *) 
  (* C_HAS_BCOUT = "0" *) 
  (* C_HAS_C = "1" *) 
  (* C_HAS_CARRYCASCIN = "0" *) 
  (* C_HAS_CARRYCASCOUT = "0" *) 
  (* C_HAS_CARRYIN = "0" *) 
  (* C_HAS_CARRYOUT = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_CEA = "0" *) 
  (* C_HAS_CEB = "0" *) 
  (* C_HAS_CEC = "0" *) 
  (* C_HAS_CECONCAT = "0" *) 
  (* C_HAS_CED = "0" *) 
  (* C_HAS_CEM = "0" *) 
  (* C_HAS_CEP = "0" *) 
  (* C_HAS_CESEL = "0" *) 
  (* C_HAS_CONCAT = "0" *) 
  (* C_HAS_D = "0" *) 
  (* C_HAS_INDEP_CE = "0" *) 
  (* C_HAS_INDEP_SCLR = "0" *) 
  (* C_HAS_PCIN = "0" *) 
  (* C_HAS_PCOUT = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SCLRA = "0" *) 
  (* C_HAS_SCLRB = "0" *) 
  (* C_HAS_SCLRC = "0" *) 
  (* C_HAS_SCLRCONCAT = "0" *) 
  (* C_HAS_SCLRD = "0" *) 
  (* C_HAS_SCLRM = "0" *) 
  (* C_HAS_SCLRP = "0" *) 
  (* C_HAS_SCLRSEL = "0" *) 
  (* C_LATENCY = "64" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_OPMODES = "000100100000010100000000,000000000011010100000001,000100100011010100000001" *) 
  (* C_P_LSB = "0" *) 
  (* C_P_MSB = "32" *) 
  (* C_REG_CONFIG = "00000000000000000000000000000000" *) 
  (* C_SEL_WIDTH = "2" *) 
  (* C_TEST_CORE = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  xbip_dsp48_macro_0_xbip_dsp48_macro_v3_0_17_viv i_synth
       (.A(A),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_i_synth_ACOUT_UNCONNECTED[29:0]),
        .B(B),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_i_synth_BCOUT_UNCONNECTED[17:0]),
        .C(C),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_i_synth_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYOUT(NLW_i_synth_CARRYOUT_UNCONNECTED),
        .CE(1'b0),
        .CEA(1'b0),
        .CEA1(1'b0),
        .CEA2(1'b0),
        .CEA3(1'b0),
        .CEA4(1'b0),
        .CEB(1'b0),
        .CEB1(1'b0),
        .CEB2(1'b0),
        .CEB3(1'b0),
        .CEB4(1'b0),
        .CEC(1'b0),
        .CEC1(1'b0),
        .CEC2(1'b0),
        .CEC3(1'b0),
        .CEC4(1'b0),
        .CEC5(1'b0),
        .CECONCAT(1'b0),
        .CECONCAT3(1'b0),
        .CECONCAT4(1'b0),
        .CECONCAT5(1'b0),
        .CED(1'b0),
        .CED1(1'b0),
        .CED2(1'b0),
        .CED3(1'b0),
        .CEM(1'b0),
        .CEP(1'b0),
        .CESEL(1'b0),
        .CESEL1(1'b0),
        .CESEL2(1'b0),
        .CESEL3(1'b0),
        .CESEL4(1'b0),
        .CESEL5(1'b0),
        .CLK(1'b1),
        .CONCAT({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .P(P),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(NLW_i_synth_PCOUT_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .SCLRA(1'b0),
        .SCLRB(1'b0),
        .SCLRC(1'b0),
        .SCLRCONCAT(1'b0),
        .SCLRD(1'b0),
        .SCLRM(1'b0),
        .SCLRP(1'b0),
        .SCLRSEL(1'b0),
        .SEL(SEL));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2019.1"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
A6Gm/t9CORdy7TJLqFUqsr6HqLU4CrdMZh8iCIZNonsJwqgaySthej1JPs0KNkLWfbMwXDxTNHKS
feuo2pfc8Q==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
DePAE6b0MAWn2lnMMooeQwVQqJbgLk0BhfejC+13rd/5gdjNzKPr4sTWr1XmDVZiWlH8L3ND2u+2
852UFZzpRygs159WD5jhawuTogtgc0BAaoAz86N6wCodZmNoKPQWhp56S6dbNlp8a4pkTJMbqhUb
YC+LR/dXFVFkYOnnNsY=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
gI3isD6zIlc8GPtLeT+WJYz9/3N79hI8O3zkT1q3aZhWKdVcWGfdg9YipMbvsag1m6D7nyDcxcjq
HBTbjv7ICq9Wa1uIxT6xIrH54P0zqLS9FUT7Ct1hegzk8yTgyDDvLPKoTTdAJ0CS+LnlRYghdBNU
tjxZ5Oo3taYCehJIfUHxG7F2+zey7tYmGvQBvw6zvq6zgR5PbKomwXPVF5poUbUi3uDGuQ9YZeqM
A60ZGqti4OisRjpxZjfIwDnN6fjLwGNgmXnSqj2Tq+bvoDC23L5G7INQkdP0tH49VvNxYGm2nfYy
u4w/LRrTV/mwjpXNy6RTh1VP/xGEz6i3MnUS8A==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
VO6NGPHNGUXRsH/Xitso5iNPf9sVcfV84QnCLZhdeuGVojOyH5PP0VpiK8yIeEC6Cnjcqh0qp08E
N15a0zCE4a0X8a9R3rePTsCuoL28UkpnDOj7NukD+dlO2Pn7XjyJrQm501RrUN11KGdzr9uI6aiB
YMRXQSISq2JIhfYx/qgnqtFwAzn2OzcGO2dCrPeJOUOO6+B0HRYA1vMOrRn9ql7b96L/QJUuAq9T
6BKJiXyVg6DazMTn4WBXIsaBktPste+EVAy912e2zmRXjfFjk4N+I0gQxqkLmmfjKPPssyqsPdKZ
xUdEZEn8PDxBEr2kV99jlqThNTqBpSlY8JPJ8A==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2019_02", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
EWhj7H3+jNO/piTibTz5QZTo/Ru6kRWkqebTYPs1RSt2sWHJ7SzAJJIehQgBKktr+ykRXMxyUW4e
YkzMS14Bic8jCU3eBM6ZA1btQuPPEBggp/u+/fhCMoMNeDszEdZI6/VLdUJkOLIm0hPpriQlqjyV
B4/RSfblYMuvl03dvxwjosldsoP5/uZAs0LH0EDs0SVWaiAIFd9KQE8jKlwqYftWdQ7vV6OU5cXF
dEj8VIwAc+4/QEyylKrS2+tIHGOrwOlz2rhX94Uk5G05EtTBv4CfWjWORDThPwwEaJqH6PYpgUlI
duqtU0B7BLM0sXoAGQlzVcU+zvUScDVnSRBrhg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
b8lk17DNszbLmhJXP7O51stx3Hgb2sQkHDaCRtDhUp3rKIkGlNtR9naQhOb0WEZnH7b0sSq9k2JW
O2PFW1Mjqd14gJ2jiinZdcy+dNywOFQyJgNbedkLoOIg7iy/nYMmF+LtJkalk0Vi/3P0HkySvoGz
YBbLbt9mfy2r0TcrJwk=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
YshRnKWka2f0wV4oNrUtUpOfMX6uSYAAlSe3YoHDIuA6xGjAESnYOVcIeFUSat0Y8lo6HxPPSKls
5Ot6F3XDzQwmb0fZKK1skCYmFSoI47O3Stn7ARxxv97dHAJg8vsusGStUGRB0n+QynDrzMvgVvaq
sgk6JcsY6H/pqpknHyXSIXxBZV8P+9NCuVC3NUhr/uCYFDWtaE3T6Uy1WK28PK9ZB3p8fDwGHCmy
JVEMBN4mOaFyNM2pBAbdMsFxE4ahd8yfLwrQJkVZEwvh3pTeMbr3v60m1vC2Pyr26c1EgIB7aQac
z3jtJQVCQFFR08cwO8FNjm8u0Gz3twIShZBwzg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Vg+wxCasz/+CnzEUT0GD5bIXqYtS3SicVto+YFiBhVvBHgaxnoERFU+E2ENghf6ZHSvqE2vqZoFz
6BLUhmSj+ayYif7JwOjkUVZYtJbA3eB+acXnVaZJRNKFIXOUOG7eUmoMWrcUcoHV5WpTF7gI7mZ4
pXSHR8FM0KVmgc7Ijfd4g+0oPExHPOWAz6maDdbLGzVs9416qoOn/Mq3KyL8SnfbTrKXCcUvdKv/
hnk78i8DT99wuqD1ZNRsyvttk1CgfUbW5th2jGQhR3VfQdOHAEIMblxua9NK5oefX5EXt/Q3Kax5
2uGrqHZYD6aQOeQqhCmWhnOIe+t+4KzoHUMyhg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
pr0kRFr6tKSGSgLiaJzeLY/NH3DeETptm7QUIVqqa/CBpsUb6Rhaq6LbZYKSnszf83Sgz/KB1AbQ
Puyvg8iMQzEaqEPqa18gHbU+PE1dH4zn1/p8pPsR32uVZ+bb1qQ7t08JwgDDNkc98zHiAR/CH3Z7
nB6rmvMNdVFPfFL7Gi4I0GWm+Sqf9WMn203F8TbbPJfCGKUspkNlNpvx2hPnNYXpeMf0j/wLxc94
cncmhcJLVZBP1TffyVBsT15kEkFkkWbqgcCW/T6If5uCLKyhEWgcemG2HfgWT/OavljQMAhAYa9z
6muKV3pnYyK/j00Azj1jAl9licgdd7UIfl4ALg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 18448)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
