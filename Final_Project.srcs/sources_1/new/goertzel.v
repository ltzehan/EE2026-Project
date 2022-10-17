`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.10.2022 15:13:14
// Design Name: 
// Module Name: goertzel
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

/*
*   Goertzel algorithm implemented with fixed-point arithmetic 
*   -- Parameters 
*   B:      Fixed-point representation size (1 sign bit + 30 integer bits + 30 decimal bits)
*               Assume it's always 1 sign bit and equal number of integer/decimal bits            
*               Honestly don't touch this or there'll be a 99% chance of breaking lmao
*   N:      Number of samples
*   k:      Frequency bin to calculate (0 <= k <= N-1)
*               Bins are separated by (Sample Freq. / N)
*   w_k:    Angular frequency of k-th bin = 2 * PI * k / N
*   -- Output
*   y1, y2: Outputs used to calculate power    
*               Requires N calculations before actual value is computed; save some computation
*               by doing it outside this filter
*
*   x[n]: 12-bit input from mic
*   s[n]: intermediate (for 1st stage IIR) of len N
*   y[n]: output of len N
*   
*   First stage (IIR):
*       s[n] = x[n] + 2cos(w_0)*s[n-1] - s[n-2]
*   Second stage (FIR):
*       y[n] = s[n] - exp(-j*w_0)*s[n-1]   
*   
*   Ref.: https://circuitcellar.com/resources/ee-tips/basic-goertzel-ee-tip-120/ 
*   Original Goertzel transform:
*       Re = y1 - y2 * 2cos(w_k)
*       Im = y2 * 2sin(w_k)
*       
*       P(k) = y1^2 + 4y^2 - 4*y1*y2*cos(w_k)
*/

module goertzel #(
    parameter B=61, // Fixed-point representation length
    parameter N=40, // Number of samples
    parameter k=0,  // Freq. bin (k = [0, N-1])
    parameter samp_khz=20_000
    ) (
    input CLK,
    input RST,
    input mic_cs,      // Mic. input on posedge 
    input [11:0] mic,  // Mic. input
    output [B-1:0] y1,
    output [B-1:0] y2
    );
    
    // Length of integer/decimal part    
    localparam B_PART = (B-1) >> 1;
   
    // Load values of cos(w_k)
    reg [B-1:0] cos_w_k_arr [N-1:0];
    reg [B-1:0] cos_w_k;
    initial begin
        $readmemh("cos_w_k.mem", cos_w_k_arr);
        cos_w_k = cos_w_k_arr[k];
    end
       
    wire signed [B-1:0] x;
    reg signed [B-1:0] s = 0;
    wire signed [B-1:0] s_prev1;
    wire signed [B-1:0] s_prev1_mul;
    wire signed [B-1:0] s_prev2;
    
    wire x_ready;
    reg s_ready = 0;
    wire mul_ready;
    
    // Convert mic -> x (fixed-point repr.)
    goertzel_fp #(.B(B)) fp (CLK, RST, mic_cs,
                             mic,
                             x,
                             x_ready);
    
    // s[n] = x[n] + w_k * s[n-1] - s[n-2]
    always @(posedge CLK or posedge RST) begin
        s_ready <= 0;
        if (RST) begin
            s <= 0;
        end 
        else if (x_ready) begin
             s <= x + s_prev1_mul - s_prev2;
             s_ready <= 1;
        end
    end
    
    // s[n-1] * cos(w_k)
    goertzel_mul #(.B(B)) mul_prev1 (CLK, RST, x_ready,
                                     s_prev1, 
                                     cos_w_k, 
                                     s_prev1_mul,
                                     mul_ready);
    
    // Store previous states right before s is computed
    // Store s[n-1]
    goertzel_reg #(.B(B)) reg_prev1 (CLK, RST, x_ready, 
                                     s, 
                                     s_prev1);
    
    // Store s[n-2]
    goertzel_reg #(.B(B)) reg_prev2 (CLK, RST, x_ready, 
                                     s_prev1, 
                                     s_prev2);
    
    assign y1 = s_prev1;
    assign y2 = s_prev2;
    
endmodule