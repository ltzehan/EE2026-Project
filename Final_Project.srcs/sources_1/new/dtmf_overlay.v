`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.10.2022 18:23:59
// Design Name: 
// Module Name: dtmf_overlay
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


module dtmf_overlay(
    input [12:0] pixel,
    output reg active
    );
    
    wire [7:0] x, y;
    px_to_xy calc(pixel, x, y);
    
    always @(posedge pixel) begin
        if (x == 3 && (y == 4 || y == 5 || y == 6 || y == 9 || y == 10 || y == 11 || y == 13 || y == 14 || y == 15 || y == 19))
            active <= 1;
        else if (x == 4 && (y == 3 || y == 8 || y == 16 || y == 19 || y == 20))
            active <= 1;
        else if (x == 5 && (y == 4 || y == 5 || y == 9 || y == 10 || y == 14 || y == 15 || y == 16 || y == 19))
            active <= 1;
        else if (x == 6 && (y == 3 || y == 8 || y == 13 || y == 16 || y == 19))
            active <= 1;
        else if (x == 7 && (y == 3 || y == 8 || y == 13 || y == 16 || y == 19))
            active <= 1;
        else if (x == 8 && (y == 4 || y == 5 || y == 6 || y == 9 || y == 10 || y == 11 || y == 14 || y == 15 || y == 18 || y == 19 || y == 20))       
            active <= 1;
        else if (x == 15 && (y == 3 || y == 4 || y == 5 || y == 6 || y == 8 || y == 9 || y == 10 || y == 11 || y == 13 || y == 14 || y == 19))        
            active <= 1;
        else if (x == 16 && (y == 3 || y == 8 || y == 13 || y == 15 || y == 19 || y == 20))
            active <= 1;
        else if (x == 17 && (y == 4 || y == 9 || y == 13 || y == 16 || y == 19))
            active <= 1;
        else if (x == 18 && (y == 4 || y == 9 || y == 13 || y == 14 || y == 15 || y == 16 || y == 19))
            active <= 1;
        else if (x == 19 && (y == 5 || y == 10 || y == 13 || y == 19))
            active <= 1;
        else if (x == 20 && (y == 5 || y == 10 || y == 13 || y == 18 || y == 19 || y == 20))
            active <= 1;
        else if (x == 27 && (y == 3 || y == 4 || y == 5 || y == 9 || y == 10 || y == 11 || y == 14 || y == 15 || y == 16 || y == 19))
            active <= 1;
        else if (x == 28 && (y == 6 || y == 8 || y == 13 || y == 19 || y == 20))
            active <= 1;
        else if (x == 29 && (y == 4 || y == 5 || y == 6 || y == 9 || y == 10 || y == 14 || y == 15 || y == 19))
            active <= 1;
        else if (x == 30 && (y == 3 || y == 6 || y == 8 || y == 13 || y == 19))
            active <= 1;
        else if (x == 31 && (y == 3 || y == 6 || y == 8 || y == 13 || y == 19))
            active <= 1;
        else if (x == 32 && (y == 4 || y == 5 || y == 9 || y == 10 || y == 11 || y == 14 || y == 15 || y == 16 || y == 18 || y == 19 || y == 20))     
            active <= 1;
        else if (x == 39 && (y == 4 || y == 5 || y == 9 || y == 10 || y == 14 || y == 15 || y == 19))
            active <= 1;
        else if (x == 40 && (y == 3 || y == 6 || y == 8 || y == 11 || y == 13 || y == 16 || y == 19 || y == 20))
            active <= 1;
        else if (x == 41 && (y == 3 || y == 6 || y == 8 || y == 11 || y == 13 || y == 19))
            active <= 1;
        else if (x == 42 && (y == 3 || y == 4 || y == 5 || y == 8 || y == 11 || y == 14 || y == 15 || y == 19))
            active <= 1;
        else if (x == 43 && (y == 3 || y == 8 || y == 11 || y == 16 || y == 19))
            active <= 1;
        else if (x == 44 && (y == 4 || y == 5 || y == 9 || y == 10 || y == 13 || y == 14 || y == 15 || y == 16 || y == 18 || y == 19 || y == 20))     
            active <= 1;
        else if (x == 51 && (y == 4 || y == 8 || y == 9 || y == 14 || y == 15))
            active <= 1;
        else if (x == 52 && (y == 4 || y == 5 || y == 8 || y == 10 || y == 13 || y == 16))
            active <= 1;
        else if (x == 53 && (y == 4 || y == 8 || y == 11 || y == 13 || y == 16))
            active <= 1;
        else if (x == 54 && (y == 4 || y == 8 || y == 9 || y == 10 || y == 11 || y == 13 || y == 14 || y == 15))
            active <= 1;
        else if (x == 55 && (y == 4 || y == 8 || y == 13))
            active <= 1;
        else if (x == 56 && (y == 3 || y == 4 || y == 5 || y == 8 || y == 14 || y == 15))
            active <= 1;
        else if (x == 63 && (y == 4 || y == 5 || y == 8 || y == 9 || y == 10 || y == 11 || y == 13 || y == 14 || y == 15 || y == 16))
            active <= 1;
        else if (x == 64 && (y == 3 || y == 6 || y == 11 || y == 13 || y == 16))
            active <= 1;
        else if (x == 65 && (y == 3 || y == 9 || y == 10 || y == 11 || y == 14 || y == 15))
            active <= 1;
        else if (x == 66 && (y == 4 || y == 5 || y == 8 || y == 13 || y == 16))
            active <= 1;
        else if (x == 67 && (y == 6 || y == 8 || y == 13 || y == 16))
            active <= 1;
        else if (x == 68 && (y == 3 || y == 4 || y == 5 || y == 6 || y == 9 || y == 10 || y == 11 || y == 13 || y == 14 || y == 15 || y == 16))       
            active <= 1;
        else if (x == 75 && (y == 4 || y == 5 || y == 8 || y == 9 || y == 10 || y == 11 || y == 13 || y == 14 || y == 15 || y == 16))
            active <= 1;
        else if (x == 76 && (y == 3 || y == 6 || y == 8 || y == 13))
            active <= 1;
        else if (x == 77 && (y == 3 || y == 6 || y == 9 || y == 14))
            active <= 1;
        else if (x == 78 && (y == 3 || y == 6 || y == 9 || y == 14))
            active <= 1;
        else if (x == 79 && (y == 3 || y == 6 || y == 10 || y == 15))
            active <= 1;
        else if (x == 80 && (y == 4 || y == 5 || y == 10 || y == 15))
            active <= 1;
        else if (x == 87 && (y == 3 || y == 4 || y == 5 || y == 6 || y == 9 || y == 10 || y == 13 || y == 14 || y == 15))
            active <= 1;
        else if (x == 88 && (y == 3 || y == 8 || y == 11 || y == 16))
            active <= 1;
        else if (x == 89 && (y == 4 || y == 8 || y == 11 || y == 14 || y == 15 || y == 16))
            active <= 1;
        else if (x == 90 && (y == 4 || y == 8 || y == 9 || y == 10 || y == 13 || y == 16))
            active <= 1;
        else if (x == 91 && (y == 5 || y == 8 || y == 13 || y == 16))
            active <= 1;
        else if (x == 92 && (y == 5 || y == 9 || y == 10 || y == 14 || y == 15))
            active <= 1;
        else
            active <= 0;
    end
endmodule
