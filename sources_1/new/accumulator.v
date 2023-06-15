`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/09/2023 08:42:49 AM
// Design Name: 
// Module Name: accumulator
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


module accumulator(

    input clk,

    input wire signed [31:0] mixer_in,
    output wire signed [47:0] acc_out
    );
    
    reg signed [47:0] sum;
    reg [13:0] counter;
    reg signed [47:0] acc;
    
    always @(posedge clk) begin
        sum <= sum + mixer_in;
        counter = counter + 1;
        if (counter == 20) begin
            sum <= 0;
            acc <= sum;
            counter <= 0;
        end
    end
    
    assign acc_out = acc;
    
endmodule
