`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2025 08:34:58 PM
// Design Name: 
// Module Name: ALUControlUnit
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


module ALUControlUnit(
        input [2:0] ALUOp,
        input [3:0] FnCode,
        output reg [3:0] ALUFn
    );
        always @(*) begin
        case (ALUOp)
            3'b001: begin
                case (FnCode)
                    4'b0000: begin
                        ALUFn <= 4'b0001;
                    end
                    4'b0001: begin
                        ALUFn <= 4'b0010;
                    end
                    4'b0010: begin
                        ALUFn <= 4'b0011;
                    end
                    4'b0011: begin
                        ALUFn <= 4'b0100;
                    end
                endcase
            end
            3'b010: begin
                ALUFn <= 4'b0001;
            end
            3'b011: begin
                ALUFn <= 4'b0101;
            end
            3'b100: begin
                ALUFn <= 4'b0110;
            end
            3'b101: begin
                ALUFn <= 4'b0111;
            end
            default: ALUFn <= 4'b0000;
        endcase
    end
endmodule
