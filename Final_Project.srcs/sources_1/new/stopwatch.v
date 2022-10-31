`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.10.2022 22:03:36
// Design Name: 
// Module Name: stopwatch
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


module stopwatch(
    input CLK,BTNU, BTND, BTNL,BTNR,
    input clk1k,
    input [12:0] pixel,
    output [15:0] watch_oled_data,
    output reg [3:0] an,
    output reg [7:0] min0,
    output reg [7:0] min1,
    output reg [7:0] sec0,
    output reg [7:0] sec1
    );
    `include "constants.vh"
    

    //BTNU: start
    //BTND: stop
    //BTNL: lapse
    //BTNR: reset
    
    reg [3:0] min0Count = 0, min1Count = 0, sec0Count = 0, sec1Count = 0, hunCount = 0;
    reg [31:0] count;
    reg clk100hz = 0;
    reg start = 0;
    reg [1:0] lapse = 0;
    reg [19:0] lapsed1 = 0, lapsed2 = 0, lapsed3 = 0;
    reg lapse_changed = 0;
    
    
    always @(posedge clk1k) 
    begin
        count <= (count == 4) ? 0 : count + 1;
        clk100hz <= (count == 0) ? ~clk100hz : clk100hz;
    end
    
    always @ (posedge CLK)
    begin
        lapse_changed = 0;
        if (BTNU == 1) begin
            start = 1;
        end
        if (BTND == 1) begin
            start = 0;
        end
        if (BTNR == 1) begin
            start = 0;
            lapse = 0;
            lapse_changed = 1;
        end
        if (BTNL) begin
            //lapse <= 3 ? 1 : lapse + 1;
            if (lapse == 3 ) begin
                lapse <= 1;
                lapse_changed = 1;
            end
            else begin
                lapse = lapse + 1;
                lapse_changed = 1;
            end
        end
    end
    
    
    always @ (posedge CLK) 
    begin
        if (lapse_changed == 1)
        begin
            if (lapse == 0) 
            begin
                lapsed1 = 0;
                lapsed2 = 0;
                lapsed3 = 0;
            end
            else if (lapse == 1) 
            begin
                lapsed1 = {{hunCount}, {min0Count}, {min1Count}, {sec0Count}, {sec1Count}};
            end
            else if (lapse == 2) 
            begin
                lapsed2 = {{hunCount}, {min0Count}, {min1Count}, {sec0Count}, {sec1Count}};
            end
            else if (lapse == 3) 
            begin
                lapsed3 = {{hunCount}, {min0Count}, {min1Count}, {sec0Count}, {sec1Count}};
            end
        end
    end
    
    show_lapsed(CLK, lapsed1, lapsed2, lapsed3, pixel, watch_oled_data);
    
    always @ (posedge clk100hz)
    begin
        if (start == 1)
        begin
            if (sec1Count == 9)
            begin
                sec1Count = 0;
                sec0Count = sec0Count + 1;
            end
            else 
            begin
                sec1Count = sec1Count + 1;
            end
            
            if (sec0Count == 10)
            begin
                sec0Count = 0;
                min1Count = min1Count + 1;
            end
            
            if (min1Count == 10)
            begin
                min1Count = 0;
                min0Count = min0Count + 1;
            end
            else 
            
            if (min0Count == 10)
            begin
                min0Count = 0;
                hunCount = hunCount + 1;
            end
            
            if (hunCount == 10)
            begin
                hunCount = 0;
            end
        end
        
        if (BTNR == 1) 
        begin
            sec1Count = 0; sec0Count = 0;
            min1Count = 0; min0Count = 0;
            hunCount = 0;
        end
    end
    
    always @ (posedge CLK)
    begin
        case (min0Count)
        0: min0 <= `SEG_0;
        1: min0 <= `SEG_1;
        2: min0 <= `SEG_2;
        3: min0 <= `SEG_3;
        4: min0 <= `SEG_4;
        5: min0 <= `SEG_5;
        6: min0 <= `SEG_6;
        7: min0 <= `SEG_7;
        8: min0 <= `SEG_8;
        9: min0 <= `SEG_9;
        default: min0 <= `SEG_0;
        endcase
        
        case (min1Count)
        0: min1 <= `SEG_0;
        1: min1 <= `SEG_1;
        2: min1 <= `SEG_2;
        3: min1 <= `SEG_3;
        4: min1 <= `SEG_4;
        5: min1 <= `SEG_5;
        6: min1 <= `SEG_6;
        7: min1 <= `SEG_7;
        8: min1 <= `SEG_8;
        9: min1 <= `SEG_9;
        default: min1 <= `SEG_0;
        endcase
        
        case (sec0Count)
        0: sec0 <= `SEG_0;
        1: sec0 <= `SEG_1;
        2: sec0 <= `SEG_2;
        3: sec0 <= `SEG_3;
        4: sec0 <= `SEG_4;
        5: sec0 <= `SEG_5;
        6: sec0 <= `SEG_6;
        7: sec0 <= `SEG_7;
        8: sec0 <= `SEG_8;
        9: sec0 <= `SEG_9;
        default: sec0 <= `SEG_0;
        endcase
        
        case (sec1Count)
        0: sec1 <= `SEG_0;
        1: sec1 <= `SEG_1;
        2: sec1 <= `SEG_2;
        3: sec1 <= `SEG_3;
        4: sec1 <= `SEG_4;
        5: sec1 <= `SEG_5;
        6: sec1 <= `SEG_6;
        7: sec1 <= `SEG_7;
        8: sec1 <= `SEG_8;
        9: sec1 <= `SEG_9;
        default: sec1 <= `SEG_0;
        endcase
    end
endmodule
