`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.10.2022 17:25:07
// Design Name: 
// Module Name: task_4
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

module task_4(
    input CLK,
    input btnU,
    input btnD,
    input [12:0] pixel_index,
    input [11:0] mic_out,
    output reg task_4a_led=0,
    output reg task_4b_led=0,
    output reg [4:0] task_4c_led=5'b0,
    output reg [15:0] task_4a_oled_data,
    output reg [15:0] task_4b_oled_data,
    output reg [15:0] task_4c_oled_data,
    output reg [6:0] task_4c_seg
    );
        
    // 100Hz clock
    wire clk100;
    fclk #(.khz(0.1)) clk_100hz(CLK, clk100);
    // 20kHz clock
    wire clk20k;
    fclk #(.khz(20)) clk_20khz(CLK, clk20k);
    // 25MHz clock
    wire clk25m;
    fclk #(.khz(25000)) clk_25mhz(CLK, clk25m);
    
    /**
     *  Task 4.2A
     */
    
    wire border_red, border_orange;
    draw_box(.pixel(pixel_index), .x1(4), .y1(4), .x2(`OLED_W-4), .y2(`OLED_H-4), .th(1), .active(border_red));
    draw_box(.pixel(pixel_index), .x1(8), .y1(8), .x2(`OLED_W-8), .y2(`OLED_H-8), .th(3), .active(border_orange));
    
    wire border_green_1, border_green_2, border_green_3, border_green_4;
    draw_box(.pixel(pixel_index), .x1(12), .y1(12), .x2(`OLED_W-12), .y2(`OLED_H-12), .th(1), .active(border_green_1));
    draw_box(.pixel(pixel_index), .x1(14), .y1(14), .x2(`OLED_W-14), .y2(`OLED_H-14), .th(1), .active(border_green_2));
    draw_box(.pixel(pixel_index), .x1(16), .y1(16), .x2(`OLED_W-16), .y2(`OLED_H-16), .th(1), .active(border_green_3));
    draw_box(.pixel(pixel_index), .x1(18), .y1(18), .x2(`OLED_W-18), .y2(`OLED_H-18), .th(1), .active(border_green_4));
    
    reg [2:0] state = 0;
    reg needs_reset = 0;
    reg [31:0] reset_ctr = 0;
    
    // Button press
    always @(posedge CLK) begin
       if (btnU) begin
           if (!needs_reset) begin
               state <= (state == 4) ? 0 : state+1;
               needs_reset <= 1;
               task_4a_led <= 1;
           end
       end
    
       if (needs_reset) begin
           // 3s delay
           reset_ctr <= (reset_ctr == 299_999_999) ? 0 : reset_ctr+1;
           if (reset_ctr == 299_999_999) begin
               needs_reset <= 0;
               task_4a_led <= 0;
           end
       end
    end
    
    // Draw borders
    always @(posedge clk25m) begin
       if (border_red)
           task_4a_oled_data <= `OLED_RED;
       else if (border_orange)
           task_4a_oled_data <= `OLED_ORANGE;
       else if (border_green_1 && state >= 1)
           task_4a_oled_data <= `OLED_GREEN;
       else if (border_green_2 && state >= 2)
           task_4a_oled_data <= `OLED_GREEN;
       else if (border_green_3 && state >= 3)
           task_4a_oled_data <= `OLED_GREEN;
       else if (border_green_4 && state == 4)
           task_4a_oled_data <= `OLED_GREEN;
       else
           task_4a_oled_data <= `OLED_BLACK;
    end
    
    /**
     *  Task 4.2B
     */
     
     wire box_1, box_2, box_3, box_4, box_5;
     draw_filled_box(.pixel(pixel_index), .x1(43), .x2(52), .y1(44), .y2(48), .active(box_1));
     draw_filled_box(.pixel(pixel_index), .x1(43), .x2(52), .y1(36), .y2(40), .active(box_2));
     draw_filled_box(.pixel(pixel_index), .x1(43), .x2(52), .y1(28), .y2(32), .active(box_3));
     draw_filled_box(.pixel(pixel_index), .x1(43), .x2(52), .y1(20), .y2(24), .active(box_4));
     draw_filled_box(.pixel(pixel_index), .x1(43), .x2(52), .y1(12), .y2(16), .active(box_5));
     
     reg [1:0] step = 0;
     reg [15:0] count_5sec = 0;
     always @(posedge clk100) begin
        if (task_4b_led == 0 && btnD == 1) begin
            step <= (step == 3) ? 0 : step + 1;
            task_4b_led <= 1;
        end
        if (task_4b_led == 1) begin
            count_5sec <= count_5sec + 1;
        end
        if (count_5sec == 499) begin
            task_4b_led <= 0;
            count_5sec <= 0;
        end
     end
    
    wire [7:0] x;
    wire [7:0] y;
    px_to_xy(pixel_index, x, y);
    always @ (posedge CLK) begin
        if (box_1)  
            task_4b_oled_data <= `OLED_RED;
        else if (box_2)
            task_4b_oled_data <= `OLED_ORANGE;
        else if (box_3 && step >= 1)
            task_4b_oled_data <= `OLED_GREEN;
        else if (box_4 && step >= 2)
            task_4b_oled_data <= `OLED_GREEN_50;
        else if (box_5 && step >= 3)
            task_4b_oled_data <= `OLED_GREEN_10;
        else 
            task_4b_oled_data <= `OLED_BLACK;
     end
    
    /**
     *  Task 4.2C
     */
    
    // Volume detection
    reg [15:0] mic_peak = 0;
    reg [15:0] mic_ctr = 0;
    reg [2:0] mic_level = 0;
    always @(posedge clk20k) begin
        // 0.1s elapsed
        mic_ctr <= (mic_ctr == 1_999) ? 0 : mic_ctr + 1;
        if (mic_out > mic_peak)
            mic_peak <= mic_out;
        
        // Audio level classifier
        // Follows roughly logarithmic scale based on human auditory perception
        if (mic_ctr == 1_999) begin
            if (mic_peak < 1500) begin
                task_4c_led <= 5'b00000;
                task_4c_seg <= `SEG_0;
                mic_level <= 0;
            end
            else if (mic_peak < 2500) begin
                task_4c_led <= 5'b00001;
                task_4c_seg <= `SEG_1;
                mic_level <= 1;
            end
            else if (mic_peak < 3170) begin
                task_4c_led <= 5'b00011;
                task_4c_seg <= `SEG_2;
                mic_level <= 2;
            end
            else if (mic_peak < 3560) begin
                task_4c_led <= 5'b00111;
                task_4c_seg <= `SEG_3;
                mic_level <= 3;
            end
            else if (mic_peak < 3820) begin
                task_4c_led <= 5'b01111;
                task_4c_seg <= `SEG_4;
                mic_level <= 4;
            end
            else begin
                task_4c_led <= 5'b11111;
                task_4c_seg <= `SEG_5;
                mic_level <= 5;
            end
                
            mic_ctr <= 0;
            mic_peak <= 0;
        end
    end
    
    always @(posedge CLK) begin
        task_4c_oled_data <= `OLED_BLACK;
        if (mic_level >= 1) begin
            if (box_1 || border_red) 
                task_4c_oled_data <= `OLED_RED;
        end
        if (mic_level >= 2) begin
            if (box_2 || border_orange)
                task_4c_oled_data <= `OLED_ORANGE;
        end
        if (mic_level >= 3) begin
            if (box_3 || border_green_1)
                task_4c_oled_data <= `OLED_GREEN;
        end
        if (mic_level >= 4) begin
            if (box_4)
                task_4c_oled_data <= `OLED_GREEN_50;
            else if (border_green_2)
                task_4c_oled_data <= `OLED_GREEN;
        end
        if (mic_level == 5) begin
            if (box_5)
                task_4c_oled_data <= `OLED_GREEN_10;
            else if (border_green_3)
                task_4c_oled_data <= `OLED_GREEN;
        end
    end
    
endmodule
