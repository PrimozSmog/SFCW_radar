`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2022 11:39:31 AM
// Design Name: 
// Module Name: clk_divider
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


module clk_divider
  #(parameter DIVISOR = 28'd10000000)
    (
    input clk_in,
    output reg clk_out
    );
    
    reg [63:0] counter;
    
always @(posedge clk_in)
    begin
         counter <= counter + 28'd1;
         if (counter >= (DIVISOR-1))
          counter <= 28'd0;
         clk_out <= (counter < DIVISOR / 2) ? 1'b1:1'b0;
    end     
    
endmodule
