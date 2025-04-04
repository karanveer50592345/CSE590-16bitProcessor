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


module test_control_tb;

    reg [3:0] opcode;
    wire RegWrite;
    wire Branch;
    wire Jump;
    wire MemRead;
    wire MemWrite;
    wire MemToReg;
    wire ALUSrc;
    wire [2:0] ALUOp;
    
    controlUnit uut (
        .opcode(opcode),
        .RegWrite(RegWrite),
        .Branch(Branch),
        .Jump(Jump),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .MemToReg(MemToReg),
        .ALUSrc(ALUSrc),
        .ALUOp(ALUOp)
    );
    
    initial begin
        $monitor("Time=%0t | opcode=%b | RegWrite=%b | Branch=%b | Jump=%b | MemRead=%b | MemWrite=%b | MemToReg=%b | ALUSrc=%b | ALUOp=%b", 
                 $time, opcode, RegWrite, Branch, Jump, MemRead, MemWrite, MemToReg, ALUSrc, ALUOp);
        
        #10 opcode = 4'b0000;
        #10 opcode = 4'b0001;
        #10 opcode = 4'b0010;
        #10 opcode = 4'b0011;
        #10 opcode = 4'b0100;
        #10 opcode = 4'b0101;
        #10 opcode = 4'b0110;
        
        #10 $finish;
    end
    
endmodule
