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
    input in,
    output reg valid=0,
    output reg [5:0] symbol=5'bx
    );
    
    /**
     *  Morse timing (Farnsworth)
     */
    // Dot:         1 unit
    // Dash:        3 units
    // Intra-char:  1 unit
    // Inter-char:  3 units
    // Word space:  7 units
    
    wire sample_clk;
    assign sample_clk = CLK;
//    fclk #(.khz(0.005)) clk_5hz(CLK, sample_clk);
    
    // 0b00: no value, 0b01: dot; 0b10: dash
    localparam X = 2'b00;
    localparam DOT = 2'b01;
    localparam DASH = 2'b10;
    reg [1:0] recv [0:4] = '{5{2'b0}};
    reg [2:0] idx = 0;
    // Counter for cycles at current level 
    reg [4:0] ctr = 0;
    reg prev = 0;
    always @(posedge sample_clk) begin
        // Increase counter if no change in signal
        prev <= in;
        if (prev == in)
            ctr <= (ctr == 32) ? 32 : ctr+1;
        else
            ctr <= 1;
        
        valid <= 0;
        
        // Rising edge of input
//        if (in & !prev) begin
//            idx <= 0;
        
//            // Next word (effectively space character)
//            if (ctr+1 >= 7) begin
//                valid <= 1;
//                symbol <= 1;
//            end
//        end
        
        // Falling edge of input
        if (!in & prev) begin
            recv[idx] <= (ctr >= 3) ? DASH : DOT; 
            idx <= idx + 1;
        end
        
        // Start new character 
        if (!prev && !in && ctr >= 3 && recv != {5{2'b0}}) begin
            valid <= 1;
            recv <= '{5{2'b0}};
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
        case (recv)
        {DOT, DASH, X, X, X}: // A = .-
            symbol <= 1;
        {DASH, DOT, DOT, DOT, X}: // B = -...
            symbol <= 2;
        // TODO
        default:
            symbol <= 5'bx;
        endcase
    end
    
endmodule
