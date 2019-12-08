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
    input                  clk_in,
    input                  reset_in, 
    input [DATA_WIDTH:0]   data_in,
    
    input [15:0]           sw,
    output                 ca, cb, cc, cd, ce, cf, cg, dp, // segments a-g, dp
    output [7:0]           an, 
        
    input                  valid_microblaze_in,
    output                 ready_to_microblaze_out, 
    input                  enable_in,

    output [2:0]           operation_out, //add = 1, cancel = 2, delete = 0
    // output [STOCK_WIDTH: 0] stock_symbol_out,
    // output [ID_WIDTH: 0]    order_id_out, 
    // output [PRICE_WIDTH: 0] price_out,
    // output [QUANT_WIDTH: 0] quantity_out,

    output [STOCK_WIDTH:0] stock_symbol_out_add,
    output [ID_WIDTH:0]    order_id_out_add, 
    output [PRICE_WIDTH:0] price_out_add,
    output [QUANT_WIDTH:0] quantity_out_add,
    
    output [STOCK_WIDTH:0] stock_symbol_out_cancel,
    output [ID_WIDTH:0]    order_id_out_cancel, 
    output [PRICE_WIDTH:0] price_out_cancel,
    output [QUANT_WIDTH:0] quantity_out_cancel, 
    output                 delete_out,

    input                  valid_master_in,
    output                 last_master_out,
    output                 ready_out
    );

   logic                    enable_parser;

 mk_parser parser(.clk_in(clk_in), .reset_in(reset_in), .data_in(data_in[7:0]), .enable_in(enable_parser), .valid_in(valid_microblaze_in), .valid_master_in(valid_master_in), .operation_out(operation_out), .stock_symbol_out_add(stock_symbol_out_add), .order_id_out_add(order_id_out_add), .price_out_add(price_out_add), .quantity_out_add(quantity_out_add),  .stock_symbol_out_cancel(stock_symbol_out_cancel), .order_id_out_cancel(order_id_out_cancel), .price_out_cancel(price_out_cancel), .quantity_out_cancel(quantity_out_cancel),  .ready_out(ready_out));
  

   assign ready_to_microblaze_out = ~ready_out;
   assign last_master_out = ready_out;
   assign enable_parser = 1; //have to think about this
      assign delete_out = (operation_out == 3'b000) && ready_out;
      16'b0_0_1_0_0_0_0 : data_to_display <= data_in;
       default : data_to_display <= operation_out;
       endcase

   // always@(posedge clk_in) begin
   //    if(reset_in) begin
          
   //    end else begin
   //       if(ready_out)ready_to_microblaze_out <= 1;
   // end
   
   
  logic [31:0] data_to_display ;   
  seg_display dis(.clk_in(clk_in), .rst_in(reset_in), .val_in(data_to_display), .cat_out({cg, cf, ce, cd, cc, cb, ca}), .an_out(an));
   logic [15:0] sw_debounced;
   assign  dp = 1'b1;  // turn off the period 
   debounce deb(.clock_in(clk_in), .reset_in(reset_in), .noisy_in(sw), .clean_out(sw_debounced));
   
   always@(posedge clk_in) begin
   case(operation_out)
   0 :    case(sw) 
       16'b0_0_0_0_0_0_0 : data_to_display <= price_out_add;
       16'b0_0_0_0_0_0_1 : data_to_display <= quantity_out_add;
       16'b0_0_0_0_0_1_0 : data_to_display <= order_id_out_add;
       16'b0_0_0_0_1_0_0 : data_to_display <= stock_symbol_out_add; 
        
       16'b0_0_0_1_0_0_0 : data_to_display <= {valid_microblaze_in, ready_to_microblaze_out, valid_master_in, last_master_out, ready_out};
       16'b0_0_1_0_0_0_0 : data_to_display <= data_in;

       default : data_to_display <= operation_out;
       endcase
   1 :case(sw) 
      16'b0_0_0_0_0_0_0 : data_to_display <= price_out_cancel;
      16'b0_0_0_0_0_0_1 : data_to_display <= quantity_out_cancel;
      16'b0_0_0_0_0_1_0 : data_to_display <= order_id_out_cancel;
      16'b0_0_0_0_1_0_0 : data_to_display <= stock_symbol_out_cancel; 
                       
      16'b0_0_0_1_0_0_0 : data_to_display <= {valid_microblaze_in, ready_to_microblaze_out, valid_master_in, last_master_out, ready_out};
      16'b0_0_1_0_0_0_0 : data_to_display <= data_in;
       default : data_to_display <= operation_out;
       endcase
   
   2 :case(sw) 
      16'b0_0_0_0_0_0_0 : data_to_display <= price_out_cancel;
      16'b0_0_0_0_0_0_1 : data_to_display <= quantity_out_cancel;
      16'b0_0_0_0_0_1_0 : data_to_display <= order_id_out_cancel;
      16'b0_0_0_0_1_0_0 : data_to_display <= stock_symbol_out_cancel; 
                       
      16'b0_0_0_1_0_0_0 : data_to_display <= {valid_microblaze_in, ready_to_microblaze_out, valid_master_in, last_master_out, ready_out};
      16'b0_0_1_0_0_0_0 : data_to_display <= data_in;
       
       default : data_to_display <= operation_out;
       endcase
   
   default :case(sw) 
      16'b0_0_0_0_0_0_0 : data_to_display <= price_out_add;
      16'b0_0_0_0_0_0_1 : data_to_display <= quantity_out_add;
      16'b0_0_0_0_0_1_0 : data_to_display <= order_id_out_add;
      16'b0_0_0_0_1_0_0 : data_to_display <= stock_symbol_out_add; 
                       
      16'b0_0_0_1_0_0_0 : data_to_display <= {valid_microblaze_in, ready_to_microblaze_out, valid_master_in, last_master_out, ready_out};
      16'b0_0_1_0_0_0_0 : data_to_display <= data_in;

       default : data_to_display <= operation_out;
       endcase
   
   endcase
   end
   
endmodule      
           
module debounce (input reset_in, clock_in, noisy_in,
                 output reg clean_out);

   reg [19:0] count;
   reg new_input;

//   always_ff @(posedge clock_in)
//     if (reset_in) begin new <= noisy_in; clean_out <= noisy_in; count <= 0; end
//     else if (noisy_in != new) begin new <= noisy_in; count <= 0; end
//     else if (count == 650000) clean_out <= new;
//     else count <= count+1;

   always_ff @(posedge clock_in)
     if (reset_in) begin 
        new_input <= noisy_in; 
        clean_out <= noisy_in; 
        count <= 0; end
     else if (noisy_in != new_input) begin new_input<=noisy_in; count <= 0; end
     else if (count == 650000) clean_out <= new_input;
     else count <= count+1;


endmodule

module seg_display(input              clk_in,
                   input              rst_in,
                   input [31:0]       val_in,
                   output logic [6:0] cat_out, // was 7:0 for some reason
                   output logic [7:0] an_out
                   );
   
   logic [7:0]                        segment_state;
   logic [31:0]                       segment_counter;
   logic [3:0]                        routed_vals;
   logic [6:0]                        led_out;
   
   binary_to_seven_seg my_converter ( .in(routed_vals), .out(led_out));
   assign cat_out = ~led_out;
   assign an_out = ~segment_state;

   
   always_comb begin
      case(segment_state)
        8'b0000_0001:   routed_vals = val_in[3:0];
        8'b0000_0010:   routed_vals = val_in[7:4];
        8'b0000_0100:   routed_vals = val_in[11:8];
        8'b0000_1000:   routed_vals = val_in[15:12];
        8'b0001_0000:   routed_vals = val_in[19:16];
        8'b0010_0000:   routed_vals = val_in[23:20];
        8'b0100_0000:   routed_vals = val_in[27:24];
        8'b1000_0000:   routed_vals = val_in[31:28];
        default:        routed_vals = val_in[3:0];       
      endcase
   end
   
   always_ff @(posedge clk_in)begin
      if (rst_in)begin
         segment_state <= 8'b0000_0001;
         segment_counter <= 32'b0;
      end else begin
         if (segment_counter == 32'd100_000)begin //changed from 100_000
            segment_counter <= 32'd0;
            segment_state <= {segment_state[6:0],segment_state[7]};
         end else begin
            segment_counter <= segment_counter +1;
         end
      end
   end
   
endmodule //seven_seg_controller


//feel free to either include binary_to_seven_seg module here or in its own file!
module binary_to_seven_seg (in,
                            out
                            );
   
   input [3:0]                in;
   output logic [6:0]         out;

   assign out[0] = ~((in == 1)  | (in == 4)  | (in == 11) | (in == 13));
   assign out[1] = ~((in == 5)  | (in == 6)  | (in == 11) | (in == 12) | (in == 14) | (in == 15));    
   assign out[2] = ~((in == 2)  | (in == 12) | (in == 14) | (in == 15));
   assign out[3] = ~((in == 1)  | (in == 4)  | (in == 7)  | (in == 10) | (in == 15));    
   assign out[4] = ~((in == 1)  | (in == 3)  | (in == 4)  | (in == 5)  | (in == 7)  | (in == 9 ));
   assign out[5] = ~((in == 1)  | (in == 2)  | (in == 3)  | (in == 7)  | (in == 13));
   assign out[6] = ~((in == 0)  | (in == 1)  | (in == 7)  | (in == 12));
   
   
endmodule
               
module mk_parser # (parameter PRICE_WIDTH=15,
                 parameter ID_WIDTH=15,
                 parameter QUANT_WIDTH=7,
                 parameter STOCK_WIDTH=7,
                 parameter DATA_WIDTH=7)//31
   
   (
    input                  clk_in,
    input                  reset_in, 
    input [DATA_WIDTH:0]   data_in,
    input                  enable_in,
    
    input                  valid_in,
    
    input                  valid_master_in,
    output logic [2:0]     operation_out,
    // output [STOCK_WIDTH: 0] stock_symbol_out,
    // output [ID_WIDTH: 0]    order_id_out, 
    // output [PRICE_WIDTH: 0] price_out,
    // output [QUANT_WIDTH: 0] quantity_out,
    
    output [STOCK_WIDTH:0] stock_symbol_out_add,
    output [ID_WIDTH:0]    order_id_out_add, 
    output [PRICE_WIDTH:0] price_out_add,
    output [QUANT_WIDTH:0] quantity_out_add,
    
    output [STOCK_WIDTH:0] stock_symbol_out_cancel,
    output [ID_WIDTH:0]    order_id_out_cancel, 
    output [PRICE_WIDTH:0] price_out_cancel,
    output [QUANT_WIDTH:0] quantity_out_cancel, 
    
    output logic           ready_out
    );

   logic                    enable_add;
   logic                    enable_cancel;
   logic                    enable_dummy;
   logic [2:0]              mess_type;              

    logic  [2:0]                            operation_out_add;
   // logic  [STOCK_WIDTH:0]                  stock_symbol_out_add;
   // logic  [ID_WIDTH:0]                     order_id_out_add;     
   // logic  [PRICE_WIDTH:0]                  price_out_add;
   // logic  [QUANT_WIDTH:0]                  quantity_out_add;
   
    logic [2:0]                           operation_out_cancel;
   // logic [STOCK_WIDTH:0]                    stock_symbol_out_cancel;
   // logic [ID_WIDTH:0]                       order_id_out_cancel;     
   // logic [PRICE_WIDTH:0]                    price_out_cancel;
   // logic [QUANT_WIDTH:0]                    quantity_out_cancel;

   logic [2:0]                               operation_out_dummy;
   logic [STOCK_WIDTH:0]                    stock_symbol_out_dummy;
   logic [ID_WIDTH:0]                       order_id_out_dummy;     
   logic [PRICE_WIDTH:0]                    price_out_dummy;
   logic [QUANT_WIDTH:0]                    quantity_out_dummy;
   
   logic                                    ready_add_out;
   logic                                    ready_cancel_out;
   logic                                    ready_dummy_out;
   
   logic [DATA_WIDTH:0] data_reg;
   //using data_in not data_reg here to automatically skip it but currently used to pipeline ffor correctness
   mkAddMessage #(.PRICE_WIDTH(PRICE_WIDTH), .ID_WIDTH(ID_WIDTH), .QUANT_WIDTH(QUANT_WIDTH), .STOCK_WIDTH(STOCK_WIDTH)) addMessage(.clk_in(clk_in), .reset_in(reset_in), .data_in(data_reg), .mess_type_in(mess_type), .enable_in(enable_add), .valid_in(valid_in), .operation_out(operation_out_add), .stock_symbol_out(stock_symbol_out_add), .order_id_out(order_id_out_add), .price_out(price_out_add), .quantity_out(quantity_out_add), .ready_out(ready_add_out));
   
    mkCancelMessage #(.PRICE_WIDTH(PRICE_WIDTH), .ID_WIDTH(ID_WIDTH), .QUANT_WIDTH(QUANT_WIDTH), .STOCK_WIDTH(STOCK_WIDTH)) cancelMessage(.clk_in(clk_in), .reset_in(reset_in), .data_in(data_reg),.mess_type_in(mess_type), .enable_in(enable_cancel), .valid_in(valid_in), .operation_out(operation_out_cancel), .stock_symbol_out(stock_symbol_out_cancel), .order_id_out(order_id_out_cancel), .price_out(price_out_cancel), .quantity_out(quantity_out_cancel), .ready_out(ready_cancel_out));
   
   mkDummyMessage #(.PRICE_WIDTH(PRICE_WIDTH), .ID_WIDTH(ID_WIDTH), .QUANT_WIDTH(QUANT_WIDTH), .STOCK_WIDTH(STOCK_WIDTH)) dummyMessage(.clk_in(clk_in), .reset_in(reset_in), .data_in(data_message_size), .enable_in(enable_dummy), .valid_in(valid_in), .operation_out(operation_out_dummy), .stock_symbol_out(stock_symbol_out_dummy), .order_id_out(order_id_out_dummy), .price_out(price_out_dummy), .quantity_out(quantity_out_dummy), .ready_out(ready_dummy_out));

   parameter MESSAGE_TYPE = DATA_WIDTH - 7;

   logic [7:0]                              message;
   logic [DATA_WIDTH:0]                     data_last;
   logic [DATA_WIDTH:0]                     data_last2;
   logic [DATA_WIDTH:0]                     data_message_size;
   
   logic                                    get_length; 
   assign message = data_in[7:0];
   
   // always@(posedge clk_in) begin
   //    data_last <= data_in;
   //    data_last2 <= data_last;
   //    data_message_size <= data_last2;
     
   // end 
   //logic ready_ou
   always@(posedge clk_in) begin
      casez({reset_in, valid_in, message, ready_out || ready_dummy_out, valid_master_in || ready_dummy_out, get_length, enable_add, enable_cancel, enable_dummy}) //probably want to make this message a bit stream parameterized (actually although that may yeild energy savings, latency savings are not there). 
        //actualy there can be latency saving for a class of trading strategies or book bulding methods (when system can't match but that is unlikley as that would be the excahgne machine is sso good that it can send informtation so fast) that are only looking at the msb s and doing computation on them.
        { 16'b1_?_????_????_?_?_?_???}: begin  data_reg <= 0; enable_add <= 0; enable_cancel <= 0; enable_dummy <= 0; mess_type <= 0; get_length <= 1; end
        // skip 00 messages, they are not really useful
        { 1'b0, 1'b1, 8'h00,  1'b0, 1'b?, 1'b?, 3'b0_0_0  }:  begin data_reg <= data_reg; enable_add <= enable_add; enable_cancel <= enable_cancel; enable_dummy <= enable_dummy; mess_type <= mess_type; end
       
        // get the length of the message
        { 1'b0, 1'b1, 8'h??,  1'b0, 1'b?, 1'b1, 3'b0_0_0  }:  begin data_message_size <= data_reg; get_length <= 0; end

        // send the message to the appropriate parser
        { 1'b0, 1'b1, 8'h41,  1'b0, 1'b?, 1'b0, 3'b0_0_0  }:  begin data_reg <= data_in; enable_add <= 1; mess_type <= 0; end //add
        { 1'b0, 1'b1, 8'h46,  1'b0, 1'b?, 1'b0, 3'b0_0_0  }:  begin data_reg <= data_in; enable_add <= 1; mess_type <= 1; end // add with id
        
        { 1'b0, 1'b1, 8'h45,  1'b0, 1'b?, 1'b0, 3'b0_0_0  }:  begin data_reg <= data_in; enable_cancel <= 1; mess_type <= 0; end //exec
        { 1'b0, 1'b1, 8'h43,  1'b0, 1'b?, 1'b0, 3'b0_0_0  }:  begin data_reg <= data_in; enable_cancel <= 1;  mess_type <= 1; end //exec_price
        { 1'b0, 1'b1, 8'h58,  1'b0, 1'b?, 1'b0, 3'b0_0_0  }:  begin data_reg <= data_in; enable_cancel <= 1;  mess_type <= 2; end //cancel
        { 1'b0, 1'b1, 8'h44,  1'b0, 1'b?, 1'b0, 3'b0_0_0  }:  begin data_reg <= data_in; enable_cancel <= 1;  mess_type <= 3; end //delete
        { 1'b0, 1'b1, 8'h55,  1'b0, 1'b?, 1'b0, 3'b0_0_0  }:  begin data_reg <= data_in; enable_cancel <= 1;  mess_type <= 4; end //replace

        { 1'b0, 1'b1, 8'h??,  1'b0, 1'b?, 1'b0, 3'b0_0_0  }:  begin data_reg <= data_in; enable_dummy <= 1;  mess_type <= 4; end //dummy

        //reset when ready signals are high 
        {16'b0_????_????_1_1_0_???}: begin data_reg <= 0; mess_type <= 0; enable_add <= 0; enable_cancel <= 0; get_length <= 1; enable_dummy <= 0; end
        
        default: begin  data_reg <= data_reg; get_length <= get_length; enable_add <= enable_add; enable_cancel <= enable_cancel; enable_dummy <= enable_dummy; mess_type <= mess_type; end
      endcase // casez ({reset_in, message, ready_out, enable_add, enable_cancel, enable_dummy})
   end

   
   always_comb begin
      case({enable_add, enable_cancel, enable_dummy})
        3'b1_0_0 : begin ready_out = ready_add_out; operation_out = operation_out_add; end
        3'b0_1_0 : begin ready_out = ready_cancel_out; operation_out = operation_out_cancel; end
        3'b0_0_1 : ready_out = 0;
        default: begin ready_out = 0; operation_out = 0; end
      endcase // case ({enable_add, enable_cancel, enable_dummy})
   end 
   
//      always@(posedge clk_in) begin
//         ready_out <= ready_out_this;
//      end
      
      
      //   always_comb begin
//      case({enable_add, enable_cancel, enable_dummy})
//        3'b1_0_0 : begin ready_out_this = ready_add_out; end
//        3'b0_1_0 : ready_out_this = ready_cancel_out;
//        3'b0_0_1 : ready_out_this = ready_dummy_out;
//        default: ready_out_this = 0; 
//      endcase // case ({enable_add, enable_cancel, enable_dummy})
//   end 
   
//   logic ready_out_2;
//      always@(posedge clk_in) begin
//         ready_out_2 <= ready_out_this;
//         ready_out <= ready_out_2;
//      end
endmodule


module mkAddMessage #(parameter PRICE_WIDTH=15,
                      parameter ID_WIDTH=15,
                      parameter QUANT_WIDTH=7,
                      parameter STOCK_WIDTH=7,
                      parameter DATA_WIDTH=31)
   
   (
    input                         clk_in,
    input                         reset_in, 
    input [DATA_WIDTH:0]          data_in,
    input [2:0]                   mess_type_in, 
    input                         enable_in,

    input                         valid_in, 

    output logic [2:0]            operation_out,
    output logic [STOCK_WIDTH: 0] stock_symbol_out,
    output logic [ID_WIDTH: 0]    order_id_out, 
    output logic order_type_out,  
    output logic [PRICE_WIDTH: 0] price_out,
    output logic [QUANT_WIDTH: 0] quantity_out,
    output logic                  ready_out
    );
   parameter MESSAGE_TYPE = 0; //because we look at messages a cycle after it comes in. it comes in the same cycle (~enable_in_reg && enable_in) == 1.
   parameter STOCK_LOCATE = 2;
   parameter TRACKING_NUMBER = 2;
   parameter TIMESTAMP = 6;
   parameter ORDER_REF_NUM = 8;
   parameter BUY_SELL_IND = 1;
   parameter SHARES = 4;
   parameter STOCK = 8;
   parameter PRICE = 4;
   parameter ATTRIBUTION = 4;

   logic [ (MESSAGE_TYPE + STOCK_LOCATE + TRACKING_NUMBER + TIMESTAMP +ORDER_REF_NUM + BUY_SELL_IND + SHARES + STOCK + PRICE + ATTRIBUTION) * 8 - 1 :0  ] parsed_data;
   logic [10:0]                                                                                                                                           count;
   logic                                                                                                                                                  enable_in_reg;
   logic ready_out_reg;
   logic mess_type_reg;
   
   assign operation_out = 3'b1;
   always_comb begin
      if(~enable_in_reg && enable_in) begin
           ready_out = 0;
      end else begin
         ready_out = ready_out_reg;
      end
   end
   always@(posedge clk_in) begin
      if(reset_in) begin
         count <= 0; enable_in_reg <=0; ready_out_reg <= 0; mess_type_reg <= 0;
      end else begin
         enable_in_reg <= enable_in;
         if(~enable_in_reg && enable_in) begin
            count <= 0; ready_out_reg <= 0;price_out <= 0; quantity_out <= 0; order_id_out <= 0; stock_symbol_out <= 0; mess_type_reg <= mess_type_in;
         end else begin
             casez(mess_type_reg)
               0 : begin
                  if(valid_in) begin
                     count <= count + 1;
                     parsed_data[count * 8 +: DATA_WIDTH] <= data_in;
                  end
                  if(count >= MESSAGE_TYPE + STOCK_LOCATE + TRACKING_NUMBER + TIMESTAMP +ORDER_REF_NUM + BUY_SELL_IND + SHARES + STOCK + PRICE) begin
                     ready_out_reg <= 1;
                     order_id_out <= parsed_data[(MESSAGE_TYPE + STOCK_LOCATE + TRACKING_NUMBER + TIMESTAMP) * 8 +: ORDER_REF_NUM * 8]; 
                     order_type_out <=  parsed_data[(MESSAGE_TYPE + STOCK_LOCATE + TRACKING_NUMBER + TIMESTAMP +ORDER_REF_NUM) * 8 +: BUY_SELL_IND * 8] == 8'h41 ? 1'b0 : 1'b1 ;
                     quantity_out <=  parsed_data[(MESSAGE_TYPE + STOCK_LOCATE + TRACKING_NUMBER + TIMESTAMP +ORDER_REF_NUM + BUY_SELL_IND ) * 8 +: SHARES * 8];
                     stock_symbol_out <=  parsed_data[(MESSAGE_TYPE) * 8 +: STOCK_LOCATE * 8];
                     price_out <= parsed_data[(MESSAGE_TYPE + STOCK_LOCATE + TRACKING_NUMBER + TIMESTAMP +ORDER_REF_NUM + BUY_SELL_IND + SHARES + STOCK) * 8 +: PRICE * 8];

                  end
               end
               default : begin
                  if(count > MESSAGE_TYPE + STOCK_LOCATE + TRACKING_NUMBER + TIMESTAMP +ORDER_REF_NUM + BUY_SELL_IND + SHARES + STOCK + PRICE + ATTRIBUTION  ) begin
                     ready_out_reg <= 1;
                     price_out <= 10;
                     quantity_out <= 20;
                     order_id_out <= 24;
                     stock_symbol_out <= 23;
                  end else begin
                     count <= count + 1;
                  end
               end
             endcase
         end
      end
   end

endmodule

module mkCancelMessage #(parameter PRICE_WIDTH=15,
                         parameter ID_WIDTH=15,
                         parameter QUANT_WIDTH=7,
                         parameter STOCK_WIDTH=7,
                         parameter DATA_WIDTH=31)
   
   (
    input                         clk_in,
    input                         reset_in, 
    input [DATA_WIDTH:0]          data_in,
    input [2:0]                   mess_type_in, 
    input                         enable_in,

    input                         valid_in,
 
    output [2:0]                  operation_out,
    output logic [STOCK_WIDTH: 0] stock_symbol_out,
    output logic [ID_WIDTH: 0]    order_id_out, 
    output logic [PRICE_WIDTH: 0] price_out,
    output logic [QUANT_WIDTH: 0] quantity_out,
    output logic                  ready_out
    );

   parameter MESSAGE_TYPE = 0; //because we look at messages a cycle after it comes in. it comes in the same cycle (~enable_in_reg && enable_in) == 1.
   parameter STOCK_LOCATE = 2;
   parameter TRACKING_NUMBER = 2;
   parameter TIMESTAMP = 6;
   parameter ORDER_REF_NUM = 8;
   parameter SHARES = 4;
   parameter MATCH_NUMBER = 8;
   parameter PRINTABLE = 8;
   parameter PRICE = 4;

   logic [10:0]             count;
      logic [ (MESSAGE_TYPE + STOCK_LOCATE + TRACKING_NUMBER + TIMESTAMP + ORDER_REF_NUM  + SHARES + MATCH_NUMBER + PRINTABLE + PRICE) * 8 - 1 :0  ] parsed_data;
   assign operation_out = {1'b0, ~mess_type_in[0], 0};// currently 3'b010;//mess_type_in[1]}; assign operation_out = {1'b0, mess_type_in[0], mess_type_in[1]}; //currently only order cancel and order delete (2,3) //{1'b0, mess_type_in[1] , ~mess_type_in[1]}; //cancel order (01, 10)

   
   logic enable_in_reg;
   logic ready_out_reg;
   logic mess_type_reg;
   
   always_comb begin
      if(~enable_in_reg && enable_in) begin
           ready_out = 0;
      end else begin
         ready_out = ready_out_reg;
      end
   end
   always@(posedge clk_in) begin
      if(reset_in) begin
         count <= 0; enable_in_reg <=0; ready_out_reg <= 0; mess_type_reg <= 0;
      end else begin
         enable_in_reg <= enable_in;
         if(~enable_in_reg && enable_in) begin
            count <= 0; ready_out_reg <= 0;price_out <= 0; quantity_out <= 0; order_id_out <= 0; stock_symbol_out <= 0; mess_type_reg <= mess_type_in;
         end else begin
             casez(mess_type_reg)
               3 : begin
                  if(valid_in) begin
                     count <= count + 1;
                     parsed_data[count * 8 +: DATA_WIDTH] <= data_in;
                  end
                  if(count >= MESSAGE_TYPE + STOCK_LOCATE + TRACKING_NUMBER + TIMESTAMP + ORDER_REF_NUM  + SHARES  ) begin
                     ready_out_reg <= 1;
                     order_id_out <= parsed_data[(MESSAGE_TYPE + STOCK_LOCATE + TRACKING_NUMBER + TIMESTAMP) * 8 +: ORDER_REF_NUM * 8]; 
                     stock_symbol_out <=  parsed_data[(MESSAGE_TYPE) * 8 +: STOCK_LOCATE * 8];
                     quantity_out <=  parsed_data[(MESSAGE_TYPE + STOCK_LOCATE + TRACKING_NUMBER + TIMESTAMP +ORDER_REF_NUM  ) * 8 +: SHARES * 8];
                 end
                 end    
               2 : begin
                  if(valid_in) begin
                     count <= count + 1;
                     parsed_data[count +: DATA_WIDTH] <= data_in;
                  end
                  if(count >= MESSAGE_TYPE + STOCK_LOCATE + TRACKING_NUMBER + TIMESTAMP + ORDER_REF_NUM ) begin
                     ready_out_reg <= 1;
                     order_id_out <= parsed_data[(MESSAGE_TYPE + STOCK_LOCATE + TRACKING_NUMBER + TIMESTAMP) * 8 +: ORDER_REF_NUM * 8]; 
                     stock_symbol_out <=  parsed_data[(MESSAGE_TYPE) * 8 +: STOCK_LOCATE * 8];
                  end
               end 
               default : begin
                  if(count > MESSAGE_TYPE + STOCK_LOCATE + TRACKING_NUMBER + TIMESTAMP +ORDER_REF_NUM + SHARES + MATCH_NUMBER + PRINTABLE +  PRICE  ) begin
                     ready_out_reg <= 1;
                     price_out <= 56;
                     quantity_out <= 980;
                     order_id_out <= 2894;
                     stock_symbol_out <= 2983;
                  end else begin
                     count <= count + 1;
                  end
               end
             endcase
         end
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

    input                   valid_in,
    
    output [2:0]            operation_out,
    output [STOCK_WIDTH: 0] stock_symbol_out,
    output [ID_WIDTH: 0]    order_id_out, 
    output [PRICE_WIDTH: 0] price_out,
    output [QUANT_WIDTH: 0] quantity_out,
    output logic                 ready_out
    );

   logic                    start;
   logic [10:0]             count;
             
  always@(posedge clk_in) begin
     if(reset_in) begin
        start <= 0; count <= 0; ready_out <= 0;
     end
     if (~start && enable_in) begin
        start <= 1;
        count <= data_in;
end
  end 

   always@(posedge clk_in) begin
      if(~reset_in) begin
          if(start && valid_in) begin
             count <= count - 1;
          end
          if(count <= 1) begin
             start <= 0;
             ready_out <= 1; 
          end else begin
             ready_out <= 0;
          end
      end
   end
endmodule
