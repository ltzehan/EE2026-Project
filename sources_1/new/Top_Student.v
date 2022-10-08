`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//
//  FILL IN THE FOLLOWING INFORMATION:
//
//  LAB SESSION DAY (Delete where applicable): MONDAY P.M, TUESDAY P.M, WEDNESDAY P.M, THURSDAY A.M., THURSDAY P.M
//
//  STUDENT A NAME: 
//  STUDENT A MATRICULATION NUMBER: 
//
//  STUDENT B NAME: 
//  STUDENT B MATRICULATION NUMBER: 
//
//////////////////////////////////////////////////////////////////////////////////

module Top_Student (
    input CLK,
    input [1:0] sw,
    input oled_reset,
    input  J_MIC3_Pin3,   // Connect from this signal to Audio_Capture.v
    output J_MIC3_Pin1,   // Connect to this signal from Audio_Capture.v
    output J_MIC3_Pin4,    // Connect to this signal from Audio_Capture.v
    output [6:0] JX,
    output reg [11:0] led
    );

    // 20kHz clock
    wire clk20k;
    fclk #(.khz(20)) clk_20khz(CLK, clk20k);
    // 10Hz clock
    wire clk10;
    fclk #(.khz(0.01)) clk_10hz(CLK, clk10);
    // 6.25MHz clock
    wire clk6p25m;
    fclk #(.khz(6250)) clk_6p25mhz(CLK, clk6p25m);
    // 25MHz clock
    wire clk25m;
    fclk #(.khz(25000)) clk_25mhz(CLK, clk25m);
    
    wire [11:0] mic_in;
    Audio_Capture audio_capture(
        .CLK(CLK),
        .cs(clk20k),
        .MISO(J_MIC3_Pin3),
        .clk_samp(J_MIC3_Pin1),
        .sclk(J_MIC3_Pin4),
        .sample(mic_in)
        );
    
    wire led_clk;
    assign led_clk = sw[0] ? clk10 : clk20k;
    
    reg [4:0] led_msb; // 5 MSB of led 
    always @(posedge led_clk) begin
        led <= mic_in;
        led_msb <= mic_in[11:7];
    end
    
    reg [15:0] oled_data;
    wire frame_begin, sending_pixels, sample_pixel;
    wire [12:0] pixel_index;
    Oled_Display oled_display(
        .clk(clk6p25m), 
        .reset(oled_reset), 
        .frame_begin(frame_begin), 
        .sending_pixels(sending_pixels),
        .sample_pixel(sample_pixel),
        .pixel_index(pixel_index),
        .pixel_data(oled_data),
        .cs(JX[0]), .sdin(JX[1]), .sclk(JX[2]), .d_cn(JX[3]), .resn(JX[4]), .vccen(JX[5]), .pmoden(JX[6]),
        .teststate(0)
        );
        
    wire border_red, border_orange;
    draw_box(.pixel(pixel_index), .x1(4), .y1(4), .x2(OLED_W-4), .y2(OLED_H-4), .th(1), .active(border_red));
    draw_box(.pixel(pixel_index), .x1(8), .y1(8), .x2(OLED_W-8), .y2(OLED_H-8), .th(3), .active(border_orange));
     
    wire border_green_1, border_green_2, border_green_3, border_green_4;
    draw_box(.pixel(pixel_index), .x1(12), .y1(12), .x2(OLED_W-12), .y2(OLED_H-12), .th(1), .active(border_green_1));
    draw_box(.pixel(pixel_index), .x1(14), .y1(14), .x2(OLED_W-14), .y2(OLED_H-14), .th(1), .active(border_green_2));
    draw_box(.pixel(pixel_index), .x1(16), .y1(16), .x2(OLED_W-16), .y2(OLED_H-16), .th(1), .active(border_green_3));
    draw_box(.pixel(pixel_index), .x1(18), .y1(18), .x2(OLED_W-18), .y2(OLED_H-18), .th(1), .active(border_green_4));

    always @(posedge clk25m) begin
        if (border_red)
            oled_data <= {{5{1'b1}}, {11{1'b0}}};
        else if (border_orange)
            oled_data <= {{5{1'b1}}, 6'b101001, {5{1'b0}}};
        else if (border_green_1)
            oled_data <= {{5{1'b0}}, {6{1'b1}}, {5{1'b0}}};
        else if (border_green_2)
            oled_data <= {{5{1'b0}}, {6{1'b1}}, {5{1'b0}}};
        else if (border_green_3)
            oled_data <= {{5{1'b0}}, {6{1'b1}}, {5{1'b0}}};
        else if (border_green_4)
            oled_data <= {{5{1'b0}}, {6{1'b1}}, {5{1'b0}}};
        else
            oled_data <= 16'b0;
    end

endmodule