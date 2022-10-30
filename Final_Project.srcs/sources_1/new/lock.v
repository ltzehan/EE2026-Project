`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.10.2022 19:57:19
// Design Name: 
// Module Name: lock
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


module lock(
    input CLK,
    input locking,
    input unlocking,
    input input_valid,
    input [6:0] input_seg,
    input btnU,
    input btnD,
    output reg locked=0,
    output [6:0] seg,
    output [3:0] an,
    output reg [15:0] oled_data
    );
    
    /**
     *  Locking logic
     */
    reg [2:0] char_idx = 0;
    reg [6:0] char0 = `SEG_BLANK;
    reg [6:0] char1 = `SEG_BLANK;
    reg [6:0] char2 = `SEG_BLANK;
    reg [6:0] char3 = `SEG_BLANK;
    segment_map(CLK, char0, char1, char2, char3, seg, an);
    
    // Rising edge of input_valid
    reg prev_input_valid = 0;
    wire edge_input_valid = ~prev_input_valid & input_valid;
    
    always @(posedge CLK) begin
        prev_input_valid <= input_valid;
         
        if (locking) begin
            if (edge_input_valid) begin
                if (char_idx == 0) begin
                    char0 <= input_seg;
                    oled_data <= `OLED_RED;
                end
                else if (char_idx == 1) begin
                    char1 <= input_seg;
                    oled_data <= `OLED_GREEN;
                end
                else if (char_idx == 2) begin
                    char2 <= input_seg;
                    oled_data <= `OLED_WHITE;
                end
                else if (char_idx == 3) begin
                    char3 <= input_seg;
                    oled_data <= `OLED_ORANGE;
                end
            
                char_idx <= (char_idx == 4) ? 4 : char_idx + 1;
            end
            // Wait for btnD to confirm password or btnU to reset
            else if (char_idx == 4) begin
                if (btnU)
                    locked <= 1;
                else if (btnD) begin
                    // Reset states
                    char_idx <= 0;
                    char0 <= `SEG_BLANK;
                    char1 <= `SEG_BLANK;
                    char2 <= `SEG_BLANK;
                    char3 <= `SEG_BLANK;
                end
            end
        end
        else if (unlocking && btnD) begin
            locked <= 0;
            // Reset states
            char_idx <= 0;
            char0 <= `SEG_BLANK;
            char1 <= `SEG_BLANK;
            char2 <= `SEG_BLANK;
            char3 <= `SEG_BLANK;
        end
    end
    
endmodule
