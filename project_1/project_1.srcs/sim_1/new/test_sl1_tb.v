`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2025 07:26:16 PM
// Design Name: 
// Module Name: test_sl1_tb
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


module test_sl1_tb;
    reg [15:0] inp;
    wire [15:0] result;

    sll uut (
        .inp(inp),
        .result(result)
    );

    initial begin
        inp = 16'b0001_0000_0000_0000;
        #10;
        $display("Test Case 1: inp = %b, result = %b", inp, result);

        inp = 16'b1111_1111_1111_1111;
        #10;
        $display("Test Case 2: inp = %b, result = %b", inp, result);

        inp = 16'b0000_0000_0000_0001;
        #10;
        $display("Test Case 3: inp = %b, result = %b", inp, result);

        inp = 16'b1000_0000_0000_0000;
        #10;
        $display("Test Case 4: inp = %b, result = %b", inp, result);

        inp = 16'b0000_0000_0000_1000;
        #10;
        $display("Test Case 5: inp = %b, result = %b", inp, result);

        inp = 16'b0000_0000_0000_0000;
        #10;
        $display("Test Case 6: inp = %b, result = %b", inp, result);

        inp = 16'b1111_1000_1111_0000;
        #10;
        $display("Test Case 7: inp = %b, result = %b", inp, result);

        $finish;
    end
endmodule
