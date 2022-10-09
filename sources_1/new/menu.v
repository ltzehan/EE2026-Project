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
    input [3:0] state,
    input btnL,
    input btnR,
    input btnC
    );
    
    always @(posedge CLK) begin
        if (state == MENU_INACTIVE) begin
            
        end
        else if (state == MENU_OLED_A) begin
        
        end
        else if (state == MENU_OLED_B) begin
        
        end
        else if (state == MENU_AVI) begin
        
        end
    end
    
endmodule
