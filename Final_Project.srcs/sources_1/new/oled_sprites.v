`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.10.2022 22:03:15
// Design Name: 
// Module Name: oled_sprites
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


module oled_sprites(
    input CLK,
    input [12:0] pixel_index,
    input [12:0] offset,
    input [5:0] symbol,
    output reg active
    );
    
    // Assume no overflow!
    wire [12:0] pixel = pixel_index + offset;
    
    // I love hardcoding things
    always @(posedge CLK) begin
        case (symbol)
        1: // A
            active =
            (pixel == 13'd389) || (pixel == 13'd390) || (pixel == 13'd391) || (pixel == 13'd392) || (pixel == 13'd393) || (pixel == 13'd394) || (pixel == 13'd484) || (pixel == 13'd489) || 
            (pixel == 13'd490) || (pixel == 13'd491) || (pixel == 13'd586) || (pixel == 13'd587) || (pixel == 13'd682) || (pixel == 13'd683) || (pixel == 13'd778) || (pixel == 13'd779) || 
            (pixel == 13'd870) || (pixel == 13'd871) || (pixel == 13'd872) || (pixel == 13'd873) || (pixel == 13'd874) || (pixel == 13'd875) || (pixel == 13'd964) || (pixel == 13'd965) || 
            (pixel == 13'd966) || (pixel == 13'd970) || (pixel == 13'd971) || (pixel == 13'd1060) || (pixel == 13'd1061) || (pixel == 13'd1066) || (pixel == 13'd1067) || (pixel == 13'd1156) || 
            (pixel == 13'd1157) || (pixel == 13'd1161) || (pixel == 13'd1162) || (pixel == 13'd1163) || (pixel == 13'd1253) || (pixel == 13'd1254) || (pixel == 13'd1255) || (pixel == 13'd1256) || 
            (pixel == 13'd1258) || (pixel == 13'd1259);
        2: // B
            active =
            (pixel == 13'd100) || (pixel == 13'd101) || (pixel == 13'd196) || (pixel == 13'd197) || (pixel == 13'd292) || (pixel == 13'd293) || (pixel == 13'd388) || (pixel == 13'd389) || 
            (pixel == 13'd391) || (pixel == 13'd392) || (pixel == 13'd393) || (pixel == 13'd484) || (pixel == 13'd485) || (pixel == 13'd486) || (pixel == 13'd489) || (pixel == 13'd490) || 
            (pixel == 13'd580) || (pixel == 13'd581) || (pixel == 13'd586) || (pixel == 13'd587) || (pixel == 13'd676) || (pixel == 13'd677) || (pixel == 13'd682) || (pixel == 13'd683) || 
            (pixel == 13'd772) || (pixel == 13'd773) || (pixel == 13'd778) || (pixel == 13'd779) || (pixel == 13'd868) || (pixel == 13'd869) || (pixel == 13'd874) || (pixel == 13'd875) || 
            (pixel == 13'd964) || (pixel == 13'd965) || (pixel == 13'd970) || (pixel == 13'd971) || (pixel == 13'd1060) || (pixel == 13'd1061) || (pixel == 13'd1066) || (pixel == 13'd1067) || 
            (pixel == 13'd1156) || (pixel == 13'd1157) || (pixel == 13'd1158) || (pixel == 13'd1161) || (pixel == 13'd1162) || (pixel == 13'd1252) || (pixel == 13'd1253) || (pixel == 13'd1255) || 
            (pixel == 13'd1256) || (pixel == 13'd1257);
        3: // C
            active =
            (pixel == 13'd390) || (pixel == 13'd391) || (pixel == 13'd392) || (pixel == 13'd393) || (pixel == 13'd485) || (pixel == 13'd486) || (pixel == 13'd490) || (pixel == 13'd580) || 
            (pixel == 13'd581) || (pixel == 13'd676) || (pixel == 13'd677) || (pixel == 13'd772) || (pixel == 13'd773) || (pixel == 13'd868) || (pixel == 13'd869) || (pixel == 13'd964) || 
            (pixel == 13'd965) || (pixel == 13'd1060) || (pixel == 13'd1061) || (pixel == 13'd1157) || (pixel == 13'd1158) || (pixel == 13'd1162) || (pixel == 13'd1254) || (pixel == 13'd1255) || 
            (pixel == 13'd1256) || (pixel == 13'd1257);
        4: // D
            active =
            (pixel == 13'd106) || (pixel == 13'd107) || (pixel == 13'd202) || (pixel == 13'd203) || (pixel == 13'd298) || (pixel == 13'd299) || (pixel == 13'd390) || (pixel == 13'd391) || 
            (pixel == 13'd392) || (pixel == 13'd394) || (pixel == 13'd395) || (pixel == 13'd485) || (pixel == 13'd486) || (pixel == 13'd489) || (pixel == 13'd490) || (pixel == 13'd491) || 
            (pixel == 13'd580) || (pixel == 13'd581) || (pixel == 13'd586) || (pixel == 13'd587) || (pixel == 13'd676) || (pixel == 13'd677) || (pixel == 13'd682) || (pixel == 13'd683) || 
            (pixel == 13'd772) || (pixel == 13'd773) || (pixel == 13'd778) || (pixel == 13'd779) || (pixel == 13'd868) || (pixel == 13'd869) || (pixel == 13'd874) || (pixel == 13'd875) || 
            (pixel == 13'd964) || (pixel == 13'd965) || (pixel == 13'd970) || (pixel == 13'd971) || (pixel == 13'd1060) || (pixel == 13'd1061) || (pixel == 13'd1066) || (pixel == 13'd1067) || 
            (pixel == 13'd1157) || (pixel == 13'd1158) || (pixel == 13'd1161) || (pixel == 13'd1162) || (pixel == 13'd1163) || (pixel == 13'd1254) || (pixel == 13'd1255) || (pixel == 13'd1256) || 
            (pixel == 13'd1258) || (pixel == 13'd1259);
        5: // E
            active =
            (pixel == 13'd390) || (pixel == 13'd391) || (pixel == 13'd392) || (pixel == 13'd393) || (pixel == 13'd485) || (pixel == 13'd486) || (pixel == 13'd489) || (pixel == 13'd490) || 
            (pixel == 13'd580) || (pixel == 13'd581) || (pixel == 13'd586) || (pixel == 13'd587) || (pixel == 13'd676) || (pixel == 13'd677) || (pixel == 13'd682) || (pixel == 13'd683) || 
            (pixel == 13'd772) || (pixel == 13'd773) || (pixel == 13'd774) || (pixel == 13'd775) || (pixel == 13'd776) || (pixel == 13'd777) || (pixel == 13'd778) || (pixel == 13'd779) || 
            (pixel == 13'd868) || (pixel == 13'd869) || (pixel == 13'd964) || (pixel == 13'd965) || (pixel == 13'd1060) || (pixel == 13'd1061) || (pixel == 13'd1157) || (pixel == 13'd1158) || 
            (pixel == 13'd1163) || (pixel == 13'd1254) || (pixel == 13'd1255) || (pixel == 13'd1256) || (pixel == 13'd1257) || (pixel == 13'd1258);
        6: // F
            active =
            (pixel == 13'd103) || (pixel == 13'd104) || (pixel == 13'd105) || (pixel == 13'd106) || (pixel == 13'd198) || (pixel == 13'd199) || (pixel == 13'd294) || (pixel == 13'd295) || 
            (pixel == 13'd390) || (pixel == 13'd391) || (pixel == 13'd484) || (pixel == 13'd485) || (pixel == 13'd486) || (pixel == 13'd487) || (pixel == 13'd488) || (pixel == 13'd489) || 
            (pixel == 13'd582) || (pixel == 13'd583) || (pixel == 13'd678) || (pixel == 13'd679) || (pixel == 13'd774) || (pixel == 13'd775) || (pixel == 13'd870) || (pixel == 13'd871) || 
            (pixel == 13'd966) || (pixel == 13'd967) || (pixel == 13'd1062) || (pixel == 13'd1063) || (pixel == 13'd1158) || (pixel == 13'd1159) || (pixel == 13'd1254) || (pixel == 13'd1255); 
        7: // G
            active =
            (pixel == 13'd294) || (pixel == 13'd295) || (pixel == 13'd296) || (pixel == 13'd297) || (pixel == 13'd298) || (pixel == 13'd299) || (pixel == 13'd389) || (pixel == 13'd390) || 
            (pixel == 13'd393) || (pixel == 13'd394) || (pixel == 13'd484) || (pixel == 13'd485) || (pixel == 13'd489) || (pixel == 13'd490) || (pixel == 13'd580) || (pixel == 13'd581) || 
            (pixel == 13'd585) || (pixel == 13'd586) || (pixel == 13'd677) || (pixel == 13'd678) || (pixel == 13'd680) || (pixel == 13'd681) || (pixel == 13'd772) || (pixel == 13'd773) || 
            (pixel == 13'd774) || (pixel == 13'd775) || (pixel == 13'd776) || (pixel == 13'd867) || (pixel == 13'd868) || (pixel == 13'd963) || (pixel == 13'd964) || (pixel == 13'd965) || 
            (pixel == 13'd966) || (pixel == 13'd967) || (pixel == 13'd968) || (pixel == 13'd969) || (pixel == 13'd970) || (pixel == 13'd1060) || (pixel == 13'd1061) || (pixel == 13'd1066) || 
            (pixel == 13'd1067) || (pixel == 13'd1155) || (pixel == 13'd1156) || (pixel == 13'd1162) || (pixel == 13'd1163) || (pixel == 13'd1251) || (pixel == 13'd1252) || (pixel == 13'd1258) || 
            (pixel == 13'd1259) || (pixel == 13'd1347) || (pixel == 13'd1348) || (pixel == 13'd1349) || (pixel == 13'd1353) || (pixel == 13'd1354) || (pixel == 13'd1444) || (pixel == 13'd1445) || 
            (pixel == 13'd1446) || (pixel == 13'd1447) || (pixel == 13'd1448) || (pixel == 13'd1449);
        8: // H 
            active =
            (pixel == 13'd100) || (pixel == 13'd101) || (pixel == 13'd196) || (pixel == 13'd197) || (pixel == 13'd292) || (pixel == 13'd293) || (pixel == 13'd388) || (pixel == 13'd389) || 
            (pixel == 13'd484) || (pixel == 13'd485) || (pixel == 13'd487) || (pixel == 13'd488) || (pixel == 13'd489) || (pixel == 13'd490) || (pixel == 13'd580) || (pixel == 13'd581) || 
            (pixel == 13'd582) || (pixel == 13'd585) || (pixel == 13'd586) || (pixel == 13'd587) || (pixel == 13'd676) || (pixel == 13'd677) || (pixel == 13'd682) || (pixel == 13'd683) || 
            (pixel == 13'd772) || (pixel == 13'd773) || (pixel == 13'd778) || (pixel == 13'd779) || (pixel == 13'd868) || (pixel == 13'd869) || (pixel == 13'd874) || (pixel == 13'd875) || 
            (pixel == 13'd964) || (pixel == 13'd965) || (pixel == 13'd970) || (pixel == 13'd971) || (pixel == 13'd1060) || (pixel == 13'd1061) || (pixel == 13'd1066) || (pixel == 13'd1067) || 
            (pixel == 13'd1156) || (pixel == 13'd1157) || (pixel == 13'd1162) || (pixel == 13'd1163) || (pixel == 13'd1252) || (pixel == 13'd1253) || (pixel == 13'd1258) || (pixel == 13'd1259);
        9: // I
            active =
            (pixel == 13'd103) || (pixel == 13'd104) || (pixel == 13'd199) || (pixel == 13'd200) || (pixel == 13'd487) || (pixel == 13'd488) || (pixel == 13'd583) || (pixel == 13'd584) || 
            (pixel == 13'd679) || (pixel == 13'd680) || (pixel == 13'd775) || (pixel == 13'd776) || (pixel == 13'd871) || (pixel == 13'd872) || (pixel == 13'd967) || (pixel == 13'd968) || 
            (pixel == 13'd1063) || (pixel == 13'd1064) || (pixel == 13'd1159) || (pixel == 13'd1160) || (pixel == 13'd1255) || (pixel == 13'd1256);
        10: // J
            active =
            (pixel == 13'd200) || (pixel == 13'd201) || (pixel == 13'd296) || (pixel == 13'd297) || (pixel == 13'd584) || (pixel == 13'd585) || (pixel == 13'd680) || (pixel == 13'd681) || 
            (pixel == 13'd776) || (pixel == 13'd777) || (pixel == 13'd872) || (pixel == 13'd873) || (pixel == 13'd968) || (pixel == 13'd969) || (pixel == 13'd1064) || (pixel == 13'd1065) || 
            (pixel == 13'd1160) || (pixel == 13'd1161) || (pixel == 13'd1256) || (pixel == 13'd1257) || (pixel == 13'd1352) || (pixel == 13'd1353) || (pixel == 13'd1446) || (pixel == 13'd1447) || 
            (pixel == 13'd1448);
        11: // K
            active =
            (pixel == 13'd100) || (pixel == 13'd101) || (pixel == 13'd196) || (pixel == 13'd197) || (pixel == 13'd292) || (pixel == 13'd293) || (pixel == 13'd388) || (pixel == 13'd389) || 
            (pixel == 13'd394) || (pixel == 13'd395) || (pixel == 13'd484) || (pixel == 13'd485) || (pixel == 13'd489) || (pixel == 13'd490) || (pixel == 13'd580) || (pixel == 13'd581) || 
            (pixel == 13'd584) || (pixel == 13'd585) || (pixel == 13'd676) || (pixel == 13'd677) || (pixel == 13'd679) || (pixel == 13'd680) || (pixel == 13'd772) || (pixel == 13'd773) || 
            (pixel == 13'd774) || (pixel == 13'd775) || (pixel == 13'd868) || (pixel == 13'd869) || (pixel == 13'd871) || (pixel == 13'd872) || (pixel == 13'd964) || (pixel == 13'd965) || 
            (pixel == 13'd968) || (pixel == 13'd969) || (pixel == 13'd1060) || (pixel == 13'd1061) || (pixel == 13'd1064) || (pixel == 13'd1065) || (pixel == 13'd1156) || (pixel == 13'd1157) || 
            (pixel == 13'd1161) || (pixel == 13'd1162) || (pixel == 13'd1252) || (pixel == 13'd1253) || (pixel == 13'd1258) || (pixel == 13'd1259);
        12: // L
            active =
            (pixel == 13'd103) || (pixel == 13'd104) || (pixel == 13'd199) || (pixel == 13'd200) || (pixel == 13'd295) || (pixel == 13'd296) || (pixel == 13'd391) || (pixel == 13'd392) || 
            (pixel == 13'd487) || (pixel == 13'd488) || (pixel == 13'd583) || (pixel == 13'd584) || (pixel == 13'd679) || (pixel == 13'd680) || (pixel == 13'd775) || (pixel == 13'd776) || 
            (pixel == 13'd871) || (pixel == 13'd872) || (pixel == 13'd967) || (pixel == 13'd968) || (pixel == 13'd1063) || (pixel == 13'd1064) || (pixel == 13'd1159) || (pixel == 13'd1160) || 
            (pixel == 13'd1255) || (pixel == 13'd1256) || (pixel == 13'd1351) || (pixel == 13'd1352);
        13: // M
            active =
            (pixel == 13'd385) || (pixel == 13'd386) || (pixel == 13'd388) || (pixel == 13'd389) || (pixel == 13'd390) || (pixel == 13'd391) || (pixel == 13'd394) || (pixel == 13'd395) || 
            (pixel == 13'd396) || (pixel == 13'd397) || (pixel == 13'd481) || (pixel == 13'd482) || (pixel == 13'd483) || (pixel == 13'd486) || (pixel == 13'd487) || (pixel == 13'd488) || 
            (pixel == 13'd489) || (pixel == 13'd492) || (pixel == 13'd493) || (pixel == 13'd494) || (pixel == 13'd577) || (pixel == 13'd578) || (pixel == 13'd583) || (pixel == 13'd584) || 
            (pixel == 13'd589) || (pixel == 13'd590) || (pixel == 13'd673) || (pixel == 13'd674) || (pixel == 13'd679) || (pixel == 13'd680) || (pixel == 13'd685) || (pixel == 13'd686) || 
            (pixel == 13'd769) || (pixel == 13'd770) || (pixel == 13'd775) || (pixel == 13'd776) || (pixel == 13'd781) || (pixel == 13'd782) || (pixel == 13'd865) || (pixel == 13'd866) || 
            (pixel == 13'd871) || (pixel == 13'd872) || (pixel == 13'd877) || (pixel == 13'd878) || (pixel == 13'd961) || (pixel == 13'd962) || (pixel == 13'd967) || (pixel == 13'd968) || 
            (pixel == 13'd973) || (pixel == 13'd974) || (pixel == 13'd1057) || (pixel == 13'd1058) || (pixel == 13'd1063) || (pixel == 13'd1064) || (pixel == 13'd1069) || (pixel == 13'd1070) || 
            (pixel == 13'd1153) || (pixel == 13'd1154) || (pixel == 13'd1159) || (pixel == 13'd1160) || (pixel == 13'd1165) || (pixel == 13'd1166) || (pixel == 13'd1249) || (pixel == 13'd1250) || 
            (pixel == 13'd1255) || (pixel == 13'd1256) || (pixel == 13'd1261) || (pixel == 13'd1262);
        14: // N
            active =
            (pixel == 13'd388) || (pixel == 13'd389) || (pixel == 13'd391) || (pixel == 13'd392) || (pixel == 13'd393) || (pixel == 13'd394) || (pixel == 13'd484) || (pixel == 13'd485) || 
            (pixel == 13'd486) || (pixel == 13'd489) || (pixel == 13'd490) || (pixel == 13'd491) || (pixel == 13'd580) || (pixel == 13'd581) || (pixel == 13'd586) || (pixel == 13'd587) || 
            (pixel == 13'd676) || (pixel == 13'd677) || (pixel == 13'd682) || (pixel == 13'd683) || (pixel == 13'd772) || (pixel == 13'd773) || (pixel == 13'd778) || (pixel == 13'd779) || 
            (pixel == 13'd868) || (pixel == 13'd869) || (pixel == 13'd874) || (pixel == 13'd875) || (pixel == 13'd964) || (pixel == 13'd965) || (pixel == 13'd970) || (pixel == 13'd971) || 
            (pixel == 13'd1060) || (pixel == 13'd1061) || (pixel == 13'd1066) || (pixel == 13'd1067) || (pixel == 13'd1156) || (pixel == 13'd1157) || (pixel == 13'd1162) || (pixel == 13'd1163) || 
            (pixel == 13'd1252) || (pixel == 13'd1253) || (pixel == 13'd1258) || (pixel == 13'd1259);
        15: // O
            active =
            (pixel == 13'd390) || (pixel == 13'd391) || (pixel == 13'd392) || (pixel == 13'd393) || (pixel == 13'd394) || (pixel == 13'd485) || (pixel == 13'd486) || (pixel == 13'd490) || 
            (pixel == 13'd491) || (pixel == 13'd580) || (pixel == 13'd581) || (pixel == 13'd587) || (pixel == 13'd588) || (pixel == 13'd676) || (pixel == 13'd677) || (pixel == 13'd683) || 
            (pixel == 13'd684) || (pixel == 13'd772) || (pixel == 13'd773) || (pixel == 13'd779) || (pixel == 13'd780) || (pixel == 13'd868) || (pixel == 13'd869) || (pixel == 13'd875) || 
            (pixel == 13'd876) || (pixel == 13'd964) || (pixel == 13'd965) || (pixel == 13'd971) || (pixel == 13'd972) || (pixel == 13'd1060) || (pixel == 13'd1061) || (pixel == 13'd1067) || 
            (pixel == 13'd1068) || (pixel == 13'd1157) || (pixel == 13'd1158) || (pixel == 13'd1162) || (pixel == 13'd1163) || (pixel == 13'd1254) || (pixel == 13'd1255) || (pixel == 13'd1256) || 
            (pixel == 13'd1257) || (pixel == 13'd1258);
        16: // P
            active =
            (pixel == 13'd196) || (pixel == 13'd197) || (pixel == 13'd199) || (pixel == 13'd200) || (pixel == 13'd201) || (pixel == 13'd292) || (pixel == 13'd293) || (pixel == 13'd294) || 
            (pixel == 13'd297) || (pixel == 13'd298) || (pixel == 13'd388) || (pixel == 13'd389) || (pixel == 13'd394) || (pixel == 13'd395) || (pixel == 13'd484) || (pixel == 13'd485) || 
            (pixel == 13'd490) || (pixel == 13'd491) || (pixel == 13'd580) || (pixel == 13'd581) || (pixel == 13'd586) || (pixel == 13'd587) || (pixel == 13'd676) || (pixel == 13'd677) || 
            (pixel == 13'd682) || (pixel == 13'd683) || (pixel == 13'd772) || (pixel == 13'd773) || (pixel == 13'd778) || (pixel == 13'd779) || (pixel == 13'd868) || (pixel == 13'd869) || 
            (pixel == 13'd874) || (pixel == 13'd875) || (pixel == 13'd964) || (pixel == 13'd965) || (pixel == 13'd966) || (pixel == 13'd969) || (pixel == 13'd970) || (pixel == 13'd1060) || 
            (pixel == 13'd1061) || (pixel == 13'd1063) || (pixel == 13'd1064) || (pixel == 13'd1065) || (pixel == 13'd1156) || (pixel == 13'd1157) || (pixel == 13'd1252) || (pixel == 13'd1253) || 
            (pixel == 13'd1348) || (pixel == 13'd1349) || (pixel == 13'd1444) || (pixel == 13'd1445); 
        17: // Q
            active =
            (pixel == 13'd294) || (pixel == 13'd295) || (pixel == 13'd296) || (pixel == 13'd298) || (pixel == 13'd299) || (pixel == 13'd389) || (pixel == 13'd390) || (pixel == 13'd393) || 
            (pixel == 13'd394) || (pixel == 13'd395) || (pixel == 13'd484) || (pixel == 13'd485) || (pixel == 13'd490) || (pixel == 13'd491) || (pixel == 13'd580) || (pixel == 13'd581) || 
            (pixel == 13'd586) || (pixel == 13'd587) || (pixel == 13'd676) || (pixel == 13'd677) || (pixel == 13'd682) || (pixel == 13'd683) || (pixel == 13'd772) || (pixel == 13'd773) || 
            (pixel == 13'd778) || (pixel == 13'd779) || (pixel == 13'd868) || (pixel == 13'd869) || (pixel == 13'd874) || (pixel == 13'd875) || (pixel == 13'd964) || (pixel == 13'd965) || 
            (pixel == 13'd970) || (pixel == 13'd971) || (pixel == 13'd1061) || (pixel == 13'd1062) || (pixel == 13'd1065) || (pixel == 13'd1066) || (pixel == 13'd1067) || (pixel == 13'd1158) || 
            (pixel == 13'd1159) || (pixel == 13'd1160) || (pixel == 13'd1162) || (pixel == 13'd1163) || (pixel == 13'd1258) || (pixel == 13'd1259) || (pixel == 13'd1354) || (pixel == 13'd1355) || 
            (pixel == 13'd1450) || (pixel == 13'd1451);
        18: // R
            active =
            (pixel == 13'd390) || (pixel == 13'd391) || (pixel == 13'd393) || (pixel == 13'd394) || (pixel == 13'd486) || (pixel == 13'd487) || (pixel == 13'd488) || (pixel == 13'd582) || 
            (pixel == 13'd583) || (pixel == 13'd678) || (pixel == 13'd679) || (pixel == 13'd774) || (pixel == 13'd775) || (pixel == 13'd870) || (pixel == 13'd871) || (pixel == 13'd966) || 
            (pixel == 13'd967) || (pixel == 13'd1062) || (pixel == 13'd1063) || (pixel == 13'd1158) || (pixel == 13'd1159) || (pixel == 13'd1254) || (pixel == 13'd1255);
        19: // S
            active =
            (pixel == 13'd390) || (pixel == 13'd391) || (pixel == 13'd392) || (pixel == 13'd393) || (pixel == 13'd484) || (pixel == 13'd485) || (pixel == 13'd490) || (pixel == 13'd580) || 
            (pixel == 13'd581) || (pixel == 13'd676) || (pixel == 13'd677) || (pixel == 13'd773) || (pixel == 13'd774) || (pixel == 13'd775) || (pixel == 13'd776) || (pixel == 13'd871) || 
            (pixel == 13'd872) || (pixel == 13'd873) || (pixel == 13'd969) || (pixel == 13'd970) || (pixel == 13'd1065) || (pixel == 13'd1066) || (pixel == 13'd1156) || (pixel == 13'd1161) || 
            (pixel == 13'd1162) || (pixel == 13'd1253) || (pixel == 13'd1254) || (pixel == 13'd1255) || (pixel == 13'd1256);
        20: // T
            active =
            (pixel == 13'd103) || (pixel == 13'd104) || (pixel == 13'd199) || (pixel == 13'd200) || (pixel == 13'd295) || (pixel == 13'd296) || (pixel == 13'd389) || (pixel == 13'd390) || 
            (pixel == 13'd391) || (pixel == 13'd392) || (pixel == 13'd393) || (pixel == 13'd394) || (pixel == 13'd487) || (pixel == 13'd488) || (pixel == 13'd583) || (pixel == 13'd584) || 
            (pixel == 13'd679) || (pixel == 13'd680) || (pixel == 13'd775) || (pixel == 13'd776) || (pixel == 13'd871) || (pixel == 13'd872) || (pixel == 13'd967) || (pixel == 13'd968) || 
            (pixel == 13'd1063) || (pixel == 13'd1064) || (pixel == 13'd1159) || (pixel == 13'd1160) || (pixel == 13'd1256) || (pixel == 13'd1257) || (pixel == 13'd1258);
        21: // U
            active =
            (pixel == 13'd388) || (pixel == 13'd389) || (pixel == 13'd394) || (pixel == 13'd395) || (pixel == 13'd484) || (pixel == 13'd485) || (pixel == 13'd490) || (pixel == 13'd491) || 
            (pixel == 13'd580) || (pixel == 13'd581) || (pixel == 13'd586) || (pixel == 13'd587) || (pixel == 13'd676) || (pixel == 13'd677) || (pixel == 13'd682) || (pixel == 13'd683) || 
            (pixel == 13'd772) || (pixel == 13'd773) || (pixel == 13'd778) || (pixel == 13'd779) || (pixel == 13'd868) || (pixel == 13'd869) || (pixel == 13'd874) || (pixel == 13'd875) || 
            (pixel == 13'd964) || (pixel == 13'd965) || (pixel == 13'd970) || (pixel == 13'd971) || (pixel == 13'd1060) || (pixel == 13'd1061) || (pixel == 13'd1066) || (pixel == 13'd1067) || 
            (pixel == 13'd1156) || (pixel == 13'd1157) || (pixel == 13'd1158) || (pixel == 13'd1161) || (pixel == 13'd1162) || (pixel == 13'd1163) || (pixel == 13'd1253) || (pixel == 13'd1254) || 
            (pixel == 13'd1255) || (pixel == 13'd1256) || (pixel == 13'd1258) || (pixel == 13'd1259);
        22: // V
            active =
            (pixel == 13'd388) || (pixel == 13'd395) || (pixel == 13'd484) || (pixel == 13'd485) || (pixel == 13'd490) || (pixel == 13'd491) || (pixel == 13'd580) || (pixel == 13'd581) || 
            (pixel == 13'd586) || (pixel == 13'd587) || (pixel == 13'd677) || (pixel == 13'd682) || (pixel == 13'd773) || (pixel == 13'd774) || (pixel == 13'd777) || (pixel == 13'd778) || 
            (pixel == 13'd869) || (pixel == 13'd870) || (pixel == 13'd873) || (pixel == 13'd874) || (pixel == 13'd966) || (pixel == 13'd969) || (pixel == 13'd1062) || (pixel == 13'd1063) || 
            (pixel == 13'd1064) || (pixel == 13'd1065) || (pixel == 13'd1158) || (pixel == 13'd1159) || (pixel == 13'd1160) || (pixel == 13'd1255) || (pixel == 13'd1256); 
        23: // W
            active =
            (pixel == 13'd385) || (pixel == 13'd386) || (pixel == 13'd391) || (pixel == 13'd392) || (pixel == 13'd397) || (pixel == 13'd398) || (pixel == 13'd481) || (pixel == 13'd482) || 
            (pixel == 13'd487) || (pixel == 13'd488) || (pixel == 13'd493) || (pixel == 13'd494) || (pixel == 13'd578) || (pixel == 13'd583) || (pixel == 13'd584) || (pixel == 13'd589) || 
            (pixel == 13'd674) || (pixel == 13'd675) || (pixel == 13'd678) || (pixel == 13'd679) || (pixel == 13'd680) || (pixel == 13'd681) || (pixel == 13'd685) || (pixel == 13'd770) || 
            (pixel == 13'd771) || (pixel == 13'd774) || (pixel == 13'd777) || (pixel == 13'd780) || (pixel == 13'd781) || (pixel == 13'd867) || (pixel == 13'd870) || (pixel == 13'd873) || 
            (pixel == 13'd876) || (pixel == 13'd963) || (pixel == 13'd966) || (pixel == 13'd969) || (pixel == 13'd972) || (pixel == 13'd1059) || (pixel == 13'd1060) || (pixel == 13'd1061) || 
            (pixel == 13'd1062) || (pixel == 13'd1065) || (pixel == 13'd1066) || (pixel == 13'd1067) || (pixel == 13'd1068) || (pixel == 13'd1156) || (pixel == 13'd1157) || (pixel == 13'd1162) || 
            (pixel == 13'd1163) || (pixel == 13'd1164) || (pixel == 13'd1252) || (pixel == 13'd1253) || (pixel == 13'd1258) || (pixel == 13'd1259); 
        24: // X
            active =
            (pixel == 13'd388) || (pixel == 13'd389) || (pixel == 13'd394) || (pixel == 13'd395) || (pixel == 13'd485) || (pixel == 13'd486) || (pixel == 13'd490) || (pixel == 13'd581) || 
            (pixel == 13'd582) || (pixel == 13'd585) || (pixel == 13'd586) || (pixel == 13'd678) || (pixel == 13'd679) || (pixel == 13'd680) || (pixel == 13'd681) || (pixel == 13'd775) || 
            (pixel == 13'd776) || (pixel == 13'd871) || (pixel == 13'd872) || (pixel == 13'd873) || (pixel == 13'd966) || (pixel == 13'd967) || (pixel == 13'd968) || (pixel == 13'd969) || 
            (pixel == 13'd1061) || (pixel == 13'd1062) || (pixel == 13'd1065) || (pixel == 13'd1066) || (pixel == 13'd1157) || (pixel == 13'd1158) || (pixel == 13'd1161) || (pixel == 13'd1162) || 
            (pixel == 13'd1252) || (pixel == 13'd1253) || (pixel == 13'd1258) || (pixel == 13'd1259); 
        25: // Y
            active =
            (pixel == 13'd195) || (pixel == 13'd196) || (pixel == 13'd202) || (pixel == 13'd203) || (pixel == 13'd292) || (pixel == 13'd293) || (pixel == 13'd298) || (pixel == 13'd299) || 
            (pixel == 13'd388) || (pixel == 13'd389) || (pixel == 13'd394) || (pixel == 13'd484) || (pixel == 13'd485) || (pixel == 13'd489) || (pixel == 13'd490) || (pixel == 13'd581) || 
            (pixel == 13'd582) || (pixel == 13'd585) || (pixel == 13'd586) || (pixel == 13'd677) || (pixel == 13'd678) || (pixel == 13'd681) || (pixel == 13'd774) || (pixel == 13'd776) || 
            (pixel == 13'd777) || (pixel == 13'd870) || (pixel == 13'd871) || (pixel == 13'd872) || (pixel == 13'd873) || (pixel == 13'd966) || (pixel == 13'd967) || (pixel == 13'd968) || 
            (pixel == 13'd1063) || (pixel == 13'd1064) || (pixel == 13'd1159) || (pixel == 13'd1160) || (pixel == 13'd1254) || (pixel == 13'd1255) || (pixel == 13'd1350) || (pixel == 13'd1351) || 
            (pixel == 13'd1446) || (pixel == 13'd1447);
        26: // Z
            active =
            (pixel == 13'd389) || (pixel == 13'd390) || (pixel == 13'd391) || (pixel == 13'd392) || (pixel == 13'd393) || (pixel == 13'd394) || (pixel == 13'd395) || (pixel == 13'd489) || 
            (pixel == 13'd490) || (pixel == 13'd585) || (pixel == 13'd586) || (pixel == 13'd680) || (pixel == 13'd681) || (pixel == 13'd776) || (pixel == 13'd777) || (pixel == 13'd871) || 
            (pixel == 13'd872) || (pixel == 13'd967) || (pixel == 13'd1062) || (pixel == 13'd1063) || (pixel == 13'd1157) || (pixel == 13'd1158) || (pixel == 13'd1253) || (pixel == 13'd1254) || 
            (pixel == 13'd1255) || (pixel == 13'd1256) || (pixel == 13'd1257) || (pixel == 13'd1258) || (pixel == 13'd1259);
        30: // 0
            active =
            (pixel == 13'd102) || (pixel == 13'd103) || (pixel == 13'd104) || (pixel == 13'd105) || (pixel == 13'd106) || (pixel == 13'd197) || (pixel == 13'd198) || (pixel == 13'd202) || 
            (pixel == 13'd203) || (pixel == 13'd293) || (pixel == 13'd294) || (pixel == 13'd299) || (pixel == 13'd388) || (pixel == 13'd389) || (pixel == 13'd395) || (pixel == 13'd396) || 
            (pixel == 13'd484) || (pixel == 13'd485) || (pixel == 13'd491) || (pixel == 13'd492) || (pixel == 13'd580) || (pixel == 13'd581) || (pixel == 13'd587) || (pixel == 13'd588) || 
            (pixel == 13'd676) || (pixel == 13'd677) || (pixel == 13'd683) || (pixel == 13'd684) || (pixel == 13'd772) || (pixel == 13'd773) || (pixel == 13'd779) || (pixel == 13'd780) || 
            (pixel == 13'd868) || (pixel == 13'd869) || (pixel == 13'd875) || (pixel == 13'd876) || (pixel == 13'd964) || (pixel == 13'd965) || (pixel == 13'd971) || (pixel == 13'd972) || 
            (pixel == 13'd1061) || (pixel == 13'd1066) || (pixel == 13'd1067) || (pixel == 13'd1157) || (pixel == 13'd1158) || (pixel == 13'd1162) || (pixel == 13'd1163) || (pixel == 13'd1254) || 
            (pixel == 13'd1255) || (pixel == 13'd1256) || (pixel == 13'd1257) || (pixel == 13'd1258);
        31: // 1
            active =
            (pixel == 13'd104) || (pixel == 13'd105) || (pixel == 13'd198) || (pixel == 13'd199) || (pixel == 13'd200) || (pixel == 13'd201) || (pixel == 13'd293) || (pixel == 13'd294) || 
            (pixel == 13'd296) || (pixel == 13'd297) || (pixel == 13'd389) || (pixel == 13'd392) || (pixel == 13'd393) || (pixel == 13'd488) || (pixel == 13'd489) || (pixel == 13'd584) || 
            (pixel == 13'd585) || (pixel == 13'd680) || (pixel == 13'd681) || (pixel == 13'd776) || (pixel == 13'd777) || (pixel == 13'd872) || (pixel == 13'd873) || (pixel == 13'd968) || 
            (pixel == 13'd969) || (pixel == 13'd1064) || (pixel == 13'd1065) || (pixel == 13'd1160) || (pixel == 13'd1161) || (pixel == 13'd1253) || (pixel == 13'd1254) || (pixel == 13'd1255) || 
            (pixel == 13'd1256) || (pixel == 13'd1257) || (pixel == 13'd1258) || (pixel == 13'd1259) || (pixel == 13'd1260);
        32: // 2
            active =
            (pixel == 13'd101) || (pixel == 13'd102) || (pixel == 13'd103) || (pixel == 13'd104) || (pixel == 13'd196) || (pixel == 13'd200) || (pixel == 13'd201) || (pixel == 13'd202) || 
            (pixel == 13'd297) || (pixel == 13'd298) || (pixel == 13'd393) || (pixel == 13'd394) || (pixel == 13'd489) || (pixel == 13'd490) || (pixel == 13'd585) || (pixel == 13'd586) || 
            (pixel == 13'd680) || (pixel == 13'd681) || (pixel == 13'd776) || (pixel == 13'd777) || (pixel == 13'd871) || (pixel == 13'd872) || (pixel == 13'd966) || (pixel == 13'd967) || 
            (pixel == 13'd1061) || (pixel == 13'd1062) || (pixel == 13'd1156) || (pixel == 13'd1157) || (pixel == 13'd1252) || (pixel == 13'd1253) || (pixel == 13'd1254) || (pixel == 13'd1255) || 
            (pixel == 13'd1256) || (pixel == 13'd1257) || (pixel == 13'd1258) || (pixel == 13'd1259);
        33: // 3
            active =
            (pixel == 13'd101) || (pixel == 13'd102) || (pixel == 13'd103) || (pixel == 13'd104) || (pixel == 13'd105) || (pixel == 13'd196) || (pixel == 13'd200) || (pixel == 13'd201) || 
            (pixel == 13'd202) || (pixel == 13'd297) || (pixel == 13'd298) || (pixel == 13'd393) || (pixel == 13'd394) || (pixel == 13'd489) || (pixel == 13'd490) || (pixel == 13'd584) || 
            (pixel == 13'd585) || (pixel == 13'd677) || (pixel == 13'd678) || (pixel == 13'd679) || (pixel == 13'd680) || (pixel == 13'd777) || (pixel == 13'd778) || (pixel == 13'd874) || 
            (pixel == 13'd875) || (pixel == 13'd970) || (pixel == 13'd971) || (pixel == 13'd1066) || (pixel == 13'd1067) || (pixel == 13'd1156) || (pixel == 13'd1161) || (pixel == 13'd1162) || 
            (pixel == 13'd1253) || (pixel == 13'd1254) || (pixel == 13'd1255) || (pixel == 13'd1256) || (pixel == 13'd1257);
        34: // 4
            active =
            (pixel == 13'd104) || (pixel == 13'd105) || (pixel == 13'd106) || (pixel == 13'd199) || (pixel == 13'd200) || (pixel == 13'd201) || (pixel == 13'd202) || (pixel == 13'd295) || 
            (pixel == 13'd297) || (pixel == 13'd298) || (pixel == 13'd390) || (pixel == 13'd391) || (pixel == 13'd393) || (pixel == 13'd394) || (pixel == 13'd486) || (pixel == 13'd489) || 
            (pixel == 13'd490) || (pixel == 13'd581) || (pixel == 13'd582) || (pixel == 13'd585) || (pixel == 13'd586) || (pixel == 13'd676) || (pixel == 13'd677) || (pixel == 13'd681) || 
            (pixel == 13'd682) || (pixel == 13'd772) || (pixel == 13'd777) || (pixel == 13'd778) || (pixel == 13'd867) || (pixel == 13'd868) || (pixel == 13'd873) || (pixel == 13'd874) || 
            (pixel == 13'd963) || (pixel == 13'd964) || (pixel == 13'd965) || (pixel == 13'd966) || (pixel == 13'd967) || (pixel == 13'd968) || (pixel == 13'd969) || (pixel == 13'd970) || 
            (pixel == 13'd971) || (pixel == 13'd972) || (pixel == 13'd1065) || (pixel == 13'd1066) || (pixel == 13'd1161) || (pixel == 13'd1162) || (pixel == 13'd1257) || (pixel == 13'd1258);
        35: // 5
            active =
            (pixel == 13'd101) || (pixel == 13'd102) || (pixel == 13'd103) || (pixel == 13'd104) || (pixel == 13'd105) || (pixel == 13'd106) || (pixel == 13'd197) || (pixel == 13'd198) || 
            (pixel == 13'd293) || (pixel == 13'd294) || (pixel == 13'd389) || (pixel == 13'd390) || (pixel == 13'd485) || (pixel == 13'd486) || (pixel == 13'd581) || (pixel == 13'd582) || 
            (pixel == 13'd583) || (pixel == 13'd584) || (pixel == 13'd585) || (pixel == 13'd681) || (pixel == 13'd682) || (pixel == 13'd778) || (pixel == 13'd779) || (pixel == 13'd874) || 
            (pixel == 13'd875) || (pixel == 13'd970) || (pixel == 13'd971) || (pixel == 13'd1066) || (pixel == 13'd1067) || (pixel == 13'd1156) || (pixel == 13'd1161) || (pixel == 13'd1162) || 
            (pixel == 13'd1253) || (pixel == 13'd1254) || (pixel == 13'd1255) || (pixel == 13'd1256) || (pixel == 13'd1257);
        36: // 6
            active =
            (pixel == 13'd103) || (pixel == 13'd104) || (pixel == 13'd105) || (pixel == 13'd106) || (pixel == 13'd107) || (pixel == 13'd198) || (pixel == 13'd199) || (pixel == 13'd293) || 
            (pixel == 13'd294) || (pixel == 13'd388) || (pixel == 13'd389) || (pixel == 13'd484) || (pixel == 13'd485) || (pixel == 13'd580) || (pixel == 13'd581) || (pixel == 13'd583) || 
            (pixel == 13'd584) || (pixel == 13'd585) || (pixel == 13'd586) || (pixel == 13'd676) || (pixel == 13'd677) || (pixel == 13'd678) || (pixel == 13'd682) || (pixel == 13'd683) || 
            (pixel == 13'd772) || (pixel == 13'd773) || (pixel == 13'd779) || (pixel == 13'd780) || (pixel == 13'd868) || (pixel == 13'd869) || (pixel == 13'd875) || (pixel == 13'd876) || 
            (pixel == 13'd964) || (pixel == 13'd965) || (pixel == 13'd971) || (pixel == 13'd972) || (pixel == 13'd1060) || (pixel == 13'd1061) || (pixel == 13'd1067) || (pixel == 13'd1068) || 
            (pixel == 13'd1157) || (pixel == 13'd1158) || (pixel == 13'd1162) || (pixel == 13'd1163) || (pixel == 13'd1254) || (pixel == 13'd1255) || (pixel == 13'd1256) || (pixel == 13'd1257) || 
            (pixel == 13'd1258);
        37: // 7
            active =
            (pixel == 13'd100) || (pixel == 13'd101) || (pixel == 13'd102) || (pixel == 13'd103) || (pixel == 13'd104) || (pixel == 13'd105) || (pixel == 13'd106) || (pixel == 13'd107) || 
            (pixel == 13'd108) || (pixel == 13'd203) || (pixel == 13'd204) || (pixel == 13'd298) || (pixel == 13'd299) || (pixel == 13'd394) || (pixel == 13'd395) || (pixel == 13'd489) || 
            (pixel == 13'd490) || (pixel == 13'd585) || (pixel == 13'd586) || (pixel == 13'd681) || (pixel == 13'd776) || (pixel == 13'd777) || (pixel == 13'd872) || (pixel == 13'd873) || 
            (pixel == 13'd967) || (pixel == 13'd968) || (pixel == 13'd1063) || (pixel == 13'd1064) || (pixel == 13'd1158) || (pixel == 13'd1159) || (pixel == 13'd1254) || (pixel == 13'd1255);
        38: // 8
            active =
            (pixel == 13'd102) || (pixel == 13'd103) || (pixel == 13'd104) || (pixel == 13'd105) || (pixel == 13'd106) || (pixel == 13'd197) || (pixel == 13'd198) || (pixel == 13'd202) || 
            (pixel == 13'd203) || (pixel == 13'd204) || (pixel == 13'd292) || (pixel == 13'd293) || (pixel == 13'd299) || (pixel == 13'd300) || (pixel == 13'd388) || (pixel == 13'd389) || 
            (pixel == 13'd395) || (pixel == 13'd396) || (pixel == 13'd484) || (pixel == 13'd485) || (pixel == 13'd486) || (pixel == 13'd490) || (pixel == 13'd491) || (pixel == 13'd581) || 
            (pixel == 13'd582) || (pixel == 13'd583) || (pixel == 13'd585) || (pixel == 13'd586) || (pixel == 13'd679) || (pixel == 13'd680) || (pixel == 13'd681) || (pixel == 13'd682) || 
            (pixel == 13'd773) || (pixel == 13'd774) || (pixel == 13'd775) || (pixel == 13'd777) || (pixel == 13'd778) || (pixel == 13'd779) || (pixel == 13'd868) || (pixel == 13'd869) || 
            (pixel == 13'd874) || (pixel == 13'd875) || (pixel == 13'd876) || (pixel == 13'd964) || (pixel == 13'd965) || (pixel == 13'd971) || (pixel == 13'd972) || (pixel == 13'd1060) || 
            (pixel == 13'd1061) || (pixel == 13'd1067) || (pixel == 13'd1068) || (pixel == 13'd1156) || (pixel == 13'd1157) || (pixel == 13'd1158) || (pixel == 13'd1162) || (pixel == 13'd1163) || 
            (pixel == 13'd1254) || (pixel == 13'd1255) || (pixel == 13'd1256) || (pixel == 13'd1257) || (pixel == 13'd1258);
        39: // 9
            active =
            (pixel == 13'd102) || (pixel == 13'd103) || (pixel == 13'd104) || (pixel == 13'd105) || (pixel == 13'd106) || (pixel == 13'd197) || (pixel == 13'd198) || (pixel == 13'd202) || 
            (pixel == 13'd203) || (pixel == 13'd292) || (pixel == 13'd293) || (pixel == 13'd299) || (pixel == 13'd388) || (pixel == 13'd389) || (pixel == 13'd395) || (pixel == 13'd396) || 
            (pixel == 13'd484) || (pixel == 13'd485) || (pixel == 13'd491) || (pixel == 13'd492) || (pixel == 13'd580) || (pixel == 13'd581) || (pixel == 13'd587) || (pixel == 13'd588) || 
            (pixel == 13'd677) || (pixel == 13'd678) || (pixel == 13'd682) || (pixel == 13'd683) || (pixel == 13'd684) || (pixel == 13'd774) || (pixel == 13'd775) || (pixel == 13'd776) || 
            (pixel == 13'd777) || (pixel == 13'd779) || (pixel == 13'd780) || (pixel == 13'd875) || (pixel == 13'd876) || (pixel == 13'd971) || (pixel == 13'd1066) || (pixel == 13'd1067) || 
            (pixel == 13'd1161) || (pixel == 13'd1162) || (pixel == 13'd1252) || (pixel == 13'd1253) || (pixel == 13'd1254) || (pixel == 13'd1255) || (pixel == 13'd1256) || (pixel == 13'd1257);
        default:
            active = 0;
        endcase
    end
    
endmodule
