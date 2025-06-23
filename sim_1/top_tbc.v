module top_tb1();
    wire [7:0] tube_scan;
    wire [7:0] tube_signal;

    reg start_pg;
    reg rx;
    wire tx;
    cpu_top dut (
        .clk_100(clk),
        .rst(rst),
        .tube_scan(tube_scan),
        .tube_signal(tube_signal),
       .start_pg(start_pg),
       .rx(rx),
       .tx(tx)
    );

    // initial begin
    //     switch_in = 8'b00000111;
    //     clk = 0;
    //     rst = 0;
    //     finish = 0;
    //     forever #10 clk = ~clk;
    // end

    initial fork
        switch_in = 8'b00000111;
        clk = 0;
        rst_n = 1;
        start_pg = 1;
        rx = 1;
        
        #100200 rst_n = 0;
        #100400 rst_n = 1;
        forever #10 clk = ~clk;
        #50 rst = 0;
        #10000 rst = 1;
        // #1100 finish = 0;
    join


endmodule
