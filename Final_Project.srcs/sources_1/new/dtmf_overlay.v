`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.10.2022 18:23:59
// Design Name: 
// Module Name: dtmf_overlay
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


module dtmf_overlay(
    input CLK,
    input [12:0] pixel,
    output reg active
    );
    
    always @(posedge CLK) begin
        if (
            (pixel == 13'd292) ||
            (pixel == 13'd294) ||
            (pixel == 13'd295) ||
            (pixel == 13'd303) ||
            (pixel == 13'd304) ||
            (pixel == 13'd315) ||
            (pixel == 13'd318) ||
            (pixel == 13'd319) ||
            (pixel == 13'd328) ||
            (pixel == 13'd329) ||
            (pixel == 13'd330) ||
            (pixel == 13'd331) ||
            (pixel == 13'd344) ||
            (pixel == 13'd352) ||
            (pixel == 13'd353) ||
            (pixel == 13'd356) ||
            (pixel == 13'd364) ||
            (pixel == 13'd365) ||
            (pixel == 13'd366) ||
            (pixel == 13'd367) ||
            (pixel == 13'd375) ||
            (pixel == 13'd376) ||
            (pixel == 13'd387) ||
            (pixel == 13'd389) ||
            (pixel == 13'd392) ||
            (pixel == 13'd399) ||
            (pixel == 13'd401) ||
            (pixel == 13'd402) ||
            (pixel == 13'd411) ||
            (pixel == 13'd413) ||
            (pixel == 13'd416) ||
            (pixel == 13'd423) ||
            (pixel == 13'd426) ||
            (pixel == 13'd428) ||
            (pixel == 13'd435) ||
            (pixel == 13'd436) ||
            (pixel == 13'd437) ||
            (pixel == 13'd438) ||
            (pixel == 13'd439) ||
            (pixel == 13'd440) ||
            (pixel == 13'd447) ||
            (pixel == 13'd450) ||
            (pixel == 13'd452) ||
            (pixel == 13'd459) ||
            (pixel == 13'd464) ||
            (pixel == 13'd471) ||
            (pixel == 13'd473) ||
            (pixel == 13'd474) ||
            (pixel == 13'd483) ||
            (pixel == 13'd485) ||
            (pixel == 13'd488) ||
            (pixel == 13'd495) ||
            (pixel == 13'd499) ||
            (pixel == 13'd500) ||
            (pixel == 13'd507) ||
            (pixel == 13'd509) ||
            (pixel == 13'd512) ||
            (pixel == 13'd519) ||
            (pixel == 13'd522) ||
            (pixel == 13'd524) ||
            (pixel == 13'd532) ||
            (pixel == 13'd536) ||
            (pixel == 13'd543) ||
            (pixel == 13'd546) ||
            (pixel == 13'd548) ||
            (pixel == 13'd555) ||
            (pixel == 13'd560) ||
            (pixel == 13'd567) ||
            (pixel == 13'd571) ||
            (pixel == 13'd572) ||
            (pixel == 13'd579) ||
            (pixel == 13'd584) ||
            (pixel == 13'd591) ||
            (pixel == 13'd604) ||
            (pixel == 13'd605) ||
            (pixel == 13'd606) ||
            (pixel == 13'd607) ||
            (pixel == 13'd616) ||
            (pixel == 13'd617) ||
            (pixel == 13'd640) ||
            (pixel == 13'd643) ||
            (pixel == 13'd644) ||
            (pixel == 13'd652) ||
            (pixel == 13'd653) ||
            (pixel == 13'd654) ||
            (pixel == 13'd655) ||
            (pixel == 13'd663) ||
            (pixel == 13'd772) ||
            (pixel == 13'd774) ||
            (pixel == 13'd775) ||
            (pixel == 13'd783) ||
            (pixel == 13'd784) ||
            (pixel == 13'd796) ||
            (pixel == 13'd798) ||
            (pixel == 13'd799) ||
            (pixel == 13'd808) ||
            (pixel == 13'd809) ||
            (pixel == 13'd810) ||
            (pixel == 13'd811) ||
            (pixel == 13'd819) ||
            (pixel == 13'd820) ||
            (pixel == 13'd821) ||
            (pixel == 13'd822) ||
            (pixel == 13'd823) ||
            (pixel == 13'd824) ||
            (pixel == 13'd831) ||
            (pixel == 13'd834) ||
            (pixel == 13'd835) ||
            (pixel == 13'd843) ||
            (pixel == 13'd844) ||
            (pixel == 13'd856) ||
            (pixel == 13'd857) ||
            (pixel == 13'd858) ||
            (pixel == 13'd859) ||
            (pixel == 13'd867) ||
            (pixel == 13'd869) ||
            (pixel == 13'd872) ||
            (pixel == 13'd879) ||
            (pixel == 13'd881) ||
            (pixel == 13'd882) ||
            (pixel == 13'd891) ||
            (pixel == 13'd893) ||
            (pixel == 13'd896) ||
            (pixel == 13'd903) ||
            (pixel == 13'd908) ||
            (pixel == 13'd915) ||
            (pixel == 13'd918) ||
            (pixel == 13'd927) ||
            (pixel == 13'd929) ||
            (pixel == 13'd932) ||
            (pixel == 13'd939) ||
            (pixel == 13'd941) ||
            (pixel == 13'd942) ||
            (pixel == 13'd951) ||
            (pixel == 13'd954) ||
            (pixel == 13'd956) ||
            (pixel == 13'd963) ||
            (pixel == 13'd965) ||
            (pixel == 13'd968) ||
            (pixel == 13'd975) ||
            (pixel == 13'd979) ||
            (pixel == 13'd980) ||
            (pixel == 13'd987) ||
            (pixel == 13'd989) ||
            (pixel == 13'd992) ||
            (pixel == 13'd999) ||
            (pixel == 13'd1004) ||
            (pixel == 13'd1012) ||
            (pixel == 13'd1014) ||
            (pixel == 13'd1023) ||
            (pixel == 13'd1025) ||
            (pixel == 13'd1028) ||
            (pixel == 13'd1035) ||
            (pixel == 13'd1039) ||
            (pixel == 13'd1040) ||
            (pixel == 13'd1047) ||
            (pixel == 13'd1050) ||
            (pixel == 13'd1052) ||
            (pixel == 13'd1059) ||
            (pixel == 13'd1064) ||
            (pixel == 13'd1071) ||
            (pixel == 13'd1083) ||
            (pixel == 13'd1088) ||
            (pixel == 13'd1096) ||
            (pixel == 13'd1097) ||
            (pixel == 13'd1098) ||
            (pixel == 13'd1099) ||
            (pixel == 13'd1109) ||
            (pixel == 13'd1110) ||
            (pixel == 13'd1119) ||
            (pixel == 13'd1120) ||
            (pixel == 13'd1121) ||
            (pixel == 13'd1124) ||
            (pixel == 13'd1131) ||
            (pixel == 13'd1144) ||
            (pixel == 13'd1145) ||
            (pixel == 13'd1251) ||
            (pixel == 13'd1254) ||
            (pixel == 13'd1255) ||
            (pixel == 13'd1263) ||
            (pixel == 13'd1264) ||
            (pixel == 13'd1265) ||
            (pixel == 13'd1266) ||
            (pixel == 13'd1267) ||
            (pixel == 13'd1268) ||
            (pixel == 13'd1276) ||
            (pixel == 13'd1278) ||
            (pixel == 13'd1279) ||
            (pixel == 13'd1288) ||
            (pixel == 13'd1289) ||
            (pixel == 13'd1292) ||
            (pixel == 13'd1300) ||
            (pixel == 13'd1301) ||
            (pixel == 13'd1302) ||
            (pixel == 13'd1303) ||
            (pixel == 13'd1311) ||
            (pixel == 13'd1312) ||
            (pixel == 13'd1314) ||
            (pixel == 13'd1315) ||
            (pixel == 13'd1316) ||
            (pixel == 13'd1323) ||
            (pixel == 13'd1324) ||
            (pixel == 13'd1335) ||
            (pixel == 13'd1338) ||
            (pixel == 13'd1339) ||
            (pixel == 13'd1347) ||
            (pixel == 13'd1349) ||
            (pixel == 13'd1352) ||
            (pixel == 13'd1359) ||
            (pixel == 13'd1362) ||
            (pixel == 13'd1371) ||
            (pixel == 13'd1373) ||
            (pixel == 13'd1376) ||
            (pixel == 13'd1383) ||
            (pixel == 13'd1386) ||
            (pixel == 13'd1388) ||
            (pixel == 13'd1395) ||
            (pixel == 13'd1398) ||
            (pixel == 13'd1400) ||
            (pixel == 13'd1407) ||
            (pixel == 13'd1409) ||
            (pixel == 13'd1412) ||
            (pixel == 13'd1419) ||
            (pixel == 13'd1421) ||
            (pixel == 13'd1422) ||
            (pixel == 13'd1431) ||
            (pixel == 13'd1433) ||
            (pixel == 13'd1436) ||
            (pixel == 13'd1443) ||
            (pixel == 13'd1445) ||
            (pixel == 13'd1448) ||
            (pixel == 13'd1456) ||
            (pixel == 13'd1458) ||
            (pixel == 13'd1467) ||
            (pixel == 13'd1469) ||
            (pixel == 13'd1472) ||
            (pixel == 13'd1479) ||
            (pixel == 13'd1482) ||
            (pixel == 13'd1484) ||
            (pixel == 13'd1491) ||
            (pixel == 13'd1494) ||
            (pixel == 13'd1496) ||
            (pixel == 13'd1503) ||
            (pixel == 13'd1505) ||
            (pixel == 13'd1508) ||
            (pixel == 13'd1515) ||
            (pixel == 13'd1519) ||
            (pixel == 13'd1520) ||
            (pixel == 13'd1527) ||
            (pixel == 13'd1529) ||
            (pixel == 13'd1532) ||
            (pixel == 13'd1540) ||
            (pixel == 13'd1541) ||
            (pixel == 13'd1542) ||
            (pixel == 13'd1543) ||
            (pixel == 13'd1553) ||
            (pixel == 13'd1554) ||
            (pixel == 13'd1563) ||
            (pixel == 13'd1568) ||
            (pixel == 13'd1576) ||
            (pixel == 13'd1579) ||
            (pixel == 13'd1580) ||
            (pixel == 13'd1588) ||
            (pixel == 13'd1589) ||
            (pixel == 13'd1599) ||
            (pixel == 13'd1600) ||
            (pixel == 13'd1602) ||
            (pixel == 13'd1603) ||
            (pixel == 13'd1604) ||
            (pixel == 13'd1611) ||
            (pixel == 13'd1624) ||
            (pixel == 13'd1625) ||
            (pixel == 13'd1626) ||
            (pixel == 13'd1627) ||
            (pixel == 13'd1736) ||
            (pixel == 13'd1748) ||
            (pixel == 13'd1760) ||
            (pixel == 13'd1772) ||
            (pixel == 13'd1827) ||
            (pixel == 13'd1828) ||
            (pixel == 13'd1829) ||
            (pixel == 13'd1830) ||
            (pixel == 13'd1831) ||
            (pixel == 13'd1832) ||
            (pixel == 13'd1839) ||
            (pixel == 13'd1840) ||
            (pixel == 13'd1841) ||
            (pixel == 13'd1842) ||
            (pixel == 13'd1843) ||
            (pixel == 13'd1844) ||
            (pixel == 13'd1851) ||
            (pixel == 13'd1852) ||
            (pixel == 13'd1853) ||
            (pixel == 13'd1854) ||
            (pixel == 13'd1855) ||
            (pixel == 13'd1856) ||
            (pixel == 13'd1863) ||
            (pixel == 13'd1864) ||
            (pixel == 13'd1865) ||
            (pixel == 13'd1866) ||
            (pixel == 13'd1867) ||
            (pixel == 13'd1868) ||
            (pixel == 13'd1924) ||
            (pixel == 13'd1928) ||
            (pixel == 13'd1936) ||
            (pixel == 13'd1940) ||
            (pixel == 13'd1948) ||
            (pixel == 13'd1952) ||
            (pixel == 13'd1960) ||
            (pixel == 13'd1964)
        )
            active <= 1;
        else
            active <= 0;
    end
endmodule
