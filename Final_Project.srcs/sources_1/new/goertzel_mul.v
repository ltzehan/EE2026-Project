`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2022 11:30:57
// Design Name: 
// Module Name: goertzel_mul
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


// Multiplier for fixed-point representation
module goertzel_mul #(
    parameter B=61
    ) (
    input CLK,
    input RST,
    input EN,
    input signed [B-1:0] a,
    input signed [B-1:0] b,
    output reg signed [B-1:0] y=0
    );
    
    // Product of two B-bits is 2B-bits in size
    wire signed [(2*B)-1:0] temp;
    assign temp = a * b;
    
    // Lower 30 bits of integer and higher 30 bits of decimal
    localparam B_DEC = (B-1)/2;
    localparam B_INT = 3*(B-1)/2 - 1;
    always @(posedge CLK or posedge RST) begin
        if (RST)
            y <= 0;
        else if (EN)
            // Take sign bit and truncate
//            y <= {temp[(2*B-1)], temp[B_INT:B_DEC]};
            y <= temp[90:30];
    end
    
endmodule