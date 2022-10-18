`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2022 11:48:12
// Design Name: 
// Module Name: sim_goertzel_fp
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


`define assert(signal, value) \
	if (signal !== value) begin \
	    $display("ASSERTION FAILED in %m: signal != value"); \
	    $display("Actual value: %b", signal);\
	    $finish; \
	end

module sim_goertzel_fp(
    );
    
    // 100MHz clock
    reg CLK = 0;
    always begin
        #5 CLK <= ~CLK;
    end
    
    reg [11:0] x;
    wire signed [60:0] y;
    goertzel_fp goertzel_fp(CLK, 1'b0, 1'b1, x, y); 
    
    initial begin
        x = 1377;
        #10;
        `assert(y, 61'b0000000000000000000000000000000101011000010000000000000000000);
        #10;
        x = 240;
        #10;
        `assert(y, 61'b0000000000000000000000000000000000111100000000000000000000000);
        #10;
        x = 1712;
        #10;
        `assert(y, 61'b0000000000000000000000000000000110101100000000000000000000000);
        #10;
        x = 76;
        #10;
        `assert(y, 61'b0000000000000000000000000000000000010011000000000000000000000);
        #10;
        x = 858;
        #10;
        `assert(y, 61'b0000000000000000000000000000000011010110100000000000000000000);
        #10;
        x = 2049;
        #10;
        `assert(y, 61'b0000000000000000000000000000001000000000010000000000000000000);
        #10;
        x = 2037;
        #10;
        `assert(y, 61'b0000000000000000000000000000000111111101010000000000000000000);
        #10;
        x = 1247;
        #10;
        `assert(y, 61'b0000000000000000000000000000000100110111110000000000000000000);
        #10;
        x = 3201;
        #10;
        `assert(y, 61'b0000000000000000000000000000001100100000010000000000000000000);
        #10;
    end
    
endmodule

