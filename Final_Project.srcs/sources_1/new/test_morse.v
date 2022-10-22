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
//    wire clk20k;
//    fclk #(.khz(20)) clk_20khz(CLK, clk20k);

//    wire [11:0] mic_out;
//    Audio_Capture audio_capture(
//        .CLK(CLK),
//        .cs(clk20k),
//        .MISO(J_MIC3_Pin3),
//        .clk_samp(J_MIC3_Pin1),
//        .sclk(J_MIC3_Pin4),
//        .sample(mic_out)
//        );
   
    wire d_btnU, d_btnL, d_btnR, d_btnD, d_btnC; // debounced
    debouncer(CLK, btnU, d_btnU);
    debouncer(CLK, btnL, d_btnL);
    debouncer(CLK, btnR, d_btnR);
    debouncer(CLK, btnD, d_btnD);
    debouncer(CLK, btnC, d_btnC);
    
    wire e_btnU, e_btnL, e_btnR, e_btnD, e_btnC; // rising edge
    edge_detector(CLK, d_btnU, e_btnU);
    edge_detector(CLK, d_btnL, e_btnL);
    edge_detector(CLK, d_btnR, e_btnR);
    edge_detector(CLK, d_btnD, e_btnD);
    edge_detector(CLK, d_btnC, e_btnC);
    
    wire classify;
    wire [5:0] symbol;
    morse morse(
        .CLK(CLK),
        .in(e_btnC),
        .classify(classify),
        .symbol(symbol)
        );
        
    
    
endmodule
