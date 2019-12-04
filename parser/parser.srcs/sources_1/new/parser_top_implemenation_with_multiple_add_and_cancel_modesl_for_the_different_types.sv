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
                 parameter DATA_WIDTH=7;)

endmodule                 
                 
module parser # (parameter PRICE_WIDTH=15;
                 parameter ID_WIDTH=15;
                 parameter QUANT_WIDTH=7;
                 parameter STOCK_WIDTH=7;
                 parameter DATA_WIDTH=7;)//31
   
   (
    input                   clk_in,
    input                   reset_in, 
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
               
   mkAddMessage #(.PRICE_WIDTH(PRICE_WIDTH), .ID_WIDTH(ID_WIDTH), QUANT_WIDTH(QUANT_WIDTH), .STOCK_WIDTH(STOCK_WIDTH)) addMessage(.clk_in(clk_in), .reset_in(reset_in), .data_in(data_in), .enable_in(enable_add), .operation_out(operation_out_add), .stock_symbol_out(stock_symbol_out_add), .order_id_out(order_id_out_add), .price_out(price_out_add), .quantity_out(quantity_out_add));
    mkcancelMessage #(.PRICE_WIDTH(PRICE_WIDTH), .ID_WIDTH(ID_WIDTH), QUANT_WIDTH(QUANT_WIDTH), .STOCK_WIDTH(STOCK_WIDTH)) cancelMessage(.clk_in(clk_in), .reset_in(reset_in), .data_in(data_in), .enable_in(enable_add), .operation_out(operation_out_cancel), .stock_symbol_out(stock_symbol_out_cancel), .order_id_out(order_id_out_cancel), .price_out(price_out_cancel), .quantity_out(quantity_out_cancel));
   mkDummyMessage #(.PRICE_WIDTH(PRICE_WIDTH), .ID_WIDTH(ID_WIDTH), QUANT_WIDTH(QUANT_WIDTH), .STOCK_WIDTH(STOCK_WIDTH)) dummyMessage(.clk_in(clk_in), .reset_in(reset_in), .data_in(data_in), .enable_in(enable_add), .operation_out(operation_out_dummy), .stock_symbol_out(stock_symbol_out_dummy), .order_id_out(order_id_out_dummy), .price_out(price_out_dummy), .quantity_out(quantity_out_dummy));

   parameter MESSAGE_TYPE = DATA_WIDTH - 7;

    casez {reset_in, message, enable_add_message, enable_add_id_message, enable_cancel_exec_message, enable_cancel_exec_price_message, enable_cancel_cancel_message, enable_cancel_delete_message, enable_cancel_replace_message, enable_dummy_message}: //probably want to make this message a bit stream parameterized (actually although that may yeild energy savings, latency savings are not there). 
    //actualy there can be latency saving for a class of trading strategies or book bulding methods (when system can't match but that is unlikley as that would be the excahgne machine is sso good that it can send informtation so fast) that are only looking at the msb s and doing computation on them.
      { 1'b1,  }: begin  enable_add_message = 0; enable_add_id_message = 0; enable_cancel_exec_message = 0;enable_cancel_exec_price_message = 0; enable_cancel_cancel_message = 0; enable_cancel_delete_message = 0;  enable_cancel_replace_message = 0; enable_dummy_message = 0; end
      { 1'b0, 8'h41, {WIDTH{?}}, 8'b0_0_0  }:  begin enable_add_message = 1;  end
      { 1'b0, 8'h46, {WIDTH{?}}, 8'b0_0_0  }:  begin enable_add_id_message = 1; end

      { 1'b0, 8'h45, {WIDTH{?}}, 8'b0_0_0  }:  begin enable_cancel_exec_message = 1;  end
      { 1'b0, 8'h43, {WIDTH{?}}, 8'b0_0_0  }:  begin enable_cancel_exec_price_message = 1; end
      { 1'b0, 8'h58, {WIDTH{?}}, 8'b0_0_0  }:  begin enable_cancel_cancel_message = 1; end
      { 1'b0, 8'h44, {WIDTH{?}}, 8'b0_0_0  }:  begin enable_cancel_delete_message = 1; end
      { 1'b0, 8'h55, {WIDTH{?}}, 8'b0_0_0  }:  begin enable_cancel_replace_message = 1;  end  

     default: enable_dummy_message = 1;
endmodule


module mkAddMessage #(parameter PRICE_WIDTH=15;
                      parameter ID_WIDTH=15;
                      parameter QUANT_WIDTH=7;
                      parameter STOCK_WIDTH=7;
                      parameter DATA_WIDTH=31;)
   
   (
    input                   clk_in,
    input                   reset_in, 
    input [DATA_WIDTH,0]    data_in,
    input                   enable_in,

    output [2,0]            operation_out,
    output [STOCK_WIDTH, 0] stock_symbol_out,
    output [ID_WIDTH, 0]    order_id_out, 
    output [PRICE_WIDTH, 0] price_out,
    output [QUANT_WIDTH, 0] quantity_out,
    output                  ready_out
    );
parameter MESSAGE_TYPE = 1;
parameter STOCK_LOCATE = 2;
parameter TRACKING_NUMBER = 2;
parameter TIMESTAMP = 6;
parameter ORDER_REF_NUM = 8;
parameter BUY_SELL_IND = 1;
parameter SHARES = 4;
parameter STOCK = 8;
parameter PRICE = 4;
parameter ATTRIBUTION = 4;

endmodule

module mkCancelMessage #(parameter PRICE_WIDTH=15;
                         parameter ID_WIDTH=15;
                         parameter QUANT_WIDTH=7;
                         parameter STOCK_WIDTH=7;
                         parameter DATA_WIDTH=31;)
   
   (
    input                   clk_in,
    input                   reset_in, 
    input [DATA_WIDTH,0]    data_in,
    input                   enable_in,

    output [2,0]            operation_out,
    output [STOCK_WIDTH, 0] stock_symbol_out,
    output [ID_WIDTH, 0]    order_id_out, 
    output [PRICE_WIDTH, 0] price_out,
    output [QUANT_WIDTH, 0] quantity_out,
    output                  ready_out
    );
parameter MESSAGE_TYPE = 1;
parameter STOCK_LOCATE = 2;
parameter TRACKING_NUMBER = 2;
parameter TIMESTAMP = 6;
parameter ORDER_REF_NUM = 8;
parameter EXECUTED_SHARES = 4;
parameter MATCH_NUMBER = 8;
parameter PRINTABLE = 8;
parameter PRICE = 4;
 
endmodule

module mkDummyMessage #(parameter PRICE_WIDTH=15;
                        parameter ID_WIDTH=15;
                        parameter QUANT_WIDTH=7;
                        parameter STOCK_WIDTH=7;
                        parameter DATA_WIDTH=31;)
   
   (
    input                   clk_in,
    input                   reset_in, 
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
