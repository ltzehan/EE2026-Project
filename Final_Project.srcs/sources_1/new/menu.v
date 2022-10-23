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
                state <= task_state;
                task_state <= MENU_INACTIVE; 
            end
        end
        else begin
            if (btnR && state != MENU_MORSE)
                state <= state + 1;
            else if (btnL && state != MENU_OLED_A)
                state <= state - 1;
        end
        
        // Confirm task selection
        if (task_state == MENU_INACTIVE && btnC) begin
            state <= MENU_INACTIVE;
            task_state <= state;
        end
    end
    
endmodule
