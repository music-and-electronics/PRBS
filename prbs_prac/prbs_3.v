module prbs_3 (
    input clk,
    input reset,
    output pseudo_rand_bit 
);

parameter PSEUDO_POLY_SEED  = 4'b1101;
reg  [3:0] state            = 4'b0001;
wire [3:0] shifted_val;     

assign shifted_val = state <<1;

always @ (posedge clk) begin
 if(reset) begin
     state     <= 1;
  end

  else begin
      if(PSEUDO_POLY_SEED[3]==shifted_val[3]) begin
          state <= PSEUDO_POLY_SEED ^ shifted_val;
      end

      else begin
          state <= shifted_val;
      end
  end
end
assign pseudo_rand_bit = state [0];

endmodule