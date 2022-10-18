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
    parameter N=171,
    parameter k=0
    ) (
    input CLK,
    input RST,
    input signed [B-1:0] y1,
    input signed [B-1:0] y2,
    output signed [B-1:0] out
    );
    
    // Load values of 2*cos(w_k)
    reg [B-1:0] val_arr [N-1:0];
    reg [B-1:0] val;
    initial begin
        $readmemh("val.mem", val_arr);
        val = val_arr[k];
    end
    
    wire signed [60:0] y1_sqr;
    wire signed [60:0] y2_sqr;
    wire signed [60:0] y1_y2;
    wire signed [60:0] cos;
    wire signed [60:0] power;
    
    // y1^2
    goertzel_mul #(.B(B)) mul_y1_sqr (CLK, RST, 1'b1,
                                      y1, 
                                      y1, 
                                      y1_sqr);
                                     
    // y2^2
    goertzel_mul #(.B(B)) mul_y2_sqr (CLK, RST, 1'b1,
                                      y2, 
                                      y2, 
                                      y2_sqr);
    
    // y1*y2
    goertzel_mul #(.B(B)) mul_y1_y2 (CLK, RST, 1'b1,
                                     y1, 
                                     y2, 
                                     y1_y2);
              
    // y1*y2*2*cos(w_k)
    goertzel_mul #(.B(B)) mul_cos (CLK, RST, 1'b1,
                                   y1_y2, 
                                   val, 
                                   cos);
    
    goertzel_add #(.B(B)) add (CLK, RST, 1'b1,
                               y1_sqr,
                               y2_sqr,
                               -cos,
                               power);
    
    assign out = power;
    
endmodule
