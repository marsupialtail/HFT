`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2019 04:17:23 PM
// Design Name: 
// Module Name: parser_top
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


module parser_sim();
   parameter PRICE_WIDTH=15;
   parameter ID_WIDTH=15;
   parameter QUANT_WIDTH=7;
   parameter STOCK_WIDTH=7;
   parameter DATA_WIDTH=31;
   logic                  clk_in;
   logic                  reset_in; 
   logic [DATA_WIDTH:0]   data_in;
   
   logic                  ready_to_microblaze_out; 
   
   logic                  enable_in;
   logic [2:0]            operation_out;

    logic  [STOCK_WIDTH:0]                  stock_symbol_out_add;  
   logic  [ID_WIDTH:0]                     order_id_out_add;     
   logic  [PRICE_WIDTH:0]                  price_out_add;
   logic  [QUANT_WIDTH:0]                  quantity_out_add;
   
   logic [STOCK_WIDTH:0]                    stock_symbol_out_cancel;
   logic [ID_WIDTH:0]                       order_id_out_cancel;     
   logic [PRICE_WIDTH:0]                    price_out_cancel;
   logic [QUANT_WIDTH:0]                    quantity_out_cancel;

  // logic [STOCK_WIDTH: 0] stock_symbol_out;
  //  logic [ID_WIDTH: 0]    order_id_out; 
  //  logic [PRICE_WIDTH: 0] price_out;
  //  logic [QUANT_WIDTH: 0] quantity_out;
   
   logic                  valid_in; 
   logic                  ready_out;

   logic                  enable_parser;
   assign ready_to_microblaze_out = ~ready_out;
   assign enable_parser = 1;

   mk_parser parser(.clk_in(clk_in), .reset_in(reset_in), .data_in(data_in[7:0]), .enable_in(enable_parser), .valid_in(valid_in), .operation_out(operation_out), .stock_symbol_out_add(stock_symbol_out_add), .order_id_out_add(order_id_out_add), .price_out_add(price_out_add), .quantity_out_add(quantity_out_add),  .stock_symbol_out_cancel(stock_symbol_out_cancel), .order_id_out_cancel(order_id_out_cancel), .price_out_cancel(price_out_cancel), .quantity_out_cancel(quantity_out_cancel),  .ready_out(ready_out));


  always begin    
  #5
  clk_in = ~clk_in;
  end
   
  initial begin
     clk_in = 1'b0;
     reset_in = 1'b1;
     valid_in = 1'b1;
 
          #10
          
     enable_in = 1'b1;
     
     #10
     reset_in = 1'b0;
     
     
     #10
       data_in = 32'hAF_32_13_41;
     #10
       data_in = 32'hAF_32_13_45;
     #600
       data_in = 32'hAF_32_13_41;
     #600
       data_in = 32'hAF_32_13_41;
    #600
       data_in = 32'hAF_32_13_44;   
    

end 
endmodule
