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
    input in,
    output reg valid=0,
    output reg [5:0] symbol=6'bx,
    output reg [15:0] led
    );
    
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
            recv[idx] <= (ctr >= 3) ? DASH : DOT;
//            led[1:0] <= (ctr >= 3) ? DASH : DOT;
            idx <= idx + 1;
        end
        
        // Start new character 
        if (!prev && !in && ctr >= 3 && 
            recv[0] != 0 && recv[1] != 0 && recv[2] != 0 && recv[3] != 0 && recv[4] != 0) begin
            valid <= 1;
            recv <= '{5{X}};
            idx <= 0;
        end

    end
    
    /**
     *  Morse classification
     */
    // 0 - 26:  Letters (A - Z)
    // 10 - 19: Digits (0 - 9)
    // 20:      ?  21:      !
    // 22:      .  23:      ,
    // 24:      ;  25:      + 
    // 26:      -  27:      /
    // 28:      =  31:      SPACE
    
    always @(posedge sample_clk) begin
        case (recv_packed)
        {DOT, DASH, X, X, X}: // A = .-
            symbol <= 1;
        {DASH, DOT, DOT, DOT, X}: // B = -...
            symbol <= 2;
        // TODO
        default:
            symbol <= 5'bx;
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
     end
    
endmodule
