`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.10.2022 16:42:28
// Design Name: 
// Module Name: sim_morse
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

`define DOT e_btnC <= 1; #1_000_000;
`define DASH e_btnC <= 1; #3_000_000;
`define SPACE e_btnC <= 0; #1_000_000;
`define WORD e_btnC <= 0; #7_000_000;

module sim_morse(
    );
            
    // 100MHz clock
    reg CLK = 0;
    always begin
        #5 CLK <= ~CLK;
    end
    
    // 6.25MHz clock
    wire clk6p25m;
    fclk #(.khz(6250)) clk_6p25mhz(CLK, clk6p25m);
    
    reg [15:0] pixel_index = 0;
    always @(posedge clk6p25m)
        pixel_index <= pixel_index + 1;
    
    wire a_active, b_active, c_active, d_active;
    oled_sprites a(clk6p25m, pixel_index, 16*96+16, 1, a_active);
    oled_sprites b(clk6p25m, pixel_index, 16*96+32, 2, b_active);
    oled_sprites c(clk6p25m, pixel_index, 16*96+48, 3, c_active);
    oled_sprites d(clk6p25m, pixel_index, 16*96+64, 4, d_active);
    
    // 20kHz clock
//    wire sample_clk;
//    fclk #(.khz(0.005)) fclk(CLK, sample_clk);
    
//    reg pb_1;
//    wire d_pb_1, dh_pb_1;
//    debouncer db(CLK, pb_1, d_pb_1);
//    debouncer_hold #(.M(1_999)) dbh(CLK, pb_1, dh_pb_1);
    
//    reg valid;
//    reg [5:0] symbol;
//    wire [6:0] seg;
//    wire [3:0] an;
    
//    initial begin
//        #20;
//        valid <= 1;
//        symbol <= 1;
//        #20;
//        valid <= 0;
//        symbol <= 2;
//        #10;
//        valid <= 1;
//    end
    
//    morse_segment m(CLK, valid, symbol, seg, an);
    
//    wire valid;
//    wire [5:0] symbol;
//    morse morse(
//        .CLK(CLK),
//        .sample_clk(sample_clk),
//        .in(e_btnC),
//        .valid(valid),
//        .symbol(symbol)
//        );
    
endmodule
