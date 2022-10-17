`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2022 13:48:12
// Design Name: 
// Module Name: goertzel_power
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

//  Calculates power of bin from outputs of Goertzel filter
//  Requires 2 clock cycles:
//  1.   y1_sqr, y2_sqr, y1_y2
//  2.   power
module goertzel_power #(
    parameter B=61,
    parameter N=40,
    parameter k=0
    ) (
    input CLK,
    input RST,
    input signed [B-1:0] y1,
    input signed [B-1:0] y2,
    output reg signed [B-1:0] power=0
    );
    
    // Load values of cos(w_k)
    reg [B-1:0] cos_w_k_arr [N-1:0];
    reg [B-1:0] cos_w_k;
    initial begin
        $readmemh("cos_w_k.mem", cos_w_k_arr);
        cos_w_k = cos_w_k_arr[k];
    end
    
    wire signed [60:0] y1_sqr;
    wire signed [60:0] y2_sqr;
    wire signed [60:0] y1_y2;
    
    // y1^2
    goertzel_mul #(.B(B)) mul_y1_sqr (CLK, RST, 
                                      y1, 
                                      y1, 
                                      y1_sqr);
                                     
    // 4*y2^2
    goertzel_mul #(.B(B)) mul_y2_sqr (CLK, RST, 
                                      4*y2, 
                                      y2, 
                                      y2_sqr);
    
    // 4*y1*y2*cos(w_k)
    goertzel_mul #(.B(B)) mul_y1_y2 (CLK, RST, 
                                     4*y1, 
                                     cos_w_k*y2, 
                                     y1_y2);
               
    always @(posedge CLK) begin
        power <= y1_sqr + y2_sqr - y1_y2;
    end
    
endmodule
