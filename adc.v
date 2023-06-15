`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2022 11:32:18 AM
// Design Name: 
// Module Name: adc
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


module adc(
    input clk,
    input adc0,
    input adc1,
    input adc2,
    input adc3,
    input adc4,
    input adc5,
    input adc6,
    input adc7,
    input adc8,
    input adc9,
    input adc10,
    input adc11,
    input adc12,
    input adc13,
    output reg [13:0] adc_val
    );
    
    wire clk_o;
    
    reg [1024:0] counter;

    
    clk_divider #(.DIVISOR(10))
    (.clk_in(clk),
    .clk_out(clk_o));
    
    always @(posedge clk)
        begin
            adc_val[0] = adc0;
            adc_val[1] = adc1;
            adc_val[2] = adc2;
            adc_val[3] = adc3;
            adc_val[4] = adc4;
            adc_val[5] = adc5;
            adc_val[6] = adc6;
            adc_val[7] = adc7;
            adc_val[8] = adc8;
            adc_val[9] = adc9;
            adc_val[10] = adc10;
            adc_val[11] = adc11;
            adc_val[12] = adc12;
            adc_val[13] = adc13;
        end
    
endmodule
