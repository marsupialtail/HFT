`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/13/2019 05:25:16 PM
// Design Name: 
// Module Name: sim_test
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
  master_axi_test_v1_0 #(
    .C_S00_AXIS_TDATA_WIDTH(32),  // AXI4Stream sink: Data Width
    .C_M00_AXIS_TDATA_WIDTH(32),  // Width of S_AXIS address bus. The slave accepts the read and write addresses of width C_M_AXIS_TDATA_WIDTH.
    .C_M00_AXIS_START_COUNT(32)  // Start count is the number of clock cycles the master will wait before initiating/issuing any transaction.
  ) inst (
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
  assign m00_axis_aresetn = s00_axis_aresetn;
  assign m00_axis_aclk = s00_axis_aclk; 
  
  always begin
      #5
      s00_axis_aclk = ~s00_axis_aclk;
  end
  
  initial begin
      s00_axis_aclk = 1;
      s00_axis_aresetn  = 0;
      
      s00_axis_tvalid = 0;
      s00_axis_tstrb = 1;
      s00_axis_tlast = 0;
      
      m00_axis_tready = 1;
      #10
      
       s00_axis_aresetn  = 1;// active low

          
        for(integer i = 0; i < 32;  ) begin
            #10
            if( i % 4 == 2 && s00_axis_tvalid) begin
                s00_axis_tvalid = 0;
            end else begin
                s00_axis_tvalid = 1;
            end
            if(s00_axis_tready && s00_axis_tvalid) begin
                s00_axis_tdata = i;
                i = i +1;
                
            end
            if(i % 4 == 3) begin
                s00_axis_tlast = 1;
                //i = 0;
            end else begin
                s00_axis_tlast = 0;
            end
        end
        #5
        s00_axis_tlast = 0;
        
  end
endmodule

