`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.10.2022 18:26:01
// Design Name: 
// Module Name: sim_goertzel
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


module sim_goertzel(
    );
    
    // 100MHz clock
    reg CLK = 0;
    always begin
        #5 CLK <= ~CLK;
    end
    
    reg RST = 0;
    reg [11:0] mic = 0;
    wire [60:0] y1;
    wire [60:0] y2;
    goertzel goertzel(CLK, RST, mic, y1, y2); 
    
endmodule
