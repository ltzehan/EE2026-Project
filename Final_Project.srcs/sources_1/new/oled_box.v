`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.10.2022 15:04:44
// Design Name: 
// Module Name: oled_box
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


module xy_to_px(
    input [7:0] x,
    input [7:0] y,
    output [12:0] px
    );

    localparam OLED_W = 96;
    localparam OLED_H = 64;
        
    assign px = (y * OLED_W) + x;
    
endmodule

module px_to_xy(
    input [12:0] px,
    output [7:0] x,
    output [7:0] y
    );

    localparam OLED_W = 96;
    localparam OLED_H = 64;

    assign x = px % OLED_W;
    assign y = px / OLED_W;

endmodule

module draw_filled_box(
    input [12:0] pixel,
    input [7:0] x1,
    input [7:0] y1,
    input [7:0] x2,
    input [7:0] y2,
    output active
    );
    
    wire [7:0] px, py;
    px_to_xy calc(pixel, px, py);
    
    assign active = (py >= y1) && (py <= y2) && (px >= x1) && (px <= x2); 
    
endmodule

module draw_box(
    input [12:0] pixel,
    input [7:0] x1,
    input [7:0] y1,
    input [7:0] x2,
    input [7:0] y2,
    input [7:0] th, // thickness
    output active
    );
    
    wire [7:0] px, py;
    px_to_xy calc(pixel, px, py);
    
    wire h1 = (py - y1 < th) && (px >= x1 && px <= x2);
    wire h2 = (y2 - py < th) && (px >= x1 && px <= x2);
    wire v1 = (px - x1 < th) && (py >= y1 && py <= y2);
    wire v2 = (x2 - px < th) && (py >= y1 && py <= y2);
    
    assign active = h1 | h2 | v1 | v2;
    
endmodule
