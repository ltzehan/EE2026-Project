`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.10.2022 15:01:38
// Design Name: 
// Module Name: goertzel_val
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


module goertzel_val(
    output signed [31:0] val
    );
    
    // Number of samples
    parameter N = 283;
    // Frequency bin (0 <= k <= N-1)
    parameter k = 0;
    
    // Load values of 2*cos(w_k)
    reg signed [31:0] val_arr [N-1:0];
    initial begin
        val_arr[0] <= 32'h00010000;
        val_arr[1] <= 32'h0000FFEF; 
        val_arr[2] <= 32'h0000FFBF; 
        val_arr[3] <= 32'h0000FF6E; 
        val_arr[4] <= 32'h0000FEFD; 
        val_arr[5] <= 32'h0000FE6C; 
        val_arr[6] <= 32'h0000FDBB; 
        val_arr[7] <= 32'h0000FCEA; 
        val_arr[8] <= 32'h0000FBF8; 
        val_arr[9] <= 32'h0000FAE8; 
        val_arr[10] <= 32'h0000F9B7;
        val_arr[11] <= 32'h0000F867;
        val_arr[12] <= 32'h0000F6F7;
        val_arr[13] <= 32'h0000F569;
        val_arr[14] <= 32'h0000F3BB;
        val_arr[15] <= 32'h0000F1EF;
        val_arr[16] <= 32'h0000F004;
        val_arr[17] <= 32'h0000EDFB;
        val_arr[18] <= 32'h0000EBD3;
        val_arr[19] <= 32'h0000E98E;
        val_arr[20] <= 32'h0000E72C;
        val_arr[21] <= 32'h0000E4AC;
        val_arr[22] <= 32'h0000E210;
        val_arr[23] <= 32'h0000DF57;
        val_arr[24] <= 32'h0000DC82;
        val_arr[25] <= 32'h0000D991;
        val_arr[26] <= 32'h0000D684;
        val_arr[27] <= 32'h0000D35D;
        val_arr[28] <= 32'h0000D01B;
        val_arr[29] <= 32'h0000CCBE;
        val_arr[30] <= 32'h0000C948;
        val_arr[31] <= 32'h0000C5B8;
        val_arr[32] <= 32'h0000C210;
        val_arr[33] <= 32'h0000BE4E;
        val_arr[34] <= 32'h0000BA75;
        val_arr[35] <= 32'h0000B685;
        val_arr[36] <= 32'h0000B27D;
        val_arr[37] <= 32'h0000AE5F;
        val_arr[38] <= 32'h0000AA2B;
        val_arr[39] <= 32'h0000A5E1;
        val_arr[40] <= 32'h0000A182;
        val_arr[41] <= 32'h00009D0F;
        val_arr[42] <= 32'h00009888;
        val_arr[43] <= 32'h000093EE;
        val_arr[44] <= 32'h00008F42;
        val_arr[45] <= 32'h00008A83;
        val_arr[46] <= 32'h000085B2;
        val_arr[47] <= 32'h000080D1;
        val_arr[48] <= 32'h00007BE0;
        val_arr[49] <= 32'h000076DF;
        val_arr[50] <= 32'h000071CF;
        val_arr[51] <= 32'h00006CB0;
        val_arr[52] <= 32'h00006784;
        val_arr[53] <= 32'h0000624B;
        val_arr[54] <= 32'h00005D05;
        val_arr[55] <= 32'h000057B4;
        val_arr[56] <= 32'h00005258;
        val_arr[57] <= 32'h00004CF1;
        val_arr[58] <= 32'h00004780;
        val_arr[59] <= 32'h00004207;
        val_arr[60] <= 32'h00003C85;
        val_arr[61] <= 32'h000036FC;
        val_arr[62] <= 32'h0000316B;
        val_arr[63] <= 32'h00002BD4;
        val_arr[64] <= 32'h00002638;
        val_arr[65] <= 32'h00002097;
        val_arr[66] <= 32'h00001AF2;
        val_arr[67] <= 32'h0000154A;
        val_arr[68] <= 32'h00000F9E;
        val_arr[69] <= 32'h000009F1;
        val_arr[70] <= 32'h00000443;
        val_arr[71] <= 32'hFFFFFE95;
        val_arr[72] <= 32'hFFFFF8E6;
        val_arr[73] <= 32'hFFFFF338;
        val_arr[74] <= 32'hFFFFED8C;
        val_arr[75] <= 32'hFFFFE7E2;
        val_arr[76] <= 32'hFFFFE23B;
        val_arr[77] <= 32'hFFFFDC98;
        val_arr[78] <= 32'hFFFFD6F9;
        val_arr[79] <= 32'hFFFFD15F;
        val_arr[80] <= 32'hFFFFCBCC;
        val_arr[81] <= 32'hFFFFC63F;
        val_arr[82] <= 32'hFFFFC0B9;
        val_arr[83] <= 32'hFFFFBB3B;
        val_arr[84] <= 32'hFFFFB5C6;
        val_arr[85] <= 32'hFFFFB05A;
        val_arr[86] <= 32'hFFFFAAF9;
        val_arr[87] <= 32'hFFFFA5A2;
        val_arr[88] <= 32'hFFFFA056;
        val_arr[89] <= 32'hFFFF9B17;
        val_arr[90] <= 32'hFFFF95E4;
        val_arr[91] <= 32'hFFFF90BF;
        val_arr[92] <= 32'hFFFF8BA7;
        val_arr[93] <= 32'hFFFF869F;
        val_arr[94] <= 32'hFFFF81A5;
        val_arr[95] <= 32'hFFFF7CBC;
        val_arr[96] <= 32'hFFFF77E3;
        val_arr[97] <= 32'hFFFF731C;
        val_arr[98] <= 32'hFFFF6E66;
        val_arr[99] <= 32'hFFFF69C2;
        val_arr[100] <= 32'hFFFF6532;
        val_arr[101] <= 32'hFFFF60B5;
        val_arr[102] <= 32'hFFFF5C4C;
        val_arr[103] <= 32'hFFFF57F8;
        val_arr[104] <= 32'hFFFF53B9;
        val_arr[105] <= 32'hFFFF4F8F;
        val_arr[106] <= 32'hFFFF4B7C;
        val_arr[107] <= 32'hFFFF4780;
        val_arr[108] <= 32'hFFFF439B;
        val_arr[109] <= 32'hFFFF3FCE;
        val_arr[110] <= 32'hFFFF3C19;
        val_arr[111] <= 32'hFFFF387D;
        val_arr[112] <= 32'hFFFF34FA;
        val_arr[113] <= 32'hFFFF3190;
        val_arr[114] <= 32'hFFFF2E41;
        val_arr[115] <= 32'hFFFF2B0C;
        val_arr[116] <= 32'hFFFF27F2;
        val_arr[117] <= 32'hFFFF24F3;
        val_arr[118] <= 32'hFFFF2210;
        val_arr[119] <= 32'hFFFF1F49;
        val_arr[120] <= 32'hFFFF1C9E;
        val_arr[121] <= 32'hFFFF1A10;
        val_arr[122] <= 32'hFFFF179F;
        val_arr[123] <= 32'hFFFF154B;
        val_arr[124] <= 32'hFFFF1315;
        val_arr[125] <= 32'hFFFF10FD;
        val_arr[126] <= 32'hFFFF0F03;
        val_arr[127] <= 32'hFFFF0D27;
        val_arr[128] <= 32'hFFFF0B6A;
        val_arr[129] <= 32'hFFFF09CC;
        val_arr[130] <= 32'hFFFF084D;
        val_arr[131] <= 32'hFFFF06ED;
        val_arr[132] <= 32'hFFFF05AD;
        val_arr[133] <= 32'hFFFF048C;
        val_arr[134] <= 32'hFFFF038B;
        val_arr[135] <= 32'hFFFF02AA;
        val_arr[136] <= 32'hFFFF01E9;
        val_arr[137] <= 32'hFFFF0147;
        val_arr[138] <= 32'hFFFF00C6;
        val_arr[139] <= 32'hFFFF0065;
        val_arr[140] <= 32'hFFFF0025;
        val_arr[141] <= 32'hFFFF0005;
        val_arr[142] <= 32'hFFFF0005;
        val_arr[143] <= 32'hFFFF0025;
        val_arr[144] <= 32'hFFFF0065;
        val_arr[145] <= 32'hFFFF00C6;
        val_arr[146] <= 32'hFFFF0147;
        val_arr[147] <= 32'hFFFF01E9;
        val_arr[148] <= 32'hFFFF02AA;
        val_arr[149] <= 32'hFFFF038B;
        val_arr[150] <= 32'hFFFF048C;
        val_arr[151] <= 32'hFFFF05AD;
        val_arr[152] <= 32'hFFFF06ED;
        val_arr[153] <= 32'hFFFF084D;
        val_arr[154] <= 32'hFFFF09CC;
        val_arr[155] <= 32'hFFFF0B6A;
        val_arr[156] <= 32'hFFFF0D27;
        val_arr[157] <= 32'hFFFF0F03;
        val_arr[158] <= 32'hFFFF10FD;
        val_arr[159] <= 32'hFFFF1315;
        val_arr[160] <= 32'hFFFF154B;
        val_arr[161] <= 32'hFFFF179F;
        val_arr[162] <= 32'hFFFF1A10;
        val_arr[163] <= 32'hFFFF1C9E;
        val_arr[164] <= 32'hFFFF1F49;
        val_arr[165] <= 32'hFFFF2210;
        val_arr[166] <= 32'hFFFF24F3;
        val_arr[167] <= 32'hFFFF27F2;
        val_arr[168] <= 32'hFFFF2B0C;
        val_arr[169] <= 32'hFFFF2E41;
        val_arr[170] <= 32'hFFFF3190;
        val_arr[171] <= 32'hFFFF34FA;
        val_arr[172] <= 32'hFFFF387D;
        val_arr[173] <= 32'hFFFF3C19;
        val_arr[174] <= 32'hFFFF3FCE;
        val_arr[175] <= 32'hFFFF439B;
        val_arr[176] <= 32'hFFFF4780;
        val_arr[177] <= 32'hFFFF4B7C;
        val_arr[178] <= 32'hFFFF4F8F;
        val_arr[179] <= 32'hFFFF53B9;
        val_arr[180] <= 32'hFFFF57F8;
        val_arr[181] <= 32'hFFFF5C4C;
        val_arr[182] <= 32'hFFFF60B5;
        val_arr[183] <= 32'hFFFF6532;
        val_arr[184] <= 32'hFFFF69C2;
        val_arr[185] <= 32'hFFFF6E66;
        val_arr[186] <= 32'hFFFF731C;
        val_arr[187] <= 32'hFFFF77E3;
        val_arr[188] <= 32'hFFFF7CBC;
        val_arr[189] <= 32'hFFFF81A5;
        val_arr[190] <= 32'hFFFF869F;
        val_arr[191] <= 32'hFFFF8BA7;
        val_arr[192] <= 32'hFFFF90BF;
        val_arr[193] <= 32'hFFFF95E4;
        val_arr[194] <= 32'hFFFF9B17;
        val_arr[195] <= 32'hFFFFA056;
        val_arr[196] <= 32'hFFFFA5A2;
        val_arr[197] <= 32'hFFFFAAF9;
        val_arr[198] <= 32'hFFFFB05A;
        val_arr[199] <= 32'hFFFFB5C6;
        val_arr[200] <= 32'hFFFFBB3B;
        val_arr[201] <= 32'hFFFFC0B9;
        val_arr[202] <= 32'hFFFFC63F;
        val_arr[203] <= 32'hFFFFCBCC;
        val_arr[204] <= 32'hFFFFD15F;
        val_arr[205] <= 32'hFFFFD6F9;
        val_arr[206] <= 32'hFFFFDC98;
        val_arr[207] <= 32'hFFFFE23B;
        val_arr[208] <= 32'hFFFFE7E2;
        val_arr[209] <= 32'hFFFFED8C;
        val_arr[210] <= 32'hFFFFF338;
        val_arr[211] <= 32'hFFFFF8E6;
        val_arr[212] <= 32'hFFFFFE95;
        val_arr[213] <= 32'h00000443;
        val_arr[214] <= 32'h000009F1;
        val_arr[215] <= 32'h00000F9E;
        val_arr[216] <= 32'h0000154A;
        val_arr[217] <= 32'h00001AF2;
        val_arr[218] <= 32'h00002097;
        val_arr[219] <= 32'h00002638;
        val_arr[220] <= 32'h00002BD4;
        val_arr[221] <= 32'h0000316B;
        val_arr[222] <= 32'h000036FC;
        val_arr[223] <= 32'h00003C85;
        val_arr[224] <= 32'h00004207;
        val_arr[225] <= 32'h00004780;
        val_arr[226] <= 32'h00004CF1;
        val_arr[227] <= 32'h00005258;
        val_arr[228] <= 32'h000057B4;
        val_arr[229] <= 32'h00005D05;
        val_arr[230] <= 32'h0000624B;
        val_arr[231] <= 32'h00006784;
        val_arr[232] <= 32'h00006CB0;
        val_arr[233] <= 32'h000071CF;
        val_arr[234] <= 32'h000076DF;
        val_arr[235] <= 32'h00007BE0;
        val_arr[236] <= 32'h000080D1;
        val_arr[237] <= 32'h000085B2;
        val_arr[238] <= 32'h00008A83;
        val_arr[239] <= 32'h00008F42;
        val_arr[240] <= 32'h000093EE;
        val_arr[241] <= 32'h00009888;
        val_arr[242] <= 32'h00009D0F;
        val_arr[243] <= 32'h0000A182;
        val_arr[244] <= 32'h0000A5E1;
        val_arr[245] <= 32'h0000AA2B;
        val_arr[246] <= 32'h0000AE5F;
        val_arr[247] <= 32'h0000B27D;
        val_arr[248] <= 32'h0000B685;
        val_arr[249] <= 32'h0000BA75;
        val_arr[250] <= 32'h0000BE4E;
        val_arr[251] <= 32'h0000C210;
        val_arr[252] <= 32'h0000C5B8;
        val_arr[253] <= 32'h0000C948;
        val_arr[254] <= 32'h0000CCBE;
        val_arr[255] <= 32'h0000D01B;
        val_arr[256] <= 32'h0000D35D;
        val_arr[257] <= 32'h0000D684;
        val_arr[258] <= 32'h0000D991;
        val_arr[259] <= 32'h0000DC82;
        val_arr[260] <= 32'h0000DF57;
        val_arr[261] <= 32'h0000E210;
        val_arr[262] <= 32'h0000E4AC;
        val_arr[263] <= 32'h0000E72C;
        val_arr[264] <= 32'h0000E98E;
        val_arr[265] <= 32'h0000EBD3;
        val_arr[266] <= 32'h0000EDFB;
        val_arr[267] <= 32'h0000F004;
        val_arr[268] <= 32'h0000F1EF;
        val_arr[269] <= 32'h0000F3BB;
        val_arr[270] <= 32'h0000F569;
        val_arr[271] <= 32'h0000F6F7;
        val_arr[272] <= 32'h0000F867;
        val_arr[273] <= 32'h0000F9B7;
        val_arr[274] <= 32'h0000FAE8;
        val_arr[275] <= 32'h0000FBF8;
        val_arr[276] <= 32'h0000FCEA;
        val_arr[277] <= 32'h0000FDBB;
        val_arr[278] <= 32'h0000FE6C;
        val_arr[279] <= 32'h0000FEFD;
        val_arr[280] <= 32'h0000FF6E;
        val_arr[281] <= 32'h0000FFBF;
        val_arr[282] <= 32'h0000FFEF;
    //        $readmemh("val.mem", val_arr, 0, N-1);
    end
        
    assign val = val_arr[k];
    
endmodule
