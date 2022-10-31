`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.10.2022 12:29:42
// Design Name: 
// Module Name: morse
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


module morse(
    input CLK,
    input sample_clk,
    input in_btn,
    input [11:0] in_mic,
    input sw,
    output reg valid=0,
    output reg [5:0] symbol=6'bx,
    output reg [15:0] led
    );
    
    // Coutner scaling for time unit
    localparam TIME_UNIT = 3_000;
    // Loudness of mic value to be considered as high input
    localparam MIC_THRESHOLD = 2_500;
    // Number of continuous low samples required for mic to be recognized as low
    localparam MIC_LOW_COUNT = 2_000;
    
    reg [15:0] mic_low_ctr = 0;
    reg in = 0;
    always @(posedge sample_clk) begin
        if (sw)
            in <= in_btn;
        else begin
            if (in_mic >= MIC_THRESHOLD) begin
                in <= 1;
                mic_low_ctr <= 0;
            end
            else begin
                // Only set mic input as low if consecutive samples are low
                // otherwise just leave it as previous state
                mic_low_ctr <= (mic_low_ctr == MIC_LOW_COUNT) ? 0 : mic_low_ctr + 1;
                if (mic_low_ctr == MIC_LOW_COUNT)
                    in <= 0;
            end
        end
    end
    
    /**
     *  Morse timing (Farnsworth)
     */
    // Dot:         1 unit
    // Dash:        3 units
    // Intra-char:  1 unit
    // Inter-char:  3 units
    // Word space:  7 units
        
    // 0b00: no value, 0b01: dot; 0b10: dash
    localparam X = 2'b00;
    localparam DOT = 2'b10;
    localparam DASH = 2'b11;
    reg [1:0] recv [0:4] = '{5{2'b0}};
    wire [9:0] recv_packed = {>>{recv}}; 
    
    reg [2:0] idx = 0;
    // Counter for cycles at current level 
    reg [15:0] ctr = 1;
    reg prev = 0;
    always @(posedge sample_clk) begin
        valid <= 0;

        // Increase counter if no change in signal
        prev <= in;
        if (prev == in)
            ctr <= (ctr == 2**15) ? 2**15 : ctr+1;
        else
            ctr <= 1;
        
        // Falling edge of input
        if (!in && prev) begin
            // Check for at least half time unit to prevent false positives
            if (ctr >= TIME_UNIT/2 && ctr < 3*TIME_UNIT) begin
                recv[idx] <= DOT;
                idx <= idx + 1;
            end
            else if (ctr >= 3*TIME_UNIT) begin
                recv[idx] <= DASH;
                idx <= idx + 1;
            end            
        end
        
        // Start new character 
        if (!prev && !in && ctr >= (3*TIME_UNIT) && 
            (recv[0] != 0 || recv[1] != 0 || recv[2] != 0 || recv[3] != 0 || recv[4] != 0)) begin
            valid <= 1;
            recv <= '{5{X}};
            idx <= 0;
        end
    end
    
    /**
     *  Morse classification
     */
    // 0 - 26:  Letters (A - Z)
    // 30 - 39: Digits (0 - 9)

    always @(posedge sample_clk) begin
        case (recv_packed)
        {DOT, DASH, X, X, X}: // A = .-
            symbol <= 1;
        {DASH, DOT, DOT, DOT, X}: // B = -...
            symbol <= 2;
        {DASH, DOT, DASH, DOT, X}: // C = -.-. 
            symbol <= 3;
        {DASH, DOT, DOT, X, X}: // D = -.. 
            symbol <= 4;
        {DOT, X, X, X, X}: // E = .
            symbol <= 5;
        {DOT, DOT, DASH, DOT, X}: // F = ..-.
            symbol <= 6;
        {DASH, DASH, DOT, X, X}: // G = --.
            symbol <= 7;
        {DOT, DOT, DOT, DOT, X}: // H = ....
            symbol <= 8;
        {DOT, DOT, X, X, X}: // I = ..
            symbol <= 9;
        {DOT, DASH, DASH, DASH, X}: // J = .---
            symbol <= 10;
        {DASH, DOT, DASH, X, X}: // K = -.-
            symbol <= 11;
        {DOT, DASH, DOT, DOT, X}: // L = .-..
            symbol <= 12;
        {DASH, DASH, X, X, X}: // M = --
            symbol <= 13;
        {DASH, DOT, X, X, X}: // N = -.
            symbol <= 14;
        {DASH, DASH, DASH, X, X}: // O = ---
            symbol <= 15;
        {DOT, DASH, DASH, DOT, X}: // P = .--.
            symbol <= 16;
        {DASH, DASH, DOT, DASH, X}: // Q = --.-
            symbol <= 17;
        {DOT, DASH, DOT, X, X}: // R = .-.
            symbol <= 18;
        {DOT, DOT, DOT, X, X}: // S = ...
            symbol <= 19;
        {DASH, X, X, X, X}: // T = -
            symbol <= 20;
        {DOT, DOT, DASH, X, X}: // U = ..-
            symbol <= 21;
        {DOT, DOT, DOT, DASH, X}: // V = ...-
            symbol <= 22;
        {DOT, DASH, DASH, X, X}: // W = .--
            symbol <= 23;
        {DASH, DOT, DOT, DASH, X}: // X = -..-
            symbol <= 24;
        {DASH, DOT, DASH, DASH, X}: // Y = -.--
            symbol <= 25;
        {DASH, DASH, DOT, DOT, X}: // Z = --..
            symbol <= 26;
        {DOT, DASH, DASH, DASH, DASH}: // 1 = .----
            symbol <= 31;
        {DOT, DOT, DASH, DASH, DASH}: // 2 = ..---
            symbol <= 32;
        {DOT, DOT, DOT, DASH, DASH}: // 3 = ...--
            symbol <= 33;
        {DOT, DOT, DOT, DOT, DASH}: // 4 = ....-
            symbol <= 34;
        {DOT, DOT, DOT, DOT, DOT}: // 5 = .....
            symbol <= 35;
        {DASH, DOT, DOT, DOT, DOT}: // 6 = -....
            symbol <= 36;
        {DASH, DASH, DOT, DOT, DOT}: // 7 = --...
            symbol <= 37;
        {DASH, DASH, DASH, DOT, DOT}: // 8 = ---..
            symbol <= 38;
        {DASH, DASH, DASH, DASH, DOT}: // 9 = ----.
            symbol <= 39;
        {DASH, DASH, DASH, DASH, DASH}: // 0 = -----
            symbol <= 30;
        default:
            symbol <= 6'bx;
        endcase
    end
    
    /**
     *  LEDs
     */
     
     always @(posedge sample_clk) begin
        led[15:14] <= recv[0];
        led[12:11] <= recv[1];
        led[9:8] <= recv[2];
        led[6:5] <= recv[3];
        led[3:2] <= recv[4];
        led[0] <= in;
     end
    
endmodule
