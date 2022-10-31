`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.10.2022 22:06:04
// Design Name: 
// Module Name: show_lapsed
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


module show_lapsed(
    input CLK,
    input [19:0] lapsed1, lapsed2, lapsed3,
    input [12:0] pixel,
    output reg [15:0] watch_oled_data
    );
    wire [15:0] d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15;
    
    wire [7:0] x, y;
    px_to_xy calc(pixel, x, y);
    
    draw_num unit1(CLK, 16, 2, x, y, lapsed1[19:16], d1);
    draw_num unit2(CLK, 28, 2, x, y, lapsed1[15:12], d2);
    draw_num unit3(CLK, 40, 2, x, y, lapsed1[11:8], d3);
    draw_num unit4(CLK, 54, 2, x, y, lapsed1[7:4], d4);
    draw_num unit5(CLK, 66, 2, x, y, lapsed1[3:0], d5);
    
    draw_num unit6(CLK, 16, 22, x, y, lapsed2[19:16], d6);
    draw_num unit7(CLK, 28, 22, x, y, lapsed2[15:12], d7);
    draw_num unit8(CLK, 40, 22, x, y, lapsed2[11:8], d8);
    draw_num unit9(CLK, 54, 22, x, y, lapsed2[7:4], d9);
    draw_num unit10(CLK, 66, 22, x, y, lapsed2[3:0], d10);
    
    draw_num unit11(CLK, 16, 42, x, y, lapsed3[19:16], d11);
    draw_num unit12(CLK, 28, 42, x, y, lapsed3[15:12], d12);
    draw_num unit13(CLK, 40, 42, x, y, lapsed3[11:8], d13);
    draw_num unit14(CLK, 54, 42, x, y, lapsed3[7:4], d14);
    draw_num unit15(CLK, 66, 42, x, y, lapsed3[3:0], d15);
    
    always @ (posedge CLK) 
    begin
        if (x >= 15 && x < 27 && y >= 2 && y < 62) begin
            if (y >= 2 && y < 22) begin
                watch_oled_data = d1;
            end
            else if (y >= 22 && y < 42) begin
                watch_oled_data = d6;
            end
            else if (y >= 42 && y < 62) begin
                watch_oled_data = d11;
            end
        end
        else if (x >= 27 && x < 39 && y >= 2 && y < 62) begin
            if (y >= 2 && y < 22) begin
                watch_oled_data = d2;
            end
            else if (y >= 22 && y < 42) begin
                watch_oled_data = d7;
            end
            else if (y >= 42 && y < 62) begin
                watch_oled_data = d12;
            end
        end
        else if (x >= 39 && x < 51 && y >= 2 && y < 62) begin
            if (y >= 2 && y < 22) begin
                watch_oled_data = d3;
            end
            else if (y >= 22 && y < 42) begin
                watch_oled_data = d8;
            end
            else if (y >= 42 && y < 62) begin
                watch_oled_data = d13;
            end
        end
        else if (x >= 53 && x < 65 && y >= 2 && y < 62) begin
            if (y >= 2 && y < 22) begin
                watch_oled_data = d4;
            end
            else if (y >= 22 && y < 42) begin
                watch_oled_data = d9;
            end
            else if (y >= 42 && y < 62) begin
                watch_oled_data = d14;
            end
        end
        else if (x >= 65 && x < 77 && y >= 2 && y < 62) begin
            if (y >= 2 && y < 22) begin
                watch_oled_data = d5;
            end
            else if (y >= 22 && y < 42) begin
                watch_oled_data = d10;
            end
            else if (y >= 42 && y < 62) begin
                watch_oled_data = d15;
            end
        end
        else if ((x == 51 || x == 52) && (y == 20 || y == 21 || y == 40 || y == 41 || y == 60 || y == 61)) begin
            watch_oled_data = 16'b1111111111111111;
        end
        else begin
            watch_oled_data = 16'b0000000000000000;
        end
    end
endmodule
