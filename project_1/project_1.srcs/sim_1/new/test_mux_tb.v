`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2025 06:42:31 PM
// Design Name: 
// Module Name: test_mux_tb
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


module test_mux_tb;

    reg [15:0] in0;
    reg [15:0] in1;
    reg sel;
    wire [15:0] mux_out;
    
    multiplexer uut (
        .in0(in0),
        .in1(in1),
        .sel(sel),
        .mux_out(mux_out)
    );
    
    initial begin
        in0 = 16'hAAAA;
        in1 = 16'h5555;
        sel = 0;
        
        #10;
        $display("sel=%b, in0=%h, in1=%h, mux_out=%h", sel, in0, in1, mux_out);
        
        sel = 1;
        #10;
        $display("sel=%b, in0=%h, in1=%h, mux_out=%h", sel, in0, in1, mux_out);
        
        in0 = 16'h1234;
        in1 = 16'h5678;
        sel = 0;
        #10;
        $display("sel=%b, in0=%h, in1=%h, mux_out=%h", sel, in0, in1, mux_out);
        
        sel = 1;
        #10;
        $display("sel=%b, in0=%h, in1=%h, mux_out=%h", sel, in0, in1, mux_out);
        
        #10;
        $finish;
    end
endmodule
