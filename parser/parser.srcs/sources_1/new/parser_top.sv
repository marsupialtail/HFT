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

module parser_top # (parameter PRICE_WIDTH=15,
                 parameter ID_WIDTH=15,
                 parameter QUANT_WIDTH=7,
                 parameter STOCK_WIDTH=7,
                 parameter DATA_WIDTH=31)
      (
    input                   clk_in,
    input                   reset_in, 
    input [DATA_WIDTH:0]    data_in,
    
    output                  ready_to_microblaze_out, 
    input                   enable_in,

    output [2:0]            operation_out,
    output [STOCK_WIDTH: 0] stock_symbol_out,
    output [ID_WIDTH: 0]    order_id_out, 
    output [PRICE_WIDTH: 0] price_out,
    output [QUANT_WIDTH: 0] quantity_out,
    input                   valid_in, 
    output                  ready_out
    );

   logic                    enable_parser;

 mk_parser parser(.clk_in(clk_in), .reset_in(reset_in), .data_in(data_in[7:0]), .enable_in(enable_parser), .operation_out(operation_out), .stock_symbol_out(stock_symbol_out), .order_id_out(order_id_out), .price_out(price_out), .quantity_out(quantity_out), .ready_out(ready_out));

   assign ready_to_microblaze_out = ~ready_out | ready_out && valid_in;
   assign enable_parser = 1; //have to think about this
   // always@(posedge clk_in) begin
   //    if(reset_in) begin
          
   //    end else begin
   //       if(ready_out)ready_to_microblaze_out <= 1;
   // end
endmodule                 
                 
