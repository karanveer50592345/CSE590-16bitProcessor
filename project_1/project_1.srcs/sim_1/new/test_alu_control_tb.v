`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2025 06:21:51 PM
// Design Name: 
// Module Name: test_control_tb
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


module test_alu_control_tb;
    reg [2:0] ALUOp;
    reg [3:0] FnCode;
    wire [3:0] ALUFn;
    
    ALUControlUnit uut (
        .ALUOp(ALUOp),
        .FnCode(FnCode),
        .ALUFn(ALUFn)
    );
    
    initial begin

        // Test ALUOp = 001 with different FnCode values
        ALUOp = 3'b001; FnCode = 4'b0000; #10;
        ALUOp = 3'b001; FnCode = 4'b0001; #10;
        ALUOp = 3'b001; FnCode = 4'b0010; #10;
        ALUOp = 3'b001; FnCode = 4'b0011; #10;
        
        // Test ALUOp = 010
        ALUOp = 3'b010; FnCode = 4'bXXXX; #10;
        
        // Test ALUOp = 011
        ALUOp = 3'b011; FnCode = 4'bXXXX; #10;
        
        // Test ALUOp = 100
        ALUOp = 3'b100; FnCode = 4'bXXXX; #10;
        
        // Test ALUOp = 101
        ALUOp = 3'b101; FnCode = 4'bXXXX; #10;
        
        // Default cases
        ALUOp = 3'b111; FnCode = 4'bXXXX; #10;        
        ALUOp = 3'b000; FnCode = 4'b0001; #10;
        
        $finish;
    end
    
    initial begin
        $monitor("Time=%0t | ALUOp=%b | FnCode=%b | ALUFn=%b", 
                 $time, ALUOp, FnCode, ALUFn);
    end
    
endmodule
