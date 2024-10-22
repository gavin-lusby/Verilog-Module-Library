`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2024 09:41:38 PM
// Design Name: 
// Module Name: ROM_block
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


module ROM_block(
        input logic[11:0]addr,
        output logic [31:0] data
    );
    
    always_comb
    begin
        case(addr)
//            4'b0000: data = 4'b0100;
//            4'b0001: data = 4'b0101;
//            4'b0010: data = 4'b0111;
//            4'b0011: data = 4'b0110;
//            4'b0100: data = 4'b1100;
//            4'b0101: data = 4'b1101;
//            4'b0110: data = 4'b1111;
//            4'b0111: data = 4'b1110;
//            4'b1000: data = 4'b0110;
//            4'b1001: data = 4'b0111;
//            4'b1010: data = 4'b0101;
//            4'b1011: data = 4'b0100;
//            4'b1100: data = 4'b1110;
//            4'b1101: data = 4'b1111;
//            4'b1110: data = 4'b1101;
//            4'b1111: data = 4'b1100;
              12'b00000000: data = 32'b00011001010111110111101100001001;
              12'b00000001: data = 32'b00110010101111101101001101100111;
              12'b00000010: data = 32'b11011100100100110001010001010001;
              12'b00000011: data = 32'b01011101001101010100100100000111;
              12'b00000100: data = 32'b10001011001110111001101110101110;
              12'b00000101: data = 32'b01110010100111110100110110011011;
              12'b00000110: data = 32'b01101010010110001010001111111110;
              12'b00000111: data = 32'b01010111001011000111111110000001;
              default: data=31'b0;
        endcase
    end
    
endmodule
