
module clk_prescaler(
    input logic clk, ena,
    output logic clk_prescaled = 0
  );

  logic [26:0]counter = 0;
  logic gated_clk = 0;
  logic sync_ena = 0;

  /* Synchronize Enable signal */
  always_ff @(posedge clk)
  begin
    sync_ena <= ena;
  end
  
  parameter int COUNTER_VALUE = 50_000_000;
  always_ff @(posedge clk)
  begin
    if (sync_ena == 0)
    begin
      counter <= 0;
    end
    else if (counter == COUNTER_VALUE)
    begin
      counter <= 0;
      clk_prescaled <= ~clk_prescaled;
    end
    else
    begin
      counter = counter + 1;
    end
  end

endmodule
