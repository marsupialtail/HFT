`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/06/2019 05:37:01 PM
// Design Name: 
// Module Name: uart
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


module mkUartRxIn  #(parameter DATA_SIZE = 7,
                     BAUD_RATE = 9600 )(
    input clk_in,
    input reset_in,
    input rx_in,
    
    output ready_out,
    output [DATA_SIZE:0] data_out
    );

//   logic [60:0] data_out;
//   logic [31:0] data_counter;
//   logic [31:0] sample_counter;
   
//   logic [31:0] valid_counter;
   
//   logic old_serial_in;
   
//   logic valid;
//   logic state;

//   ila_1 my_ila_1(.clk(clk_in), .probe0(x_out), .probe1(y_out), .probe2(data_counter), .probe3(sample_counter), .probe4(valid_counter), .probe5(data_out), .probe6(state));
//   always@(posedge clk_in) begin
//     casez ({reset_in, state})
//       2'b1?: begin state <= 0; ready <= 0; data_out <= 0; data_counter <= 0; sample_counter <= 0; valid_counter <= 0; valid <= 1; end
//       2'b00: begin
//             ready <= 0;
//             if(sample_counter == TWO_MS) begin
//                if(!serial_in) begin
//                    valid_counter <= 1;
//                    state <= 1;
//                    sample_counter <= 0;
//                end 
//             end else begin
//                sample_counter <= sample_counter + 1;
//             end
//           end
       
//       2'b01: begin
//                if(data_counter < 60) begin
//                   if(sample_counter >= BAUD_RATE) begin
//                                     sample_counter <= 0;
//                                    if(valid_counter == 15) begin valid_counter <= 0; end else
//                                    if(valid_counter == 8) begin valid_counter <= valid_counter + 1; data_counter <= data_counter + 1; data_out <= {serial_in, data_out[59:1]};  end
//                                    else begin valid_counter <= valid_counter + 1; end 
//                   end else sample_counter <= sample_counter + 1;             
//                end else begin
//                       x_out <= {data_out[18:11], data_out[8:1]};
//                       y_out <= {data_out[38:31], data_out[28:21]};
//                       ready <= 1;
       
//                    state <= 0;
//                    data_counter <= 0;
//                    sample_counter <= 0;
//                end
//           end
       
//       default: begin state <= 0; ready <= 0; data_out <= 0; data_counter <= 0; sample_counter <= 0; valid_counter <= 0; valid <= 1;  end
//   endcase
//   end
endmodule

module mkUartTxOut #(parameter DATA_SIZE = 7)(
    input clk_in,
    input reset_in,
    input [DATA_SIZE:0] data_in,
        
    output ready_out,
    output tx_out
    );
endmodule