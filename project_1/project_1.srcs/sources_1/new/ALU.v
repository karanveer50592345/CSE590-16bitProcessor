`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2025 08:53:44 PM
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [15:0] data1,
    input [15:0] data2,
    input [3:0] ALUFn,
    output reg bin,
    output reg [15:0] out
);
    always @(*) begin
        case (ALUFn)
            4'b0000: begin
                bin <= 0;
                out <= 16'h0000;
            end
            4'b0001: begin
                bin <= 0;
                out <= data1 + data2;
            end
            4'b0010: begin
                bin <= 0;
                out <= data1 - data2;
            end
            4'b0011: begin
                bin <= 0;
                out <= data2 << data1;
            end
            4'b0100: begin
                bin <= 0;
                out <= data1 & data2;
            end
            4'b0101: begin
                out <= 16'h0000;
                if (data1 == data2)
                    bin <= 1;
                else
                    bin <= 0;    
            end
            4'b0110: begin
                out <= 16'h0000;
                if (data1 !== data2)
                    bin <= 1;
                else
                    bin <= 0;
            end
            4'b0111: begin
                bin <= 0;
                out <= $unsigned(data1) + $signed(data2);
            end
            default: begin
                bin <= 0;
                out <= 16'h0000;
            end
        endcase
    end 
endmodule