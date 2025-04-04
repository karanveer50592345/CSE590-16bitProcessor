`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2025 05:29:42 PM
// Design Name: 
// Module Name: test_reg_file_tb
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


module test_reg_file_tb;

    reg clk;
    reg reset;
    reg [3:0] read_reg1;
    reg [3:0] read_reg2;
    reg [3:0] write_reg;
    reg [15:0] write_data;
    reg reg_write;
    wire [15:0] read_data1;
    wire [15:0] read_data2;

    registerFile uut (
        .clk(clk),
        .reset(reset),
        .read_reg1(read_reg1),
        .read_reg2(read_reg2),
        .write_reg(write_reg),
        .write_data(write_data),
        .reg_write(reg_write),
        .read_data1(read_data1),
        .read_data2(read_data2)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        reg_write = 0;
        write_reg = 4'b0000;
        write_data = 16'h0000;
        read_reg1 = 4'b0000;
        read_reg2 = 4'b0001;

        #10 reset = 0;

        #10 reg_write = 1; write_reg = 4'b0001; write_data = 16'hAAAA; // Write AAAA to R2
        #10 reg_write = 1; write_reg = 4'b0011; write_data = 16'hBBBB; // Write BBBB to R3
        #10 reg_write = 0;

        #10 read_reg1 = 4'b0010; read_reg2 = 4'b0011;  // Read R2 and R3, expect AAAA and BBBB

        #10 reg_write = 1; write_reg = 4'b0100; write_data = 16'h1234;

        #10 reg_write = 0; read_reg1 = 4'b0100; read_reg2 = 4'b0000;

        #10 reset = 1;
        #10 reset = 0; read_reg1 = 4'b0010; read_reg2 = 4'b0011;

        #20 $finish;
    end

    // Monitor Outputs
    initial begin
        $monitor("Time=%0t | clk=%b | reset=%b | reg_write=%b | write_reg=%h | write_data=%h | read_reg1=%h | read_reg2=%h | read_data1=%h | read_data2=%h", 
                 $time, clk, reset, reg_write, write_reg, write_data, read_reg1, read_reg2, read_data1, read_data2);
    end

endmodule
