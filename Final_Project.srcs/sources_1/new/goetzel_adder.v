`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2022 20:41:18
// Design Name: 
// Module Name: goetzel_adder
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


module goertzel_add #(
    parameter B=61
    ) (
    input CLK,
    input RST,
    input EN,
    input signed [B-1:0] a,
    input signed [B-1:0] b,
    input signed [B-1:0] c,
    output reg signed [B-1:0] y=0
    );
    
    // TODO: Why is this 2 bits larger? Does [B:0] not work
    wire signed [B+1:0] s_a;
    wire signed [B+1:0] s_b;
    wire signed [B+1:0] s_c;
    wire signed [B+1:0] s_y;
    
    assign s_a = $signed(a);
    assign s_b = $signed(b);
    assign s_c = $signed(c);
    assign s_y = s_a + s_b + s_c;
    
    always @(posedge CLK or posedge RST) begin
        if (RST) begin
            y <= 0;
        end
        else if (EN) begin
            y <= $signed(s_y);
        end
    end
    
endmodule