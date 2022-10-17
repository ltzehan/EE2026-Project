`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2022 11:31:41
// Design Name: 
// Module Name: goertzel_reg
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


// Stores value of previous calculation of s[*]
module goertzel_reg #(
    parameter B=61
    ) (
    input CLK,
    input RST,
    input EN,
    input signed [B-1:0] x,
    output reg signed [B-1:0] next_x=0
    );
    
    always @(posedge CLK or posedge RST) begin
        if (RST)
            next_x <= 0;
        else if (EN)
            next_x <= x;
    end
    
endmodule