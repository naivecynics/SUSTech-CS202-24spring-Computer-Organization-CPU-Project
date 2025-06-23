module cpuclk_tb();
    reg clk;
    wire clk_23, clk_10;

    cpuclk cpuclk_inst(
        .clk_in1(clk),
        .clk_out1(clk_23),
        .clk_out2(clk_10)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        #5000000 $finish;
    end

endmodule