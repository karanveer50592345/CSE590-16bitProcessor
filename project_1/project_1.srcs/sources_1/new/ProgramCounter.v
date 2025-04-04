`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2025 04:07:25 PM
// Design Name: 
// Module Name: ProgramCounter
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

module programCounter(
    input clk,
    input reset,
    input [15:0] next_pc,
    output reg [15:0] pc
    );
    always @(posedge clk or posedge reset) begin
        if (reset)
            pc <= 16'b0;
        else
            pc <= next_pc;
    end
endmodule
