`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.10.2022 15:42:12
// Design Name: 
// Module Name: morse_oled
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


module morse_oled(
    input CLK,
    input [12:0] pixel,
    input btnL,
    input morse_valid,
    input [5:0] morse_symbol,
    output reg [15:0] oled_data
    );
    
    reg [5:0] symbols [14:0] = '{15{0}};
    wire [14:0] active;
    
    wire edge_morse_valid;
    edge_detector (CLK, morse_valid, edge_morse_valid);
    
    reg [3:0] idx = 0;
    always @(posedge CLK) begin
        if (btnL) begin
            symbols <= '{15{0}};
            idx <= 0;
        end
        else if (edge_morse_valid) begin
            symbols[idx] <= morse_symbol;
            // Ring buffer
            idx <= (idx == 14) ? 0 : idx + 1;
        end
    end
    
    genvar g_row, g_col;
    generate
        for (g_row = 0; g_row < 3; g_row = g_row+1) begin
            for (g_col = 0; g_col < 5; g_col = g_col+1) begin
                oled_text_sprite #(.OFFSET((8*96+8) + (16*g_col) + (16*96*g_row)))
                    (CLK, pixel, symbols[(g_row*5)+g_col], active[(g_row*5)+g_col]);
            end
        end
    endgenerate
    
//    genvar i;
//    generate
//        for (i = 0; i < 17; i = i+1) begin
//            always @(posedge CLK) begin
//                if (active[i])
//                    oled_data <= (i == idx) ? `OLED_RED : `OLED_WHITE;
//            end
//        end
//    endgenerate 
    
    wire box_active;
    draw_box(pixel, 1, 1, 94, 62, 1, box_active);
    
    always @(posedge CLK) begin
        if (active)
            oled_data <= `OLED_WHITE;
        else if (box_active)
            oled_data <= `OLED_RED;
        else
            oled_data <= `OLED_BLACK;
    end
    
endmodule
