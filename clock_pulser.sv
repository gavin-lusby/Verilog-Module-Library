`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 10/13/2024 02:31:32 PM
// Design Name:
// Module Name: clock_pulser
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


module clock_pulser(
    input logic clk, start, [3:0]num_pulses,
    output logic pulse_out, last_pulse
  );
  logic [3:0]pulse_reg = 4'd0;
  logic active_bit = 0;
  logic latched_start = 0;
  logic [3:0]counter_sub;
  always_comb counter_sub = pulse_reg - 4'd1;
  always_comb last_pulse = ((counter_sub == 4'd0) & active_bit);

  
  always_ff @(posedge clk)
  begin
    if((start & ((~active_bit) | last_pulse)) & (num_pulses != 4'd0))
    begin
      active_bit <= 1;
      pulse_reg <= num_pulses;
    end
    else if (last_pulse)
    begin
      active_bit <= 0;
    end
    else if (active_bit)
    begin
      pulse_reg <= counter_sub;
    end

  end
  assign pulse_out = clk & active_bit;




endmodule
