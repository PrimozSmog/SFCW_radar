`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/10/2023 09:35:59 AM
// Design Name: 
// Module Name: IQ_control
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


module IQ_control(
    input clk,
    output reg rf_switch,
    input wire signed [47:0] acc_in,
    output wire signed [47:0] component_TX,
    output wire signed [47:0] component_RX
    );
    
    reg signed [47:0] acc_TX;
    reg signed [47:0] acc_RX;
    
    reg [15:0] counter;
    reg signed [47:0] out;
    
    always @(posedge clk) begin
        counter <= counter + 1;
        
        if (counter == 0) begin
            rf_switch <= 0;
        end
            
        if (counter == 100) begin
            acc_TX <= acc_in;
            rf_switch <= 1;
        end
        
        if (counter == 200) begin
            acc_RX <= acc_in;
            counter <=0;
        end        
        

    end
    
    assign component_TX = acc_TX;
    assign component_RX = acc_RX;
    
endmodule
