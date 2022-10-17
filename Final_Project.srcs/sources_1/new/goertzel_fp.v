`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2022 11:42:07
// Design Name: 
// Module Name: goertzel_fp
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

// Convert microphone input to fixed-point representation
module goertzel_fp #(
    parameter B=61
    ) (
    input CLK,
    input RST,
    input EN,
    input [11:0] mic,
    output reg signed [B-1:0] x=0,
    output reg x_ready=0
    );

    always @(posedge CLK or posedge RST) begin
        x_ready <= 0;
        if (RST) begin
            x <= 0;
        end
        else if (EN) begin
            // Sign bit is always 0 (mic. input is unsigned)
            // Normalize input (x / 2^12) and clear integer part + pad lower bits of decimal part 
//            x <= {1'b0, {B_PART{1'b0}}, mic[11:0], {(B_PART-12){1'b0}}};
            x <= {31'b0, mic, 18'b0};
            x_ready <= 1;
        end
    end
    
endmodule
