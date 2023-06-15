`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/06/2023 11:58:41 AM
// Design Name: 
// Module Name: mixer
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


module mixer
    #(parameter RF_WIDTH = 14,
      parameter LO_WIDTH = 14,
      parameter IF_WIDTH = 32)
    (
    input clk,
    input wire signed [RF_WIDTH-1 : 0] rf,
    input wire signed [LO_WIDTH-1 : 0] lo2,
    output wire signed [IF_WIDTH-1 : 0] if_out
    );
    
    //reg [RF_WIDTH+LO_WIDTH-1 : 0] pipe [1:0];
    reg signed [RF_WIDTH-1 : 0] a;
    reg signed [LO_WIDTH-1 : 0] b;
    //reg [IF_WIDTH-1 : 0] non_rounded,rounded;
    
    reg signed [31 : 0] m;
    
    
    always @(posedge clk) begin
        a <= rf;
        b <= lo2;
        //m <= a*b;
        m = rf*lo2;
    end

    assign if_out = m;

endmodule
