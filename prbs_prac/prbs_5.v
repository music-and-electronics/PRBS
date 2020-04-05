module prbs_5 (
    input clk,
    input reset,
    output pseudo_rand_bit 
);

parameter PSEUDO_POLY_SEED  = 6'b101001;
reg  [5:0] state            = 6'b000001;
wire [5:0] shifted_val;     

assign shifted_val = state <<1;

always @ (posedge clk) begin
 if(reset) begin
     state     <= 1;
  end

  else begin
      if(PSEUDO_POLY_SEED[5]==shifted_val[5]) begin
          state <= PSEUDO_POLY_SEED ^ shifted_val;
      end

      else begin
          state <= shifted_val;
      end
  end
assign pseudo_rand_bit = state [0];

endmodule