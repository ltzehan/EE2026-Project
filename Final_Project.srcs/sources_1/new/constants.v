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
localparam OLED_GREEN_50   = 16'b1000011111110000;
localparam OLED_GREEN_10   = 16'b1111011111111110;
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
localparam MENU_MORSE      = 5;

//
//  7-segment
//

localparam SEG_BLANK   = 7'b1111111; 
localparam SEG_A       = 7'b0001000;
localparam SEG_B       = 7'b0000011;
localparam SEG_C       = 7'b0100111;
localparam SEG_D       = 7'b0100001;
localparam SEG_E       = 7'b0000110;
localparam SEG_F       = 7'b0001110;
localparam SEG_G       = 7'b1000010;
localparam SEG_H       = 7'b0001011;
localparam SEG_I       = 7'b1001111;
localparam SEG_J       = 7'b1100001;
localparam SEG_K       = 7'b0001010;
localparam SEG_L       = 7'b1000111;
localparam SEG_M       = 7'b1101010;
localparam SEG_N       = 7'b1001000;
localparam SEG_O       = 7'b0100011;
localparam SEG_P       = 7'b0001100;
localparam SEG_Q       = 7'b0011000;
localparam SEG_R       = 7'b0101111;
localparam SEG_S       = 7'b0010010;
localparam SEG_T       = 7'b0000111;
localparam SEG_U       = 7'b1000001;
localparam SEG_V       = 7'b1100011;
localparam SEG_W       = 7'b1100010;
localparam SEG_X       = 7'b0001001;
localparam SEG_Y       = 7'b0010001;
localparam SEG_Z       = 7'b1100100;

localparam SEG_0       = 7'b1000000;
localparam SEG_1       = 7'b1111001;
localparam SEG_2       = 7'b0100100;
localparam SEG_3       = 7'b0110000;
localparam SEG_4       = 7'b0011001;
localparam SEG_5       = 7'b0010010;
localparam SEG_6       = 7'b0000010;
localparam SEG_7       = 7'b1111000;
localparam SEG_8       = 7'b0000000;
localparam SEG_9       = 7'b0010000;
localparam SEG_ASTR    = 7'b0111111;
localparam SEG_HASH    = 7'b0001001;

`endif // _constants_h_