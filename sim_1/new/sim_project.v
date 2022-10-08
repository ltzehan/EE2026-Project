`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.09.2022 14:36:15
// Design Name: 
// Module Name: sim_project
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


module sim_project(
    );
    
    // 100 MHz clock
    reg CLK;
    
    initial begin
        CLK <= 0;
    end
    always begin
        #5 CLK <= ~CLK;
    end
    
    reg x, y
    
endmodule
