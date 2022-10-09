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
    output reg task_4a_led,
    output reg [15:0] oled_data
    );
    
    // 25MHz clock
    wire clk25m;
    fclk #(.khz(25000)) clk_25mhz(CLK, clk25m);
    
    wire border_red, border_orange;
    draw_box(.pixel(pixel_index), .x1(4), .y1(4), .x2(OLED_W-4), .y2(OLED_H-4), .th(1), .active(border_red));
    draw_box(.pixel(pixel_index), .x1(8), .y1(8), .x2(OLED_W-8), .y2(OLED_H-8), .th(3), .active(border_orange));
    
    wire border_green_1, border_green_2, border_green_3, border_green_4;
    draw_box(.pixel(pixel_index), .x1(12), .y1(12), .x2(OLED_W-12), .y2(OLED_H-12), .th(1), .active(border_green_1));
    draw_box(.pixel(pixel_index), .x1(14), .y1(14), .x2(OLED_W-14), .y2(OLED_H-14), .th(1), .active(border_green_2));
    draw_box(.pixel(pixel_index), .x1(16), .y1(16), .x2(OLED_W-16), .y2(OLED_H-16), .th(1), .active(border_green_3));
    draw_box(.pixel(pixel_index), .x1(18), .y1(18), .x2(OLED_W-18), .y2(OLED_H-18), .th(1), .active(border_green_4));
    
    wire d_btnU;
    debouncer(CLK, btnU, d_btnU);
    
    reg [7:0] state = 0;
    reg needs_reset = 0;
    reg [31:0] reset_ctr = 0;
    
    reg prev_d_btnU = 0;
    always @(posedge CLK) begin
       prev_d_btnU <= d_btnU;
       // Rising edge of d_btnU
       if (~prev_d_btnU & d_btnU) begin
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

endmodule