module mk_parser # (parameter PRICE_WIDTH=15,
                 parameter ID_WIDTH=15,
                 parameter QUANT_WIDTH=7,
                 parameter STOCK_WIDTH=7,
                 parameter DATA_WIDTH=7)//31
   
   (
    input                   clk_in,
    input                   reset_in, 
    input [DATA_WIDTH:0]    data_in,
    input                   enable_in,

    output [2:0]            operation_out,
    output [STOCK_WIDTH: 0] stock_symbol_out,
    output [ID_WIDTH: 0]    order_id_out, 
    output [PRICE_WIDTH: 0] price_out,
    output [QUANT_WIDTH: 0] quantity_out,
    output                  ready_out
    );

   logic                    enable_add;
   logic                    enable_cancel;
   logic                    enable_dummy;
   logic [2:0]              mess_type;              

   logic  [2:0]                            operation_out_add;
   logic  [STOCK_WIDTH:0]                  stock_symbol_out_add;
   logic  [ID_WIDTH:0]                     order_id_out_add;     
   logic  [PRICE_WIDTH:0]                  price_out_add;
   logic  [QUANT_WIDTH:0]                  quantity_out_add;
   
   logic [2:0]                             operation_out_cancel;
   logic [STOCK_WIDTH:0]                    stock_symbol_out_cancel;
   logic [ID_WIDTH:0]                       order_id_out_cancel;     
   logic [PRICE_WIDTH:0]                    price_out_cancel;
   logic [QUANT_WIDTH:0]                    quantity_out_cancel;

   logic [2:0]                               operation_outut_dummy;
   logic [STOCK_WIDTH:0]                    stock_symbol_out_dummy;
   logic [ID_WIDTH:0]                       order_id_out_dummy;     
   logic [PRICE_WIDTH:0]                    price_out_dummy;
   logic [QUANT_WIDTH:0]                    quantity_out_dummy;
   
   logic                                    ready_add_out;
   logic                                    ready_cancel_out;
   logic                                    ready_dummy_out;
   
   mkAddMessage #(.PRICE_WIDTH(PRICE_WIDTH), .ID_WIDTH(ID_WIDTH), .QUANT_WIDTH(QUANT_WIDTH), .STOCK_WIDTH(STOCK_WIDTH)) addMessage(.clk_in(clk_in), .reset_in(reset_in), .data_in(data_in), .enable_in(enable_add), .operation_out(operation_out_add), .stock_symbol_out(stock_symbol_out_add), .order_id_out(order_id_out_add), .price_out(price_out_add), .quantity_out(quantity_out_add), .ready_out(ready_add_out));
   
    mkcancelMessage #(.PRICE_WIDTH(PRICE_WIDTH), .ID_WIDTH(ID_WIDTH), .QUANT_WIDTH(QUANT_WIDTH), .STOCK_WIDTH(STOCK_WIDTH)) cancelMessage(.clk_in(clk_in), .reset_in(reset_in), .data_in(data_in), .enable_in(enable_add), .operation_out(operation_out_cancel), .stock_symbol_out(stock_symbol_out_cancel), .order_id_out(order_id_out_cancel), .price_out(price_out_cancel), .quantity_out(quantity_out_cancel), , .ready_out(ready_cancel_out));
   
   mkDummyMessage #(.PRICE_WIDTH(PRICE_WIDTH), .ID_WIDTH(ID_WIDTH), .QUANT_WIDTH(QUANT_WIDTH), .STOCK_WIDTH(STOCK_WIDTH)) dummyMessage(.clk_in(clk_in), .reset_in(reset_in), .data_in(data_in), .enable_in(enable_add), .operation_out(operation_out_dummy), .stock_symbol_out(stock_symbol_out_dummy), .order_id_out(order_id_out_dummy), .price_out(price_out_dummy), .quantity_out(quantity_out_dummy), , .ready_out(ready_dummy_out));

   parameter MESSAGE_TYPE = DATA_WIDTH - 7;

   logic [7:0]                              message;
   
   assign message = data_in[7:0];
   always@(posedge clk_in) begin
      casez({reset_in, message, enable_add, enable_cancel, enable_dummy}) //probably want to make this message a bit stream parameterized (actually although that may yeild energy savings, latency savings are not there). 
        //actualy there can be latency saving for a class of trading strategies or book bulding methods (when system can't match but that is unlikley as that would be the excahgne machine is sso good that it can send informtation so fast) that are only looking at the msb s and doing computation on them.
        { 1'b1, {(8 + WIDTH + 3){?}}}: begin enable_add <= 0; enable_cancel <= 0; enable_dummy <= 0; mess_type <= 0; end
        { 1'b0, 8'h41, {WIDTH{?}}, 3'b0_0_0  }:  begin enable_add <= 1; mess_type <= 0; end
        { 1'b0, 8'h46, {WIDTH{?}}, 3'b0_0_0  }:  begin enable_add <= 1; mess_type <= 1; end

        { 1'b0, 8'h45, {WIDTH{?}}, 3'b0_0_0  }:  begin enable_cancel <= 1; mess_type <= 0; end //exec
        { 1'b0, 8'h43, {WIDTH{?}}, 3'b0_0_0  }:  begin enable_cancel <= 1;  mess_type <= 1; end //exxec_price
        { 1'b0, 8'h58, {WIDTH{?}}, 3'b0_0_0  }:  begin enable_cancel <= 1;  mess_type <= 2; end //cancel
        { 1'b0, 8'h44, {WIDTH{?}}, 3'b0_0_0  }:  begin enable_cancel <= 1;  mess_type <= 3; end //delete
        { 1'b0, 8'h55, {WIDTH{?}}, 3'b0_0_0  }:  begin enable_cancel <= 1;  mess_type <= 4; end //replace
        
        default: begin  enable_add <= enable_add; enable_cancel <= enable_cancel <= enable_cancel; enable_dummy <= enable_dummy; mess_type <= mess_type; end
      endcase // casez ({reset_in, message, enable_add, enable_cancel, enable_dummy})
   end

   always@(posedge clk_in) begin
      case({enable_add, enable_cancel, enable_dummy})
        3'b1_0_0 : ready_out <= ready_add_out;
        3'b0_1_0 : ready_out <= ready_cancel_out;
        3'b0_0_1 : ready_out <= ready_dummy_out;
        default: ready_out <= 0; 
      endcase // case ({enable_add, enable_cancel, enable_dummy})
   end 
endmodule


module mkAddMessage #(parameter PRICE_WIDTH=15,
                      parameter ID_WIDTH=15,
                      parameter QUANT_WIDTH=7,
                      parameter STOCK_WIDTH=7,
                      parameter DATA_WIDTH=31)
   
   (
    input                   clk_in,
    input                   reset_in, 
    input [DATA_WIDTH:0]    data_in,
    input [2:0]             mess_type_in,             
    input                   enable_in,

    output [2:0]            operation_out,
    output [STOCK_WIDTH: 0] stock_symbol_out,
    output [ID_WIDTH: 0]    order_id_out, 
    output [PRICE_WIDTH: 0] price_out,
    output [QUANT_WIDTH: 0] quantity_out,
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

   logic [10:0]             count;
   always@(posedge clk_in) begin
      if(reset_in || enable_in) begin
         count <= 0; 
      end else begin
         casez(mess_type_in)
           default : begin
              if(count >= MESSAGE_TYPE + STOCK_LOCATE + TRACKING_NUMBER + TIMESTAMP +ORDER_REF_NUM + BUY_SELL_IND + SHARES + STOCK + PRICE + ATTRIBUTION  ) begin
                 ready_out <= 1;
                 price_out <= 10;
                 quantity_out <= 20;
                 order_id_out <= 24;
              end else begin
                 count <= count + 1;
              end
         endcase
      end
   end

endmodule

module mkCancelMessage #(parameter PRICE_WIDTH=15,
                         parameter ID_WIDTH=15,
                         parameter QUANT_WIDTH=7,
                         parameter STOCK_WIDTH=7,
                         parameter DATA_WIDTH=31)
   
   (
    input                   clk_in,
    input                   reset_in, 
    input [DATA_WIDTH:0]    data_in,
    input [2:0]             mess_type_in,             
    input                   enable_in,

    output [2:0]            operation_out,
    output [STOCK_WIDTH: 0] stock_symbol_out,
    output [ID_WIDTH: 0]    order_id_out, 
    output [PRICE_WIDTH: 0] price_out,
    output [QUANT_WIDTH: 0] quantity_out,
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

   logic [10:0]             count;
   always@(posedge clk_in) begin
      if(reset_in || enable_in) begin
         count <= 0;
      end else begin
         casez(mess_type_in)
           default : begin
              if(count >= MESSAGE_TYPE + STOCK_LOCATE + TRACKING_NUMBER + TIMESTAMP +ORDER_REF_NUM + EXECUTED_SHARES + MATCH_NUMBER + PRINTABLE +  PRICE  ) begin
                 ready_out <= 1;
                 price_out <= 20;
                 quantity_out <= 40;
                 order_id_out <= 34;
              end else begin
                 count <= count + 1;
              end
         endcase
      end
   end
endmodule

module mkDummyMessage #(parameter PRICE_WIDTH=15,
                        parameter ID_WIDTH=15,
                        parameter QUANT_WIDTH=7,
                        parameter STOCK_WIDTH=7,
                        parameter DATA_WIDTH=31)
   
   (
    input                   clk_in,
    input                   reset_in, 
    input [DATA_WIDTH:0]    data_in,
    input                   enable_in,

    output [2:0]            operation_out,
    output [STOCK_WIDTH: 0] stock_symbol_out,
    output [ID_WIDTH: 0]    order_id_out, 
    output [PRICE_WIDTH: 0] price_out,
    output [QUANT_WIDTH: 0] quantity_out,
    output                  ready_out
    );
endmodule
