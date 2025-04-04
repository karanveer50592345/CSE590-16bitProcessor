`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2025 08:22:26 PM
// Design Name: 
// Module Name: SignExtender12bit
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


module signExtension12Bit(
    // 12 bit immediate input extends to 16 bit output
    input [11:0] twelveBitInput,      
    output reg [15:0] sixteenBitExtendedOutput 
);

    always @(*) begin
        sixteenBitExtendedOutput = {{4{twelveBitInput[11]}}, twelveBitInput};  
    end

endmodule
