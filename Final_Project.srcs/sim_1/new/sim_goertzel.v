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
//    reg CLK = 0;
//    always begin
//        #5 CLK <= ~CLK;
//    end
    
//    // Sine wave generator
//    wire [11:0] sine_4khz;
//    sine_gen #(.SIZE(25000)) sine_4khz_gen(CLK, sine_4khz); 
    
//    reg RST = 0;
//    wire [11:0] mic = 0;
//    wire [60:0] y1;
//    wire [60:0] y2;
    
//    assign mic = sine_4khz;
//    goertzel goertzel(CLK, RST, sine_4khz, y1, y2); 
    
endmodule
