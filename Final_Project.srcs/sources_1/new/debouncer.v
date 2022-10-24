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
    
    parameter M = 9_999;
    
    // Don't use fclk here since DFFs should only be enabled for a single clock cycle
    reg [31:0] ctr = 0;
    always @(posedge CLK) begin
        ctr <= (ctr == M) ? 0 : ctr+1;
    end
    
    wire en;
    assign en = (ctr == M);
                      
    wire q0, q1, q2;
    dff dff1(CLK, en, in, q0);
    dff dff2(CLK, en, q0, q1);
    dff dff3(CLK, en, q1, q2);
    
    assign out = q1 & ~q2;
   
endmodule
