// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Thu Jun 17 13:27:10 2021
// Host        : PC-SER-DELL-1 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ TOP_block_vio_0_0_stub.v
// Design      : TOP_block_vio_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z014sclg484-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "vio,Vivado 2019.2" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(clk, probe_in0, probe_in1, probe_out0, 
  probe_out1, probe_out2, probe_out3, probe_out4, probe_out5, probe_out6, probe_out7, probe_out8, 
  probe_out9, probe_out10, probe_out11)
/* synthesis syn_black_box black_box_pad_pin="clk,probe_in0[18:0],probe_in1[15:0],probe_out0[18:0],probe_out1[18:0],probe_out2[0:0],probe_out3[0:0],probe_out4[0:0],probe_out5[5:0],probe_out6[7:0],probe_out7[0:0],probe_out8[0:0],probe_out9[13:0],probe_out10[0:0],probe_out11[15:0]" */;
  input clk;
  input [18:0]probe_in0;
  input [15:0]probe_in1;
  output [18:0]probe_out0;
  output [18:0]probe_out1;
  output [0:0]probe_out2;
  output [0:0]probe_out3;
  output [0:0]probe_out4;
  output [5:0]probe_out5;
  output [7:0]probe_out6;
  output [0:0]probe_out7;
  output [0:0]probe_out8;
  output [13:0]probe_out9;
  output [0:0]probe_out10;
  output [15:0]probe_out11;
endmodule
