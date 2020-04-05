module prbs_15 (
    input clk,
    input reset,
    output pseudo_rand_bit 
);

parameter PSEUDO_POLY_SEED   = 16'hC001;
reg  [15:0] state            = 16'h0001;
wire [15:0] shifted_val;     

assign shifted_val = state <<1;

always @ (posedge clk) begin
 if(reset) begin
     state     <= 1;
  end

  else begin
      if(PSEUDO_POLY_SEED[15]==shifted_val[15]) begin
          state <= PSEUDO_POLY_SEED ^ shifted_val;
      end

      else begin
          state <= shifted_val;
      end
  end
assign pseudo_rand_bit = state [0];

endmodule