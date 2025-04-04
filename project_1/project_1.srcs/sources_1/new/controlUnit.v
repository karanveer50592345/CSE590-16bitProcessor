`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2025 04:05:36 PM
// Design Name: 
// Module Name: controlUnit
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

module controlUnit(
    input [3:0] opcode,
    output reg RegWrite,
    output reg Branch,
    output reg Jump,
    output reg MemRead,
    output reg MemWrite,
    output reg MemToReg,
    output reg ALUSrc,
    output reg [2:0] ALUOp
    );
    always @(*) begin
        case (opcode)
            4'b0000: begin
                RegWrite = 1;
                Branch = 0;
                Jump = 0;
                MemRead = 0;
                MemWrite = 0;
                MemToReg = 0;
                ALUSrc = 0;
                ALUOp[2:0] = 4'b001;
            end
            4'b0001: begin
                RegWrite = 1;
                Branch = 0;
                Jump = 0;
                MemRead = 1;
                MemWrite = 0;
                MemToReg = 1;
                ALUSrc = 1;
                ALUOp[2:0] = 4'b101;
            end
            4'b0010: begin
                RegWrite = 0;
                Branch = 0;
                Jump = 0;
                MemRead = 0;
                MemWrite = 1;
                MemToReg = 0;
                ALUSrc = 1;
                ALUOp[2:0] = 4'b101;
            end
            4'b0011: begin
                RegWrite = 1;
                Branch = 0;
                Jump = 0;
                MemRead = 0;
                MemWrite = 0;
                MemToReg = 0;
                ALUSrc = 1;
                ALUOp[2:0] = 4'b010;
            end
            4'b0100: begin
                RegWrite = 0;
                Branch = 1;
                Jump = 0;
                MemRead = 0;
                MemWrite = 0;
                MemToReg = 0;
                ALUSrc = 0;
                ALUOp[2:0] = 4'b011;
            end
            4'b0101: begin
                RegWrite = 0;
                Branch = 1;
                Jump = 0;
                MemRead = 0;
                MemWrite = 0;
                MemToReg = 0;
                ALUSrc = 0;
                ALUOp[2:0] = 4'b100;
            end
            4'b0110: begin
                RegWrite = 0;
                Branch = 0;
                Jump = 1;
                MemRead = 0;
                MemWrite = 0;
                MemToReg = 0;
                ALUSrc = 0;
                ALUOp[2:0] = 4'b000;
            end
            default: begin
                RegWrite = 0;
                Branch = 0;
                Jump = 0;
                MemRead = 0;
                MemWrite = 0;
                MemToReg = 0;
                ALUSrc = 0;
                ALUOp[2:0] = 4'b000;
            end
        endcase
    end
endmodule