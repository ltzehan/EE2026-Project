`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.10.2022 02:15:39
// Design Name: 
// Module Name: lock_overlay
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


module lock_overlay(
    input [12:0] pixel,
    output active
    );
    
    assign active =
        (pixel == 13'd791) || (pixel == 13'd792) || (pixel == 13'd793) || (pixel == 13'd794) || (pixel == 13'd816) || (pixel == 13'd817) || (pixel == 13'd818) || (pixel == 13'd819) || 
        (pixel == 13'd820) || (pixel == 13'd821) || (pixel == 13'd886) || (pixel == 13'd887) || (pixel == 13'd888) || (pixel == 13'd889) || (pixel == 13'd890) || (pixel == 13'd891) || 
        (pixel == 13'd902) || (pixel == 13'd903) || (pixel == 13'd912) || (pixel == 13'd913) || (pixel == 13'd914) || (pixel == 13'd915) || (pixel == 13'd916) || (pixel == 13'd917) || 
        (pixel == 13'd918) || (pixel == 13'd982) || (pixel == 13'd983) || (pixel == 13'd987) || (pixel == 13'd998) || (pixel == 13'd999) || (pixel == 13'd1008) || (pixel == 13'd1009) || 
        (pixel == 13'd1013) || (pixel == 13'd1014) || (pixel == 13'd1078) || (pixel == 13'd1079) || (pixel == 13'd1087) || (pixel == 13'd1088) || (pixel == 13'd1089) || (pixel == 13'd1090) || 
        (pixel == 13'd1093) || (pixel == 13'd1094) || (pixel == 13'd1095) || (pixel == 13'd1096) || (pixel == 13'd1097) || (pixel == 13'd1104) || (pixel == 13'd1105) || (pixel == 13'd1109) || 
        (pixel == 13'd1110) || (pixel == 13'd1113) || (pixel == 13'd1114) || (pixel == 13'd1115) || (pixel == 13'd1116) || (pixel == 13'd1117) || (pixel == 13'd1122) || (pixel == 13'd1123) || 
        (pixel == 13'd1124) || (pixel == 13'd1128) || (pixel == 13'd1129) || (pixel == 13'd1130) || (pixel == 13'd1174) || (pixel == 13'd1175) || (pixel == 13'd1176) || (pixel == 13'd1177) || 
        (pixel == 13'd1178) || (pixel == 13'd1182) || (pixel == 13'd1183) || (pixel == 13'd1184) || (pixel == 13'd1185) || (pixel == 13'd1186) || (pixel == 13'd1187) || (pixel == 13'd1189) || 
        (pixel == 13'd1190) || (pixel == 13'd1191) || (pixel == 13'd1192) || (pixel == 13'd1193) || (pixel == 13'd1200) || (pixel == 13'd1201) || (pixel == 13'd1205) || (pixel == 13'd1206) || 
        (pixel == 13'd1209) || (pixel == 13'd1210) || (pixel == 13'd1211) || (pixel == 13'd1212) || (pixel == 13'd1213) || (pixel == 13'd1214) || (pixel == 13'd1217) || (pixel == 13'd1218) || 
        (pixel == 13'd1219) || (pixel == 13'd1220) || (pixel == 13'd1223) || (pixel == 13'd1224) || (pixel == 13'd1225) || (pixel == 13'd1226) || (pixel == 13'd1271) || (pixel == 13'd1272) || 
        (pixel == 13'd1273) || (pixel == 13'd1274) || (pixel == 13'd1275) || (pixel == 13'd1278) || (pixel == 13'd1279) || (pixel == 13'd1282) || (pixel == 13'd1283) || (pixel == 13'd1286) || 
        (pixel == 13'd1287) || (pixel == 13'd1296) || (pixel == 13'd1297) || (pixel == 13'd1298) || (pixel == 13'd1299) || (pixel == 13'd1300) || (pixel == 13'd1301) || (pixel == 13'd1302) || 
        (pixel == 13'd1309) || (pixel == 13'd1310) || (pixel == 13'd1313) || (pixel == 13'd1314) || (pixel == 13'd1319) || (pixel == 13'd1320) || (pixel == 13'd1370) || (pixel == 13'd1371) || 
        (pixel == 13'd1374) || (pixel == 13'd1375) || (pixel == 13'd1376) || (pixel == 13'd1377) || (pixel == 13'd1378) || (pixel == 13'd1379) || (pixel == 13'd1382) || (pixel == 13'd1383) || 
        (pixel == 13'd1392) || (pixel == 13'd1393) || (pixel == 13'd1394) || (pixel == 13'd1395) || (pixel == 13'd1396) || (pixel == 13'd1397) || (pixel == 13'd1402) || (pixel == 13'd1403) || 
        (pixel == 13'd1404) || (pixel == 13'd1405) || (pixel == 13'd1406) || (pixel == 13'd1410) || (pixel == 13'd1411) || (pixel == 13'd1416) || (pixel == 13'd1417) || (pixel == 13'd1462) || 
        (pixel == 13'd1466) || (pixel == 13'd1467) || (pixel == 13'd1470) || (pixel == 13'd1471) || (pixel == 13'd1478) || (pixel == 13'd1479) || (pixel == 13'd1488) || (pixel == 13'd1489) || 
        (pixel == 13'd1497) || (pixel == 13'd1498) || (pixel == 13'd1501) || (pixel == 13'd1502) || (pixel == 13'd1507) || (pixel == 13'd1508) || (pixel == 13'd1513) || (pixel == 13'd1514) || 
        (pixel == 13'd1558) || (pixel == 13'd1559) || (pixel == 13'd1560) || (pixel == 13'd1561) || (pixel == 13'd1562) || (pixel == 13'd1563) || (pixel == 13'd1566) || (pixel == 13'd1567) || 
        (pixel == 13'd1568) || (pixel == 13'd1569) || (pixel == 13'd1570) || (pixel == 13'd1571) || (pixel == 13'd1574) || (pixel == 13'd1575) || (pixel == 13'd1576) || (pixel == 13'd1577) || 
        (pixel == 13'd1584) || (pixel == 13'd1585) || (pixel == 13'd1593) || (pixel == 13'd1594) || (pixel == 13'd1595) || (pixel == 13'd1596) || (pixel == 13'd1597) || (pixel == 13'd1598) || 
        (pixel == 13'd1601) || (pixel == 13'd1602) || (pixel == 13'd1603) || (pixel == 13'd1604) || (pixel == 13'd1607) || (pixel == 13'd1608) || (pixel == 13'd1609) || (pixel == 13'd1610) || 
        (pixel == 13'd1655) || (pixel == 13'd1656) || (pixel == 13'd1657) || (pixel == 13'd1658) || (pixel == 13'd1663) || (pixel == 13'd1664) || (pixel == 13'd1665) || (pixel == 13'd1666) || 
        (pixel == 13'd1667) || (pixel == 13'd1671) || (pixel == 13'd1672) || (pixel == 13'd1673) || (pixel == 13'd1680) || (pixel == 13'd1681) || (pixel == 13'd1690) || (pixel == 13'd1691) || 
        (pixel == 13'd1692) || (pixel == 13'd1693) || (pixel == 13'd1694) || (pixel == 13'd1697) || (pixel == 13'd1698) || (pixel == 13'd1699) || (pixel == 13'd1703) || (pixel == 13'd1704) || 
        (pixel == 13'd1705) || (pixel == 13'd4338) || (pixel == 13'd4339) || (pixel == 13'd4340) || (pixel == 13'd4341) || (pixel == 13'd4342) || (pixel == 13'd4343) || (pixel == 13'd4344) || 
        (pixel == 13'd4345) || (pixel == 13'd4346) || (pixel == 13'd4347) || (pixel == 13'd4348) || (pixel == 13'd4349) || (pixel == 13'd4354) || (pixel == 13'd4355) || (pixel == 13'd4356) || 
        (pixel == 13'd4357) || (pixel == 13'd4358) || (pixel == 13'd4359) || (pixel == 13'd4360) || (pixel == 13'd4361) || (pixel == 13'd4362) || (pixel == 13'd4363) || (pixel == 13'd4364) || 
        (pixel == 13'd4365) || (pixel == 13'd4370) || (pixel == 13'd4371) || (pixel == 13'd4372) || (pixel == 13'd4373) || (pixel == 13'd4374) || (pixel == 13'd4375) || (pixel == 13'd4376) || 
        (pixel == 13'd4377) || (pixel == 13'd4378) || (pixel == 13'd4379) || (pixel == 13'd4380) || (pixel == 13'd4381) || (pixel == 13'd4386) || (pixel == 13'd4387) || (pixel == 13'd4388) || 
        (pixel == 13'd4389) || (pixel == 13'd4390) || (pixel == 13'd4391) || (pixel == 13'd4392) || (pixel == 13'd4393) || (pixel == 13'd4394) || (pixel == 13'd4395) || (pixel == 13'd4396) || 
        (pixel == 13'd4397) || (pixel == 13'd4434) || (pixel == 13'd4435) || (pixel == 13'd4436) || (pixel == 13'd4437) || (pixel == 13'd4438) || (pixel == 13'd4439) || (pixel == 13'd4440) || 
        (pixel == 13'd4441) || (pixel == 13'd4442) || (pixel == 13'd4443) || (pixel == 13'd4444) || (pixel == 13'd4445) || (pixel == 13'd4450) || (pixel == 13'd4451) || (pixel == 13'd4452) || 
        (pixel == 13'd4453) || (pixel == 13'd4454) || (pixel == 13'd4455) || (pixel == 13'd4456) || (pixel == 13'd4457) || (pixel == 13'd4458) || (pixel == 13'd4459) || (pixel == 13'd4460) || 
        (pixel == 13'd4461) || (pixel == 13'd4466) || (pixel == 13'd4467) || (pixel == 13'd4468) || (pixel == 13'd4469) || (pixel == 13'd4470) || (pixel == 13'd4471) || (pixel == 13'd4472) || 
        (pixel == 13'd4473) || (pixel == 13'd4474) || (pixel == 13'd4475) || (pixel == 13'd4476) || (pixel == 13'd4477) || (pixel == 13'd4482) || (pixel == 13'd4483) || (pixel == 13'd4484) || 
        (pixel == 13'd4485) || (pixel == 13'd4486) || (pixel == 13'd4487) || (pixel == 13'd4488) || (pixel == 13'd4489) || (pixel == 13'd4490) || (pixel == 13'd4491) || (pixel == 13'd4492) || 
        (pixel == 13'd4493);
    
endmodule
