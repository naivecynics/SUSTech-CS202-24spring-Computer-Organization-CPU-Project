module keypad_tbc ();
    reg clk;
    reg rst_n;
    reg [3:0] row;
    reg [3:0] col;
    wire [4:0] key;

    keypad uut (
        .clk(clk),
        .reset(rst_n),
        .row(row),
        .col(col),
        .key(key)
    );

    initial begin
        fork
            begin
            clk = 0;
            rst_n = 0;
            {row, col} = 8'b0001_0001;
            #10 rst_n = 1;
            #10 rst_n = 0;
            
            #30 {row, col} = 8'b0001_0010;
            #30 {row, col} = 8'b0001_0100;
            #30 {row, col} = 8'b0001_1000;
            #30 {row, col} = 8'b0010_0001;
            #30 {row, col} = 8'b0010_0010;
            #30 {row, col} = 8'b0010_0100;
            #30 {row, col} = 8'b0010_1000;
            end
            begin
                forever begin
                    #5 clk = ~clk;
                end
            end
        join
    end


endmodule