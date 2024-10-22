module ez_mux_dataflow(
    input logic in_a, in_b, in_x,
    output logic out2
  );

  assign out2 = (in_a & (~in_x)) | (in_b & in_x);
endmodule
