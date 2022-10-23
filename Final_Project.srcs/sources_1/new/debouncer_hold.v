`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.10.2022 13:21:33
// Design Name: 
// Module Name: debouncer_hold
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


// Differs from `debouncer` with output for press and hold; instead of a single pulse, output
// will be high for as long as button is held down

// Modified from https://www.fpga4student.com/2017/04/simple-debouncing-verilog-code-for.html
module debouncer_hold(
    input CLK,
    input in,
    output out
    );
    
    // 2 MHz
    parameter M = 9;
    
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
    
    assign out = q2;
   
endmodule
