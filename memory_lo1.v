`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/03/2023 01:11:33 PM
// Design Name: 
// Module Name: memory_lo1
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


module memory_lo1(
    input  i_clk,
    input [7:0] i_reg_nr,
    output reg [23:0] o_lmx_reg
);


    always @(posedge i_clk) begin
        case (i_reg_nr)
                8'b00000000 : o_lmx_reg = 24'h7D2288;
                8'b00000001 : o_lmx_reg = 24'h7C0000;
                8'b00000010 : o_lmx_reg = 24'h7B0000;
                8'b00000011 : o_lmx_reg = 24'h7A0000;
                8'b00000100 : o_lmx_reg = 24'h790000;
                8'b00000101 : o_lmx_reg = 24'h780000;
                8'b00000110 : o_lmx_reg = 24'h770000;
                8'b00000111 : o_lmx_reg = 24'h760000;
                8'b00001000 : o_lmx_reg = 24'h750000;
                8'b00001001 : o_lmx_reg = 24'h740000;
                8'b00001010 : o_lmx_reg = 24'h730000;
                8'b00001011 : o_lmx_reg = 24'h727802;
                8'b00001100 : o_lmx_reg = 24'h710000;
                8'b00001101 : o_lmx_reg = 24'h700000;
                8'b00001110 : o_lmx_reg = 24'h6F0000;
                8'b00001111 : o_lmx_reg = 24'h6E0000;
                8'b00010000 : o_lmx_reg = 24'h6D0000;
                8'b00010001 : o_lmx_reg = 24'h6C0000;
                8'b00010010 : o_lmx_reg = 24'h6B0000;
                8'b00010011 : o_lmx_reg = 24'h6A0007;
                8'b00010100 : o_lmx_reg = 24'h694440;
                8'b00010101 : o_lmx_reg = 24'h6803E8;
                8'b00010110 : o_lmx_reg = 24'h670000;
                8'b00010111 : o_lmx_reg = 24'h660000;
                8'b00011000 : o_lmx_reg = 24'h650000;
                8'b00011001 : o_lmx_reg = 24'h6403E8;
                8'b00011010 : o_lmx_reg = 24'h63B852;
                8'b00011011 : o_lmx_reg = 24'h620078;
                8'b00011100 : o_lmx_reg = 24'h610000;
                8'b00011101 : o_lmx_reg = 24'h600000;
                8'b00011110 : o_lmx_reg = 24'h5F0000;
                8'b00011111 : o_lmx_reg = 24'h5E0000;
                8'b00100000 : o_lmx_reg = 24'h5D0000;
                8'b00100001 : o_lmx_reg = 24'h5C0000;
                8'b00100010 : o_lmx_reg = 24'h5B0000;
                8'b00100011 : o_lmx_reg = 24'h5A0000;
                8'b00100100 : o_lmx_reg = 24'h590000;
                8'b00100101 : o_lmx_reg = 24'h580000;
                8'b00100110 : o_lmx_reg = 24'h570000;
                8'b00100111 : o_lmx_reg = 24'h560001;
                8'b00101000 : o_lmx_reg = 24'h550000;
                8'b00101001 : o_lmx_reg = 24'h540001;
                8'b00101010 : o_lmx_reg = 24'h53FFFF;
                8'b00101011 : o_lmx_reg = 24'h52FFFF;
                8'b00101100 : o_lmx_reg = 24'h510000;
                8'b00101101 : o_lmx_reg = 24'h500000;
                8'b00101110 : o_lmx_reg = 24'h4F0300;
                8'b00101111 : o_lmx_reg = 24'h4E0001;
                8'b00110000 : o_lmx_reg = 24'h4D0000;
                8'b00110001 : o_lmx_reg = 24'h4C000C;
                8'b00110010 : o_lmx_reg = 24'h4B08C0;
                8'b00110011 : o_lmx_reg = 24'h4A0000;
                8'b00110100 : o_lmx_reg = 24'h49003F;
                8'b00110101 : o_lmx_reg = 24'h480001;
                8'b00110110 : o_lmx_reg = 24'h470081;
                8'b00110111 : o_lmx_reg = 24'h46C350;
                8'b00111000 : o_lmx_reg = 24'h450000;
                8'b00111001 : o_lmx_reg = 24'h4403E8;
                8'b00111010 : o_lmx_reg = 24'h430000;
                8'b00111011 : o_lmx_reg = 24'h4201F4;
                8'b00111100 : o_lmx_reg = 24'h410000;
                8'b00111101 : o_lmx_reg = 24'h401388;
                8'b00111110 : o_lmx_reg = 24'h3F0000;
                8'b00111111 : o_lmx_reg = 24'h3E00AF;
                8'b01000000 : o_lmx_reg = 24'h3D00A8;
                8'b01000001 : o_lmx_reg = 24'h3C03E8;
                8'b01000010 : o_lmx_reg = 24'h3B0001;
                8'b01000011 : o_lmx_reg = 24'h3A9001;
                8'b01000100 : o_lmx_reg = 24'h390020;
                8'b01000101 : o_lmx_reg = 24'h380000;
                8'b01000110 : o_lmx_reg = 24'h370000;
                8'b01000111 : o_lmx_reg = 24'h360000;
                8'b01001000 : o_lmx_reg = 24'h350000;
                8'b01001001 : o_lmx_reg = 24'h340421;
                8'b01001010 : o_lmx_reg = 24'h330080;
                8'b01001011 : o_lmx_reg = 24'h320080;
                8'b01001100 : o_lmx_reg = 24'h314180;
                8'b01001101 : o_lmx_reg = 24'h3003E0;
                8'b01001110 : o_lmx_reg = 24'h2F0300;
                8'b01001111 : o_lmx_reg = 24'h2E07F0;
                8'b01010000 : o_lmx_reg = 24'h2DC61F;
                8'b01010001 : o_lmx_reg = 24'h2C1F23;
                8'b01010010 : o_lmx_reg = 24'h2B0000;
                8'b01010011 : o_lmx_reg = 24'h2A0000;
                8'b01010100 : o_lmx_reg = 24'h290000;
                8'b01010101 : o_lmx_reg = 24'h280000;
                8'b01010110 : o_lmx_reg = 24'h2703E8;
                8'b01010111 : o_lmx_reg = 24'h260000;
                8'b01011000 : o_lmx_reg = 24'h250205;
                8'b01011001 : o_lmx_reg = 24'h240190;
                8'b01011010 : o_lmx_reg = 24'h230004;
                8'b01011011 : o_lmx_reg = 24'h220010;
                8'b01011100 : o_lmx_reg = 24'h211E01;
                8'b01011101 : o_lmx_reg = 24'h2005BF;
                8'b01011110 : o_lmx_reg = 24'h1FC3E6;
                8'b01011111 : o_lmx_reg = 24'h1E18A6;
                8'b01100000 : o_lmx_reg = 24'h1D0000;
                8'b01100001 : o_lmx_reg = 24'h1C0488;
                8'b01100010 : o_lmx_reg = 24'h1B0002;
                8'b01100011 : o_lmx_reg = 24'h1A0808;
                8'b01100100 : o_lmx_reg = 24'h190624;
                8'b01100101 : o_lmx_reg = 24'h18071A;
                8'b01100110 : o_lmx_reg = 24'h17007C;
                8'b01100111 : o_lmx_reg = 24'h160001;
                8'b01101000 : o_lmx_reg = 24'h150409;
                8'b01101001 : o_lmx_reg = 24'h144848;
                8'b01101010 : o_lmx_reg = 24'h1327B7;
                8'b01101011 : o_lmx_reg = 24'h120064;
                8'b01101100 : o_lmx_reg = 24'h110096;
                8'b01101101 : o_lmx_reg = 24'h100080;
                8'b01101110 : o_lmx_reg = 24'h0F060E;
                8'b01101111 : o_lmx_reg = 24'h0E1820;
                8'b01110000 : o_lmx_reg = 24'h0D4000;
                8'b01110001 : o_lmx_reg = 24'h0C5001;
                8'b01110010 : o_lmx_reg = 24'h0BB018;
                8'b01110011 : o_lmx_reg = 24'h0A10F8;
                8'b01110100 : o_lmx_reg = 24'h090004;
                8'b01110101 : o_lmx_reg = 24'h082000;
                8'b01110110 : o_lmx_reg = 24'h0700B2;
                8'b01110111 : o_lmx_reg = 24'h06C802;
                8'b01111000 : o_lmx_reg = 24'h0530C8;
                8'b01111001 : o_lmx_reg = 24'h040A43;
                8'b01111010 : o_lmx_reg = 24'h030782;
                8'b01111011 : o_lmx_reg = 24'h020500;
                8'b01111100 : o_lmx_reg = 24'h010808;
                8'b01111101 : o_lmx_reg = 24'h00201C;
            
            default : o_lmx_reg = 24'h00201C; 
        endcase
    end
endmodule
