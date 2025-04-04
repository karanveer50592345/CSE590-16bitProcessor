`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2025 12:54:53 PM
// Design Name: 
// Module Name: signExtension
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


module signExtension(
    // 4 bit immediate input extends to 16 bit output
    input [3:0] fourBitInput,      
    output reg [15:0] sixteenBitExtendedOutput 
);
    always @(*) begin
        sixteenBitExtendedOutput = {{12{fourBitInput[3]}}, fourBitInput};  
    end
endmodule
