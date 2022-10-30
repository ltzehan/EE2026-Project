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
    input input_seg,
    input btnC,
    output reg locked=0,
    output [6:0] seg,
    output [3:0] an
    );
    
    /**
     *  Locking logic
     */
    reg [1:0] char_idx = 0;
    reg [6:0] char0 = `SEG_BLANK;
    reg [6:0] char1 = `SEG_BLANK;
    reg [6:0] char2 = `SEG_BLANK;
    reg [6:0] char3 = `SEG_BLANK;
    segment_map(CLK, char0, char1, char2, char3, seg, an);
    
    always @(posedge CLK) begin
        if (locking && input_valid) begin
            if (char_idx == 0)
                char0 <= input_seg;
            else if (char_idx == 1)
                char1 <= input_seg;
            else if (char_idx == 2)
                char2 <= input_seg;
            else if (char_idx == 3) begin
                char3 <= input_seg;
                locked <= 1;
            end
        
            char_idx <= (char_idx == 3) ? 3 : char_idx + 1;
        end
    end
    
    /**
     *  Unlocking logic
     */
    always @(posedge CLK) begin
        if (unlocking) begin
            if (btnC) locked <= 0;
        end
    end
    
endmodule
