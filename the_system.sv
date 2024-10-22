`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 10/13/2024 02:07:36 PM
// Design Name:
// Module Name: the_system
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


module the_system(
    input logic [3:0]sw,
    input logic [2:0]btn,
    input logic clk,
    output logic [2:0]led,
    output logic led2_b,
    output logic led3_b,
    output logic led1_b,
    output logic ck_io39,
    output logic ck_io40,
    output logic ck_io41
  );

  logic clk_prescaled;
  logic latched_start;
  logic pulse_out;
  logic last_pulse;
  assign led3_b = clk_prescaled;
  assign led2_b = pulse_out;
  assign led1_b = latched_start;
  assign ck_io39 = pulse_out;
  assign ck_io40 = clk_prescaled;
  assign ck_io41 = latched_start;
  ez_mux system_mux_gates(
           .in_a(sw[0]),
           .in_b(sw[1]),
           .in_x(btn[0]),
           .out1(led[0])
         );

  ez_mux_dataflow system_mux_dataflow(
                    .in_a(sw[0]),
                    .in_b(sw[1]),
                    .in_x(btn[0]),
                    .out2(led[1])
                  );

  ez_mux_behav system_mux_behav(
                 .in_a(sw[0]),
                 .in_b(sw[1]),
                 .in_x(btn[0]),
                 .out3(led[2])
               );

      clock_pulser my_pulser(
      .clk(clk_prescaled),
      .start(latched_start),
      .num_pulses(sw),
      .pulse_out(pulse_out),
      .last_pulse(last_pulse)
      );

  clk_prescaler prescaler(
      .clk(clk),
      .ena(btn[1]),
      .clk_prescaled(clk_prescaled)
    );
                
    sr_latch clock_latcher(
    .clk(clk),
    .sync_set(btn[2]),
    .sync_reset(last_pulse),
    .data_out(latched_start)
    );


endmodule
