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
    input [3:0] task_state,
    input input_valid,
    input [5:0] input_symbol,
    input btnL,
    input btnR,
    input [12:0] pixel_index,
    output reg locked=0,
    output [6:0] seg,
    output [3:0] an,
    output reg [15:0] oled_data
    );
    
    wire locking = task_state == `MENU_LOCK;
    wire unlocking = task_state == `MENU_UNLOCK;
    reg [3:0] prev_task_state;
    wire RST = (task_state == `MENU_LOCK) && (prev_task_state != `MENU_LOCK);
    always @(posedge CLK) begin
        prev_task_state <= task_state;
    end

    reg [6:0] char_0 = `SEG_BLANK;
    reg [6:0] char_1 = `SEG_S;
    reg [6:0] char_2 = `SEG_E;
    reg [6:0] char_3 = `SEG_T;
    segment_map(CLK, char_0, char_1, char_2, char_3, seg, an);
    
    /**
     *  Locking logic
     */
    reg [2:0] idx = 0;
    reg [5:0] symbol_0 = 0;
    reg [5:0] symbol_1 = 0;
    reg [5:0] symbol_2 = 0;
    reg [5:0] symbol_3 = 0;
    reg [5:0] pass_0 = 0;
    reg [5:0] pass_1 = 0;
    reg [5:0] pass_2 = 0;
    reg [5:0] pass_3 = 0;
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
    
    wire [15:0] wrong_pass_oled_data;
    wrong_pass_oled(CLK, pixel_index, wrong_pass_oled_data);
    
    wire unlock_overlay_active, lock_overlay_active;
    unlock_overlay(pixel_index, unlock_overlay_active);
    lock_overlay(pixel_index, lock_overlay_active);
    
    localparam DELAY_CNT = 50_000_000; 
    reg [31:0] delay_ctr = 0;
    always @(posedge CLK) begin
        prev_input_valid <= input_valid;
         
        if (RST) begin
            char_0 <= `SEG_BLANK;
            char_1 <= `SEG_S;
            char_2 <= `SEG_E;
            char_3 <= `SEG_T;
            idx <= 0;
            symbol_0 <= 0;
            symbol_1 <= 0;
            symbol_2 <= 0;
            symbol_3 <= 0;
            pass_0 <= 0;
            pass_1 <= 0;
            pass_2 <= 0;
            pass_3 <= 0;
            delay_ctr <= 0;
        end
         
        if (locking) begin
            char_0 <= `SEG_BLANK;
            char_1 <= `SEG_S;
            char_2 <= `SEG_E;
            char_3 <= `SEG_T;

            if (delay_ctr == DELAY_CNT)
                oled_data <= confirm_oled_data;
            else begin
                if (active_1 || active_2 || active_3 || active_4 || lock_overlay_active)
                    oled_data <= `OLED_WHITE;
                else
                    oled_data <= `OLED_BLACK;
            end
        
            if (idx == 4) begin
                delay_ctr <= (delay_ctr == DELAY_CNT) ? DELAY_CNT : delay_ctr+1;
                
                // Wait for btnR to confirm password or btnL to reset    
                if (btnR) begin
                    locked <= 1;
                    pass_0 <= symbol_0;
                    pass_1 <= symbol_1;
                    pass_2 <= symbol_2;
                    pass_3 <= symbol_3;
                end
                if (btnL || btnR) begin
                    // Reset states
                    idx <= 0;
                    symbol_0 <= `SEG_BLANK;
                    symbol_1 <= `SEG_BLANK;
                    symbol_2 <= `SEG_BLANK;
                    symbol_3 <= `SEG_BLANK;
                    delay_ctr <= 0;
                end
            end
            else begin
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
            char_0 <= `SEG_P;
            char_1 <= `SEG_A;
            char_2 <= `SEG_S;
            char_3 <= `SEG_S;
        
            if (active_1 || active_2 || active_3 || active_4 || unlock_overlay_active)
                oled_data <= `OLED_WHITE;
            else
                oled_data <= `OLED_BLACK;
        
            if (idx == 4) begin
                if (pass_0 == symbol_0 && pass_1 == symbol_1 && pass_2 == symbol_2 && pass_3 == symbol_3) begin
                    locked <= 0;
                    // Reset states
                    idx <= 0;
                    symbol_0 <= `SEG_BLANK;
                    symbol_1 <= `SEG_BLANK;
                    symbol_2 <= `SEG_BLANK;
                    symbol_3 <= `SEG_BLANK;
                end
                else begin
                    if (delay_ctr < DELAY_CNT) begin
                        delay_ctr <= (delay_ctr == DELAY_CNT) ? DELAY_CNT : delay_ctr+1;
                        oled_data <= wrong_pass_oled_data;
                    end
                    else begin
                        // Reset states
                        idx <= 0;
                        symbol_0 <= `SEG_BLANK;
                        symbol_1 <= `SEG_BLANK;
                        symbol_2 <= `SEG_BLANK;
                        symbol_3 <= `SEG_BLANK;
                        delay_ctr <= 0;
                    end
                end
                
                
            end
            else begin
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
    end
    
endmodule
