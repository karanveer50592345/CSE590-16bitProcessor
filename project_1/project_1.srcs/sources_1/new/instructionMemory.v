`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2025 07:54:49 PM
// Design Name: 
// Module Name: instruction_memory
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


module instructionMemory(
    input [15:0] pc,
    output reg [15:0] instruction
	);
    
    reg [15:0] mem [0:63];
    integer i;
    initial begin
//        $readmemh("instruction_memory.mem", mem);
//        mem[0] = 16'h320d;
//        mem[1] = 16'h3307;
        mem[0] = 16'h320d;
        mem[1] = 16'h3307;
        mem[2] = 16'h0120;
        mem[3] = 16'h3730;
        mem[4] = 16'h0711;
        mem[5] = 16'h3270;
        mem[6] = 16'h3781;
        mem[7] = 16'h0172;
        mem[8] = 16'h0133;
        mem[9] = 16'h3413;
        mem[10] = 16'h3506;
        mem[11] = 16'h245c;
        mem[12] = 16'h165c;
        mem[13] = 16'h4462;
        mem[14] = 16'h3709;
        mem[15] = 16'h543e;
        mem[16] = 16'h370a;
        mem[17] = 16'h6003;
        mem[18] = 16'h531e;
        mem[19] = 16'h370b;
        mem[20] = 16'h370c;
        mem[21] = 16'h6002;
        mem[22] = 16'h370d;
        mem[23] = 16'h370c;
        mem[24] = 16'h6ff4;
        mem[25] = 16'h370f;
        mem[26] = 16'h3700;
        mem[27] = 16'h3701;
        mem[28] = 16'h6fe2;        
    end 
    
    always @(*) begin
        instruction = mem[pc >> 1];
    end
endmodule   
