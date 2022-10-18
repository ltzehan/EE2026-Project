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

    parameter [7:0][7:0] BINS = {8'd10, 8'd11, 8'd12, 8'd13, 8'd17, 8'd19, 8'd21, 8'd23};
    wire [31:0] y1 [7:0];
    wire [31:0] y2 [7:0];
    wire [31:0] power [7:0];

    genvar k;
    generate 
        for (k = 0; k <= 7; k = k+1) begin
            goertzel_v2 #(.k(BINS[k]), .N(SIZE)) goertzel_v2 (mic_clk, 1'b0, mic, y1[k], y2[k]);
            goertzel_power_v2 #(.k(BINS[k]), .N(SIZE)) goertzel_power_v2 (mic_clk, 1'b0, y1[k], y2[k], power[k]);
        end
    endgenerate
    
    localparam THRESHOLD = 150;
    reg [3:0] i;
    reg [2:0] row_idx;
    reg row_valid = 0;
    reg [31:0] row_max_val;
    reg [2:0] col_idx;
    reg [31:0] col_max_val;
    reg col_valid = 0;
    reg [8:0] ctr = 0;
     
    always @(posedge mic_clk) begin
        ctr <= (ctr == SIZE) ? 0 : ctr+1;
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
        end

    end
    
endmodule
