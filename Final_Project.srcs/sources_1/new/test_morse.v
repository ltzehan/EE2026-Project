`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.10.2022 12:26:47
// Design Name: 
// Module Name: test_morse
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


module test_morse(
    input CLK,
    input [1:0] sw,
    input btnU, input btnL, input btnR, input btnD, input btnC, 
    input J_MIC3_Pin3, output J_MIC3_Pin1, output J_MIC3_Pin4,
    output [6:0] JX,
    output reg [15:0] led,
    output reg [6:0] seg, output reg [3:0] an
    );
    
    // 20kHz clock
    wire clk20k;
    fclk #(.khz(0.005)) clk_20khz(CLK, clk20k);

//    wire [11:0] mic_out;
//    Audio_Capture audio_capture(
//        .CLK(CLK),
//        .cs(clk20k),
//        .MISO(J_MIC3_Pin3),
//        .clk_samp(J_MIC3_Pin1),
//        .sclk(J_MIC3_Pin4),
//        .sample(mic_out)
//        );
   
    wire dh_btnC; // debounced hold
    debouncer_hold(CLK, btnC, dh_btnC);
    
    wire [15:0] morse_led;
    wire valid;
    wire [5:0] symbol;
    morse morse(
        .CLK(CLK),
        .sample_clk(clk20k),
        .in(dh_btnC),
        .valid(valid),
        .symbol(symbol),
        .led(morse_led)
        );
        
    always @(posedge CLK) begin
        led[15:1] <= morse_led[15:1];
        led[0] <= dh_btnC;
    end
endmodule
