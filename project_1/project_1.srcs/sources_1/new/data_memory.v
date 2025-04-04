`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2025 07:55:30 PM
// Design Name: 
// Module Name: data_memory
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


module dataMemory(
    input clk,
    input reset,
    input [15:0] address,
    input [15:0] write_data,
    input MemWrite,
    input MemRead,
    output reg [15:0] read_data
	);
    
    reg [7:0] data_mem [63:0];
//    initial begin
////        $readmemh("data_memory.mem", data_mem); // Load data from a file to main memory
//        for (i=0; i < 64; i = i + 1) begin
//            data_mem[i] <= 8'h00;
//        end
//    end
    integer i;
    always @(posedge reset or posedge clk) begin
        if (reset) begin
            for (i=0; i < 64; i = i + 1) begin
                data_mem[i] <= 8'h00;
            end
        end
        else if (MemWrite) begin
            data_mem[address] <= write_data[15:8];
            data_mem[address+1] <= write_data[7:0];
        end
    end

    always @(*) begin
        if (MemRead) begin
            read_data[15:8] = data_mem[address];
            read_data[7:0] = data_mem[address+1];
        end
        else begin
            read_data = 16'h0000;
        end
    end

//	always @(posedge clk) begin    
//        if (MemWrite) begin
//            data_mem[address] <= write_data[15:8];
//            data_mem[address+1] <= write_data[7:0];
//        end
//    end    

endmodule