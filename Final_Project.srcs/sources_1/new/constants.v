`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.10.2022 12:33:47
// Design Name: 
// Module Name: constants
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

`ifndef _constants_h_
`define _constants_h_

//
//  OLED Properties
//


localparam OLED_W = 96;
localparam OLED_H = 64;

//
//  OLED Colours
//

localparam OLED_RED        = {{5{1'b1}}, {11{1'b0}}}; 
localparam OLED_ORANGE     = {{5{1'b1}}, 6'b101001, {5{1'b0}}}; 
localparam OLED_GREEN      = {{5{1'b0}}, {6{1'b1}}, {5{1'b0}}};
localparam OLED_BLACK      = {16{1'b0}};
localparam OLED_WHITE      = {16{1'b1}};

//
//  Menu states
//

localparam MENU_INACTIVE   = 0;
localparam MENU_OLED_A     = 1;
localparam MENU_OLED_B     = 2;
localparam MENU_AVI        = 3;
localparam MENU_DTMF       = 4;

//
//  7-segment
//

localparam SEG_BLANK   = 7'b1111111; 
localparam SEG_A       = 7'b0001000;
localparam SEG_B       = 7'b0000011;
localparam SEG_C       = 7'b0100111;
localparam SEG_D       = 7'b0100001;
localparam SEG_F       = 7'b0001110;
localparam SEG_M       = 7'b0101010;
localparam SEG_T       = 7'b0000111;
localparam SEG_4       = 7'b0011001;

`endif // _constants_h_