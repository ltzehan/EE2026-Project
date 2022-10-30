`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.10.2022 22:31:07
// Design Name: 
// Module Name: segment_map
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


module segment_map(
    input CLK,
    input [6:0] char0,
    input [6:0] char1,
    input [6:0] char2,
    input [6:0] char3,
    output reg [6:0] seg,
    output reg [3:0] an
    );

    // 100Hz clock
    wire clk1k;
    fclk #(.khz(1)) clk_1khz(CLK, clk1k);
    
    reg [3:0] led_idx = 0;
    always @(posedge clk1k) begin
        led_idx <= (led_idx == 3) ? 0 : led_idx + 1;
    
        case (led_idx)
            0: begin
                an <= 4'b0111;
                seg <= char0;
            end
            1: begin
                an <= 4'b1011;
                seg <= char1;
            end
            2: begin
                an <= 4'b1101;
                seg <= char2;
            end
            3: begin
                an <= 4'b1110;
                seg <= char3;
            end
        endcase
    end

endmodule