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


module rom_test(
    input logic [3:0]sw,
    input logic [2:0]btn,
    input logic clk,
    output logic [3:0]led,
    output logic led2_b = 0,
    output logic led3_b = 0,
    output logic led1_b,
    output logic ck_io39 = 0,
    output logic ck_io40 = 0,
    output logic ck_io41 = 0,
    input logic [11:0] addr,
    output logic [31:0] bigdata
  );

    logic clk_prescaled;
    assign led1_b = clk_prescaled;
//    shift_reg_ser_to_par my_shift(
//        .ser_in(btn[0]),
//        .clk_in(clk_prescaled),
//        .msb_shift(sw[0]),
//        .par_out({led, led3_b, led2_b, led1_b, ck_io39, ck_io40}),
//        .carry_out(ck_io41)  
//    );
//input logic [7:0] par_in,
//    input logic clk_in, ser_in, msb_shift, shift_not_load,
//    output logic ser_out
//    ROM_block my_rom(
//    .addr(sw),
//    .data(led)
//    );
    ROM_block my_rom2(
    .addr(addr),
    .data(bigdata)
    );

    clk_prescaler prescaler(
      .clk(clk),
      .ena(btn[1]),
      .clk_prescaled(clk_prescaled)
    );
endmodule
