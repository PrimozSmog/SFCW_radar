`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/17/2023 08:42:07 AM
// Design Name: 
// Module Name: LO1FreqRegisters
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


module LO1FreqRegisters(
    input  clk,
    input [13:0] freqNumber,
    input [13:0] freqRegisterNumber,
    output reg [3:0] numberOfRegisters,
    output reg [23:0] LMXRegOut
    );
    
    reg [23:0] LMXReg [4:0];
    
    
always @(posedge clk) begin
    LMXRegOut = LMXReg[freqRegisterNumber];
    
    case (freqNumber)
        8'b00000000 : begin
            numberOfRegisters<= 4'b0100;
            LMXReg [1] <= 24'h4B08C0;
            LMXReg [2] <= 24'h240191;
            LMXReg [3] <= 24'h2B0258;
            LMXReg [4] <= 24'h250205;
        end
        8'b00000001 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240199;
        end
        8'b00000010 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401A1;
        end
        8'b00000011 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401A9;
        end
        8'b00000100 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401B1;
        end
        8'b00000101 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401B9;
        end
        8'b00000110 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401C1;
        end
        8'b00000111 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401C9;
        end
        8'b00001000 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401D1;
        end
        8'b00001001 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401D9;
        end
        8'b00001010 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401E1;
        end
        8'b00001011 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401E9;
        end
        8'b00001100 : begin
            numberOfRegisters<= 4'b0010;
            LMXReg [1] <= 24'h2401F1;
            LMXReg [2] <= 24'h250305;
        end
        8'b00001101 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401F9;
        end
        8'b00001110 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240201;
        end
        8'b00001111 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240209;
        end
        8'b00010000 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240211;
        end
        8'b00010001 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240219;
        end
        8'b00010010 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240221;
        end
        8'b00010011 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240229;
        end
        8'b00010100 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240231;
        end
        8'b00010101 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240239;
        end
        8'b00010110 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240241;
        end
        8'b00010111 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240249;
        end
        8'b00011000 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240251;
        end
        8'b00011001 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240259;
        end
        8'b00011010 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240261;
        end
        8'b00011011 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240269;
        end
        8'b00011100 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240271;
        end
        8'b00011101 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240279;
        end
        8'b00011110 : begin
            numberOfRegisters<= 4'b0100;
            LMXReg [1] <= 24'h4B0840;
            LMXReg [2] <= 24'h240140;
            LMXReg [3] <= 24'h2B0320;
            LMXReg [4] <= 24'h250205;
        end
        8'b00011111 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240144;
        end
        8'b00100000 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240148;
        end
        8'b00100001 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h24014C;
        end
        8'b00100010 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240150;
        end
        8'b00100011 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240154;
        end
        8'b00100100 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240158;
        end
        8'b00100101 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h24015C;
        end
        8'b00100110 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240160;
        end
        8'b00100111 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240164;
        end
        8'b00101000 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240168;
        end
        8'b00101001 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h24016C;
        end
        8'b00101010 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240170;
        end
        8'b00101011 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240174;
        end
        8'b00101100 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240178;
        end
        8'b00101101 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h24017C;
        end
        8'b00101110 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240180;
        end
        8'b00101111 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240184;
        end
        8'b00110000 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240188;
        end
        8'b00110001 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h24018C;
        end
        8'b00110010 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240190;
        end
        8'b00110011 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240194;
        end
        8'b00110100 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240198;
        end
        8'b00110101 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h24019C;
        end
        8'b00110110 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401A0;
        end
        8'b00110111 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401A4;
        end
        8'b00111000 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401A8;
        end
        8'b00111001 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401AC;
        end
        8'b00111010 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401B0;
        end
        8'b00111011 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401B4;
        end
        8'b00111100 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401B8;
        end
        8'b00111101 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401BC;
        end
        8'b00111110 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401C0;
        end
        8'b00111111 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401C4;
        end
        8'b01000000 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401C8;
        end
        8'b01000001 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401CC;
        end
        8'b01000010 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401D0;
        end
        8'b01000011 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401D4;
        end
        8'b01000100 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401D8;
        end
        8'b01000101 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401DC;
        end
        8'b01000110 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401E0;
        end
        8'b01000111 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401E4;
        end
        8'b01001000 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401E8;
        end
        8'b01001001 : begin
            numberOfRegisters<= 4'b0010;
            LMXReg [1] <= 24'h2401EC;
            LMXReg [2] <= 24'h250305;
        end
        8'b01001010 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401F0;
        end
        8'b01001011 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401F4;
        end
        8'b01001100 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401F8;
        end
        8'b01001101 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401FC;
        end
        8'b01001110 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240200;
        end
        8'b01001111 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240204;
        end
        8'b01010000 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240208;
        end
        8'b01010001 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h24020C;
        end
        8'b01010010 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240210;
        end
        8'b01010011 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240214;
        end
        8'b01010100 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240218;
        end
        8'b01010101 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h24021C;
        end
        8'b01010110 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240220;
        end
        8'b01010111 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240224;
        end
        8'b01011000 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240228;
        end
        8'b01011001 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h24022C;
        end
        8'b01011010 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240230;
        end
        8'b01011011 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240234;
        end
        8'b01011100 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240238;
        end
        8'b01011101 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h24023C;
        end
        8'b01011110 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240240;
        end
        8'b01011111 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240244;
        end
        8'b01100000 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240248;
        end
        8'b01100001 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h24024C;
        end
        8'b01100010 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240250;
        end
        8'b01100011 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240254;
        end
        8'b01100100 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240258;
        end
        
        8'b01100101 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h24025C;
        end
                
        8'b01100110 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240260;
        end 
                
        8'b01100111 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240264;
        end 
                
        8'b01101000 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240268;
        end 
                
        8'b01101001 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h24026C;
        end 
                
        8'b01101010 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240270;
        end 
                
        8'b01101011 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240274;
        end 
                
        8'b01101100 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240278;
        end 
                
        8'b01101101 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h24027C;
        end 
                
        8'b01101110 : begin
            numberOfRegisters<= 4'b0100;
            LMXReg [1] <= 24'h4B0800;
            LMXReg [2] <= 24'h240140;
            LMXReg [3] <= 24'h2B0190;
            LMXReg [4] <= 24'h250205;
        end 
                
        8'b01101111 : begin
            numberOfRegisters<= 4'b0011;
            LMXReg [1] <= 24'h240142;

        end 
                
        8'b01110000 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240144;
        end 
                
        8'b01110001 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240146;
        end 
                
        8'b01110010 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240148;
        end 
                
        8'b01110011 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h24014A;
        end 
                
        8'b01110100 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h24014C;
        end 
                
        8'b01110101 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h24014E;
        end 
                
        8'b01110110 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240150;
        end 
                
        8'b01110111 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240152;
        end 
                
        8'b01111000 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240154;
        end 
                
        8'b01111001 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240156;
        end 
                
        8'b01111010 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240158;
        end 
                
        8'b01111011 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h24015A;
        end 
                
        8'b01111100 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h24015C;
        end 
                
        8'b01111101 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h24015E;
        end 
                
        8'b01111110 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240160;
        end 
                
        8'b01111111 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240162;
        end 
                
        8'b10000000 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240164;
        end 
                
        8'b10000001 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240166;
        end 
                
        8'b10000010 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240168;
        end 
                
        8'b10000011 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h24016A;
        end 
                
        8'b10000100 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h24016C;
        end 
                
        8'b10000101 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h24016E;
        end 
                
        8'b10000110 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240170;
        end 
                
        8'b10000111 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240172;
        end 
                
        8'b10001000 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240174;
        end 
                
        8'b10001001 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240176;
        end 
                
        8'b10001010 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240178;
        end 
                
        8'b10001011 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h24017A;
        end 
                
        8'b10001100 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h24017C;
        end 
                
        8'b10001101 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h24017E;
        end 
                
        8'b10001110 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240180;
        end 
                
        8'b10001111 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240182;
        end 
                
        8'b10010000 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240184;
        end 
                
        8'b10010001 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240186;
        end 
                
        8'b10010010 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240188;
        end 
                
        8'b10010011 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h24018A;
        end 
                
        8'b10010100 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h24018C;
        end 
                
        8'b10010101 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h24018E;
        end 
                
        8'b10010110 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240190;
        end 
                
        8'b10010111 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240192;
        end 
                
        8'b10011000 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240194;
        end 
                
        8'b10011001 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240196;
        end 
                
        8'b10011010 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h240198;
        end 
                
        8'b10011011 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h24019A;
        end 
                
        8'b10011100 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h24019C;
        end 
                
        8'b10011101 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h24019E;
        end 
                
        8'b10011110 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401A0;
        end 
                
        8'b10011111 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401A2;
        end 
                
        8'b10100000 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401A4;
        end 
                
        8'b10100001 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401A6;
        end 
                
        8'b10100010 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401A8;
        end 
                
        8'b10100011 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401AA;
        end 
                
        8'b10100100 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401AC;
        end 
                
        8'b10100101 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401AE;
        end 
                
        8'b10100110 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401B0;
        end 
                
        8'b10100111 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401B2;
        end 
                
        8'b10101000 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401B4;
        end 
                
        8'b10101001 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401B6;
        end 
                
        8'b10101010 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401B8;
        end 
                
        8'b10101011 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401BA;
        end 
                
        8'b10101100 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401BC;
        end 
                
        8'b10101101 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401BE;
        end 
                
        8'b10101110 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401C0;
        end 
                
        8'b10101111 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401C2;
        end 
                
        8'b10110000 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401C4;
        end 
                
        8'b10110001 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401C6;
        end 
                
        8'b10110010 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401C8;
        end 
                
        8'b10110011 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401CA;
        end 
                
        8'b10110100 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401CC;
        end 
                
        8'b10110101 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401CE;
        end 
                
        8'b10110110 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401D0;
        end 
                
        8'b10110111 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401D2;
        end 
                
        8'b10111000 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401D4;
        end 
                
        8'b10111001 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401D6;
        end 
                
        8'b10111010 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401D8;
        end 
                
        8'b10111011 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401DA;
        end 
                
        8'b10111100 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401DC;
        end 
                
        8'b10111101 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401DE;
        end 
                
        8'b10111110 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401E0;
        end 
                
        8'b10111111 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401E2;
        end 
                
        8'b11000000 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401E4;
        end 
                
        8'b11000001 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401E6;
        end 
                
        8'b11000010 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401E8;
        end 
                
        8'b11000011 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401EA;
            LMXReg [2] <= 24'h250305;
        end 
                
        8'b11000100 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401EC;
        end 
                
        8'b11000101 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401EE;
        end 
                
        8'b11000110 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401F0;
        end 
                
        8'b11000111 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401F2;
        end
            
        8'b11001000 : begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h2401F4;
        end    
    
        default: begin
            numberOfRegisters<= 4'b0001;
            LMXReg [1] <= 24'h00201C; 
        end 
         
    endcase
end

endmodule