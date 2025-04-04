`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2025 06:46:17 PM
// Design Name: 
// Module Name: test_alu_tb
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


module test_alu_tb;

    reg [15:0] data1;
    reg [15:0] data2;
    reg [3:0] ALUFn;
    wire bin;
    wire [15:0] out;

    ALU uut (
        .data1(data1),
        .data2(data2),
        .ALUFn(ALUFn),
        .bin(bin),
        .out(out)
    );

    initial begin
        data1 = 16'h0000;
        data2 = 16'h0000;
        ALUFn = 4'b0000;

        #10;

        // Test ALU operation 0000 (no operation)
        ALUFn = 4'b0000;
        #10;
        $display("ALUFn=%b, data1=%h, data2=%h, out=%h, bin=%b", ALUFn, data1, data2, out, bin);

        // Test ALU operation 0001 (Addition)
        ALUFn = 4'b0001;
        data1 = 16'h0005;
        data2 = 16'h0003;
        #10;
        $display("ALUFn=%b, data1=%h, data2=%h, out=%h, bin=%b", ALUFn, data1, data2, out, bin);

        // Test ALU operation 0010 (Subtraction)
        ALUFn = 4'b0010;
        data1 = 16'h0010;
        data2 = 16'h0005;
        #10;
        $display("ALUFn=%b, data1=%h, data2=%h, out=%h, bin=%b", ALUFn, data1, data2, out, bin);

        // Test ALU operation 0011 (Shift Left)
        ALUFn = 4'b0011;
        data1 = 16'h0004;
        data2 = 16'h0002;
        #10;
        $display("ALUFn=%b, data1=%h, data2=%h, out=%h, bin=%b", ALUFn, data1, data2, out, bin);

        // Test ALU operation 0100 (AND operation)
        ALUFn = 4'b0100;
        data1 = 16'hFFFF;
        data2 = 16'h00FF;
        #10;
        $display("ALUFn=%b, data1=%h, data2=%h, out=%h, bin=%b", ALUFn, data1, data2, out, bin);

        // Test ALU operation 0101 (Equality check)
        ALUFn = 4'b0101;
        data1 = 16'h1234;
        data2 = 16'h1234;
        #10;
        $display("ALUFn=%b, data1=%h, data2=%h, out=%h, bin=%b", ALUFn, data1, data2, out, bin);
        
        ALUFn = 4'b0101;
        data1 = 16'h1234;
        data2 = 16'h1235;
        #10;
        $display("ALUFn=%b, data1=%h, data2=%h, out=%h, bin=%b", ALUFn, data1, data2, out, bin);

        // Test ALU operation 0110 (Inequality check)
        ALUFn = 4'b0110;
        data1 = 16'h1234;
        data2 = 16'h5678;
        #10;
        $display("ALUFn=%b, data1=%h, data2=%h, out=%h, bin=%b", ALUFn, data1, data2, out, bin);

        ALUFn = 4'b0110;
        data1 = 16'h5678;
        data2 = 16'h5678;
        #10;
        $display("ALUFn=%b, data1=%h, data2=%h, out=%h, bin=%b", ALUFn, data1, data2, out, bin);

        #10;
        $finish;
    end
endmodule
