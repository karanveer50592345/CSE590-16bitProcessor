`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2025 07:30:05 PM
// Design Name: 
// Module Name: test_data_mem_tb
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


module test_data_mem_tb;
    reg clk;
    reg reset;
    reg [15:0] address;
    reg [15:0] write_data;
    reg MemWrite;
    reg MemRead;
    wire [15:0] read_data;

    dataMemory uut (
        .clk(clk),
        .reset(reset),
        .address(address),
        .write_data(write_data),
        .MemWrite(MemWrite),
        .MemRead(MemRead),
        .read_data(read_data)
    );

    always begin
        #5 clk = ~clk;
    end

    initial begin
        clk = 0;
        reset = 0;
        address = 16'h0;
        write_data = 16'h0;
        MemWrite = 0;
        MemRead = 0;

        #10;
        reset = 1;
        #10;
        reset = 0;
        $display("Test Case 1: After reset, read_data = %h", read_data);

        #10;
        address = 16'h0;
        write_data = 16'h1234;
        MemWrite = 1;
        MemRead = 0;
        #10;
        MemWrite = 0;
        MemRead = 1;
        #10;
        $display("Test Case 2: Write 1234 to address 0, read_data = %h", read_data);

        #10;
        address = 16'h4;
        write_data = 16'h5678;
        MemWrite = 1;
        MemRead = 0;
        #10;
        MemWrite = 0;
        MemRead = 1;
        #10;
        $display("Test Case 3: Write 5678 to address 2, read_data = %h", read_data);

        #10;
        address = 16'h2;
        MemWrite = 0;
        MemRead = 1;
        #10;
        $display("Test Case 4: Read from address 1 (unwritten), read_data = %h", read_data);

        #10;
        address = 16'hA;
        write_data = 16'h9ABC;
        MemWrite = 1;
        MemRead = 0;
        #10;
        MemWrite = 0;
        MemRead = 1;
        #10;
        $display("Test Case 5: Write 9ABC to address 5, read_data = %h", read_data);

        #10;
        $finish;
    end

endmodule
