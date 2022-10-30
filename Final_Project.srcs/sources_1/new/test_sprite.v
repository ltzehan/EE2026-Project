`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.10.2022 23:19:33
// Design Name: 
// Module Name: test_sprite
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


module test_sprite(
    input CLK,
    input [1:0] sw,
    input btnU, input btnL, input btnR, input btnD, input btnC, 
    input J_MIC3_Pin3, output J_MIC3_Pin1, output J_MIC3_Pin4,
    output [6:0] JX,
    output reg [15:0] led,
    output reg [6:0] seg, output reg [3:0] an
    );
    
    // 6.25MHz clock
    wire clk6p25m;
    fclk #(.khz(6250)) clk_6p25mhz(CLK, clk6p25m);
    
    reg [15:0] oled_data;
    wire frame_begin, sending_pixels, sample_pixel;
    wire [12:0] pixel_index;
    Oled_Display oled_display(
        .clk(clk6p25m), 
        .reset(0), 
        .frame_begin(frame_begin), 
        .sending_pixels(sending_pixels),
        .sample_pixel(sample_pixel),
        .pixel_index(pixel_index),
        .pixel_data(oled_data),
        .cs(JX[0]), .sdin(JX[1]), .sclk(JX[2]), .d_cn(JX[3]), .resn(JX[4]), .vccen(JX[5]), .pmoden(JX[6]),
        .teststate(0)
        );

    wire [15:0] confirm_oled_data;
    lock_confirm_oled(CLK, pixel_index, confirm_oled_data);
    
    wire overlay_active;
    unlock_overlay(CLK, pixel_index, overlay_active);
    
    wire a_active, b_active, c_active, d_active;
    oled_text_sprite #(.OFFSET(28*96+16)) (clk6p25m, pixel_index, 1, a_active);
    oled_text_sprite #(.OFFSET(28*96+32)) (clk6p25m, pixel_index, 2, b_active);
    oled_text_sprite #(.OFFSET(28*96+48)) (clk6p25m, pixel_index, 3, c_active);
    oled_text_sprite #(.OFFSET(28*96+64)) (clk6p25m, pixel_index, 4, d_active);
    
    always @(posedge CLK) begin
        if (sw[0]) begin
            oled_data <= `OLED_BLACK;
            if (overlay_active) oled_data <= `OLED_WHITE;
            if (a_active) oled_data <= `OLED_GREEN;
            if (b_active) oled_data <= `OLED_RED;
            if (c_active) oled_data <= `OLED_GREEN;
            if (d_active) oled_data <= `OLED_ORANGE;
        end
        else begin
            oled_data <= confirm_oled_data;
        end
    end
    
endmodule
