`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2025 09:15:44 PM
// Design Name: 
// Module Name: processor
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
`include "ProgramCounter.v"
`include "instructionMemory.v"
`include "controlUnit.v"
`include "registerFile.v"
`include "signExtension.v"
`include "signExtender12Bit.v"
`include "sll.v"
`include "ALU.v"
`include "pcAdder.v"
`include "add.v"
`include "data_memory.v"
`include "multiplexer.v"
`include "ALUControlUnit.v"

module processor(
    input clk,                 
    input reset,
//    output reg [15:0] pc_cur,
//    output reg [15:0]reg_data1,
//    output reg [15:0]reg_data2,
//    output reg [15:0] alu_inp2,
//    output reg [15:0] alu_out,
//    output reg [15:0] mem_out,
//    output reg regwrite,
//    output reg branch,
//    output reg jump,
//    output reg memread,
//    output reg memwrite,
//    output reg memtoreg,
//    output reg alusrc,
//    output reg [2:0] aluop,
//    output reg [15:0] im_out,
    output reg [15:0] cpu_out
    );
    wire [15:0] PC_CUR, PC_NEXT, IM_OUT, REG_DATA1, REG_DATA2, ALU_INP2, IMM_EX, ALU_OUT, MEM_OUT, REG_WRITE_DATA, IMM_SLB, PC_2, BR_ADDR, JMP_ADDR, JMP_EX, JMP_SL, BR_PC_2 ;
    wire [3:0] ALU_FN ;
    wire IS_BRANCH, PC_SRC;
    // control signal wires
    wire RegWrite, Branch, Jump, MemRead, MemWrite, MemToReg, ALUSrc;
    wire [2:0] ALUOp;
    
    programCounter PC(
    .clk(clk),
    .reset(reset),
    .next_pc(PC_NEXT),
    .pc(PC_CUR)
    );
    
    instructionMemory IM(
    .pc(PC_CUR),
    .instruction(IM_OUT)
    );
    
    pcAdder PC_ADD(
    .inp(PC_CUR),
    .result(PC_2)
    );
    
    registerFile RF (
    .clk(clk),
    .reset(reset),
    .read_reg1(IM_OUT[7:4]),
    .read_reg2(IM_OUT[11:8]),
    .write_reg(IM_OUT[11:8]),
    .write_data(REG_WRITE_DATA),
    .reg_write(RegWrite),
    .read_data1(REG_DATA1),
    .read_data2(REG_DATA2)
    );
    
    controlUnit CU (
    .opcode(IM_OUT[15:12]),
    .RegWrite(RegWrite),
    .Branch(Branch),
    .Jump(Jump),
    .MemRead(MemRead),
    .MemWrite(MemWrite),
    .MemToReg(MemToReg),
    .ALUSrc(ALUSrc),
    .ALUOp(ALUOp)
    );
    
    signExtension12Bit SE12(
    .twelveBitInput(IM_OUT[11:0]),      
    .sixteenBitExtendedOutput(JMP_EX) 
    );
    
    signExtension SE(
    .fourBitInput(IM_OUT[3:0]),      
    .sixteenBitExtendedOutput(IMM_EX) 
    );
    
    multiplexer MUX1 (
    .in0(REG_DATA2),
    .in1(IMM_EX),
    .sel(ALUSrc),
    .mux_out(ALU_INP2)
    );
    
    ALUControlUnit ALUCU (
    .ALUOp(ALUOp),
    .FnCode(IM_OUT[3:0]),
    .ALUFn(ALU_FN)
    );
    
    ALU MainALU (
    .data1(REG_DATA1),
    .data2(ALU_INP2),
    .ALUFn(ALU_FN),
    .bin(IS_BRANCH),
    .out(ALU_OUT)
    );
    
    dataMemory DM(
    .clk(clk),
    .reset(reset),
    .address(ALU_OUT),
    .write_data(REG_DATA2),
    .MemWrite(MemWrite),
    .MemRead(MemRead),
    .read_data(MEM_OUT)
    );
	
	multiplexer MUX2 (
    .in0(ALU_OUT),
    .in1(MEM_OUT),
    .sel(MemToReg),
    .mux_out(REG_WRITE_DATA)
    );

    always @(posedge clk or posedge reset) begin
        if (reset)
            cpu_out = 16'b0;
        else
            cpu_out = REG_WRITE_DATA;
                 
//        pc_cur = PC_CUR;
//        reg_data1 = REG_DATA1;
//        reg_data2 = REG_DATA2;
//        alu_inp2 = ALU_INP2;
//        alu_out = ALU_OUT;
//        mem_out = MEM_OUT;
//        regwrite = RegWrite;
//        branch = Branch;
//        jump = Jump;
//        memread = MemRead;
//        memwrite = MemWrite;
//        memtoreg = MemToReg;
//        alusrc = ALUSrc;
//        aluop = ALUOp;
//        im_out = IM_OUT;
    end 
    
    sll SLB (
    .inp(IMM_EX),      
    .result(IMM_SLB)
    );
    
    adder ADDB (
    .inp1(PC_2),
    .inp2(IMM_SLB),
    .result(BR_ADDR)
    );
    
    and a1(PC_SRC, IS_BRANCH, Branch);
    
    multiplexer MUX3 (
    .in0(PC_2),
    .in1(BR_ADDR),
    .sel(PC_SRC),
    .mux_out(BR_PC_2)
    );
    
    sll SLJ (
    .inp(JMP_EX),      
    .result(JMP_SL)
    );
    
    adder ADDJ (
    .inp1(PC_2),
    .inp2(JMP_SL),
    .result(JMP_ADDR)
    );
    
     multiplexer MUX4 (
    .in0(BR_PC_2),
    .in1(JMP_ADDR),
    .sel(Jump),
    .mux_out(PC_NEXT)
    );    
endmodule
