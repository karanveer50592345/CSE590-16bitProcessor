`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2025 06:55:44 PM
// Design Name: 
// Module Name: test_adder_tb
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


module test_adder_tb;
    reg signed [15:0] inp1;
    reg signed [15:0] inp2;
    wire signed [15:0] result;

    adder uut (
        .inp1(inp1),
        .inp2(inp2),
        .result(result)
    );

    initial begin
        inp1 = 16'sd0;
        inp2 = 16'sd0;

        #10;
        inp1 = 16'sd100;
        inp2 = 16'sd200;
        #10;
        $display("Test Case 1: inp1 = %d, inp2 = %d, result = %d", inp1, inp2, result);

        #10;
        inp1 = 150;
        inp2 = -50;
        #10;
        $display("Test Case 2: inp1 = %d, inp2 = %d, result = %d", inp1, inp2, result);

        #10;
        inp1 = -100;
        inp2 = -200;
        #10;
        $display("Test Case 3: inp1 = %d, inp2 = %d, result = %d", inp1, inp2, result);

        #10;
        inp1 = 16'sd50;
        inp2 = 16'sd0;
        #10;
        $display("Test Case 4: inp1 = %d, inp2 = %d, result = %d", inp1, inp2, result);

        #10;
        inp1 = 16'sd32767;
        inp2 = 16'sd100;
        #10;
        $display("Test Case 5: inp1 = %d, inp2 = %d, result = %d", inp1, inp2, result);

        #10;
        inp1 = -32768;
        inp2 = 16'sd50;
        #10;
        $display("Test Case 6: inp1 = %d, inp2 = %d, result = %d", inp1, inp2, result);

        #10;
        inp1 = -10000;
        inp2 = -20000;
        #10;
        $display("Test Case 7: inp1 = %d, inp2 = %d, result = %d", inp1, inp2, result);

        #10;
        $finish;
    end
endmodule
