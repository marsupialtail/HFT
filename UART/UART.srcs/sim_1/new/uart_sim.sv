module uart_sim();
logic clk;
logic reset;
logic tx_out;
logic rx_in;
axi_uartlite_0 uart(.s_axi_aclk(clk), .s_axi_aresetn(reset),  .rx(tx_out), .tx(rx_in), .s_axi_arvalid(1), .s_axi_awvalid(1),  .s_axi_bready(1), .s_axi_rready(1), .s_axi_wvalid(1));

always begin
    #5
    clk = !clk;
end

initial begin
    clk = 1;
    reset = 0;
    for(integer i = 0; i < 10 ; i = i + 1) begin
        #10
        tx_out = i;
    end
end
endmodule