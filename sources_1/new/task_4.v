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


module task_4(
    input CLK,
    input btnU,
    input [12:0] pixel_index,
    input [11:0] mic_out,
    output reg task_4a_led,
    output reg [4:0] task_4c_led,
    output reg [15:0] oled_data
    );
    
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
    draw_box(.pixel(pixel_index), .x1(4), .y1(4), .x2(OLED_W-4), .y2(OLED_H-4), .th(1), .active(border_red));
    draw_box(.pixel(pixel_index), .x1(8), .y1(8), .x2(OLED_W-8), .y2(OLED_H-8), .th(3), .active(border_orange));
    
    wire border_green_1, border_green_2, border_green_3, border_green_4;
    draw_box(.pixel(pixel_index), .x1(12), .y1(12), .x2(OLED_W-12), .y2(OLED_H-12), .th(1), .active(border_green_1));
    draw_box(.pixel(pixel_index), .x1(14), .y1(14), .x2(OLED_W-14), .y2(OLED_H-14), .th(1), .active(border_green_2));
    draw_box(.pixel(pixel_index), .x1(16), .y1(16), .x2(OLED_W-16), .y2(OLED_H-16), .th(1), .active(border_green_3));
    draw_box(.pixel(pixel_index), .x1(18), .y1(18), .x2(OLED_W-18), .y2(OLED_H-18), .th(1), .active(border_green_4));
    
    reg [2:0] state = 0;
    reg needs_reset = 0;
    reg [31:0] reset_ctr = 0;
    
    // Button press
    reg prev_btnU = 0;
    always @(posedge CLK) begin
       prev_btnU <= btnU;
       // Rising edge of btnU
       if (~prev_btnU & btnU) begin
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
           oled_data <= {{5{1'b1}}, {11{1'b0}}};
       else if (border_orange)
           oled_data <= {{5{1'b1}}, 6'b101001, {5{1'b0}}};
       else if (border_green_1 && state >= 1)
           oled_data <= {{5{1'b0}}, {6{1'b1}}, {5{1'b0}}};
       else if (border_green_2 && state >= 2)
           oled_data <= {{5{1'b0}}, {6{1'b1}}, {5{1'b0}}};
       else if (border_green_3 && state >= 3)
           oled_data <= {{5{1'b0}}, {6{1'b1}}, {5{1'b0}}};
       else if (border_green_4 && state == 4)
           oled_data <= {{5{1'b0}}, {6{1'b1}}, {5{1'b0}}};
       else
           oled_data <= 16'b0;
    end
    
    /**
     *  Task 4.2C
     */
    
    // Volume detection
    reg [15:0] mic_peak = 0;
    reg [15:0] mic_ctr = 0;
    always @(posedge clk20k) begin
        // 0.1s elapsed
        mic_ctr <= (mic_ctr == 1_999) ? 0 : mic_ctr + 1;
        if (mic_out > mic_peak)
            mic_peak <= mic_out;
        
        // Audio level classifier
        // Follows roughly logarithmic scale based on human auditory perception
        if (mic_ctr == 1_999) begin
            if (mic_peak < 2000)
                task_4c_led <= 5'b00000;
            else if (mic_peak < 2650)
                task_4c_led <= 5'b00001;
            else if (mic_peak < 3170)
                task_4c_led <= 5'b00011;
            else if (mic_peak < 3560)
                task_4c_led <= 5'b00111;
            else if (mic_peak < 3820)
                task_4c_led <= 5'b01111;
            else
                task_4c_led <= 5'b11111;
                
            mic_ctr <= 0;
            mic_peak <= 0;
        end
    end
    
endmodule
