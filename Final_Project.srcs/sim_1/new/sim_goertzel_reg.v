`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2022 11:32:20
// Design Name: 
// Module Name: sim_goertzel_reg
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
	    $finish; \
	end

module sim_goertzel_reg(
    );
    
    // 100MHz clock
    reg CLK = 0;
    always begin
        #5 CLK <= ~CLK;
    end
    
    reg signed [60:0] x;
    wire signed [60:0] next_x;
    goertzel_reg goertzel_reg(CLK, 1'b0, 1'b1, x, next_x); 
    
    localparam v = 61'b001011011101111011111011111101111111011111111011111111101011;
    initial begin
       x = 0;
       #10;
       `assert(next_x, 0);
       x = v;
       `assert(next_x, 0);
       #10;
       `assert(next_x, v);
       x = (v >> 2);
       `assert(next_x, v);
       #10;
       `assert(next_x, v >> 2);
    end
    
endmodule
