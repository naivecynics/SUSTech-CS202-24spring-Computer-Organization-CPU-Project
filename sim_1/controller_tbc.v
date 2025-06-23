`timescale 1ns / 1ps

module controller_testbench;
    // Inputs
    reg [6:0] instruction;

    // Outputs
    wire Branch;
    wire [1:0] ALUOp;
    wire ALUSrc;
    wire MemRead;
    wire MemWrite;
    wire Mem2Reg;
    wire RegWrite;

    // Instantiate the Unit Under Test (UUT)
    controller uut (
        .instruction(instruction), 
        .Branch(Branch), 
        .ALUOp(ALUOp), 
        .ALUSrc(ALUSrc), 
        .MemRead(MemRead), 
        .MemWrite(MemWrite), 
        .Mem2Reg(Mem2Reg), 
        .RegWrite(RegWrite)
    );

    initial begin
        // Initialize Inputs
        instruction = 0;

        // Test each instruction type and display the result
        $display("Instruction | Branch | ALUOp | ALUSrc | MemRead | MemWrite | Mem2Reg | RegWrite");

        // Test for R format
        instruction = 7'h33;
        #10; // Wait for the change to propagate
        $display("R format    |    %b    |  %b  |    %b   |     %b   |     %b    |    %b    |    %b", Branch, ALUOp, ALUSrc, MemRead, MemWrite, Mem2Reg, RegWrite);

        // Test for I format
        instruction = 7'h13;
        #10;
        $display("I format    |    %b    |  %b  |    %b   |     %b   |     %b    |    %b    |    %b", Branch, ALUOp, ALUSrc, MemRead, MemWrite, Mem2Reg, RegWrite);

        // Test for I format - load
        instruction = 7'h03;
        #10;
        $display("I format LD |    %b    |  %b  |    %b   |     %b   |     %b    |    %b    |    %b", Branch, ALUOp, ALUSrc, MemRead, MemWrite, Mem2Reg, RegWrite);

        // Test for S format
        instruction = 7'h23;
        #10;
        $display("S format    |    %b    |  %b  |    %b   |     %b   |     %b    |    %b    |    %b", Branch, ALUOp, ALUSrc, MemRead, MemWrite, Mem2Reg, RegWrite);

        // Test for B format
        instruction = 7'h63;
        #10;
        $display("B format    |    %b    |  %b  |    %b   |     %b   |     %b    |    %b    |    %b", Branch, ALUOp, ALUSrc, MemRead, MemWrite, Mem2Reg, RegWrite);

        // Finish the simulation
        $finish;
    end
endmodule
