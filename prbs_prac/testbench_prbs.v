module prbs_testbench();
    
    reg clk;
    reg reset;
    wire pseudo_rand_bit;  

    initial begin
        clk = 0;
        reset =1;
    end
    always #5 clk = ~clk;
    always #10 reset =0;

    prbs_3 MUT(clk,reset);

endmodule