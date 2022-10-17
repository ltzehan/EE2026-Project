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
    goertzel_fp goertzel_fp(CLK, 1'b0, x, y); 
    
    initial begin
        x = 1567;
        #10;
        `assert(y, 61'b0000000000000000000000000000000011000011111000000000000000000);
        #10;
        x = 201;
        #10;
        `assert(y, 61'b0000000000000000000000000000000000011001001000000000000000000);
        #10;
        x = 1725;
        #10;
        `assert(y, 61'b0000000000000000000000000000000011010111101000000000000000000);
        #10;
        x = 340;
        #10;
        `assert(y, 61'b0000000000000000000000000000000000101010100000000000000000000);
        #10;
        x = 3821;
        #10;
        `assert(y, 61'b0000000000000000000000000000000111011101101000000000000000000);
        #10;
        x = 3999;
        #10;
        `assert(y, 61'b0000000000000000000000000000000111110011111000000000000000000);
        #10;
        x = 3299;
        #10;
        `assert(y, 61'b0000000000000000000000000000000110011100011000000000000000000);
        #10;
        x = 1230;
        #10;
        `assert(y, 61'b0000000000000000000000000000000010011001110000000000000000000);
        #10;
        x = 1707;
        #10;
        `assert(y, 61'b0000000000000000000000000000000011010101011000000000000000000);
        #10;
    end
    
endmodule

