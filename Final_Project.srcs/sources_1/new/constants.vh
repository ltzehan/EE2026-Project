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

`define OLED_W   96
`define OLED_H   64

//
//  OLED Colours
//

`define OLED_RED          {{5{1'b1}}, {11{1'b0}}} 
`define OLED_ORANGE       {{5{1'b1}}, 6'b101001, {5{1'b0}}} 
`define OLED_GREEN        {{5{1'b0}}, {6{1'b1}}, {5{1'b0}}}
`define OLED_GREEN_50     16'b1000011111110000
`define OLED_GREEN_10     16'b1111011111111110
`define OLED_BLACK        {16{1'b0}}
`define OLED_WHITE        {16{1'b1}}

//
//  Menu states
//

`define MENU_INACTIVE     0
`define MENU_OLED_A       1
`define MENU_OLED_B       2
`define MENU_AVI          3
`define MENU_DTMF         4
`define MENU_MORSE        5

//
//  7-segment
//

`define SEG_BLANK     7'b1111111 
`define SEG_A         7'b0001000
`define SEG_B         7'b0000011
`define SEG_C         7'b0100111
`define SEG_D         7'b0100001
`define SEG_E         7'b0000110
`define SEG_F         7'b0001110
`define SEG_G         7'b1000010
`define SEG_H         7'b0001011
`define SEG_I         7'b1001111
`define SEG_J         7'b1100001
`define SEG_K         7'b0001010
`define SEG_L         7'b1000111
`define SEG_M         7'b1101010
`define SEG_N         7'b1001000
`define SEG_O         7'b0100011
`define SEG_P         7'b0001100
`define SEG_Q         7'b0011000
`define SEG_R         7'b0101111
`define SEG_S         7'b0010010
`define SEG_T         7'b0000111
`define SEG_U         7'b1000001
`define SEG_V         7'b1100011
`define SEG_W         7'b1100010
`define SEG_X         7'b0001001
`define SEG_Y         7'b0010001
`define SEG_Z         7'b1100100

`define SEG_0         7'b1000000
`define SEG_1         7'b1111001
`define SEG_2         7'b0100100
`define SEG_3         7'b0110000
`define SEG_4         7'b0011001
`define SEG_5         7'b0010010
`define SEG_6         7'b0000010
`define SEG_7         7'b1111000
`define SEG_8         7'b0000000
`define SEG_9         7'b0010000
`define SEG_ASTR      7'b0111111
`define SEG_HASH      7'b0001001

`endif // _constants_h_