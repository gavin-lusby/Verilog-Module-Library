`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2024 08:16:22 PM
// Design Name: 
// Module Name: shift_reg_ser_to_par
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


module shift_reg_ser_to_par(
    input logic ser_in, clk_in, msb_shift,
    output logic [7:0]par_out,
    output logic carry_out
    );
    always_ff @(posedge clk_in)
    begin
        if(msb_shift)
        begin
            carry_out <= par_out[0];
            par_out <= {ser_in, par_out[7:1]};
        end
        else
        begin
            carry_out <= par_out[7];
            par_out <= {par_out[6:0], ser_in};
        end
    end
endmodule
