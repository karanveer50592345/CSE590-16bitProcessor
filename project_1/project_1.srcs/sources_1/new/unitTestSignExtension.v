`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2025 01:14:22 PM
// Design Name: 
// Module Name: unitTestSignExtension
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


module unitTestSignExtension;

    reg [11:0] twelveBitInput;
    wire [15:0] sixteenBitExtendedOutput;

    signExtension12Bit uut (
        .twelveBitInput(twelveBitInput),
        .sixteenBitExtendedOutput(sixteenBitExtendedOutput)
    );

    initial begin
        twelveBitInput = 12'h101;
        #10;
        $display("Test Case 1: twelveBitInput = %b, sixteenBitExtendedOutput = %b", twelveBitInput, sixteenBitExtendedOutput);

        twelveBitInput = 12'hf01;
        #10;
        $display("Test Case 2: twelveBitInput = %b, sixteenBitExtendedOutput = %b", twelveBitInput, sixteenBitExtendedOutput);

        twelveBitInput = 12'h801;
        #10;
        $display("Test Case 3: twelveBitInput = %b, sixteenBitExtendedOutput = %b", twelveBitInput, sixteenBitExtendedOutput);

        twelveBitInput = 12'h951;
        #10;
        $display("Test Case 4: twelveBitInput = %b, sixteenBitExtendedOutput = %b", twelveBitInput, sixteenBitExtendedOutput);

        twelveBitInput = 12'h100;
        #10;
        $display("Test Case 5: twelveBitInput = %b, sixteenBitExtendedOutput = %b", twelveBitInput, sixteenBitExtendedOutput);

        $finish;
    end

endmodule
