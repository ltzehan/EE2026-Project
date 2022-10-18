`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2022 22:25:12
// Design Name: 
// Module Name: goertzel_v2
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

module goertzel_v2 (
    input CLK,
    input RST,
    input [11:0] mic,  // Mic. input
    output signed [31:0] y1,
    output signed [31:0] y2
    );
    
    // Number of samples
    parameter N = 171;
    // Frequency bin (0 <= k <= N-1)
    parameter k = 0;

    // Load values of 2*cos(w_k)
    reg signed [31:0] val_arr [N-1:0];
    reg signed [31:0] val;
    initial begin
        $readmemh("val.mem", val_arr);
        val = val_arr[k];
        $display("[goertzel_v2] k = %d; val = %h", k, val);
    end
    
    
    wire clk_20khz;
    fclk #(.khz(20)) mic_clk(CLK, clk_20khz);
    
    wire signed [31:0] x;
    wire signed [63:0] s1_val_mul_64;
    wire signed [31:0] s1_val_mul;
    wire signed [31:0] s;
    
    reg signed [31:0] s1 = 0;
    reg signed [31:0] s2 = 0; 
    // Convert input to fixed-point representation (Normalized to [0, 1])
    assign x = {17'b0, mic[11:0], 3'b0};
    // s[n-1] * val (32+32 bits)
    assign s1_val_mul_64 = s1 * val;
    // s[n-1] * val (32 bits)
    assign s1_val_mul = s1_val_mul_64[46:15];
    // x[n] + 2*cos(w_k)*s[n-1]*val - s[n-2]
    assign s = x + s1_val_mul - s2; 
    
    always @(posedge clk_20khz or posedge RST) begin
        if (RST) begin
            s1 <= 0;
            s2 <= 0;
        end
        else begin
            s1 <= s;
            s2 <= s1;
        end
    end
    
    assign y1 = s1;
    assign y2 = s2;
    
endmodule
