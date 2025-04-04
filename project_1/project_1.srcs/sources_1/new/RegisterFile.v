`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2025 03:51:09 PM
// Design Name: 
// Module Name: RegisterFile
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


module registerFile(
    input clk,
    input reset,
    input [3:0] read_reg1,
    input [3:0] read_reg2,
    input [3:0] write_reg,
    input [15:0] write_data,
    input reg_write,
    output [15:0] read_data1,
    output [15:0] read_data2
);
    reg [15:0] registers [0:15];
    
    integer i;
    always @(posedge reset) begin
        $readmemh("reg_init.mem", registers);
    end
    always @(posedge clk) begin
        if (reg_write) begin
            registers[write_reg] <= write_data;
        end
    end

//    always @(negedge clk) begin
        assign read_data1 = registers[read_reg1];
        assign read_data2 = registers[read_reg2];
//    end
endmodule
