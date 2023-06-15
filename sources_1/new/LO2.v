`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/05/2023 04:45:32 PM
// Design Name: 
// Module Name: LO2
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


module LO2    
    #(parameter COS = 1,
      parameter BIT_WIDTH = 14,
      parameter TABLE_SIZE = 5,
      parameter TABLE_WIDTH = 3
    )
    (
        input clk,
        input rst,
        output wire signed [BIT_WIDTH-1 : 0] LO2_out
    );
    
    function [TABLE_WIDTH-1 : 0] init_i;
        input COS;
        if (COS) init_i =  TABLE_SIZE;
        else init_i = 0;
    endfunction
        
    function init_dir;
        input COS;
        if (COS) init_dir = 1;
        else init_dir = 0;
    endfunction
    
    reg direction = init_dir(COS);
    reg [TABLE_WIDTH-1 : 0] index = init_i(COS);
    reg sign = 0;
    
    reg signed [BIT_WIDTH-1 : 0] table_value [TABLE_SIZE : 0] ;//= {0{14'd0},1{14'd2531},2{14'd4814},3{14'd6626},4{14'd7790},5{14'd8191}};
    
    always @(posedge clk) begin
        table_value[0] = 14'd0;
        table_value[1] = 14'd2531;
        table_value[2] = 14'd4814;
        table_value[3] = 14'd6626;
        table_value[4] = 14'd7790;
        table_value[5] = 14'd8191;
    end
    
    always @(posedge clk) begin
    
        if (~rst) begin
            if (COS) begin
                index <= TABLE_SIZE;
                sign <= 0;
                direction = 1;
            end
            else begin
                index <= 0;
                sign <= 0;
                direction = 0;
            end
        end
    
        else begin
            if (index == TABLE_SIZE)begin
                direction = 1;
            end
            if (index == 0) begin
                direction = 0;
                sign = ~sign; 
            end
            if (direction == 0) index <= index + 1;
            else index <= index - 1;         
        end
    end
    
    assign LO2_out = sign == 0 ? table_value[index] : -table_value[index];
    
endmodule
