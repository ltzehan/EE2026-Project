`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.10.2022 22:07:12
// Design Name: 
// Module Name: draw_num
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


module draw_num(
    input CLK,
    input [7:0] refx, refy,
    input [7:0] x, y,
    input [3:0] num,
    output reg [15:0] watch_oled_data
    );
    localparam BLACK      = {16{1'b0}};
    localparam WHITE      = {16{1'b1}};
    
    always @ (posedge CLK)
    begin
        if (x >= refx - 1 && x < refx + 11 && y >= refy && y < refy + 20) 
        begin
            if (num == 0) 
            begin
                if ((y == refy + 2 || y == refy + 17) && x >= refx + 1 && x < refx + 9) 
                begin
                    watch_oled_data = WHITE;
                end
                else if (y > refy + 2 && y < refy + 17 && (x == refx + 1 || x == refx + 8))
                begin
                    watch_oled_data = WHITE;
                end
                else 
                begin
                    watch_oled_data = BLACK;
                end
            end
            
            else if (num == 1) 
            begin
                if (y >= refy + 2 && y <= refy + 17 && x == refx + 8)
                begin
                    watch_oled_data = WHITE;
                end
                else 
                begin
                    watch_oled_data = BLACK;
                end
            end
            
            else if (num == 2) 
            begin
                if ((y == refy + 2 || y == refy + 17 || y == refy + 9) && x >= refx + 1 && x < refx + 9)
                begin
                    watch_oled_data = WHITE;
                end
                else if ((y > refy + 9 && y < refy + 17 && x == refx + 1) || (y > refy + 2 && y < refy + 9 && x == refx + 8))
                begin
                    watch_oled_data = WHITE;
                end
                else 
                begin
                    watch_oled_data = BLACK;
                end
            end
            
            else if (num == 3) 
            begin
                if (y >= refy + 2 && y <= refy + 17 && x == refx + 8)
                begin
                    watch_oled_data = WHITE;
                end
                else if ((y == refy + 2 || y == refy + 17 || y == refy + 9) && x >= refx + 1 && x < refx + 8)
                begin
                    watch_oled_data = WHITE;
                end
                else begin
                    watch_oled_data = BLACK;
                end
            end
            
            else if (num == 4) 
            begin
                if (y >= refy + 2 && y <= refy + 17 && x == refx + 8)
                begin
                    watch_oled_data = WHITE;
                end
                else if (y == refy + 9 && x >= refx + 1 && x < refx + 8) 
                begin
                    watch_oled_data = WHITE;
                end
                else if (x == refx + 1 && y >= refy + 2 && y < refy + 9)
                begin
                    watch_oled_data = WHITE;
                end
                else begin
                    watch_oled_data = BLACK;
                end
            end
            
            else if (num == 5) 
            begin
                if ((y == refy + 2 || y == refy + 17 || y == refy + 9) && x >= refx + 1 && x < refx + 9)
                begin
                    watch_oled_data = WHITE;
                end
                else if ((y > refy + 2 && y < refy + 9 && x == refx + 1) || (y > refy + 9 && y < refy + 17 && x == refx + 8))
                begin
                    watch_oled_data = WHITE;
                end
                else begin
                    watch_oled_data = BLACK;
                end
            end
            
            else if (num == 6) 
            begin
                if (y >= refy + 2 && y <= refy + 17 && x == refx + 1)
                begin
                    watch_oled_data = WHITE;
                end
                else if ((y == refy + 2 || y == refy + 17 || y == refy + 9) && x >= refx + 2 && x < refx + 9)
                begin
                    watch_oled_data = WHITE;
                end
                else if (x == refx + 8 && y > refy + 9 && y < refy + 17)
                begin
                    watch_oled_data = WHITE;
                end
                else begin
                    watch_oled_data = BLACK;
                end
            end
            
            else if (num == 7) 
            begin
                if (y >= refy + 2 && y <= refy + 17 && x == refx + 8)
                begin
                    watch_oled_data = WHITE;
                end
                else if (y == refy + 2 && x < refx + 8) 
                begin
                    watch_oled_data = WHITE;
                end
                else begin
                    watch_oled_data = BLACK;
                end
            end
            
            else if (num == 8) 
            begin
                if (y >= refy + 2 && y <= refy + 17 && (x == refx + 8 || x == refx + 1))
                begin
                    watch_oled_data = WHITE;
                end
                else if ((y == refy + 2 || y == refy + 17 || y == refy + 9) && x > refx + 1 && x < refx + 8)
                begin
                    watch_oled_data = WHITE;
                end
                else begin
                    watch_oled_data = BLACK;
                end
            end
            
            else if (num == 9)
            begin
                if (y >= refy + 2 && y <= refy + 17 && x == refx + 8)
                begin
                    watch_oled_data = WHITE;
                end
                else if ((y == refy + 2 || y == refy + 17 || y == refy + 9) && x >= refx + 1 && x < refx + 8)
                begin
                    watch_oled_data = WHITE;
                end
                else if (x == refx + 1 && y > refy + 2 && y < refy + 9) 
                begin
                    watch_oled_data = WHITE;
                end
                else begin
                    watch_oled_data = BLACK;
                end
            end
            
        end
    end
endmodule
