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


module shift_reg_par_to_ser(
    input logic [7:0] par_in,
    input logic clk_in, ser_in, msb_shift, load_not_shift,
    output logic ser_out, latched_msb
    );
    
    logic [7:0]shift_reg;
    always_ff @(posedge clk_in)
    begin
        if(load_not_shift)
        begin
            shift_reg <= par_in;
            latched_msb <= msb_shift;
        end
        else
        begin
            if(latched_msb) begin
                shift_reg <= {shift_reg[6:0], ser_in};
            end
            else
            begin
                shift_reg <= {ser_in, shift_reg[7:1]};
            end
        end
    end
    
    always_comb
    begin
        if(latched_msb)
        begin
            ser_out = shift_reg[7];
        end
        else
        begin
            ser_out = shift_reg[0];
        end
    end
endmodule
