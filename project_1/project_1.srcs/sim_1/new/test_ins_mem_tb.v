`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2025 05:22:53 PM
// Design Name: 
// Module Name: test_ins_mem_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


`timescale 1ns / 1ps

module test_ins_mem_tb;

    reg [15:0] pc;
    wire [15:0] instruction;

    instructionMemory uut (
        .pc(pc),
        .instruction(instruction)
    );

    initial begin
        $monitor("Time=%0t | PC=%h | Instruction=%h", $time, pc, instruction);

        #10 pc = 16'h0000;  // Expect instruction from mem[0]
        #10 pc = 16'h0002;  // Expect instruction from mem[1]
        #10 pc = 16'h0004;
        #10 pc = 16'h0006;
        #10 pc = 16'h0008;
        #10 pc = 16'h000A;
        #10 pc = 16'h000C;
        #10 pc = 16'h0010;
        #10 pc = 16'h003E;

        #20 $finish;
    end

endmodule

