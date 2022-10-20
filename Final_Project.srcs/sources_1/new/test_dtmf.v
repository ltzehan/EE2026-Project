`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.10.2022 21:08:21
// Design Name: 
// Module Name: test_dtmf
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


module test_dtmf(
    input CLK,
    input [1:0] sw,
    input btnU, input btnL, input btnR, input btnD, input btnC, 
    input J_MIC3_Pin3, output J_MIC3_Pin1, output J_MIC3_Pin4,
    output [6:0] JX,
    output reg [15:0] led,
    output reg [6:0] seg, output reg [3:0] an=0
    );
    
    // 20kHz clock
    wire clk20k;
    fclk #(.khz(20)) clk_20khz(CLK, clk20k);
    // 6.25MHz clock
    wire clk6p25m;
    fclk #(.khz(6250)) clk_6p25mhz(CLK, clk6p25m);
    
    wire d_btnU, d_btnL, d_btnR, d_btnD, d_btnC; // debounced
    debouncer(CLK, btnL, d_btnL);
    debouncer(CLK, btnR, d_btnR);
    
    wire e_btnU, e_btnL, e_btnR, e_btnD, e_btnC; // rising edge
    edge_detector(CLK, d_btnL, e_btnL);
    edge_detector(CLK, d_btnR, e_btnR);
    
    wire [11:0] mic_out;
    Audio_Capture audio_capture(
        .CLK(CLK),
        .cs(clk20k),
        .MISO(J_MIC3_Pin3),
        .clk_samp(J_MIC3_Pin1),
        .sclk(J_MIC3_Pin4),
        .sample(mic_out)
        );
    
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

    /**
     *  Goertzel Filter
     */
     
    wire [15:0] dtmf_led;
    wire [6:0] dtmf_seg;
    wire [15:0] dtmf_oled_data;
    goertzel_wrapper(
        .CLK(CLK),
        .mic_clk(clk20k),
        .btnL(d_btnL),
        .btnR(d_btnR),
        .sw(sw[0]),
        .mic(mic_out),
        .pixel(pixel_index),
        .seg(dtmf_seg),
        .oled_data(dtmf_oled_data),
        .led(dtmf_led)
        );
    
    always @(posedge CLK) begin
        oled_data <= dtmf_oled_data;
        seg <= dtmf_seg;
        led <= dtmf_led;
    end
    
endmodule
