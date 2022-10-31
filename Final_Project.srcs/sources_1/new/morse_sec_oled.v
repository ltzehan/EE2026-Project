`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.10.2022 22:18:45
// Design Name: 
// Module Name: morse_sec_oled
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


module morse_sec_oled(
    input CLK,
    input [9:0] recv_packed,
    input [12:0] pixel,
    output reg [15:0] morse_oled_data
);
    localparam [1:0] DOT = 2'b10;
    localparam [1:0] DASH = 2'b11;
    reg [15:0] white = 16'b1111111111111111;
    reg [15:0] black = 16'b0000000000000000;
    wire [7:0] px, py;
    px_to_xy calc(pixel, px, py);
    
    always @ (posedge CLK) 
    begin
        if (px < 22) //first morse code
        begin
            if (recv_packed[9:8] == DOT) 
            begin
                if ((py == 28 || py == 37) && (px >= 11 && px < 15))
                    begin 
                        morse_oled_data <= white;
                    end
                else if ((py == 29 || py == 30 || py == 35 || py == 36) && (px >= 9 && px < 17))
                begin
                    morse_oled_data <= white;
                end
                else if ((py > 30 && py < 35) && px >= 8 && px < 18)
                begin
                    morse_oled_data <= white;
                end
                else 
                begin
                     morse_oled_data <= black;
                end
            end
            else if (recv_packed[9:8] == DASH) 
            begin
                if (py > 31 && py < 34 && px >= 8 && px < 18)
                begin
                    morse_oled_data <= white;
                end
                else 
                begin
                    morse_oled_data <= black;
                end
            end
        end
        else if (px >= 22 && px < 40) //second morse code
        begin
            if (recv_packed[7:6] == DOT) 
            begin
                if ((py == 28 || py == 37) && (px >= 29 && px < 33))
                    begin 
                        morse_oled_data <= white;
                    end
                else if ((py == 29 || py == 30 || py == 35 || py == 36) && (px >= 27 && px < 35))
                begin
                    morse_oled_data <= white;
                end
                else if ((py > 30 && py < 35) && px >= 26 && px < 36)
                begin
                    morse_oled_data <= white;
                end
                else 
                begin
                     morse_oled_data <= black;
                end
            end
            else if (recv_packed[7:6] == DASH) 
            begin
                if (py > 31 && py < 34 && px >= 26 && px < 36)
                begin
                    morse_oled_data <= white;
                end
                else 
                begin
                    morse_oled_data <= black;
                end
            end
        end
        else if (px >= 40 && px < 58) //third morse code
        begin
            if (recv_packed[5:4] == DOT) 
            begin
                if ((py == 28 || py == 37) && (px >= 47 && px < 51))
                    begin 
                        morse_oled_data <= white;
                    end
                else if ((py == 29 || py == 30 || py == 35 || py == 36) && (px >= 45 && px < 53))
                begin
                    morse_oled_data <= white;
                end
                else if ((py > 30 && py < 35) && px >= 44 && px < 54)
                begin
                    morse_oled_data <= white;
                end
                else 
                begin
                     morse_oled_data <= black;
                end
            end
            else if (recv_packed[5:4] == DASH) 
            begin
                if (py > 31 && py < 34 && px >= 44 && px < 54)
                begin
                    morse_oled_data <= white;
                end
                else 
                begin
                    morse_oled_data <= black;
                end
            end
        end
        else if (px >= 58 && px < 76) //fourth morse code
        begin
            if (recv_packed[3:2] == DOT) 
            begin
                if ((py == 28 || py == 37) && (px >= 65 && px < 69))
                    begin 
                        morse_oled_data <= white;
                    end
                else if ((py == 29 || py == 30 || py == 35 || py == 36) && (px >= 63 && px < 71))
                begin
                    morse_oled_data <= white;
                end
                else if ((py > 30 && py < 35) && px >= 62 && px < 72)
                begin
                    morse_oled_data <= white;
                end
                else 
                begin
                     morse_oled_data <= black;
                end
            end
            else if (recv_packed[3:2] == DASH) 
            begin
                if (py > 31 && py < 34 && px >= 62 && px < 72)
                begin
                    morse_oled_data <= white;
                end
                else 
                begin
                    morse_oled_data <= black;
                end
            end
        end
        else if (px >= 76 && px < 95) //final morse code
        begin
            if (recv_packed[1:0] == DOT) 
            begin
                if ((py == 28 || py == 37) && (px >= 83 && px < 87))
                    begin 
                        morse_oled_data <= white;
                    end
                else if ((py == 29 || py == 30 || py == 35 || py == 36) && (px >= 81 && px < 89))
                begin
                    morse_oled_data <= white;
                end
                else if ((py > 30 && py < 35) && px >= 80 && px < 90)
                begin
                    morse_oled_data <= white;
                end
                else 
                begin
                     morse_oled_data <= black;
                end
            end
            else if (recv_packed[1:0] == DASH) 
            begin
                if (py > 31 && py < 34 && px >= 80 && px < 90)
                begin
                    morse_oled_data <= white;
                end
                else 
                begin
                    morse_oled_data <= black;
                end
            end
        end
    end
endmodule
