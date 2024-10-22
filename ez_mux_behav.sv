module ez_mux_behav(
    input logic in_a, in_b, in_x,
    output logic out3
  );

  always_comb
  begin
    if(in_x ==0)
    begin
      out3 = in_a;
    end
    else
    begin
      out3 = in_b;
    end
  end

endmodule
