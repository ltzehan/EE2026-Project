`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.10.2022 13:49:36
// Design Name: 
// Module Name: sine_gen
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


module sine_gen(
    input CLK,
    output reg [11:0] out=0
    );
    
    parameter SIZE = 1024;
    
    reg [11:0] sine_mem [SIZE-1:0];
    initial
        $readmemh("sine_770hz.mem", sine_mem);
        
    reg [31:0] i = 0;
    always @(posedge CLK) begin
        out <= sine_mem[i];
        i <= (i == SIZE) ? 0 : i+1; 
    end
    
endmodule
