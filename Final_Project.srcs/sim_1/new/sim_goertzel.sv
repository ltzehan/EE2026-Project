`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.10.2022 14:46:32
// Design Name: 
// Module Name: sim_goertzel
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


module sim_goertzel(
    );
    
    localparam SIZE = 283;

    // 100MHz clock
    reg CLK = 0;
    always begin
        #5 CLK <= ~CLK;
    end
    
    // Input waveform
    wire [11:0] mic;
    wire mic_clk;
    fclk #(.khz(20)) fclk (CLK, mic_clk);
    input_gen #(.SIZE(SIZE)) input_gen (mic_clk, mic);

    wire [12:0] pixel_index;
    wire [7:0] dtmf_led;
    wire [15:0] dtmf_oled_data;
    goertzel_wrapper dtmf(
        .mic_clk(mic_clk),
        .mic(mic),
        .pixel(pixel_index),
        .oled_data(dtmf_oled_data),
        .led(dtmf_led)
        );
    
endmodule
