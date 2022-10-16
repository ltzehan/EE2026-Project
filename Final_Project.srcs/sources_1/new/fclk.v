`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.09.2022 14:35:09
// Design Name: 
// Module Name: fclk
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


// Custom clock
module fclk(
    input CLK, // 100 MHz
    output reg out = 0
    );
    
    parameter khz = 20;
    
    // 50% duty cycle
    reg [31:0] ctr = 0;
    reg [31:0] top = (100_000_000 / (2 * khz * 1_000)) - 1;
    always @(posedge CLK) begin
        ctr <= (ctr == top) ? 0 : ctr + 1;
        out <= (ctr == 0) ? ~out : out;
    end
    
endmodule
