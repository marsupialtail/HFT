`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/13/2019 05:11:41 PM
// Design Name: 
// Module Name: sim_test_axi_ip
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module sim_test_axi_ip(
    );
  
  logic [31:0]   s00_axis_tdata;
  logic [3:0]   s00_axis_tstrb;
  logic s00_axis_tlast;
  logic s00_axis_tvalid;
  logic s00_axis_tready;
  logic s00_axis_aclk;
  logic s00_axis_aresetn;
  
  logic [31:0] m00_axis_tdata;
  logic [3:0]  m00_axis_tstrb;
  logic m00_axis_tlast;
  logic m00_axis_tvalid;
  logic m00_axis_tready;
  logic m00_axis_aclk;
  logic m00_axis_aresetn; 
  design_1_master_axi_test_0_0 inst (
    .s00_axis_tdata(s00_axis_tdata),
    .s00_axis_tstrb(s00_axis_tstrb),
    .s00_axis_tlast(s00_axis_tlast),
    .s00_axis_tvalid(s00_axis_tvalid),
    .s00_axis_tready(s00_axis_tready),
    .s00_axis_aclk(s00_axis_aclk),
    .s00_axis_aresetn(s00_axis_aresetn),
    .m00_axis_tdata(m00_axis_tdata),
    .m00_axis_tstrb(m00_axis_tstrb),
    .m00_axis_tlast(m00_axis_tlast),
    .m00_axis_tvalid(m00_axis_tvalid),
    .m00_axis_tready(m00_axis_tready),
    .m00_axis_aclk(m00_axis_aclk),
    .m00_axis_aresetn(m00_axis_aresetn)
  );
endmodule
