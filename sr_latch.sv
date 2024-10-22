`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2024 10:40:39 AM
// Design Name: 
// Module Name: sr_latch
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


module sr_latch(
        input logic clk, sync_set, sync_reset,
        output logic data_out = 0
    );
    always_ff @(posedge clk)
    begin
        if(sync_set)
        begin
            data_out <= 1;
        end else if (sync_reset & (~sync_set))
        begin
            data_out <= 0;
        end
    end
endmodule
