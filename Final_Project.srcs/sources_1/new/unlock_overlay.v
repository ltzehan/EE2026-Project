`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.10.2022 00:52:49
// Design Name: 
// Module Name: unlock_overlay
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


module unlock_overlay(
    input [12:0] pixel,
    output active
    );
    
    assign active =
        (pixel == 13'd879) || (pixel == 13'd880) || (pixel == 13'd881) || (pixel == 13'd882) || (pixel == 13'd883) || (pixel == 13'd884) || (pixel == 13'd920) || (pixel == 13'd921) || 
        (pixel == 13'd922) || (pixel == 13'd923) || (pixel == 13'd924) || (pixel == 13'd925) || (pixel == 13'd975) || (pixel == 13'd976) || (pixel == 13'd977) || (pixel == 13'd978) || 
        (pixel == 13'd979) || (pixel == 13'd980) || (pixel == 13'd992) || (pixel == 13'd993) || (pixel == 13'd1016) || (pixel == 13'd1017) || (pixel == 13'd1018) || (pixel == 13'd1019) || 
        (pixel == 13'd1020) || (pixel == 13'd1021) || (pixel == 13'd1022) || (pixel == 13'd1071) || (pixel == 13'd1072) || (pixel == 13'd1088) || (pixel == 13'd1089) || (pixel == 13'd1112) || 
        (pixel == 13'd1113) || (pixel == 13'd1117) || (pixel == 13'd1118) || (pixel == 13'd1167) || (pixel == 13'd1168) || (pixel == 13'd1175) || (pixel == 13'd1176) || (pixel == 13'd1178) || 
        (pixel == 13'd1179) || (pixel == 13'd1180) || (pixel == 13'd1183) || (pixel == 13'd1184) || (pixel == 13'd1185) || (pixel == 13'd1186) || (pixel == 13'd1187) || (pixel == 13'd1191) || 
        (pixel == 13'd1192) || (pixel == 13'd1193) || (pixel == 13'd1194) || (pixel == 13'd1198) || (pixel == 13'd1199) || (pixel == 13'd1201) || (pixel == 13'd1202) || (pixel == 13'd1208) || 
        (pixel == 13'd1209) || (pixel == 13'd1213) || (pixel == 13'd1214) || (pixel == 13'd1217) || (pixel == 13'd1218) || (pixel == 13'd1219) || (pixel == 13'd1220) || (pixel == 13'd1221) || 
        (pixel == 13'd1226) || (pixel == 13'd1227) || (pixel == 13'd1228) || (pixel == 13'd1232) || (pixel == 13'd1233) || (pixel == 13'd1234) || (pixel == 13'd1263) || (pixel == 13'd1264) || 
        (pixel == 13'd1265) || (pixel == 13'd1266) || (pixel == 13'd1267) || (pixel == 13'd1271) || (pixel == 13'd1272) || (pixel == 13'd1273) || (pixel == 13'd1274) || (pixel == 13'd1275) || 
        (pixel == 13'd1276) || (pixel == 13'd1277) || (pixel == 13'd1279) || (pixel == 13'd1280) || (pixel == 13'd1281) || (pixel == 13'd1282) || (pixel == 13'd1283) || (pixel == 13'd1286) || 
        (pixel == 13'd1287) || (pixel == 13'd1288) || (pixel == 13'd1289) || (pixel == 13'd1290) || (pixel == 13'd1291) || (pixel == 13'd1294) || (pixel == 13'd1295) || (pixel == 13'd1296) || 
        (pixel == 13'd1297) || (pixel == 13'd1298) || (pixel == 13'd1304) || (pixel == 13'd1305) || (pixel == 13'd1309) || (pixel == 13'd1310) || (pixel == 13'd1313) || (pixel == 13'd1314) || 
        (pixel == 13'd1315) || (pixel == 13'd1316) || (pixel == 13'd1317) || (pixel == 13'd1318) || (pixel == 13'd1321) || (pixel == 13'd1322) || (pixel == 13'd1323) || (pixel == 13'd1324) || 
        (pixel == 13'd1327) || (pixel == 13'd1328) || (pixel == 13'd1329) || (pixel == 13'd1330) || (pixel == 13'd1359) || (pixel == 13'd1360) || (pixel == 13'd1361) || (pixel == 13'd1362) || 
        (pixel == 13'd1363) || (pixel == 13'd1367) || (pixel == 13'd1368) || (pixel == 13'd1372) || (pixel == 13'd1373) || (pixel == 13'd1376) || (pixel == 13'd1377) || (pixel == 13'd1382) || 
        (pixel == 13'd1383) || (pixel == 13'd1386) || (pixel == 13'd1387) || (pixel == 13'd1390) || (pixel == 13'd1391) || (pixel == 13'd1400) || (pixel == 13'd1401) || (pixel == 13'd1402) || 
        (pixel == 13'd1403) || (pixel == 13'd1404) || (pixel == 13'd1405) || (pixel == 13'd1406) || (pixel == 13'd1413) || (pixel == 13'd1414) || (pixel == 13'd1417) || (pixel == 13'd1418) || 
        (pixel == 13'd1423) || (pixel == 13'd1424) || (pixel == 13'd1455) || (pixel == 13'd1456) || (pixel == 13'd1463) || (pixel == 13'd1464) || (pixel == 13'd1468) || (pixel == 13'd1469) || 
        (pixel == 13'd1472) || (pixel == 13'd1473) || (pixel == 13'd1478) || (pixel == 13'd1479) || (pixel == 13'd1480) || (pixel == 13'd1481) || (pixel == 13'd1482) || (pixel == 13'd1483) || 
        (pixel == 13'd1486) || (pixel == 13'd1487) || (pixel == 13'd1496) || (pixel == 13'd1497) || (pixel == 13'd1498) || (pixel == 13'd1499) || (pixel == 13'd1500) || (pixel == 13'd1501) || 
        (pixel == 13'd1506) || (pixel == 13'd1507) || (pixel == 13'd1508) || (pixel == 13'd1509) || (pixel == 13'd1510) || (pixel == 13'd1514) || (pixel == 13'd1515) || (pixel == 13'd1520) || 
        (pixel == 13'd1521) || (pixel == 13'd1551) || (pixel == 13'd1552) || (pixel == 13'd1559) || (pixel == 13'd1560) || (pixel == 13'd1564) || (pixel == 13'd1565) || (pixel == 13'd1568) || 
        (pixel == 13'd1569) || (pixel == 13'd1574) || (pixel == 13'd1575) || (pixel == 13'd1582) || (pixel == 13'd1583) || (pixel == 13'd1592) || (pixel == 13'd1593) || (pixel == 13'd1601) || 
        (pixel == 13'd1602) || (pixel == 13'd1605) || (pixel == 13'd1606) || (pixel == 13'd1611) || (pixel == 13'd1612) || (pixel == 13'd1617) || (pixel == 13'd1618) || (pixel == 13'd1647) || 
        (pixel == 13'd1648) || (pixel == 13'd1649) || (pixel == 13'd1650) || (pixel == 13'd1651) || (pixel == 13'd1652) || (pixel == 13'd1655) || (pixel == 13'd1656) || (pixel == 13'd1660) || 
        (pixel == 13'd1661) || (pixel == 13'd1664) || (pixel == 13'd1665) || (pixel == 13'd1666) || (pixel == 13'd1667) || (pixel == 13'd1670) || (pixel == 13'd1671) || (pixel == 13'd1672) || 
        (pixel == 13'd1673) || (pixel == 13'd1674) || (pixel == 13'd1675) || (pixel == 13'd1678) || (pixel == 13'd1679) || (pixel == 13'd1688) || (pixel == 13'd1689) || (pixel == 13'd1697) || 
        (pixel == 13'd1698) || (pixel == 13'd1699) || (pixel == 13'd1700) || (pixel == 13'd1701) || (pixel == 13'd1702) || (pixel == 13'd1705) || (pixel == 13'd1706) || (pixel == 13'd1707) || 
        (pixel == 13'd1708) || (pixel == 13'd1711) || (pixel == 13'd1712) || (pixel == 13'd1713) || (pixel == 13'd1714) || (pixel == 13'd1743) || (pixel == 13'd1744) || (pixel == 13'd1745) || 
        (pixel == 13'd1746) || (pixel == 13'd1747) || (pixel == 13'd1748) || (pixel == 13'd1751) || (pixel == 13'd1752) || (pixel == 13'd1756) || (pixel == 13'd1757) || (pixel == 13'd1761) || 
        (pixel == 13'd1762) || (pixel == 13'd1763) || (pixel == 13'd1767) || (pixel == 13'd1768) || (pixel == 13'd1769) || (pixel == 13'd1770) || (pixel == 13'd1771) || (pixel == 13'd1774) || 
        (pixel == 13'd1775) || (pixel == 13'd1784) || (pixel == 13'd1785) || (pixel == 13'd1794) || (pixel == 13'd1795) || (pixel == 13'd1796) || (pixel == 13'd1797) || (pixel == 13'd1798) || 
        (pixel == 13'd1801) || (pixel == 13'd1802) || (pixel == 13'd1803) || (pixel == 13'd1807) || (pixel == 13'd1808) || (pixel == 13'd1809) || (pixel == 13'd4338) || (pixel == 13'd4339) || 
        (pixel == 13'd4340) || (pixel == 13'd4341) || (pixel == 13'd4342) || (pixel == 13'd4343) || (pixel == 13'd4344) || (pixel == 13'd4345) || (pixel == 13'd4346) || (pixel == 13'd4347) || 
        (pixel == 13'd4348) || (pixel == 13'd4349) || (pixel == 13'd4354) || (pixel == 13'd4355) || (pixel == 13'd4356) || (pixel == 13'd4357) || (pixel == 13'd4358) || (pixel == 13'd4359) || 
        (pixel == 13'd4360) || (pixel == 13'd4361) || (pixel == 13'd4362) || (pixel == 13'd4363) || (pixel == 13'd4364) || (pixel == 13'd4365) || (pixel == 13'd4370) || (pixel == 13'd4371) || 
        (pixel == 13'd4372) || (pixel == 13'd4373) || (pixel == 13'd4374) || (pixel == 13'd4375) || (pixel == 13'd4376) || (pixel == 13'd4377) || (pixel == 13'd4378) || (pixel == 13'd4379) || 
        (pixel == 13'd4380) || (pixel == 13'd4381) || (pixel == 13'd4386) || (pixel == 13'd4387) || (pixel == 13'd4388) || (pixel == 13'd4389) || (pixel == 13'd4390) || (pixel == 13'd4391) || 
        (pixel == 13'd4392) || (pixel == 13'd4393) || (pixel == 13'd4394) || (pixel == 13'd4395) || (pixel == 13'd4396) || (pixel == 13'd4397) || (pixel == 13'd4434) || (pixel == 13'd4435) || 
        (pixel == 13'd4436) || (pixel == 13'd4437) || (pixel == 13'd4438) || (pixel == 13'd4439) || (pixel == 13'd4440) || (pixel == 13'd4441) || (pixel == 13'd4442) || (pixel == 13'd4443) || 
        (pixel == 13'd4444) || (pixel == 13'd4445) || (pixel == 13'd4450) || (pixel == 13'd4451) || (pixel == 13'd4452) || (pixel == 13'd4453) || (pixel == 13'd4454) || (pixel == 13'd4455) || 
        (pixel == 13'd4456) || (pixel == 13'd4457) || (pixel == 13'd4458) || (pixel == 13'd4459) || (pixel == 13'd4460) || (pixel == 13'd4461) || (pixel == 13'd4466) || (pixel == 13'd4467) || 
        (pixel == 13'd4468) || (pixel == 13'd4469) || (pixel == 13'd4470) || (pixel == 13'd4471) || (pixel == 13'd4472) || (pixel == 13'd4473) || (pixel == 13'd4474) || (pixel == 13'd4475) || 
        (pixel == 13'd4476) || (pixel == 13'd4477) || (pixel == 13'd4482) || (pixel == 13'd4483) || (pixel == 13'd4484) || (pixel == 13'd4485) || (pixel == 13'd4486) || (pixel == 13'd4487) || 
        (pixel == 13'd4488) || (pixel == 13'd4489) || (pixel == 13'd4490) || (pixel == 13'd4491) || (pixel == 13'd4492) || (pixel == 13'd4493);
    
endmodule
