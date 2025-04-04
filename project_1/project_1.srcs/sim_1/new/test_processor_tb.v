`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2025 04:12:26 PM
// Design Name: 
// Module Name: test_processor_tb
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


module test_processor_tb;
    reg clk;
    reg reset;
    
//    wire [15:0] pc_cur;
//    wire [15:0] reg_data1;
//    wire [15:0] reg_data2;
//    wire [15:0] alu_inp2;
//    wire [15:0] alu_out;
//    wire [15:0] mem_out;
//    wire regwrite;
//    wire branch;
//    wire jump;
//    wire memread;
//    wire memwrite;
//    wire memtoreg;
//    wire alusrc;
//    wire [2:0] aluop;
    wire [15:0] cpu_out;
//    wire [15:0] im_out;
    
    processor uut (
        .clk(clk),
        .reset(reset),
//        .pc_cur(pc_cur),
//        .reg_data1(reg_data1),
//        .reg_data2(reg_data2),
//        .alu_inp2(alu_inp2),
//        .alu_out(alu_out),
//        .mem_out(mem_out),
//        .regwrite(regwrite),
//        .branch(branch),
//        .jump(jump),
//        .memread(memread),
//        .memwrite(memwrite),
//        .memtoreg(memtoreg),
//        .alusrc(alusrc),
//        .aluop(aluop),
//        .im_out(im_out),
        .cpu_out(cpu_out)
    );
    
    always #0.5 clk = ~clk;

    initial begin        
        clk = 0;
        reset = 1;
        #1;
        reset = 0;
        #100;
        
        $display("Test Completed");
        $finish;
    end
    
endmodule

