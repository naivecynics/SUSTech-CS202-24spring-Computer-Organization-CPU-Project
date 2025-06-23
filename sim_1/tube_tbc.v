module tube_tbc ();
    reg clk;
    reg rst_n;
    reg [31:0] reg_data;
    wire [7:0] tube_scan;
    wire [7:0] tube_signal;

    tube uut (
        .clk(clk),
        .reset(rst_n),
        // .reg_data(reg_data),
        .tube_scan(tube_scan),
        .tube_signal(tube_signal)
    );

    initial begin
        clk = 0;
        reg_data = 32'h56789abc;
        rst_n = 0;
        #10 rst_n = 1;
        #10 rst_n = 0;
        forever begin
            #5 clk = ~clk;
        end
    end

endmodule