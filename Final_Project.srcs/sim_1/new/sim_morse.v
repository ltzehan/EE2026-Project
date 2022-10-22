`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.10.2022 16:42:28
// Design Name: 
// Module Name: sim_morse
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

`define DOT e_btnC <= 1; #10;
`define DASH e_btnC <= 1; #30;
`define SPACE e_btnC <= 0; #10;
`define WORD e_btnC <= 0; #70;

module sim_morse(
    );
    
    // 100MHz clock
    reg CLK = 0;
    always begin
        #5 CLK <= ~CLK;
    end
    
    reg e_btnC = 0;
    initial begin
        #5;
        `DOT`SPACE`DASH
        `WORD
        `DASH`SPACE`DOT`SPACE`DOT`SPACE`DOT
        `WORD
    end
    
    wire valid;
    wire [5:0] symbol;
    morse morse(
        .CLK(CLK),
        .in(e_btnC),
        .valid(valid),
        .symbol(symbol)
        );
    
endmodule
