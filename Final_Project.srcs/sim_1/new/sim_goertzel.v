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


module sim_goertzel(
    );
    
    sim_goertzel_fp sim_fp();
    sim_goertzel_mul sim_mul();
    sim_goertzel_reg sim_reg();
    
    // 100MHz clock
    reg CLK = 0;
    always begin
        #5 CLK <= ~CLK;
    end
    
    // Sine wave generator
    wire [11:0] sine;
    sine_gen #(.SIZE(129870)) sine_gen (CLK, sine); 
    
    reg [11:0] mic = 0;
    wire [60:0] y1_0;
    wire [60:0] y2_0;
    wire [60:0] y1_7;
    wire [60:0] y2_7;
    
    wire [60:0] power_0;
    goertzel_power #(.k(0)) goertzel_power_0(CLK, 1'b0, y1_0, y2_0, power_0);        
   
    // Simulate microphone sampling rate
    wire clk_20k;
    fclk #(.khz(20)) clk_20khz(CLK, clk_20k);
    
    wire mic_ready;
    edge_detector mic_clk_edge (CLK, clk_20k, mic_ready);
    
    reg [7:0] sample_ctr = 0;
    always @(posedge clk_20k) begin
        mic <= sine;
        sample_ctr <= (sample_ctr + 1);
        if (sample_ctr == 40) begin
            sample_ctr <= 0;
            // Compute powers
             
        end
    end
    
    goertzel #(.k(0)) goertzel_0(CLK, 1'b0, mic_ready, mic, y1_0, y2_0);
//    goertzel #(.k(7)) goertzel_5(CLK, 1'b0, mic_ready, mic, y1_7, y2_7); 
    
    
    
endmodule
