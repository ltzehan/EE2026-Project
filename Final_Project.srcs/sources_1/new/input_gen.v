`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.10.2022 12:50:44
// Design Name: 
// Module Name: input_gen
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


module input_gen(
    input CLK,
    output reg [11:0] out=0
    );
    
    parameter SIZE = 1024;
    
    reg [11:0] input_mem [SIZE-1:0];
    initial
        $readmemh("input.mem", input_mem);
        
    reg [31:0] i = 0;
    always @(posedge CLK) begin
        out <= input_mem[i];
        i <= (i == SIZE) ? 0 : i+1; 
    end
    
endmodule
