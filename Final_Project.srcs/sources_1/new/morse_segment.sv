`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.10.2022 16:32:28
// Design Name: 
// Module Name: morse_segment
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


`include "constants.vh"

module morse_segment(
    input CLK,
    input valid,
    input [5:0] symbol,
    output [6:0] seg,
    output reg [3:0] an=4'b1110
    );
        
    localparam [6:0] lut [0:39] = {
        `SEG_BLANK,
        `SEG_A, `SEG_B, `SEG_C, `SEG_D, `SEG_E, `SEG_F, `SEG_G, `SEG_H, 
        `SEG_I, `SEG_J, `SEG_K, `SEG_L, `SEG_M, `SEG_N, `SEG_O, `SEG_P, 
        `SEG_Q, `SEG_R, `SEG_S, `SEG_T, `SEG_U, `SEG_V, `SEG_W, `SEG_X, 
        `SEG_Y, `SEG_Z, `SEG_BLANK, `SEG_BLANK, `SEG_BLANK, 
        `SEG_0, `SEG_1, `SEG_2, `SEG_3, `SEG_4, `SEG_5, `SEG_6, `SEG_7, `SEG_8, `SEG_9
    };
    
    assign seg = (valid && symbol < 40) ? lut[symbol] : `SEG_BLANK; 
    
endmodule
