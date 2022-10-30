`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.10.2022 19:18:32
// Design Name: 
// Module Name: menu
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

module menu(
    input CLK,
    input btnL,
    input btnR,
    input btnC,
    input locked,
    output [6:0] seg,
    output [4:0] an,
    output reg [3:0] task_state = `MENU_INACTIVE    // State used for switching outputs
    );
    
    /**
     *  Menu Logic
     */
    
    reg [3:0] display_state = `MENU_OLED_A;
    
    reg prev_locked = 0;
    always @(posedge CLK) begin
        prev_locked <= locked;
    
        if (locked) begin
            display_state <= `MENU_UNLOCK;
            task_state <= `MENU_UNLOCK;
        end
            
        if (!locked) begin
            // Right after unlock, go back to default state
            if (prev_locked) begin
                display_state <= `MENU_OLED_A;
                task_state <= `MENU_INACTIVE;
            end
        
            if (display_state == `MENU_INACTIVE) begin
                if (btnC) begin
                    display_state <= task_state;
                    task_state <= `MENU_INACTIVE; 
                end
            end
            else begin
                if (btnR && display_state != `MENU_LOCK)
                    display_state <= display_state + 1;
                else if (btnL && display_state != `MENU_OLED_A)
                    display_state <= display_state - 1;
            end
            
            // Confirm task selection
            if (task_state == `MENU_INACTIVE && btnC) begin
                display_state <= `MENU_INACTIVE;
                task_state <= display_state;
            end
        end
    end
    
    /**
     *  Menu Display
     */
     
    reg [6:0] char0, char1, char2, char3;
    segment_map(CLK, char0, char1, char2, char3, seg, an);
     
    always @(posedge CLK) begin
        begin
            case (display_state)
                `MENU_OLED_A: begin
                    char0 <= `SEG_BLANK;
                    char1 <= `SEG_BLANK;
                    char2 <= `SEG_4;
                    char3 <= `SEG_A;
                end
                `MENU_OLED_B: begin
                    char0 <= `SEG_BLANK;
                    char1 <= `SEG_BLANK;
                    char2 <= `SEG_4;
                    char3 <= `SEG_B;
                end
                `MENU_AVI: begin
                    char0 <= `SEG_BLANK;
                    char1 <= `SEG_BLANK;
                    char2 <= `SEG_4;
                    char3 <= `SEG_C;
                end
                `MENU_DTMF: begin
                    char0 <= `SEG_D;
                    char1 <= `SEG_T;
                    char2 <= `SEG_M;
                    char3 <= `SEG_F;
                end
                `MENU_MORSE: begin
                    char0 <= `SEG_M;
                    char1 <= `SEG_O;
                    char2 <= `SEG_R;
                    char3 <= `SEG_S;
                end
                `MENU_LOCK: begin
                    char0 <= `SEG_L;
                    char1 <= `SEG_O;
                    char2 <= `SEG_C;
                    char3 <= `SEG_K;
                end
                `MENU_UNLOCK: begin
                    char0 <= `SEG_P;
                    char1 <= `SEG_A;
                    char2 <= `SEG_S;
                    char3 <= `SEG_S;
                end
            endcase
        end
    end
     
endmodule
