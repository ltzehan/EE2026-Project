`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.10.2022 19:03:32
// Design Name: 
// Module Name: debouncer
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


// Modified from https://www.fpga4student.com/2017/04/simple-debouncing-verilog-code-for.html
module debouncer(
    input CLK,
    input in,
    output out
    );
    
    wire en;
    fclk #(.khz(2)) clk_0p8khz(CLK, en);
                  
    wire q0, q1, q2;
    dff dff1(CLK, en, in, q0);
    dff dff2(CLK, en, q0, q1);
    dff dff3(CLK, en, q1, q2);
    
    assign out = q1 & ~q2;
   
endmodule
