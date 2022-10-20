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
            (pixel == 13'd291) ||
            (pixel == 13'd292) ||
            (pixel == 13'd304) ||
            (pixel == 13'd305) ||
            (pixel == 13'd306) ||
            (pixel == 13'd307) ||
            (pixel == 13'd316) ||
            (pixel == 13'd317) ||
            (pixel == 13'd320) ||
            (pixel == 13'd332) ||
            (pixel == 13'd340) ||
            (pixel == 13'd341) ||
            (pixel == 13'd342) ||
            (pixel == 13'd343) ||
            (pixel == 13'd350) ||
            (pixel == 13'd353) ||
            (pixel == 13'd354) ||
            (pixel == 13'd363) ||
            (pixel == 13'd364) ||
            (pixel == 13'd387) ||
            (pixel == 13'd389) ||
            (pixel == 13'd390) ||
            (pixel == 13'd399) ||
            (pixel == 13'd404) ||
            (pixel == 13'd411) ||
            (pixel == 13'd414) ||
            (pixel == 13'd416) ||
            (pixel == 13'd423) ||
            (pixel == 13'd424) ||
            (pixel == 13'd425) ||
            (pixel == 13'd426) ||
            (pixel == 13'd427) ||
            (pixel == 13'd428) ||
            (pixel == 13'd435) ||
            (pixel == 13'd438) ||
            (pixel == 13'd440) ||
            (pixel == 13'd446) ||
            (pixel == 13'd448) ||
            (pixel == 13'd451) ||
            (pixel == 13'd459) ||
            (pixel == 13'd461) ||
            (pixel == 13'd462) ||
            (pixel == 13'd472) ||
            (pixel == 13'd474) ||
            (pixel == 13'd475) ||
            (pixel == 13'd483) ||
            (pixel == 13'd487) ||
            (pixel == 13'd488) ||
            (pixel == 13'd495) ||
            (pixel == 13'd500) ||
            (pixel == 13'd507) ||
            (pixel == 13'd510) ||
            (pixel == 13'd512) ||
            (pixel == 13'd520) ||
            (pixel == 13'd524) ||
            (pixel == 13'd531) ||
            (pixel == 13'd534) ||
            (pixel == 13'd536) ||
            (pixel == 13'd542) ||
            (pixel == 13'd544) ||
            (pixel == 13'd547) ||
            (pixel == 13'd555) ||
            (pixel == 13'd559) ||
            (pixel == 13'd560) ||
            (pixel == 13'd567) ||
            (pixel == 13'd569) ||
            (pixel == 13'd572) ||
            (pixel == 13'd579) ||
            (pixel == 13'd592) ||
            (pixel == 13'd593) ||
            (pixel == 13'd594) ||
            (pixel == 13'd595) ||
            (pixel == 13'd604) ||
            (pixel == 13'd607) ||
            (pixel == 13'd608) ||
            (pixel == 13'd628) ||
            (pixel == 13'd629) ||
            (pixel == 13'd639) ||
            (pixel == 13'd640) ||
            (pixel == 13'd641) ||
            (pixel == 13'd642) ||
            (pixel == 13'd651) ||
            (pixel == 13'd663) ||
            (pixel == 13'd665) ||
            (pixel == 13'd668) ||
            (pixel == 13'd759) ||
            (pixel == 13'd764) ||
            (pixel == 13'd772) ||
            (pixel == 13'd773) ||
            (pixel == 13'd774) ||
            (pixel == 13'd775) ||
            (pixel == 13'd783) ||
            (pixel == 13'd784) ||
            (pixel == 13'd795) ||
            (pixel == 13'd798) ||
            (pixel == 13'd799) ||
            (pixel == 13'd807) ||
            (pixel == 13'd808) ||
            (pixel == 13'd809) ||
            (pixel == 13'd810) ||
            (pixel == 13'd811) ||
            (pixel == 13'd812) ||
            (pixel == 13'd820) ||
            (pixel == 13'd821) ||
            (pixel == 13'd822) ||
            (pixel == 13'd823) ||
            (pixel == 13'd831) ||
            (pixel == 13'd833) ||
            (pixel == 13'd834) ||
            (pixel == 13'd843) ||
            (pixel == 13'd844) ||
            (pixel == 13'd867) ||
            (pixel == 13'd870) ||
            (pixel == 13'd872) ||
            (pixel == 13'd879) ||
            (pixel == 13'd881) ||
            (pixel == 13'd882) ||
            (pixel == 13'd891) ||
            (pixel == 13'd893) ||
            (pixel == 13'd896) ||
            (pixel == 13'd903) ||
            (pixel == 13'd906) ||
            (pixel == 13'd915) ||
            (pixel == 13'd920) ||
            (pixel == 13'd926) ||
            (pixel == 13'd928) ||
            (pixel == 13'd931) ||
            (pixel == 13'd939) ||
            (pixel == 13'd941) ||
            (pixel == 13'd942) ||
            (pixel == 13'd952) ||
            (pixel == 13'd954) ||
            (pixel == 13'd955) ||
            (pixel == 13'd963) ||
            (pixel == 13'd966) ||
            (pixel == 13'd968) ||
            (pixel == 13'd975) ||
            (pixel == 13'd979) ||
            (pixel == 13'd980) ||
            (pixel == 13'd987) ||
            (pixel == 13'd989) ||
            (pixel == 13'd992) ||
            (pixel == 13'd1000) ||
            (pixel == 13'd1002) ||
            (pixel == 13'd1011) ||
            (pixel == 13'd1016) ||
            (pixel == 13'd1022) ||
            (pixel == 13'd1024) ||
            (pixel == 13'd1027) ||
            (pixel == 13'd1035) ||
            (pixel == 13'd1039) ||
            (pixel == 13'd1040) ||
            (pixel == 13'd1047) ||
            (pixel == 13'd1049) ||
            (pixel == 13'd1052) ||
            (pixel == 13'd1060) ||
            (pixel == 13'd1061) ||
            (pixel == 13'd1071) ||
            (pixel == 13'd1083) ||
            (pixel == 13'd1084) ||
            (pixel == 13'd1085) ||
            (pixel == 13'd1088) ||
            (pixel == 13'd1097) ||
            (pixel == 13'd1098) ||
            (pixel == 13'd1108) ||
            (pixel == 13'd1109) ||
            (pixel == 13'd1110) ||
            (pixel == 13'd1111) ||
            (pixel == 13'd1118) ||
            (pixel == 13'd1123) ||
            (pixel == 13'd1131) ||
            (pixel == 13'd1143) ||
            (pixel == 13'd1145) ||
            (pixel == 13'd1148) ||
            (pixel == 13'd1239) ||
            (pixel == 13'd1244) ||
            (pixel == 13'd1251) ||
            (pixel == 13'd1254) ||
            (pixel == 13'd1255) ||
            (pixel == 13'd1263) ||
            (pixel == 13'd1264) ||
            (pixel == 13'd1275) ||
            (pixel == 13'd1276) ||
            (pixel == 13'd1278) ||
            (pixel == 13'd1279) ||
            (pixel == 13'd1280) ||
            (pixel == 13'd1288) ||
            (pixel == 13'd1289) ||
            (pixel == 13'd1290) ||
            (pixel == 13'd1291) ||
            (pixel == 13'd1300) ||
            (pixel == 13'd1301) ||
            (pixel == 13'd1304) ||
            (pixel == 13'd1311) ||
            (pixel == 13'd1313) ||
            (pixel == 13'd1314) ||
            (pixel == 13'd1323) ||
            (pixel == 13'd1324) ||
            (pixel == 13'd1325) ||
            (pixel == 13'd1326) ||
            (pixel == 13'd1327) ||
            (pixel == 13'd1328) ||
            (pixel == 13'd1347) ||
            (pixel == 13'd1349) ||
            (pixel == 13'd1352) ||
            (pixel == 13'd1359) ||
            (pixel == 13'd1361) ||
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
            (pixel == 13'd1406) ||
            (pixel == 13'd1408) ||
            (pixel == 13'd1411) ||
            (pixel == 13'd1419) ||
            (pixel == 13'd1422) ||
            (pixel == 13'd1431) ||
            (pixel == 13'd1434) ||
            (pixel == 13'd1435) ||
            (pixel == 13'd1443) ||
            (pixel == 13'd1445) ||
            (pixel == 13'd1448) ||
            (pixel == 13'd1455) ||
            (pixel == 13'd1459) ||
            (pixel == 13'd1460) ||
            (pixel == 13'd1467) ||
            (pixel == 13'd1469) ||
            (pixel == 13'd1472) ||
            (pixel == 13'd1479) ||
            (pixel == 13'd1482) ||
            (pixel == 13'd1484) ||
            (pixel == 13'd1491) ||
            (pixel == 13'd1494) ||
            (pixel == 13'd1496) ||
            (pixel == 13'd1502) ||
            (pixel == 13'd1504) ||
            (pixel == 13'd1507) ||
            (pixel == 13'd1516) ||
            (pixel == 13'd1518) ||
            (pixel == 13'd1527) ||
            (pixel == 13'd1529) ||
            (pixel == 13'd1532) ||
            (pixel == 13'd1540) ||
            (pixel == 13'd1541) ||
            (pixel == 13'd1542) ||
            (pixel == 13'd1543) ||
            (pixel == 13'd1551) ||
            (pixel == 13'd1563) ||
            (pixel == 13'd1564) ||
            (pixel == 13'd1566) ||
            (pixel == 13'd1567) ||
            (pixel == 13'd1568) ||
            (pixel == 13'd1576) ||
            (pixel == 13'd1577) ||
            (pixel == 13'd1588) ||
            (pixel == 13'd1591) ||
            (pixel == 13'd1592) ||
            (pixel == 13'd1598) ||
            (pixel == 13'd1603) ||
            (pixel == 13'd1613) ||
            (pixel == 13'd1614) ||
            (pixel == 13'd1623) ||
            (pixel == 13'd1625) ||
            (pixel == 13'd1628) ||
            (pixel == 13'd1720) ||
            (pixel == 13'd1721) ||
            (pixel == 13'd1722) ||
            (pixel == 13'd1723) ||
            (pixel == 13'd1784) ||
            (pixel == 13'd1795) ||
            (pixel == 13'd1808) ||
            (pixel == 13'd1875) ||
            (pixel == 13'd1876) ||
            (pixel == 13'd1877) ||
            (pixel == 13'd1878) ||
            (pixel == 13'd1879) ||
            (pixel == 13'd1880) ||
            (pixel == 13'd1886) ||
            (pixel == 13'd1887) ||
            (pixel == 13'd1888) ||
            (pixel == 13'd1889) ||
            (pixel == 13'd1890) ||
            (pixel == 13'd1891) ||
            (pixel == 13'd1899) ||
            (pixel == 13'd1900) ||
            (pixel == 13'd1901) ||
            (pixel == 13'd1902) ||
            (pixel == 13'd1903) ||
            (pixel == 13'd1904) ||
            (pixel == 13'd1916) ||
            (pixel == 13'd1972) ||
            (pixel == 13'd1976) ||
            (pixel == 13'd1983) ||
            (pixel == 13'd1987) ||
            (pixel == 13'd1996) ||
            (pixel == 13'd2000) ||
            (pixel == 13'd2007) ||
            (pixel == 13'd2008) ||
            (pixel == 13'd2009) ||
            (pixel == 13'd2010) ||
            (pixel == 13'd2011) ||
            (pixel == 13'd2012) ||
            (pixel == 13'd2104) ||
            (pixel == 13'd2108)
        )
            active <= 1;
        else
            active <= 0;
    end
endmodule
