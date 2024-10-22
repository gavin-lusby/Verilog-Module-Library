module ez_mux(
    input logic in_a, in_b, in_x,
    output logic out1
  );
  logic not_x, out_and1, out_and2;

  not not1(not_x, in_x);
  and and1(out_and1, in_a, not_x);
  and and2(out_and2, in_b, in_x);
  or or1(out1, out_and1, out_and2);
endmodule
