`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.10.2022 21:41:10
// Design Name: 
// Module Name: dtmf
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


`include "constants.vh"

module dtmf(
    input CLK,
    input mic_clk,
    input btnL, input btnR,
    input [1:0] sw,
    input [11:0] mic,
    input [12:0] pixel,
    output reg [15:0] oled_data,
    output [6:0] seg,
    output [3:0] an,
    output reg [15:0] led 
    );

    /**
     *  Filter
     */
    
    parameter SIZE = 283;
    localparam [7:0][7:0] BINS = {8'd23, 8'd21, 8'd19, 8'd17, 8'd13, 8'd12, 8'd11, 8'd10}; 
    wire [31:0] y1 [7:0];
    wire [31:0] y2 [7:0];
    wire [31:0] power [7:0];
    wire RST;

    genvar k;
    generate 
        for (k = 0; k <= 7; k = k+1) begin
            goertzel_v2 #(.k(BINS[k]), .N(SIZE)) goertzel_v2 (mic_clk, RST, mic, y1[k], y2[k]);
            goertzel_power_v2 #(.k(BINS[k]), .N(SIZE)) goertzel_power_v2 (mic_clk, y1[k], y2[k], power[k]);
        end
    endgenerate
    
    // Sample counter
    reg [8:0] ctr = 0;
    assign RST = (ctr == 0);
    always @(posedge mic_clk) begin
         ctr <= (ctr == SIZE) ? 0 : ctr+1;       
    end
    
    /**
     *  Spectra
     */
    
    // Scale power to bar height
    localparam MAX_POWER = 32'h300_0000;
    // Empirically determined
    localparam [7:0][7:0] POWER_SCALE = {8'd19, 8'd19, 8'd19, 8'd19, 8'd18, 8'd18, 8'd17, 8'd16};
    reg [5:0] power_height [7:0];  // [0, 63]
    // Will only be zero if pixel is not part of any bars 
    reg [7:0] spectra_active;
    
    // Bar dimensions
    localparam MIN_BAR_W = 6;
    localparam MAX_BAR_W = 12;
    wire [7:0] bar_margin;
    reg [7:0] bar_width = 8; // px
    
    assign bar_margin = (MAX_BAR_W - bar_width) >> 1;
    always @(posedge CLK) begin
        if (btnL) begin
            bar_width <= (bar_width == MIN_BAR_W) ? MIN_BAR_W : bar_width - 2;
        end
        else if (btnR) begin
            bar_width <= (bar_width == MAX_BAR_W) ? MAX_BAR_W : bar_width + 2;
        end
    end
    
    // Generate bars for each frequency bin
    genvar p;
    generate
        for (p = 0; p <= 7; p = p+1) begin
            draw_filled_box dtmf_bar(
                .pixel(pixel), 
                .x1(p*MAX_BAR_W + bar_margin), 
                .y1(`OLED_H-power_height[p]), 
                .x2((p+1)*MAX_BAR_W - bar_margin), 
                .y2(`OLED_H), 
                .active(spectra_active[p])
                );

            always @(posedge mic_clk) begin
                // Update spectra after every sampling cycle
                if (ctr == SIZE)
                    power_height[p] <= (power[p] >> POWER_SCALE[p]);
            end
        end
    endgenerate
    
    /**
     *  Tone Classification
     */
    
    // Peak finding
    localparam THRESHOLD = 32'hFFFF;
    reg [3:0] i;
    reg [2:0] row_idx;
    reg row_valid = 0;
    reg [31:0] row_max_val;
    reg [2:0] col_idx;
    reg [31:0] col_max_val;
    reg col_valid = 0;
    wire [3:0] grid_idx = row_idx * 4 + col_idx;
    
    // Noise reduction by requiring 4 same classifications before output
    reg [1:0] last_ctr = 0;
    reg [3:0] last_grid_idx = 0;
    reg has_updated = 0;
    
    // 7-segment
    reg [15:0] idx;
    localparam [6:0] dtmf_seg [0:15] = {
                                        `SEG_1, `SEG_2, `SEG_3, `SEG_A,
                                        `SEG_4, `SEG_5, `SEG_6, `SEG_B,
                                        `SEG_7, `SEG_8, `SEG_9, `SEG_C,
                                        `SEG_ASTR, `SEG_0, `SEG_HASH, `SEG_D
                                       };
    reg [15:0] clear_ctr;
    
    reg [6:0] seg_0 = `SEG_BLANK;
    reg [6:0] seg_1 = `SEG_BLANK;
    reg [6:0] seg_2 = `SEG_BLANK;
    reg [6:0] seg_3 = `SEG_BLANK;
    // Intentional index reversing
    segment_map(CLK, seg_3, seg_2, seg_1, seg_0, seg, an);
    
    always @(posedge mic_clk) begin
        // Peak detector
        if (ctr == SIZE) begin
            row_max_val = THRESHOLD;
            row_valid = 0;
            col_max_val = THRESHOLD;
            col_valid = 0;

            // Find row peak
            for (i = 0; i <= 3; i = i+1) begin
                if (power[i] > row_max_val) begin
                    row_max_val = power[i];
                    row_idx = i;
                    row_valid = 1;
                end
            end
            // Find col peak
            for (i = 0; i <= 3; i = i+1) begin
                if (power[i+4] > col_max_val) begin
                    col_max_val = power[i+4];
                    col_idx = i;
                    col_valid = 1;
                end           
            end
            
            if (row_valid && col_valid) begin
                last_grid_idx <= grid_idx;
                if (grid_idx == last_grid_idx) begin
                    last_ctr <= (last_ctr == 3) ? 3 : last_ctr + 1;
                    if (last_ctr == 3 && ~has_updated) begin
                        led[grid_idx] <= 1;
                        has_updated <= 1;
                        seg_0 <= dtmf_seg[grid_idx];
                        seg_1 <= seg_0;
                        seg_2 <= seg_1;
                        seg_3 <= seg_2;
                    end
                end
                else begin
                    last_ctr <= 0;
                    has_updated <= 0;
                end
                
                clear_ctr <= 0;
            end
            else begin
                last_ctr <= 0;
                has_updated <= 0;
            end
        end
        
        // Reset after 1 sample cycle
        if (ctr == 0) begin
            row_valid <= 0;
            col_valid <= 0;
        end
        
        clear_ctr <= clear_ctr + 1;
        if (clear_ctr > 4000) begin
            clear_ctr <= 0;
            led <= 0;
        end
    end
    
    /**
     *  Display
     */
    
    wire show_grid = sw[1];
    wire show_overlay = sw[0] && ~sw[1];
    
    // Frequency Overlay
    wire overlay_active;
    dtmf_overlay dtmf_overlay(CLK, pixel, overlay_active);
    
    // Grid
    wire [15:0] dtmf_grid_oled_data;
    dtmf_grid_oled(CLK, pixel, row_valid, col_valid, row_idx, col_idx, dtmf_grid_oled_data);
    
    // OLED colour
    always @(posedge CLK) begin
//        if (show_grid) begin
//            oled_data <= dtmf_grid_oled_data;
//        end
//        else begin
        // Show frequency overlay
        if (show_overlay && overlay_active)
            oled_data <= `OLED_WHITE;
        else if (spectra_active)
            oled_data <= `OLED_RED;
        else
            oled_data <= `OLED_BLACK;
//        end
    end 
    
    
endmodule
