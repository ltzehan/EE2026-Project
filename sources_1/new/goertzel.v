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
*   Since only power is required, ignore the second stage to compute phase
*   Equivalently (I think), on the N-th calculation:
*       F_k = s[N-1]^2 + s[N-2]^2 - w_k*s[N-1]*s[N-2]
*/

module goertzel #(
    parameter B=61, // Fixed-point representation length
    parameter N=40, // Number of samples
    parameter k=0   // Freq. bin (k = [0, N-1])
    ) (
    input CLK,
    input RST,
    input [11:0] mic,  // Mic. input
    output [B-1:0] y1,
    output [B-1:0] y2
    );
    
    // Length of integer/decimal part    
    localparam B_PART = (B-1) >> 1;
    // Constants
    localparam PI = 3.1415926535;
    localparam w_k = 2*PI*k/N;
    
    wire EN; // TODO 
    
    reg signed [B-1:0] x;
    reg signed [B-1:0] s;
    wire signed [B-1:0] s_prev1;
    wire signed [B-1:0] s_prev1_mul;
    wire signed [B-1:0] s_prev2;
    wire signed [B-1:0] s_prev2_inv;
    
    // Convert mic -> x (fixed-point repr.)
    always @(posedge CLK or posedge RST) begin
        if (RST)
            x <= 0;
        else if (EN)
            // Sign bit is always 0 (mic. input is unsigned)
            // Normalize input (x / 2^12) and clear integer part + pad lower bits of decimal part 
            x <= {1'b0, {B_PART{1'b0}}, x, {(B_PART-12){1'b0}}};
    end
    
    // s[n] = x[n] + w_k * s[n-1] - s[n-2]
    always @(posedge CLK or posedge RST) begin
        if (RST)
            s <= 0;
        else if (EN)
            s <= x + s_prev1_mul - s_prev2;
    end
    
    // s[n-1] * w_k
    goertzel_mul #(.B(B)) mul_prev1 (CLK, RST, EN, s_prev1, w_k, s_prev1_mul);
    
    // Store s[n-1]
    goertzel_reg #(.B(B)) reg_prev1 (CLK, RST, EN, s, s_prev1);
    
    // Store s[n-2]
    goertzel_reg #(.B(B)) reg_prev2 (CLK, RST, EN, s_prev1, s_prev2);
    
    assign y1 = s_prev1;
    assign y2 = s_prev2;
    
endmodule

// Converts integer to fixed-point representation
// Using 1 sign bit + 30 integer bits + 30 decimal bits = 61 bits
module goertzel_fp #(
    parameter B=61
    ) (
    input CLK,
    input RST,
    input EN,
    input [11:0] x,
    output reg signed [B-1:0] fp
    );
    
    localparam B_PART = (B-1) >> 1;
    
    always @(posedge CLK or posedge RST) begin
        if (RST)
            fp <= 0;
        else if (EN)
            // Sign bit is always 0 (mic. input is unsigned)
            // Normalize input (x / 2^12) and clear integer part + pad lower bits of decimal part 
            fp <= {1'b0, {B_PART{1'b0}}, x, {(B_PART-12){1'b0}}};
    end
    
endmodule

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

// Multiplier for fixed-point representation
module goertzel_mul #(
    parameter B=61
    ) (
    input CLK,
    input RST,
    input EN,
    input signed [B-1:0] a,
    input signed [B-1:0] b,
    output reg signed [B-1:0] y
    );
    
    // Product of two B-bits is 2B-bits in size
    wire signed [(2*B)-1:0] temp;
    assign temp = a * b;
    
    always @(posedge CLK or posedge RST) begin
        if (RST)
            y <= 0;
        else if (EN)
            // Take sign bit and lower 30 bits of integer and higher 30 bits of decimal
            y <= {temp[(2*B-1)], temp[89:30]};
    end
    
endmodule