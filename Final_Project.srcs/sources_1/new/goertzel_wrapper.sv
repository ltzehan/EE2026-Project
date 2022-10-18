`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.10.2022 21:41:10
// Design Name: 
// Module Name: goertzel_wrapper
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


module goertzel_wrapper(
    input mic_clk,
    input [11:0] mic,
    output reg [7:0] led=0
    );
    
    parameter SIZE = 283;
    localparam [7:0][7:0] BINS = {8'd10, 8'd11, 8'd12, 8'd13, 8'd17, 8'd19, 8'd21, 8'd23};
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
    
    localparam THRESHOLD = 32'hFFFF;
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
            
            if (row_valid & col_valid) begin
                led[row_idx] <= 1;
                led[col_idx+4] <= 1;
            end
        end
        
        // Reset after 1 clock cycle
        if (ctr == 0) begin
            row_valid <= 0;
            col_valid <= 0;
        end
    end
    
endmodule
