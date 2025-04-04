`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2025 05:16:24 PM
// Design Name: 
// Module Name: test_pc_tb
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

module ProgramCounter_tb;

    reg clk;
    reg reset;
    reg [15:0] next_pc;
    wire [15:0] pc;

    programCounter uut (
        .clk(clk),
        .reset(reset),
        .next_pc(next_pc),
        .pc(pc)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        next_pc = 16'h0000;

        #10 reset = 0;
        
        #10 next_pc = 16'h0004;  // Expect pc = 0004
        #10 next_pc = 16'h0008;
        #10 next_pc = 16'h000C;
        
        // Set reset again, expect pc = 0000
        #10 reset = 1;
        #10 reset = 0; next_pc = 16'h0010; // Expect pc = 0010

        #10 next_pc = 16'h0020;
        #10 next_pc = 16'h0030;
        
        #20 $finish;
    end

    // Monitor Output
    initial begin
        $monitor("Time=%0t | clk=%b | reset=%b | next_pc=%h | pc=%h", 
                  $time, clk, reset, next_pc, pc);
    end

endmodule
