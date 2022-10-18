`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.10.2022 18:26:01
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


//module sim_goertzel(
//    );
    
//    sim_goertzel_fp sim_fp();
//    sim_goertzel_mul sim_mul();
//    sim_goertzel_reg sim_reg();
    
//    // 100MHz clock
//    reg CLK = 0;
//    always begin
//        #5 CLK <= ~CLK;
//    end
    
//    // Input waveform
//    wire [11:0] mic;
//    wire mic_clk;
//    fclk #(.khz(20)) fclk (CLK, mic_clk);
//    input_gen #(.SIZE(171)) input_gen (mic_clk, mic); 
    
//    parameter [7:0][7:0] BINS = {7'd5, 7'd6, 7'd7, 7'd8, 7'd10, 7'd11, 7'd12, 7'd13};
//    wire [31:0] y1 [7:0];
//    wire [31:0] y2 [7:0];
//    wire [31:0] power [7:0];
    
//    genvar k;
//    generate 
//        for (k = 0; k < 7; k = k+1) begin
//            goertzel_v2 #(.k(BINS[k])) filter_v2 (CLK, 1'b0, mic, y1[k], y2[k]);
//            goertzel_power_v2 #(.k(BINS[k])) power_v2 (CLK, 1'b0, y1[k], y2[k], power[k]);
//        end
//    endgenerate
    
//endmodule
