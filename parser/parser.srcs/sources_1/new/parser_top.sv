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

module parser_top # (parameter PRICE_WIDTH=15;
                 parameter ID_WIDTH=15;
                 parameter QUANT_WIDTH=7;
                 parameter STOCK_WIDTH=7;
                 parameter DATA_WIDTH=31;)

endmodule                 
                 
module parser # (parameter PRICE_WIDTH=15;
                 parameter ID_WIDTH=15;
                 parameter QUANT_WIDTH=7;
                 parameter STOCK_WIDTH=7;
                 parameter DATA_WIDTH=31;)
   
   (
    input                   clk_in,
    input [DATA_WIDTH,0]    data_in,
    input                   enable_in,

    output [2,0]            operation_out,
    output [STOCK_WIDTH, 0] stock_symbol_out,
    output [ID_WIDTH, 0]    order_id_out, 
    output [PRICE_WIDTH, 0] price_out,
    output [QUANT_WIDTH, 0] quantity_out,
    output                  ready_out
    );

   logic                    enable_add;
   logic                    enable_cancel;
   logic                    enable_dummy;

   logic  [2,0]                            operation_out_add;
   logic  [STOCK_WIDTH, 0]                  stock_symbol_out_add;
   logic  [ID_WIDTH, 0]                     order_id_out_add;     
   logic  [PRICE_WIDTH, 0]                  price_out_add;
   logic  [QUANT_WIDTH, 0]                  quantity_out_add;

   logic  [2,0]                             operation_out_cancel;
   logic  [STOCK_WIDTH, 0]                   stock_symbol_out_cancel;
   logic  [ID_WIDTH, 0]                      order_id_out_cancel;     
   logic  [PRICE_WIDTH, 0]                   price_out_cancel;
   logic  [QUANT_WIDTH, 0]                   quantity_out_cancel;

   logic [2,0]                               operation_outut_dummy;
   logic [STOCK_WIDTH, 0]                    stock_symbol_out_dummy;
   logic [ID_WIDTH, 0]                       order_id_out_dummy;     
   logic  [PRICE_WIDTH, 0]                   price_out_dummy;
   logic  [QUANT_WIDTH, 0]                   quantity_out_dummy;
               
   mkAddMessage #(.PRICE_WIDTH(PRICE_WIDTH), .ID_WIDTH(ID_WIDTH), QUANT_WIDTH(QUANT_WIDTH), .STOCK_WIDTH(STOCK_WIDTH)) addMessage(.clk_in(clk_in), .data_in(data_in), .enable_in(enable_add), .operation_out(operation_out_add), .stock_symbol_out(stock_symbol_out_add), .order_id_out(order_id_out_add), .price_out(price_out_add), .quantity_out(quantity_out_add));
    mkcancelMessage #(.PRICE_WIDTH(PRICE_WIDTH), .ID_WIDTH(ID_WIDTH), QUANT_WIDTH(QUANT_WIDTH), .STOCK_WIDTH(STOCK_WIDTH)) cancelMessage(.clk_in(clk_in), .data_in(data_in), .enable_in(enable_add), .operation_out(operation_out_cancel), .stock_symbol_out(stock_symbol_out_cancel), .order_id_out(order_id_out_cancel), .price_out(price_out_cancel), .quantity_out(quantity_out_cancel));
   mkDummyMessage #(.PRICE_WIDTH(PRICE_WIDTH), .ID_WIDTH(ID_WIDTH), QUANT_WIDTH(QUANT_WIDTH), .STOCK_WIDTH(STOCK_WIDTH)) dummyMessage(.clk_in(clk_in), .data_in(data_in), .enable_in(enable_add), .operation_out(operation_out_dummy), .stock_symbol_out(stock_symbol_out_dummy), .order_id_out(order_id_out_dummy), .price_out(price_out_dummy), .quantity_out(quantity_out_dummy));


   
    casez {enable_add_message, enable_cancel_message, enable_dummy_message, message}: //probably want to make this message a bit stream parameterized (actually although that may yeild energy savings, latency savings are not there). 
    //actualy there can be latency saving for a class of trading strategies or book bulding methods (when system can't match but that is unlikley as that would be the excahgne machine is sso good that it can send informtation so fast) that are only looking at the msb s and doing computation on them.
    7'hA:  enable_add_message = 1;
    7'hB:  enable_cancel_message = 1;
    default: enable_dummy_message = 1;
endmodule


module mkAddMessage #(parameter PRICE_WIDTH=15;
                      parameter ID_WIDTH=15;
                      parameter QUANT_WIDTH=7;
                      parameter STOCK_WIDTH=7;
                      parameter DATA_WIDTH=31;)
   
   (
    input                   clk_in,
    input [DATA_WIDTH,0]    data_in,
    input                   enable_in,

    output [2,0]            operation_out,
    output [STOCK_WIDTH, 0] stock_symbol_out,
    output [ID_WIDTH, 0]    order_id_out, 
    output [PRICE_WIDTH, 0] price_out,
    output [QUANT_WIDTH, 0] quantity_out,
    output                  ready_out
    );

endmodule

module mkCancelMessage #(parameter PRICE_WIDTH=15;
                         parameter ID_WIDTH=15;
                         parameter QUANT_WIDTH=7;
                         parameter STOCK_WIDTH=7;
                         parameter DATA_WIDTH=31;)
   
   (
    input                   clk_in,
    input [DATA_WIDTH,0]    data_in,
    input                   enable_in,

    output [2,0]            operation_out,
    output [STOCK_WIDTH, 0] stock_symbol_out,
    output [ID_WIDTH, 0]    order_id_out, 
    output [PRICE_WIDTH, 0] price_out,
    output [QUANT_WIDTH, 0] quantity_out,
    output                  ready_out
    );
   
endmodule

module mkDummyMessage #(parameter PRICE_WIDTH=15;
                        parameter ID_WIDTH=15;
                        parameter QUANT_WIDTH=7;
                        parameter STOCK_WIDTH=7;
                        parameter DATA_WIDTH=31;)
   
   (
    input                   clk_in,
    input [DATA_WIDTH,0]    data_in,
    input                   enable_in,

    output [2,0]            operation_out,
    output [STOCK_WIDTH, 0] stock_symbol_out,
    output [ID_WIDTH, 0]    order_id_out, 
    output [PRICE_WIDTH, 0] price_out,
    output [QUANT_WIDTH, 0] quantity_out,
    output                  ready_out
    );
endmodule
