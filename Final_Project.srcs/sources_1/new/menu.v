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

parameter MENU_INACTIVE = 0;
parameter MENU_OLED_A = 1;
parameter MENU_OLED_B = 2;
parameter MENU_AVI = 3;

module menu(
    input CLK,
    input btnL,
    input btnR,
    input btnC,
    output reg [3:0] state = MENU_OLED_A,   // State used for 7-segment display
    output reg [3:0] task_state = MENU_INACTIVE // State used for activating tasks
    );
        
    always @(posedge CLK) begin
        if (state == MENU_INACTIVE) begin
            if (btnC) begin
                state <= MENU_OLED_A;
                task_state <= MENU_INACTIVE; 
            end
        end
        else if (state == MENU_OLED_A) begin
            if (btnR)
                state <= state + 1;
        end
        else if (state == MENU_OLED_B) begin
            if (btnL)
                state <= state - 1;
            else if (btnR)
                state <= state + 1;
        end
        else if (state == MENU_AVI) begin
            if (btnL)
                state <= state - 1;
        end
        
        // Confirm task selection
        if (task_state == MENU_INACTIVE && btnC) begin
            state <= MENU_INACTIVE;
            task_state <= state;
        end
    end
    
endmodule
