`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.10.2022 14:30:55
// Design Name: 
// Module Name: goertzel_power_v2
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


module goertzel_power_v2(
    input CLK,
    input RST,
    input signed [31:0] y1,
    input signed [31:0] y2,
    output signed [31:0] out
    );
    
    // Number of samples
    parameter N = 283;
    // Frequency bin (0 <= k <= N-1)
    parameter k = 0;
    
    // Load values of 2*cos(w_k)
    wire signed [31:0] val;
    goertzel_val #(.N(N), .k(k)) rom (val);
    
    wire signed [63:0] y1_sqr_64;
    wire signed [63:0] y2_sqr_64;
    wire signed [63:0] y1_y2_64;
    wire signed [31:0] y1_y2;
    wire signed [63:0] y1_y2_val_64;
    wire signed [63:0] out_64;
    
    assign y1_sqr_64 = y1 * y1;
    assign y2_sqr_64 = y2 * y2;
    assign y1_y2_64 = y1 * y2;
    assign y1_y2 = y1_y2_64[46:15];
    assign y1_y2_val_64 = y1_y2 * val;
    assign out_64 = y1_sqr_64 + y2_sqr_64 - y1_y2_val_64;

    assign out = out_64 > 0 ? out_64[46:15] : 0;
    
endmodule
