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
    
    localparam SIZE = 205;
    
//    sim_goertzel_fp sim_fp();
//    sim_goertzel_mul sim_mul();
//    sim_goertzel_reg sim_reg();
    
    // 100MHz clock
    reg CLK = 0;
    always begin
        #5 CLK <= ~CLK;
    end
    
    // Input waveform
    wire [11:0] mic;
    wire mic_clk;
//    fclk #(.khz(20)) fclk (CLK, mic_clk);
//    input_gen #(.SIZE(171)) input_gen (mic_clk, mic); 
    fclk #(.khz(8)) fclk (CLK, mic_clk);
    input_gen #(.SIZE(SIZE)) input_gen (mic_clk, mic); 

//    parameter [7:0][7:0] BINS = {8'd5, 8'd6, 8'd7, 8'd8, 8'd10, 8'd11, 8'd12, 8'd13};
    parameter [7:0][7:0] BINS = {8'd18, 8'd20, 8'd22, 8'd24, 8'd31, 8'd34, 8'd38, 8'd42};
    wire [31:0] y1 [7:0];
    wire [31:0] y2 [7:0];
    wire [31:0] power [7:0];

//    goertzel_v2 #(.k(1)) goertzel_v2 (CLK, 1'b0, mic, y1[0], y2[0]);
//    goertzel_power_v2 #(.k(1)) goertzel_power_v2 (CLK, 1'b0, y1[0], y2[0], power[0]);
    
    genvar k;
    generate 
        for (k = 0; k <= 7; k = k+1) begin
            goertzel_v2 #(.k(BINS[k]), .N(SIZE)) goertzel_v2 (mic_clk, 1'b0, mic, y1[k], y2[k]);
            goertzel_power_v2 #(.k(BINS[k]), .N(SIZE)) goertzel_power_v2 (mic_clk, 1'b0, y1[k], y2[k], power[k]);
        end
    endgenerate
    
endmodule
