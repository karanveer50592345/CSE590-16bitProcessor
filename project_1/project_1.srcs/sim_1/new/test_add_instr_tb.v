`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2025 07:52:26 PM
// Design Name: 
// Module Name: test_add_instr_tb
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


module test_add_instr_tb;

    reg clk;
    reg reset;
    reg [15:0] pc_in;
    wire [15:0] pc_out;
    wire [15:0] instruction;
    wire [15:0] reg_data1, reg_data2;
    reg [15:0] reg_write_data;
    reg reg_write_en;
    wire [15:0] alu_result;
    wire alu_zero_flag;

    programCounter uut_pc (
        .clk(clk),
        .reset(reset),
        .next_pc(pc_in),
        .pc(pc_out)
    );

    instructionMemory uut_im (
        .pc(pc_out),
        .instruction(instruction)
    );

    registerFile uut_rf (
        .clk(clk),
        .reset(reset),
        .read_reg1(instruction[7:4]),
        .read_reg2(instruction[11:8]),
        .write_reg(instruction[11:8]),
        .write_data(reg_write_data),
        .reg_write(reg_write_en),
        .read_data1(reg_data1),
        .read_data2(reg_data2)
    );

    ALU uut_alu (    
        .clk(clk),
        .data1(reg_data1),
        .data2(reg_data2),
        .ALUFn(4'b0001),
        .bin(alu_zero_flag),
        .out(alu_result)
    );

    always begin
        #5 clk = ~clk;
    end

    
    initial begin
        clk = 0;
        reset = 0;
        pc_in = 16'h0000;
        reg_write_data = 16'h0;
        reg_write_en = 0;

        #10;
        reset = 1;
        #10;
        reset = 0;
        $display("Test Case 1: After reset, PC = %h, reg_data1 = %h, reg_data2 = %h, alu_result = %h", pc_out, reg_data1, reg_data2, alu_result);

        #10;
        pc_in = 16'h0004;
        #10;
        $display("Test Case 2: Set PC to %h, PC = %h, instruction = %h", pc_in, pc_out, instruction);

        #10;
        reg_write_data = 16'hA1A1;
        reg_write_en = 1;
        #10;
        reg_write_en = 0;
        $display("Test Case 3: Write data to register, reg_data1 = %h, reg_data2 = %h", reg_data1, reg_data2);

        #10;
        reg_write_data = 16'hA1A1;
        reg_write_en = 1;
        #10;
        reg_write_en = 0;
        $display("Test Case 4: ALU addition, alu_result = %h", alu_result);

        #10;
        pc_in = 16'h0008;
        #10;
        $display("Test Case 5: PC = %h, instruction = %h", pc_out, instruction);
        
        #10;
        if (alu_result == 16'h0) begin
            $display("Test Case 6: ALU zero flag is set");
        end else begin
            $display("Test Case 6: ALU zero flag is not set");
        end

        #10;
        $finish;
    end

endmodule