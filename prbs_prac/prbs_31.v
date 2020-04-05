module prbs_31 (
    input clk,
    input reset,
    output pseudo_rand_bit 
);

parameter PSEUDO_POLY_SEED   = 32'h90000001;
reg  [31:0] state            = 32'h00000001;
wire [31:0] shifted_val;     

assign shifted_val = state <<1;

always @ (posedge clk) begin
 if(reset) begin
     state     <= 1;
  end

  else begin
      if(PSEUDO_POLY_SEED[31]==shifted_val[31]) begin
          state <= PSEUDO_POLY_SEED ^ shifted_val;
      end

      else begin
          state <= shifted_val;
      end
  end
assign pseudo_rand_bit = state [0];

endmodule