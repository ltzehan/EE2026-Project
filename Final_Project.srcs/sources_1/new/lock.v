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
    input [5:0] input_symbol,
    input btnU,
    input btnD,
    input [12:0] pixel_index,
    output reg locked=0,
    output [6:0] seg,
    output [3:0] an,
    output reg [15:0] oled_data
    );

    segment_map(CLK, `SEG_BLANK, `SEG_S, `SEG_E, `SEG_T, seg, an);
    
    /**
     *  Locking logic
     */
    reg [2:0] idx = 0;
    reg [5:0] symbol_0 = 0;
    reg [5:0] symbol_1 = 0;
    reg [5:0] symbol_2 = 0;
    reg [5:0] symbol_3 = 0;
    wire active_1, active_2, active_3, active_4;

    oled_text_sprite #(.OFFSET(28*96+16)) (CLK, pixel_index, symbol_0, active_1);
    oled_text_sprite #(.OFFSET(28*96+32)) (CLK, pixel_index, symbol_1, active_2);
    oled_text_sprite #(.OFFSET(28*96+48)) (CLK, pixel_index, symbol_2, active_3);
    oled_text_sprite #(.OFFSET(28*96+64)) (CLK, pixel_index, symbol_3, active_4);
    
    // Rising edge of input_valid
    reg prev_input_valid = 0;
    wire edge_input_valid = ~prev_input_valid & input_valid;
    
    wire [15:0] confirm_oled_data;
    lock_confirm_oled(CLK, pixel_index, confirm_oled_data);
    
    wire unlock_active;
    unlock_overlay(CLK, pixel_index, unlock_active);
    
    always @(posedge CLK) begin
        prev_input_valid <= input_valid;
         
        if (locking) begin
            if (idx == 4) begin
                oled_data <= confirm_oled_data;
                
                // Wait for btnD to confirm password or btnU to reset    
                if (btnU)
                    locked <= 1;
                else if (btnD) begin
                    // Reset states
                    idx <= 0;
                    symbol_0 <= `SEG_BLANK;
                    symbol_1 <= `SEG_BLANK;
                    symbol_2 <= `SEG_BLANK;
                    symbol_3 <= `SEG_BLANK;
                end
            end
            else begin
                if (active_1 || active_2 || active_3 || active_4)
                    oled_data <= `OLED_WHITE;
            
                // Next character
                if (edge_input_valid) begin
                    if (idx == 0) begin
                        symbol_0 <= input_symbol;
                    end
                    else if (idx == 1) begin
                        symbol_1 <= input_symbol;
                    end
                    else if (idx == 2) begin
                        symbol_2 <= input_symbol;
                    end
                    else if (idx == 3) begin
                        symbol_3 <= input_symbol;
                    end
                
                    idx <= (idx == 4) ? 4 : idx + 1;
                end
            end
            
        end
        else if (unlocking) begin
            if (unlock_active)
                oled_data <= `OLED_WHITE;
        
            if (btnD) begin
                locked <= 0;
                // Reset states
                idx <= 0;
                symbol_0 <= `SEG_BLANK;
                symbol_1 <= `SEG_BLANK;
                symbol_2 <= `SEG_BLANK;
                symbol_3 <= `SEG_BLANK;
            end
        end
    end
    
endmodule
