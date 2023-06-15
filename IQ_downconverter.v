`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/05/2023 03:34:46 PM
// Design Name: 
// Module Name: IQ_downconverter
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


module IQ_downconverter
    
    (
    input clk,
    input rst,
    input signed [13:0] adc,
    output wire rf_switch,
    output wire signed [13:0] LO2_s,
    output wire signed [13:0] LO2_c,
    output wire signed [31:0] I_if,
    output wire signed [31:0] Q_if,
    output wire signed [31:0] I_out,
    output wire signed [31:0] Q_out,
    output wire signed [47:0] I_TX_out,
    output wire signed [47:0] I_RX_out,
    output wire signed [47:0] Q_TX_out,
    output wire signed [47:0] Q_RX_out,
    output wire signed [47:0] test
    );

    
    LO2 
    #(.COS(0))LO2_sin
    (
        .clk(clk),
        .rst(rst),
        .LO2_out(LO2_s)
    );
    
    LO2 
    #(.COS(1))LO2_cos
    (
        .clk(clk),
        .rst(rst),
        .LO2_out(LO2_c)
    );
    
    mixer
    #(.RF_WIDTH(14),
    .LO_WIDTH(14),
    .IF_WIDTH(32)) mixer_i
    (
        .clk(clk),
        .rf(adc),//adc
        .lo2(LO2_s),
        .if_out(I_if) 
    );
    
    mixer
    #(.RF_WIDTH(14),
    .LO_WIDTH(14),
    .IF_WIDTH(32)) mixer_q
    (
        .clk(clk),
        .rf(adc),//adc
        .lo2(LO2_c),
        .if_out(Q_if) 
    );
    
    accumulator I_accum(
    .clk(clk),
    .mixer_in(I_if),
    .acc_out(I_out)
    );
    
    accumulator Q_accum(
    .clk(clk),
    .mixer_in(Q_if),
    .acc_out(Q_out)
    );
    
    IQ_control I_control(
    .clk(clk),
    .rf_switch(rf_switch), //rf_switch connected here only, drives rf_switch for both I_control and Q_control
    .acc_in(I_out),
    .component_TX(I_TX_out),
    .component_RX(I_RX_out)
    );
    
    IQ_control Q_control(
    .clk(clk),
    .rf_switch(),
    .acc_in(Q_out),
    .component_TX(Q_TX_out),
    .component_RX(Q_RX_out)
    );
 
endmodule
