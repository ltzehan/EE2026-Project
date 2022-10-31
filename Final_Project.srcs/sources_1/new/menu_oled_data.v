`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.10.2022 20:06:27
// Design Name: 
// Module Name: menu_oled_data
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


module menu_oled_data(
    input CLK,
    input [3:0] display_state,
    input [12:0] pixel,
    output reg [15:0] oled_data
    );
    
    always @(posedge CLK) begin
        oled_data <= `OLED_BLACK;
    
        // Header
        if (
            (pixel == 13'd786) || (pixel == 13'd787) || (pixel == 13'd788) || (pixel == 13'd789) || (pixel == 13'd790) || (pixel == 13'd797) || (pixel == 13'd798) || (pixel == 13'd799) || 
            (pixel == 13'd800) || (pixel == 13'd801) || (pixel == 13'd806) || (pixel == 13'd807) || (pixel == 13'd808) || (pixel == 13'd809) || (pixel == 13'd810) || (pixel == 13'd811) || 
            (pixel == 13'd812) || (pixel == 13'd813) || (pixel == 13'd817) || (pixel == 13'd818) || (pixel == 13'd819) || (pixel == 13'd820) || (pixel == 13'd827) || (pixel == 13'd828) || 
            (pixel == 13'd829) || (pixel == 13'd834) || (pixel == 13'd835) || (pixel == 13'd836) || (pixel == 13'd842) || (pixel == 13'd843) || (pixel == 13'd844) || (pixel == 13'd882) || 
            (pixel == 13'd883) || (pixel == 13'd884) || (pixel == 13'd885) || (pixel == 13'd886) || (pixel == 13'd893) || (pixel == 13'd894) || (pixel == 13'd895) || (pixel == 13'd896) || 
            (pixel == 13'd897) || (pixel == 13'd902) || (pixel == 13'd903) || (pixel == 13'd904) || (pixel == 13'd905) || (pixel == 13'd906) || (pixel == 13'd907) || (pixel == 13'd908) || 
            (pixel == 13'd909) || (pixel == 13'd913) || (pixel == 13'd914) || (pixel == 13'd915) || (pixel == 13'd916) || (pixel == 13'd923) || (pixel == 13'd924) || (pixel == 13'd925) || 
            (pixel == 13'd930) || (pixel == 13'd931) || (pixel == 13'd932) || (pixel == 13'd938) || (pixel == 13'd939) || (pixel == 13'd940) || (pixel == 13'd978) || (pixel == 13'd979) || 
            (pixel == 13'd980) || (pixel == 13'd981) || (pixel == 13'd982) || (pixel == 13'd983) || (pixel == 13'd989) || (pixel == 13'd990) || (pixel == 13'd991) || (pixel == 13'd992) || 
            (pixel == 13'd993) || (pixel == 13'd998) || (pixel == 13'd999) || (pixel == 13'd1000) || (pixel == 13'd1001) || (pixel == 13'd1002) || (pixel == 13'd1003) || (pixel == 13'd1004) || 
            (pixel == 13'd1005) || (pixel == 13'd1009) || (pixel == 13'd1010) || (pixel == 13'd1011) || (pixel == 13'd1012) || (pixel == 13'd1013) || (pixel == 13'd1019) || (pixel == 13'd1020) || 
            (pixel == 13'd1021) || (pixel == 13'd1026) || (pixel == 13'd1027) || (pixel == 13'd1028) || (pixel == 13'd1034) || (pixel == 13'd1035) || (pixel == 13'd1036) || (pixel == 13'd1074) || 
            (pixel == 13'd1075) || (pixel == 13'd1076) || (pixel == 13'd1077) || (pixel == 13'd1078) || (pixel == 13'd1079) || (pixel == 13'd1084) || (pixel == 13'd1085) || (pixel == 13'd1086) || 
            (pixel == 13'd1087) || (pixel == 13'd1088) || (pixel == 13'd1089) || (pixel == 13'd1094) || (pixel == 13'd1095) || (pixel == 13'd1096) || (pixel == 13'd1105) || (pixel == 13'd1106) || 
            (pixel == 13'd1107) || (pixel == 13'd1108) || (pixel == 13'd1109) || (pixel == 13'd1110) || (pixel == 13'd1115) || (pixel == 13'd1116) || (pixel == 13'd1117) || (pixel == 13'd1122) || 
            (pixel == 13'd1123) || (pixel == 13'd1124) || (pixel == 13'd1130) || (pixel == 13'd1131) || (pixel == 13'd1132) || (pixel == 13'd1170) || (pixel == 13'd1171) || (pixel == 13'd1172) || 
            (pixel == 13'd1173) || (pixel == 13'd1174) || (pixel == 13'd1175) || (pixel == 13'd1180) || (pixel == 13'd1181) || (pixel == 13'd1182) || (pixel == 13'd1183) || (pixel == 13'd1184) || 
            (pixel == 13'd1185) || (pixel == 13'd1190) || (pixel == 13'd1191) || (pixel == 13'd1192) || (pixel == 13'd1201) || (pixel == 13'd1202) || (pixel == 13'd1203) || (pixel == 13'd1204) || 
            (pixel == 13'd1205) || (pixel == 13'd1206) || (pixel == 13'd1211) || (pixel == 13'd1212) || (pixel == 13'd1213) || (pixel == 13'd1218) || (pixel == 13'd1219) || (pixel == 13'd1220) || 
            (pixel == 13'd1226) || (pixel == 13'd1227) || (pixel == 13'd1228) || (pixel == 13'd1266) || (pixel == 13'd1267) || (pixel == 13'd1268) || (pixel == 13'd1270) || (pixel == 13'd1271) || 
            (pixel == 13'd1272) || (pixel == 13'd1276) || (pixel == 13'd1277) || (pixel == 13'd1279) || (pixel == 13'd1280) || (pixel == 13'd1281) || (pixel == 13'd1286) || (pixel == 13'd1287) || 
            (pixel == 13'd1288) || (pixel == 13'd1297) || (pixel == 13'd1298) || (pixel == 13'd1299) || (pixel == 13'd1301) || (pixel == 13'd1302) || (pixel == 13'd1303) || (pixel == 13'd1307) || 
            (pixel == 13'd1308) || (pixel == 13'd1309) || (pixel == 13'd1314) || (pixel == 13'd1315) || (pixel == 13'd1316) || (pixel == 13'd1322) || (pixel == 13'd1323) || (pixel == 13'd1324) || 
            (pixel == 13'd1362) || (pixel == 13'd1363) || (pixel == 13'd1364) || (pixel == 13'd1366) || (pixel == 13'd1367) || (pixel == 13'd1368) || (pixel == 13'd1371) || (pixel == 13'd1372) || 
            (pixel == 13'd1373) || (pixel == 13'd1375) || (pixel == 13'd1376) || (pixel == 13'd1377) || (pixel == 13'd1382) || (pixel == 13'd1383) || (pixel == 13'd1384) || (pixel == 13'd1385) || 
            (pixel == 13'd1386) || (pixel == 13'd1387) || (pixel == 13'd1388) || (pixel == 13'd1393) || (pixel == 13'd1394) || (pixel == 13'd1395) || (pixel == 13'd1397) || (pixel == 13'd1398) || 
            (pixel == 13'd1399) || (pixel == 13'd1400) || (pixel == 13'd1403) || (pixel == 13'd1404) || (pixel == 13'd1405) || (pixel == 13'd1410) || (pixel == 13'd1411) || (pixel == 13'd1412) || 
            (pixel == 13'd1418) || (pixel == 13'd1419) || (pixel == 13'd1420) || (pixel == 13'd1458) || (pixel == 13'd1459) || (pixel == 13'd1460) || (pixel == 13'd1462) || (pixel == 13'd1463) || 
            (pixel == 13'd1464) || (pixel == 13'd1467) || (pixel == 13'd1468) || (pixel == 13'd1469) || (pixel == 13'd1471) || (pixel == 13'd1472) || (pixel == 13'd1473) || (pixel == 13'd1478) || 
            (pixel == 13'd1479) || (pixel == 13'd1480) || (pixel == 13'd1481) || (pixel == 13'd1482) || (pixel == 13'd1483) || (pixel == 13'd1484) || (pixel == 13'd1489) || (pixel == 13'd1490) || 
            (pixel == 13'd1491) || (pixel == 13'd1494) || (pixel == 13'd1495) || (pixel == 13'd1496) || (pixel == 13'd1499) || (pixel == 13'd1500) || (pixel == 13'd1501) || (pixel == 13'd1506) || 
            (pixel == 13'd1507) || (pixel == 13'd1508) || (pixel == 13'd1514) || (pixel == 13'd1515) || (pixel == 13'd1516) || (pixel == 13'd1554) || (pixel == 13'd1555) || (pixel == 13'd1556) || 
            (pixel == 13'd1559) || (pixel == 13'd1560) || (pixel == 13'd1561) || (pixel == 13'd1563) || (pixel == 13'd1564) || (pixel == 13'd1567) || (pixel == 13'd1568) || (pixel == 13'd1569) || 
            (pixel == 13'd1574) || (pixel == 13'd1575) || (pixel == 13'd1576) || (pixel == 13'd1577) || (pixel == 13'd1578) || (pixel == 13'd1579) || (pixel == 13'd1580) || (pixel == 13'd1585) || 
            (pixel == 13'd1586) || (pixel == 13'd1587) || (pixel == 13'd1591) || (pixel == 13'd1592) || (pixel == 13'd1593) || (pixel == 13'd1595) || (pixel == 13'd1596) || (pixel == 13'd1597) || 
            (pixel == 13'd1602) || (pixel == 13'd1603) || (pixel == 13'd1604) || (pixel == 13'd1610) || (pixel == 13'd1611) || (pixel == 13'd1612) || (pixel == 13'd1650) || (pixel == 13'd1651) || 
            (pixel == 13'd1652) || (pixel == 13'd1655) || (pixel == 13'd1656) || (pixel == 13'd1657) || (pixel == 13'd1659) || (pixel == 13'd1660) || (pixel == 13'd1663) || (pixel == 13'd1664) || 
            (pixel == 13'd1665) || (pixel == 13'd1670) || (pixel == 13'd1671) || (pixel == 13'd1672) || (pixel == 13'd1681) || (pixel == 13'd1682) || (pixel == 13'd1683) || (pixel == 13'd1687) || 
            (pixel == 13'd1688) || (pixel == 13'd1689) || (pixel == 13'd1690) || (pixel == 13'd1691) || (pixel == 13'd1692) || (pixel == 13'd1693) || (pixel == 13'd1698) || (pixel == 13'd1699) || 
            (pixel == 13'd1700) || (pixel == 13'd1706) || (pixel == 13'd1707) || (pixel == 13'd1708) || (pixel == 13'd1746) || (pixel == 13'd1747) || (pixel == 13'd1748) || (pixel == 13'd1751) || 
            (pixel == 13'd1752) || (pixel == 13'd1753) || (pixel == 13'd1754) || (pixel == 13'd1755) || (pixel == 13'd1756) || (pixel == 13'd1759) || (pixel == 13'd1760) || (pixel == 13'd1761) || 
            (pixel == 13'd1766) || (pixel == 13'd1767) || (pixel == 13'd1768) || (pixel == 13'd1777) || (pixel == 13'd1778) || (pixel == 13'd1779) || (pixel == 13'd1784) || (pixel == 13'd1785) || 
            (pixel == 13'd1786) || (pixel == 13'd1787) || (pixel == 13'd1788) || (pixel == 13'd1789) || (pixel == 13'd1794) || (pixel == 13'd1795) || (pixel == 13'd1796) || (pixel == 13'd1802) || 
            (pixel == 13'd1803) || (pixel == 13'd1804) || (pixel == 13'd1842) || (pixel == 13'd1843) || (pixel == 13'd1844) || (pixel == 13'd1848) || (pixel == 13'd1849) || (pixel == 13'd1850) || 
            (pixel == 13'd1851) || (pixel == 13'd1855) || (pixel == 13'd1856) || (pixel == 13'd1857) || (pixel == 13'd1862) || (pixel == 13'd1863) || (pixel == 13'd1864) || (pixel == 13'd1873) || 
            (pixel == 13'd1874) || (pixel == 13'd1875) || (pixel == 13'd1881) || (pixel == 13'd1882) || (pixel == 13'd1883) || (pixel == 13'd1884) || (pixel == 13'd1885) || (pixel == 13'd1890) || 
            (pixel == 13'd1891) || (pixel == 13'd1892) || (pixel == 13'd1893) || (pixel == 13'd1897) || (pixel == 13'd1898) || (pixel == 13'd1899) || (pixel == 13'd1900) || (pixel == 13'd1938) || 
            (pixel == 13'd1939) || (pixel == 13'd1940) || (pixel == 13'd1944) || (pixel == 13'd1945) || (pixel == 13'd1946) || (pixel == 13'd1947) || (pixel == 13'd1951) || (pixel == 13'd1952) || 
            (pixel == 13'd1953) || (pixel == 13'd1958) || (pixel == 13'd1959) || (pixel == 13'd1960) || (pixel == 13'd1961) || (pixel == 13'd1962) || (pixel == 13'd1963) || (pixel == 13'd1964) || 
            (pixel == 13'd1965) || (pixel == 13'd1969) || (pixel == 13'd1970) || (pixel == 13'd1971) || (pixel == 13'd1977) || (pixel == 13'd1978) || (pixel == 13'd1979) || (pixel == 13'd1980) || 
            (pixel == 13'd1981) || (pixel == 13'd1987) || (pixel == 13'd1988) || (pixel == 13'd1989) || (pixel == 13'd1990) || (pixel == 13'd1991) || (pixel == 13'd1992) || (pixel == 13'd1993) || 
            (pixel == 13'd1994) || (pixel == 13'd1995) || (pixel == 13'd2034) || (pixel == 13'd2035) || (pixel == 13'd2036) || (pixel == 13'd2040) || (pixel == 13'd2041) || (pixel == 13'd2042) || 
            (pixel == 13'd2043) || (pixel == 13'd2047) || (pixel == 13'd2048) || (pixel == 13'd2049) || (pixel == 13'd2054) || (pixel == 13'd2055) || (pixel == 13'd2056) || (pixel == 13'd2057) || 
            (pixel == 13'd2058) || (pixel == 13'd2059) || (pixel == 13'd2060) || (pixel == 13'd2061) || (pixel == 13'd2065) || (pixel == 13'd2066) || (pixel == 13'd2067) || (pixel == 13'd2074) || 
            (pixel == 13'd2075) || (pixel == 13'd2076) || (pixel == 13'd2077) || (pixel == 13'd2083) || (pixel == 13'd2084) || (pixel == 13'd2085) || (pixel == 13'd2086) || (pixel == 13'd2087) || 
            (pixel == 13'd2088) || (pixel == 13'd2089) || (pixel == 13'd2090) || (pixel == 13'd2130) || (pixel == 13'd2131) || (pixel == 13'd2132) || (pixel == 13'd2137) || (pixel == 13'd2138) || 
            (pixel == 13'd2143) || (pixel == 13'd2144) || (pixel == 13'd2145) || (pixel == 13'd2150) || (pixel == 13'd2151) || (pixel == 13'd2152) || (pixel == 13'd2153) || (pixel == 13'd2154) || 
            (pixel == 13'd2155) || (pixel == 13'd2156) || (pixel == 13'd2157) || (pixel == 13'd2161) || (pixel == 13'd2162) || (pixel == 13'd2163) || (pixel == 13'd2170) || (pixel == 13'd2171) || 
            (pixel == 13'd2172) || (pixel == 13'd2173) || (pixel == 13'd2181) || (pixel == 13'd2182) || (pixel == 13'd2183) || (pixel == 13'd2184) || (pixel == 13'd2185)) 
            oled_data <= `OLED_ORANGE;
    
        case (display_state)
            `MENU_OLED_A:
                if (
                (pixel == 13'd3309) || (pixel == 13'd3310) || (pixel == 13'd3380) || (pixel == 13'd3381) || (pixel == 13'd3382) || (pixel == 13'd3383) || (pixel == 13'd3384) || (pixel == 13'd3385) || 
                (pixel == 13'd3386) || (pixel == 13'd3387) || (pixel == 13'd3405) || (pixel == 13'd3406) || (pixel == 13'd3422) || (pixel == 13'd3423) || (pixel == 13'd3430) || (pixel == 13'd3431) || 
                (pixel == 13'd3432) || (pixel == 13'd3476) || (pixel == 13'd3477) || (pixel == 13'd3478) || (pixel == 13'd3479) || (pixel == 13'd3480) || (pixel == 13'd3481) || (pixel == 13'd3482) || 
                (pixel == 13'd3483) || (pixel == 13'd3501) || (pixel == 13'd3502) || (pixel == 13'd3517) || (pixel == 13'd3518) || (pixel == 13'd3519) || (pixel == 13'd3526) || (pixel == 13'd3527) || 
                (pixel == 13'd3528) || (pixel == 13'd3529) || (pixel == 13'd3542) || (pixel == 13'd3543) || (pixel == 13'd3575) || (pixel == 13'd3576) || (pixel == 13'd3597) || (pixel == 13'd3598) || 
                (pixel == 13'd3613) || (pixel == 13'd3614) || (pixel == 13'd3615) || (pixel == 13'd3621) || (pixel == 13'd3622) || (pixel == 13'd3624) || (pixel == 13'd3625) || (pixel == 13'd3638) || 
                (pixel == 13'd3639) || (pixel == 13'd3640) || (pixel == 13'd3671) || (pixel == 13'd3672) || (pixel == 13'd3677) || (pixel == 13'd3678) || (pixel == 13'd3679) || (pixel == 13'd3680) || 
                (pixel == 13'd3681) || (pixel == 13'd3687) || (pixel == 13'd3688) || (pixel == 13'd3689) || (pixel == 13'd3690) || (pixel == 13'd3693) || (pixel == 13'd3694) || (pixel == 13'd3698) || 
                (pixel == 13'd3699) || (pixel == 13'd3700) || (pixel == 13'd3708) || (pixel == 13'd3709) || (pixel == 13'd3710) || (pixel == 13'd3711) || (pixel == 13'd3717) || (pixel == 13'd3718) || 
                (pixel == 13'd3720) || (pixel == 13'd3721) || (pixel == 13'd3734) || (pixel == 13'd3735) || (pixel == 13'd3736) || (pixel == 13'd3737) || (pixel == 13'd3767) || (pixel == 13'd3768) || 
                (pixel == 13'd3773) || (pixel == 13'd3774) || (pixel == 13'd3775) || (pixel == 13'd3776) || (pixel == 13'd3777) || (pixel == 13'd3778) || (pixel == 13'd3782) || (pixel == 13'd3783) || 
                (pixel == 13'd3784) || (pixel == 13'd3785) || (pixel == 13'd3789) || (pixel == 13'd3790) || (pixel == 13'd3793) || (pixel == 13'd3794) || (pixel == 13'd3795) || (pixel == 13'd3803) || 
                (pixel == 13'd3804) || (pixel == 13'd3806) || (pixel == 13'd3807) || (pixel == 13'd3812) || (pixel == 13'd3813) || (pixel == 13'd3814) || (pixel == 13'd3816) || (pixel == 13'd3817) || 
                (pixel == 13'd3818) || (pixel == 13'd3830) || (pixel == 13'd3831) || (pixel == 13'd3832) || (pixel == 13'd3833) || (pixel == 13'd3834) || (pixel == 13'd3863) || (pixel == 13'd3864) || 
                (pixel == 13'd3873) || (pixel == 13'd3874) || (pixel == 13'd3878) || (pixel == 13'd3879) || (pixel == 13'd3885) || (pixel == 13'd3886) || (pixel == 13'd3888) || (pixel == 13'd3889) || 
                (pixel == 13'd3890) || (pixel == 13'd3898) || (pixel == 13'd3899) || (pixel == 13'd3902) || (pixel == 13'd3903) || (pixel == 13'd3908) || (pixel == 13'd3909) || (pixel == 13'd3913) || 
                (pixel == 13'd3914) || (pixel == 13'd3926) || (pixel == 13'd3927) || (pixel == 13'd3928) || (pixel == 13'd3929) || (pixel == 13'd3930) || (pixel == 13'd3959) || (pixel == 13'd3960) || 
                (pixel == 13'd3965) || (pixel == 13'd3966) || (pixel == 13'd3967) || (pixel == 13'd3968) || (pixel == 13'd3969) || (pixel == 13'd3970) || (pixel == 13'd3974) || (pixel == 13'd3975) || 
                (pixel == 13'd3976) || (pixel == 13'd3977) || (pixel == 13'd3981) || (pixel == 13'd3982) || (pixel == 13'd3983) || (pixel == 13'd3984) || (pixel == 13'd3985) || (pixel == 13'd3993) || 
                (pixel == 13'd3994) || (pixel == 13'd3995) || (pixel == 13'd3998) || (pixel == 13'd3999) || (pixel == 13'd4004) || (pixel == 13'd4005) || (pixel == 13'd4009) || (pixel == 13'd4010) || 
                (pixel == 13'd4022) || (pixel == 13'd4023) || (pixel == 13'd4024) || (pixel == 13'd4025) || (pixel == 13'd4055) || (pixel == 13'd4056) || (pixel == 13'd4060) || (pixel == 13'd4061) || 
                (pixel == 13'd4062) || (pixel == 13'd4065) || (pixel == 13'd4066) || (pixel == 13'd4071) || (pixel == 13'd4072) || (pixel == 13'd4073) || (pixel == 13'd4074) || (pixel == 13'd4077) || 
                (pixel == 13'd4078) || (pixel == 13'd4079) || (pixel == 13'd4080) || (pixel == 13'd4081) || (pixel == 13'd4089) || (pixel == 13'd4090) || (pixel == 13'd4091) || (pixel == 13'd4092) || 
                (pixel == 13'd4093) || (pixel == 13'd4094) || (pixel == 13'd4095) || (pixel == 13'd4096) || (pixel == 13'd4099) || (pixel == 13'd4100) || (pixel == 13'd4101) || (pixel == 13'd4102) || 
                (pixel == 13'd4103) || (pixel == 13'd4104) || (pixel == 13'd4105) || (pixel == 13'd4106) || (pixel == 13'd4107) || (pixel == 13'd4118) || (pixel == 13'd4119) || (pixel == 13'd4120) || 
                (pixel == 13'd4151) || (pixel == 13'd4152) || (pixel == 13'd4156) || (pixel == 13'd4157) || (pixel == 13'd4161) || (pixel == 13'd4162) || (pixel == 13'd4169) || (pixel == 13'd4170) || 
                (pixel == 13'd4173) || (pixel == 13'd4174) || (pixel == 13'd4176) || (pixel == 13'd4177) || (pixel == 13'd4178) || (pixel == 13'd4185) || (pixel == 13'd4186) || (pixel == 13'd4187) || 
                (pixel == 13'd4188) || (pixel == 13'd4189) || (pixel == 13'd4190) || (pixel == 13'd4191) || (pixel == 13'd4192) || (pixel == 13'd4195) || (pixel == 13'd4196) || (pixel == 13'd4197) || 
                (pixel == 13'd4198) || (pixel == 13'd4199) || (pixel == 13'd4200) || (pixel == 13'd4201) || (pixel == 13'd4202) || (pixel == 13'd4203) || (pixel == 13'd4214) || (pixel == 13'd4215) || 
                (pixel == 13'd4247) || (pixel == 13'd4248) || (pixel == 13'd4252) || (pixel == 13'd4253) || (pixel == 13'd4254) || (pixel == 13'd4255) || (pixel == 13'd4256) || (pixel == 13'd4257) || 
                (pixel == 13'd4258) || (pixel == 13'd4262) || (pixel == 13'd4263) || (pixel == 13'd4264) || (pixel == 13'd4265) || (pixel == 13'd4266) || (pixel == 13'd4269) || (pixel == 13'd4270) || 
                (pixel == 13'd4273) || (pixel == 13'd4274) || (pixel == 13'd4275) || (pixel == 13'd4286) || (pixel == 13'd4287) || (pixel == 13'd4291) || (pixel == 13'd4292) || (pixel == 13'd4298) || 
                (pixel == 13'd4299) || (pixel == 13'd4343) || (pixel == 13'd4344) || (pixel == 13'd4349) || (pixel == 13'd4350) || (pixel == 13'd4351) || (pixel == 13'd4353) || (pixel == 13'd4354) || 
                (pixel == 13'd4358) || (pixel == 13'd4359) || (pixel == 13'd4360) || (pixel == 13'd4361) || (pixel == 13'd4365) || (pixel == 13'd4366) || (pixel == 13'd4370) || (pixel == 13'd4371) || 
                (pixel == 13'd4372) || (pixel == 13'd4382) || (pixel == 13'd4383) || (pixel == 13'd4386) || (pixel == 13'd4387) || (pixel == 13'd4388) || (pixel == 13'd4394) || (pixel == 13'd4395) || 
                (pixel == 13'd4396))
                oled_data <= `OLED_WHITE;
                
            `MENU_OLED_B:
                if (
                (pixel == 13'd3309) || (pixel == 13'd3310) || (pixel == 13'd3380) || (pixel == 13'd3381) || (pixel == 13'd3382) || (pixel == 13'd3383) || (pixel == 13'd3384) || (pixel == 13'd3385) || 
                (pixel == 13'd3386) || (pixel == 13'd3387) || (pixel == 13'd3405) || (pixel == 13'd3406) || (pixel == 13'd3422) || (pixel == 13'd3423) || (pixel == 13'd3427) || (pixel == 13'd3428) || 
                (pixel == 13'd3429) || (pixel == 13'd3430) || (pixel == 13'd3431) || (pixel == 13'd3432) || (pixel == 13'd3433) || (pixel == 13'd3464) || (pixel == 13'd3465) || (pixel == 13'd3476) || 
                (pixel == 13'd3477) || (pixel == 13'd3478) || (pixel == 13'd3479) || (pixel == 13'd3480) || (pixel == 13'd3481) || (pixel == 13'd3482) || (pixel == 13'd3483) || (pixel == 13'd3501) || 
                (pixel == 13'd3502) || (pixel == 13'd3517) || (pixel == 13'd3518) || (pixel == 13'd3519) || (pixel == 13'd3523) || (pixel == 13'd3524) || (pixel == 13'd3525) || (pixel == 13'd3526) || 
                (pixel == 13'd3527) || (pixel == 13'd3528) || (pixel == 13'd3529) || (pixel == 13'd3530) || (pixel == 13'd3542) || (pixel == 13'd3543) || (pixel == 13'd3559) || (pixel == 13'd3560) || 
                (pixel == 13'd3561) || (pixel == 13'd3575) || (pixel == 13'd3576) || (pixel == 13'd3597) || (pixel == 13'd3598) || (pixel == 13'd3613) || (pixel == 13'd3614) || (pixel == 13'd3615) || 
                (pixel == 13'd3619) || (pixel == 13'd3620) || (pixel == 13'd3625) || (pixel == 13'd3626) || (pixel == 13'd3638) || (pixel == 13'd3639) || (pixel == 13'd3640) || (pixel == 13'd3654) || 
                (pixel == 13'd3655) || (pixel == 13'd3656) || (pixel == 13'd3657) || (pixel == 13'd3671) || (pixel == 13'd3672) || (pixel == 13'd3677) || (pixel == 13'd3678) || (pixel == 13'd3679) || 
                (pixel == 13'd3680) || (pixel == 13'd3681) || (pixel == 13'd3687) || (pixel == 13'd3688) || (pixel == 13'd3689) || (pixel == 13'd3690) || (pixel == 13'd3693) || (pixel == 13'd3694) || 
                (pixel == 13'd3698) || (pixel == 13'd3699) || (pixel == 13'd3700) || (pixel == 13'd3708) || (pixel == 13'd3709) || (pixel == 13'd3710) || (pixel == 13'd3711) || (pixel == 13'd3715) || 
                (pixel == 13'd3716) || (pixel == 13'd3721) || (pixel == 13'd3722) || (pixel == 13'd3734) || (pixel == 13'd3735) || (pixel == 13'd3736) || (pixel == 13'd3737) || (pixel == 13'd3749) || 
                (pixel == 13'd3750) || (pixel == 13'd3751) || (pixel == 13'd3752) || (pixel == 13'd3753) || (pixel == 13'd3767) || (pixel == 13'd3768) || (pixel == 13'd3773) || (pixel == 13'd3774) || 
                (pixel == 13'd3775) || (pixel == 13'd3776) || (pixel == 13'd3777) || (pixel == 13'd3778) || (pixel == 13'd3782) || (pixel == 13'd3783) || (pixel == 13'd3784) || (pixel == 13'd3785) || 
                (pixel == 13'd3789) || (pixel == 13'd3790) || (pixel == 13'd3793) || (pixel == 13'd3794) || (pixel == 13'd3795) || (pixel == 13'd3803) || (pixel == 13'd3804) || (pixel == 13'd3806) || 
                (pixel == 13'd3807) || (pixel == 13'd3811) || (pixel == 13'd3812) || (pixel == 13'd3813) || (pixel == 13'd3814) || (pixel == 13'd3815) || (pixel == 13'd3816) || (pixel == 13'd3830) || 
                (pixel == 13'd3831) || (pixel == 13'd3832) || (pixel == 13'd3833) || (pixel == 13'd3834) || (pixel == 13'd3845) || (pixel == 13'd3846) || (pixel == 13'd3847) || (pixel == 13'd3848) || 
                (pixel == 13'd3849) || (pixel == 13'd3863) || (pixel == 13'd3864) || (pixel == 13'd3873) || (pixel == 13'd3874) || (pixel == 13'd3878) || (pixel == 13'd3879) || (pixel == 13'd3885) || 
                (pixel == 13'd3886) || (pixel == 13'd3888) || (pixel == 13'd3889) || (pixel == 13'd3890) || (pixel == 13'd3898) || (pixel == 13'd3899) || (pixel == 13'd3902) || (pixel == 13'd3903) || 
                (pixel == 13'd3907) || (pixel == 13'd3908) || (pixel == 13'd3909) || (pixel == 13'd3910) || (pixel == 13'd3911) || (pixel == 13'd3912) || (pixel == 13'd3913) || (pixel == 13'd3926) || 
                (pixel == 13'd3927) || (pixel == 13'd3928) || (pixel == 13'd3929) || (pixel == 13'd3930) || (pixel == 13'd3942) || (pixel == 13'd3943) || (pixel == 13'd3944) || (pixel == 13'd3945) || 
                (pixel == 13'd3959) || (pixel == 13'd3960) || (pixel == 13'd3965) || (pixel == 13'd3966) || (pixel == 13'd3967) || (pixel == 13'd3968) || (pixel == 13'd3969) || (pixel == 13'd3970) || 
                (pixel == 13'd3974) || (pixel == 13'd3975) || (pixel == 13'd3976) || (pixel == 13'd3977) || (pixel == 13'd3981) || (pixel == 13'd3982) || (pixel == 13'd3983) || (pixel == 13'd3984) || 
                (pixel == 13'd3985) || (pixel == 13'd3993) || (pixel == 13'd3994) || (pixel == 13'd3995) || (pixel == 13'd3998) || (pixel == 13'd3999) || (pixel == 13'd4003) || (pixel == 13'd4004) || 
                (pixel == 13'd4009) || (pixel == 13'd4010) || (pixel == 13'd4022) || (pixel == 13'd4023) || (pixel == 13'd4024) || (pixel == 13'd4025) || (pixel == 13'd4039) || (pixel == 13'd4040) || 
                (pixel == 13'd4041) || (pixel == 13'd4055) || (pixel == 13'd4056) || (pixel == 13'd4060) || (pixel == 13'd4061) || (pixel == 13'd4062) || (pixel == 13'd4065) || (pixel == 13'd4066) || 
                (pixel == 13'd4071) || (pixel == 13'd4072) || (pixel == 13'd4073) || (pixel == 13'd4074) || (pixel == 13'd4077) || (pixel == 13'd4078) || (pixel == 13'd4079) || (pixel == 13'd4080) || 
                (pixel == 13'd4081) || (pixel == 13'd4089) || (pixel == 13'd4090) || (pixel == 13'd4091) || (pixel == 13'd4092) || (pixel == 13'd4093) || (pixel == 13'd4094) || (pixel == 13'd4095) || 
                (pixel == 13'd4096) || (pixel == 13'd4099) || (pixel == 13'd4100) || (pixel == 13'd4105) || (pixel == 13'd4106) || (pixel == 13'd4118) || (pixel == 13'd4119) || (pixel == 13'd4120) || 
                (pixel == 13'd4136) || (pixel == 13'd4137) || (pixel == 13'd4151) || (pixel == 13'd4152) || (pixel == 13'd4156) || (pixel == 13'd4157) || (pixel == 13'd4161) || (pixel == 13'd4162) || 
                (pixel == 13'd4169) || (pixel == 13'd4170) || (pixel == 13'd4173) || (pixel == 13'd4174) || (pixel == 13'd4176) || (pixel == 13'd4177) || (pixel == 13'd4178) || (pixel == 13'd4185) || 
                (pixel == 13'd4186) || (pixel == 13'd4187) || (pixel == 13'd4188) || (pixel == 13'd4189) || (pixel == 13'd4190) || (pixel == 13'd4191) || (pixel == 13'd4192) || (pixel == 13'd4195) || 
                (pixel == 13'd4196) || (pixel == 13'd4200) || (pixel == 13'd4201) || (pixel == 13'd4202) || (pixel == 13'd4214) || (pixel == 13'd4215) || (pixel == 13'd4247) || (pixel == 13'd4248) || 
                (pixel == 13'd4252) || (pixel == 13'd4253) || (pixel == 13'd4254) || (pixel == 13'd4255) || (pixel == 13'd4256) || (pixel == 13'd4257) || (pixel == 13'd4258) || (pixel == 13'd4262) || 
                (pixel == 13'd4263) || (pixel == 13'd4264) || (pixel == 13'd4265) || (pixel == 13'd4266) || (pixel == 13'd4269) || (pixel == 13'd4270) || (pixel == 13'd4273) || (pixel == 13'd4274) || 
                (pixel == 13'd4275) || (pixel == 13'd4286) || (pixel == 13'd4287) || (pixel == 13'd4291) || (pixel == 13'd4292) || (pixel == 13'd4293) || (pixel == 13'd4294) || (pixel == 13'd4295) || 
                (pixel == 13'd4296) || (pixel == 13'd4297) || (pixel == 13'd4343) || (pixel == 13'd4344) || (pixel == 13'd4349) || (pixel == 13'd4350) || (pixel == 13'd4351) || (pixel == 13'd4353) || 
                (pixel == 13'd4354) || (pixel == 13'd4358) || (pixel == 13'd4359) || (pixel == 13'd4360) || (pixel == 13'd4361) || (pixel == 13'd4365) || (pixel == 13'd4366) || (pixel == 13'd4370) || 
                (pixel == 13'd4371) || (pixel == 13'd4372) || (pixel == 13'd4382) || (pixel == 13'd4383) || (pixel == 13'd4387) || (pixel == 13'd4388) || (pixel == 13'd4389) || (pixel == 13'd4390) || 
                (pixel == 13'd4391) || (pixel == 13'd4392))
                oled_data <= `OLED_WHITE;
                
            `MENU_AVI:
                if (
                (pixel == 13'd3309) || (pixel == 13'd3310) || (pixel == 13'd3380) || (pixel == 13'd3381) || (pixel == 13'd3382) || (pixel == 13'd3383) || (pixel == 13'd3384) || (pixel == 13'd3385) || 
                (pixel == 13'd3386) || (pixel == 13'd3387) || (pixel == 13'd3405) || (pixel == 13'd3406) || (pixel == 13'd3422) || (pixel == 13'd3423) || (pixel == 13'd3430) || (pixel == 13'd3431) || 
                (pixel == 13'd3432) || (pixel == 13'd3433) || (pixel == 13'd3434) || (pixel == 13'd3464) || (pixel == 13'd3465) || (pixel == 13'd3476) || (pixel == 13'd3477) || (pixel == 13'd3478) || 
                (pixel == 13'd3479) || (pixel == 13'd3480) || (pixel == 13'd3481) || (pixel == 13'd3482) || (pixel == 13'd3483) || (pixel == 13'd3501) || (pixel == 13'd3502) || (pixel == 13'd3517) || 
                (pixel == 13'd3518) || (pixel == 13'd3519) || (pixel == 13'd3525) || (pixel == 13'd3526) || (pixel == 13'd3527) || (pixel == 13'd3528) || (pixel == 13'd3529) || (pixel == 13'd3530) || 
                (pixel == 13'd3542) || (pixel == 13'd3543) || (pixel == 13'd3559) || (pixel == 13'd3560) || (pixel == 13'd3561) || (pixel == 13'd3575) || (pixel == 13'd3576) || (pixel == 13'd3597) || 
                (pixel == 13'd3598) || (pixel == 13'd3613) || (pixel == 13'd3614) || (pixel == 13'd3615) || (pixel == 13'd3620) || (pixel == 13'd3621) || (pixel == 13'd3622) || (pixel == 13'd3626) || 
                (pixel == 13'd3638) || (pixel == 13'd3639) || (pixel == 13'd3640) || (pixel == 13'd3654) || (pixel == 13'd3655) || (pixel == 13'd3656) || (pixel == 13'd3657) || (pixel == 13'd3671) || 
                (pixel == 13'd3672) || (pixel == 13'd3677) || (pixel == 13'd3678) || (pixel == 13'd3679) || (pixel == 13'd3680) || (pixel == 13'd3681) || (pixel == 13'd3687) || (pixel == 13'd3688) || 
                (pixel == 13'd3689) || (pixel == 13'd3690) || (pixel == 13'd3693) || (pixel == 13'd3694) || (pixel == 13'd3698) || (pixel == 13'd3699) || (pixel == 13'd3700) || (pixel == 13'd3708) || 
                (pixel == 13'd3709) || (pixel == 13'd3710) || (pixel == 13'd3711) || (pixel == 13'd3715) || (pixel == 13'd3716) || (pixel == 13'd3717) || (pixel == 13'd3734) || (pixel == 13'd3735) || 
                (pixel == 13'd3736) || (pixel == 13'd3737) || (pixel == 13'd3749) || (pixel == 13'd3750) || (pixel == 13'd3751) || (pixel == 13'd3752) || (pixel == 13'd3753) || (pixel == 13'd3767) || 
                (pixel == 13'd3768) || (pixel == 13'd3773) || (pixel == 13'd3774) || (pixel == 13'd3775) || (pixel == 13'd3776) || (pixel == 13'd3777) || (pixel == 13'd3778) || (pixel == 13'd3782) || 
                (pixel == 13'd3783) || (pixel == 13'd3784) || (pixel == 13'd3785) || (pixel == 13'd3789) || (pixel == 13'd3790) || (pixel == 13'd3793) || (pixel == 13'd3794) || (pixel == 13'd3795) || 
                (pixel == 13'd3803) || (pixel == 13'd3804) || (pixel == 13'd3806) || (pixel == 13'd3807) || (pixel == 13'd3811) || (pixel == 13'd3812) || (pixel == 13'd3830) || (pixel == 13'd3831) || 
                (pixel == 13'd3832) || (pixel == 13'd3833) || (pixel == 13'd3834) || (pixel == 13'd3845) || (pixel == 13'd3846) || (pixel == 13'd3847) || (pixel == 13'd3848) || (pixel == 13'd3849) || 
                (pixel == 13'd3863) || (pixel == 13'd3864) || (pixel == 13'd3873) || (pixel == 13'd3874) || (pixel == 13'd3878) || (pixel == 13'd3879) || (pixel == 13'd3885) || (pixel == 13'd3886) || 
                (pixel == 13'd3888) || (pixel == 13'd3889) || (pixel == 13'd3890) || (pixel == 13'd3898) || (pixel == 13'd3899) || (pixel == 13'd3902) || (pixel == 13'd3903) || (pixel == 13'd3907) || 
                (pixel == 13'd3908) || (pixel == 13'd3926) || (pixel == 13'd3927) || (pixel == 13'd3928) || (pixel == 13'd3929) || (pixel == 13'd3930) || (pixel == 13'd3942) || (pixel == 13'd3943) || 
                (pixel == 13'd3944) || (pixel == 13'd3945) || (pixel == 13'd3959) || (pixel == 13'd3960) || (pixel == 13'd3965) || (pixel == 13'd3966) || (pixel == 13'd3967) || (pixel == 13'd3968) || 
                (pixel == 13'd3969) || (pixel == 13'd3970) || (pixel == 13'd3974) || (pixel == 13'd3975) || (pixel == 13'd3976) || (pixel == 13'd3977) || (pixel == 13'd3981) || (pixel == 13'd3982) || 
                (pixel == 13'd3983) || (pixel == 13'd3984) || (pixel == 13'd3985) || (pixel == 13'd3993) || (pixel == 13'd3994) || (pixel == 13'd3995) || (pixel == 13'd3998) || (pixel == 13'd3999) || 
                (pixel == 13'd4003) || (pixel == 13'd4004) || (pixel == 13'd4022) || (pixel == 13'd4023) || (pixel == 13'd4024) || (pixel == 13'd4025) || (pixel == 13'd4039) || (pixel == 13'd4040) || 
                (pixel == 13'd4041) || (pixel == 13'd4055) || (pixel == 13'd4056) || (pixel == 13'd4060) || (pixel == 13'd4061) || (pixel == 13'd4062) || (pixel == 13'd4065) || (pixel == 13'd4066) || 
                (pixel == 13'd4071) || (pixel == 13'd4072) || (pixel == 13'd4073) || (pixel == 13'd4074) || (pixel == 13'd4077) || (pixel == 13'd4078) || (pixel == 13'd4079) || (pixel == 13'd4080) || 
                (pixel == 13'd4081) || (pixel == 13'd4089) || (pixel == 13'd4090) || (pixel == 13'd4091) || (pixel == 13'd4092) || (pixel == 13'd4093) || (pixel == 13'd4094) || (pixel == 13'd4095) || 
                (pixel == 13'd4096) || (pixel == 13'd4099) || (pixel == 13'd4100) || (pixel == 13'd4118) || (pixel == 13'd4119) || (pixel == 13'd4120) || (pixel == 13'd4136) || (pixel == 13'd4137) || 
                (pixel == 13'd4151) || (pixel == 13'd4152) || (pixel == 13'd4156) || (pixel == 13'd4157) || (pixel == 13'd4161) || (pixel == 13'd4162) || (pixel == 13'd4169) || (pixel == 13'd4170) || 
                (pixel == 13'd4173) || (pixel == 13'd4174) || (pixel == 13'd4176) || (pixel == 13'd4177) || (pixel == 13'd4178) || (pixel == 13'd4185) || (pixel == 13'd4186) || (pixel == 13'd4187) || 
                (pixel == 13'd4188) || (pixel == 13'd4189) || (pixel == 13'd4190) || (pixel == 13'd4191) || (pixel == 13'd4192) || (pixel == 13'd4196) || (pixel == 13'd4197) || (pixel == 13'd4202) || 
                (pixel == 13'd4214) || (pixel == 13'd4215) || (pixel == 13'd4247) || (pixel == 13'd4248) || (pixel == 13'd4252) || (pixel == 13'd4253) || (pixel == 13'd4254) || (pixel == 13'd4255) || 
                (pixel == 13'd4256) || (pixel == 13'd4257) || (pixel == 13'd4258) || (pixel == 13'd4262) || (pixel == 13'd4263) || (pixel == 13'd4264) || (pixel == 13'd4265) || (pixel == 13'd4266) || 
                (pixel == 13'd4269) || (pixel == 13'd4270) || (pixel == 13'd4273) || (pixel == 13'd4274) || (pixel == 13'd4275) || (pixel == 13'd4286) || (pixel == 13'd4287) || (pixel == 13'd4292) || 
                (pixel == 13'd4293) || (pixel == 13'd4294) || (pixel == 13'd4295) || (pixel == 13'd4296) || (pixel == 13'd4297) || (pixel == 13'd4298) || (pixel == 13'd4343) || (pixel == 13'd4344) || 
                (pixel == 13'd4349) || (pixel == 13'd4350) || (pixel == 13'd4351) || (pixel == 13'd4353) || (pixel == 13'd4354) || (pixel == 13'd4358) || (pixel == 13'd4359) || (pixel == 13'd4360) || 
                (pixel == 13'd4361) || (pixel == 13'd4365) || (pixel == 13'd4366) || (pixel == 13'd4370) || (pixel == 13'd4371) || (pixel == 13'd4372) || (pixel == 13'd4382) || (pixel == 13'd4383) || 
                (pixel == 13'd4390) || (pixel == 13'd4391) || (pixel == 13'd4392) || (pixel == 13'd4393) || (pixel == 13'd4394))
                oled_data <= `OLED_WHITE;
                
            `MENU_DTMF:
                if(
                (pixel == 13'd3292) || (pixel == 13'd3293) || (pixel == 13'd3294) || (pixel == 13'd3295) || (pixel == 13'd3296) || (pixel == 13'd3297) || (pixel == 13'd3298) || (pixel == 13'd3302) || 
                (pixel == 13'd3303) || (pixel == 13'd3304) || (pixel == 13'd3305) || (pixel == 13'd3306) || (pixel == 13'd3307) || (pixel == 13'd3308) || (pixel == 13'd3309) || (pixel == 13'd3312) || 
                (pixel == 13'd3313) || (pixel == 13'd3314) || (pixel == 13'd3315) || (pixel == 13'd3321) || (pixel == 13'd3322) || (pixel == 13'd3323) || (pixel == 13'd3327) || (pixel == 13'd3328) || 
                (pixel == 13'd3329) || (pixel == 13'd3330) || (pixel == 13'd3331) || (pixel == 13'd3332) || (pixel == 13'd3388) || (pixel == 13'd3389) || (pixel == 13'd3390) || (pixel == 13'd3391) || 
                (pixel == 13'd3392) || (pixel == 13'd3393) || (pixel == 13'd3394) || (pixel == 13'd3395) || (pixel == 13'd3396) || (pixel == 13'd3398) || (pixel == 13'd3399) || (pixel == 13'd3400) || 
                (pixel == 13'd3401) || (pixel == 13'd3402) || (pixel == 13'd3403) || (pixel == 13'd3404) || (pixel == 13'd3405) || (pixel == 13'd3408) || (pixel == 13'd3409) || (pixel == 13'd3410) || 
                (pixel == 13'd3411) || (pixel == 13'd3416) || (pixel == 13'd3417) || (pixel == 13'd3418) || (pixel == 13'd3419) || (pixel == 13'd3423) || (pixel == 13'd3424) || (pixel == 13'd3425) || 
                (pixel == 13'd3426) || (pixel == 13'd3427) || (pixel == 13'd3428) || (pixel == 13'd3464) || (pixel == 13'd3465) || (pixel == 13'd3484) || (pixel == 13'd3485) || (pixel == 13'd3490) || 
                (pixel == 13'd3491) || (pixel == 13'd3492) || (pixel == 13'd3497) || (pixel == 13'd3498) || (pixel == 13'd3504) || (pixel == 13'd3505) || (pixel == 13'd3506) || (pixel == 13'd3507) || 
                (pixel == 13'd3512) || (pixel == 13'd3513) || (pixel == 13'd3514) || (pixel == 13'd3515) || (pixel == 13'd3519) || (pixel == 13'd3520) || (pixel == 13'd3542) || (pixel == 13'd3543) || 
                (pixel == 13'd3559) || (pixel == 13'd3560) || (pixel == 13'd3561) || (pixel == 13'd3580) || (pixel == 13'd3581) || (pixel == 13'd3587) || (pixel == 13'd3588) || (pixel == 13'd3589) || 
                (pixel == 13'd3593) || (pixel == 13'd3594) || (pixel == 13'd3600) || (pixel == 13'd3601) || (pixel == 13'd3602) || (pixel == 13'd3603) || (pixel == 13'd3604) || (pixel == 13'd3608) || 
                (pixel == 13'd3609) || (pixel == 13'd3610) || (pixel == 13'd3611) || (pixel == 13'd3615) || (pixel == 13'd3616) || (pixel == 13'd3638) || (pixel == 13'd3639) || (pixel == 13'd3640) || 
                (pixel == 13'd3654) || (pixel == 13'd3655) || (pixel == 13'd3656) || (pixel == 13'd3657) || (pixel == 13'd3676) || (pixel == 13'd3677) || (pixel == 13'd3684) || (pixel == 13'd3685) || 
                (pixel == 13'd3689) || (pixel == 13'd3690) || (pixel == 13'd3696) || (pixel == 13'd3697) || (pixel == 13'd3699) || (pixel == 13'd3700) || (pixel == 13'd3703) || (pixel == 13'd3704) || 
                (pixel == 13'd3706) || (pixel == 13'd3707) || (pixel == 13'd3711) || (pixel == 13'd3712) || (pixel == 13'd3734) || (pixel == 13'd3735) || (pixel == 13'd3736) || (pixel == 13'd3737) || 
                (pixel == 13'd3749) || (pixel == 13'd3750) || (pixel == 13'd3751) || (pixel == 13'd3752) || (pixel == 13'd3753) || (pixel == 13'd3772) || (pixel == 13'd3773) || (pixel == 13'd3780) || 
                (pixel == 13'd3781) || (pixel == 13'd3785) || (pixel == 13'd3786) || (pixel == 13'd3792) || (pixel == 13'd3793) || (pixel == 13'd3795) || (pixel == 13'd3796) || (pixel == 13'd3799) || 
                (pixel == 13'd3800) || (pixel == 13'd3802) || (pixel == 13'd3803) || (pixel == 13'd3807) || (pixel == 13'd3808) || (pixel == 13'd3809) || (pixel == 13'd3810) || (pixel == 13'd3811) || 
                (pixel == 13'd3812) || (pixel == 13'd3830) || (pixel == 13'd3831) || (pixel == 13'd3832) || (pixel == 13'd3833) || (pixel == 13'd3834) || (pixel == 13'd3845) || (pixel == 13'd3846) || 
                (pixel == 13'd3847) || (pixel == 13'd3848) || (pixel == 13'd3849) || (pixel == 13'd3868) || (pixel == 13'd3869) || (pixel == 13'd3876) || (pixel == 13'd3877) || (pixel == 13'd3881) || 
                (pixel == 13'd3882) || (pixel == 13'd3888) || (pixel == 13'd3889) || (pixel == 13'd3891) || (pixel == 13'd3892) || (pixel == 13'd3893) || (pixel == 13'd3895) || (pixel == 13'd3896) || 
                (pixel == 13'd3898) || (pixel == 13'd3899) || (pixel == 13'd3903) || (pixel == 13'd3904) || (pixel == 13'd3905) || (pixel == 13'd3906) || (pixel == 13'd3907) || (pixel == 13'd3908) || 
                (pixel == 13'd3926) || (pixel == 13'd3927) || (pixel == 13'd3928) || (pixel == 13'd3929) || (pixel == 13'd3930) || (pixel == 13'd3942) || (pixel == 13'd3943) || (pixel == 13'd3944) || 
                (pixel == 13'd3945) || (pixel == 13'd3964) || (pixel == 13'd3965) || (pixel == 13'd3971) || (pixel == 13'd3972) || (pixel == 13'd3973) || (pixel == 13'd3977) || (pixel == 13'd3978) || 
                (pixel == 13'd3984) || (pixel == 13'd3985) || (pixel == 13'd3988) || (pixel == 13'd3989) || (pixel == 13'd3990) || (pixel == 13'd3991) || (pixel == 13'd3994) || (pixel == 13'd3995) || 
                (pixel == 13'd3999) || (pixel == 13'd4000) || (pixel == 13'd4022) || (pixel == 13'd4023) || (pixel == 13'd4024) || (pixel == 13'd4025) || (pixel == 13'd4039) || (pixel == 13'd4040) || 
                (pixel == 13'd4041) || (pixel == 13'd4060) || (pixel == 13'd4061) || (pixel == 13'd4066) || (pixel == 13'd4067) || (pixel == 13'd4068) || (pixel == 13'd4073) || (pixel == 13'd4074) || 
                (pixel == 13'd4080) || (pixel == 13'd4081) || (pixel == 13'd4084) || (pixel == 13'd4085) || (pixel == 13'd4086) || (pixel == 13'd4087) || (pixel == 13'd4090) || (pixel == 13'd4091) || 
                (pixel == 13'd4095) || (pixel == 13'd4096) || (pixel == 13'd4118) || (pixel == 13'd4119) || (pixel == 13'd4120) || (pixel == 13'd4136) || (pixel == 13'd4137) || (pixel == 13'd4156) || 
                (pixel == 13'd4157) || (pixel == 13'd4158) || (pixel == 13'd4159) || (pixel == 13'd4160) || (pixel == 13'd4161) || (pixel == 13'd4162) || (pixel == 13'd4163) || (pixel == 13'd4169) || 
                (pixel == 13'd4170) || (pixel == 13'd4176) || (pixel == 13'd4177) || (pixel == 13'd4180) || (pixel == 13'd4181) || (pixel == 13'd4182) || (pixel == 13'd4183) || (pixel == 13'd4186) || 
                (pixel == 13'd4187) || (pixel == 13'd4191) || (pixel == 13'd4192) || (pixel == 13'd4214) || (pixel == 13'd4215) || (pixel == 13'd4252) || (pixel == 13'd4253) || (pixel == 13'd4254) || 
                (pixel == 13'd4255) || (pixel == 13'd4256) || (pixel == 13'd4257) || (pixel == 13'd4258) || (pixel == 13'd4265) || (pixel == 13'd4266) || (pixel == 13'd4272) || (pixel == 13'd4273) || 
                (pixel == 13'd4277) || (pixel == 13'd4278) || (pixel == 13'd4282) || (pixel == 13'd4283) || (pixel == 13'd4287) || (pixel == 13'd4288))
                oled_data <= `OLED_WHITE;
            
            `MENU_TIMER:
                if(
                (pixel == 13'd3300) || (pixel == 13'd3301) || (pixel == 13'd3386) || (pixel == 13'd3387) || (pixel == 13'd3388) || (pixel == 13'd3389) || (pixel == 13'd3390) || (pixel == 13'd3391) || 
                (pixel == 13'd3392) || (pixel == 13'd3393) || (pixel == 13'd3396) || (pixel == 13'd3397) || (pixel == 13'd3464) || (pixel == 13'd3465) || (pixel == 13'd3482) || (pixel == 13'd3483) || 
                (pixel == 13'd3484) || (pixel == 13'd3485) || (pixel == 13'd3486) || (pixel == 13'd3487) || (pixel == 13'd3488) || (pixel == 13'd3489) || (pixel == 13'd3492) || (pixel == 13'd3493) || 
                (pixel == 13'd3542) || (pixel == 13'd3543) || (pixel == 13'd3559) || (pixel == 13'd3560) || (pixel == 13'd3561) || (pixel == 13'd3581) || (pixel == 13'd3582) || (pixel == 13'd3638) || 
                (pixel == 13'd3639) || (pixel == 13'd3640) || (pixel == 13'd3654) || (pixel == 13'd3655) || (pixel == 13'd3656) || (pixel == 13'd3657) || (pixel == 13'd3677) || (pixel == 13'd3678) || 
                (pixel == 13'd3684) || (pixel == 13'd3685) || (pixel == 13'd3689) || (pixel == 13'd3690) || (pixel == 13'd3692) || (pixel == 13'd3693) || (pixel == 13'd3694) || (pixel == 13'd3697) || 
                (pixel == 13'd3698) || (pixel == 13'd3699) || (pixel == 13'd3706) || (pixel == 13'd3707) || (pixel == 13'd3708) || (pixel == 13'd3709) || (pixel == 13'd3713) || (pixel == 13'd3714) || 
                (pixel == 13'd3716) || (pixel == 13'd3717) || (pixel == 13'd3734) || (pixel == 13'd3735) || (pixel == 13'd3736) || (pixel == 13'd3737) || (pixel == 13'd3749) || (pixel == 13'd3750) || 
                (pixel == 13'd3751) || (pixel == 13'd3752) || (pixel == 13'd3753) || (pixel == 13'd3773) || (pixel == 13'd3774) || (pixel == 13'd3780) || (pixel == 13'd3781) || (pixel == 13'd3785) || 
                (pixel == 13'd3786) || (pixel == 13'd3787) || (pixel == 13'd3788) || (pixel == 13'd3789) || (pixel == 13'd3790) || (pixel == 13'd3791) || (pixel == 13'd3792) || (pixel == 13'd3793) || 
                (pixel == 13'd3794) || (pixel == 13'd3795) || (pixel == 13'd3796) || (pixel == 13'd3801) || (pixel == 13'd3802) || (pixel == 13'd3803) || (pixel == 13'd3804) || (pixel == 13'd3805) || 
                (pixel == 13'd3809) || (pixel == 13'd3810) || (pixel == 13'd3811) || (pixel == 13'd3812) || (pixel == 13'd3813) || (pixel == 13'd3830) || (pixel == 13'd3831) || (pixel == 13'd3832) || 
                (pixel == 13'd3833) || (pixel == 13'd3834) || (pixel == 13'd3845) || (pixel == 13'd3846) || (pixel == 13'd3847) || (pixel == 13'd3848) || (pixel == 13'd3849) || (pixel == 13'd3869) || 
                (pixel == 13'd3870) || (pixel == 13'd3876) || (pixel == 13'd3877) || (pixel == 13'd3881) || (pixel == 13'd3882) || (pixel == 13'd3886) || (pixel == 13'd3887) || (pixel == 13'd3891) || 
                (pixel == 13'd3892) || (pixel == 13'd3896) || (pixel == 13'd3897) || (pixel == 13'd3901) || (pixel == 13'd3902) || (pixel == 13'd3905) || (pixel == 13'd3906) || (pixel == 13'd3907) || 
                (pixel == 13'd3926) || (pixel == 13'd3927) || (pixel == 13'd3928) || (pixel == 13'd3929) || (pixel == 13'd3930) || (pixel == 13'd3942) || (pixel == 13'd3943) || (pixel == 13'd3944) || 
                (pixel == 13'd3945) || (pixel == 13'd3965) || (pixel == 13'd3966) || (pixel == 13'd3972) || (pixel == 13'd3973) || (pixel == 13'd3977) || (pixel == 13'd3978) || (pixel == 13'd3982) || 
                (pixel == 13'd3983) || (pixel == 13'd3987) || (pixel == 13'd3988) || (pixel == 13'd3992) || (pixel == 13'd3993) || (pixel == 13'd3994) || (pixel == 13'd3995) || (pixel == 13'd3996) || 
                (pixel == 13'd3997) || (pixel == 13'd3998) || (pixel == 13'd4001) || (pixel == 13'd4002) || (pixel == 13'd4022) || (pixel == 13'd4023) || (pixel == 13'd4024) || (pixel == 13'd4025) || 
                (pixel == 13'd4039) || (pixel == 13'd4040) || (pixel == 13'd4041) || (pixel == 13'd4061) || (pixel == 13'd4062) || (pixel == 13'd4068) || (pixel == 13'd4069) || (pixel == 13'd4073) || 
                (pixel == 13'd4074) || (pixel == 13'd4078) || (pixel == 13'd4079) || (pixel == 13'd4083) || (pixel == 13'd4084) || (pixel == 13'd4088) || (pixel == 13'd4089) || (pixel == 13'd4090) || 
                (pixel == 13'd4091) || (pixel == 13'd4092) || (pixel == 13'd4093) || (pixel == 13'd4094) || (pixel == 13'd4097) || (pixel == 13'd4098) || (pixel == 13'd4118) || (pixel == 13'd4119) || 
                (pixel == 13'd4120) || (pixel == 13'd4136) || (pixel == 13'd4137) || (pixel == 13'd4157) || (pixel == 13'd4158) || (pixel == 13'd4164) || (pixel == 13'd4165) || (pixel == 13'd4169) || 
                (pixel == 13'd4170) || (pixel == 13'd4174) || (pixel == 13'd4175) || (pixel == 13'd4179) || (pixel == 13'd4180) || (pixel == 13'd4184) || (pixel == 13'd4185) || (pixel == 13'd4193) || 
                (pixel == 13'd4194) || (pixel == 13'd4214) || (pixel == 13'd4215) || (pixel == 13'd4253) || (pixel == 13'd4254) || (pixel == 13'd4260) || (pixel == 13'd4261) || (pixel == 13'd4265) || 
                (pixel == 13'd4266) || (pixel == 13'd4270) || (pixel == 13'd4271) || (pixel == 13'd4275) || (pixel == 13'd4276) || (pixel == 13'd4281) || (pixel == 13'd4282) || (pixel == 13'd4283) || 
                (pixel == 13'd4284) || (pixel == 13'd4285) || (pixel == 13'd4289) || (pixel == 13'd4290) || (pixel == 13'd4349) || (pixel == 13'd4350) || (pixel == 13'd4356) || (pixel == 13'd4357) || 
                (pixel == 13'd4361) || (pixel == 13'd4362) || (pixel == 13'd4366) || (pixel == 13'd4367) || (pixel == 13'd4371) || (pixel == 13'd4372) || (pixel == 13'd4378) || (pixel == 13'd4379) || 
                (pixel == 13'd4380) || (pixel == 13'd4381) || (pixel == 13'd4385) || (pixel == 13'd4386))
                oled_data <= `OLED_WHITE;
            
            `MENU_MORSE:
                if(
                (pixel == 13'd3291) || (pixel == 13'd3292) || (pixel == 13'd3293) || (pixel == 13'd3294) || (pixel == 13'd3300) || (pixel == 13'd3301) || (pixel == 13'd3302) || (pixel == 13'd3387) || 
                (pixel == 13'd3388) || (pixel == 13'd3389) || (pixel == 13'd3390) || (pixel == 13'd3395) || (pixel == 13'd3396) || (pixel == 13'd3397) || (pixel == 13'd3398) || (pixel == 13'd3464) || 
                (pixel == 13'd3465) || (pixel == 13'd3483) || (pixel == 13'd3484) || (pixel == 13'd3485) || (pixel == 13'd3486) || (pixel == 13'd3491) || (pixel == 13'd3492) || (pixel == 13'd3493) || 
                (pixel == 13'd3494) || (pixel == 13'd3542) || (pixel == 13'd3543) || (pixel == 13'd3559) || (pixel == 13'd3560) || (pixel == 13'd3561) || (pixel == 13'd3579) || (pixel == 13'd3580) || 
                (pixel == 13'd3581) || (pixel == 13'd3582) || (pixel == 13'd3583) || (pixel == 13'd3587) || (pixel == 13'd3588) || (pixel == 13'd3589) || (pixel == 13'd3590) || (pixel == 13'd3596) || 
                (pixel == 13'd3597) || (pixel == 13'd3598) || (pixel == 13'd3599) || (pixel == 13'd3604) || (pixel == 13'd3605) || (pixel == 13'd3607) || (pixel == 13'd3608) || (pixel == 13'd3611) || 
                (pixel == 13'd3612) || (pixel == 13'd3613) || (pixel == 13'd3614) || (pixel == 13'd3619) || (pixel == 13'd3620) || (pixel == 13'd3621) || (pixel == 13'd3622) || (pixel == 13'd3638) || 
                (pixel == 13'd3639) || (pixel == 13'd3640) || (pixel == 13'd3654) || (pixel == 13'd3655) || (pixel == 13'd3656) || (pixel == 13'd3657) || (pixel == 13'd3675) || (pixel == 13'd3676) || 
                (pixel == 13'd3678) || (pixel == 13'd3679) || (pixel == 13'd3682) || (pixel == 13'd3683) || (pixel == 13'd3685) || (pixel == 13'd3686) || (pixel == 13'd3691) || (pixel == 13'd3692) || 
                (pixel == 13'd3693) || (pixel == 13'd3694) || (pixel == 13'd3695) || (pixel == 13'd3696) || (pixel == 13'd3700) || (pixel == 13'd3701) || (pixel == 13'd3702) || (pixel == 13'd3703) || 
                (pixel == 13'd3704) || (pixel == 13'd3706) || (pixel == 13'd3707) || (pixel == 13'd3708) || (pixel == 13'd3709) || (pixel == 13'd3714) || (pixel == 13'd3715) || (pixel == 13'd3716) || 
                (pixel == 13'd3717) || (pixel == 13'd3718) || (pixel == 13'd3734) || (pixel == 13'd3735) || (pixel == 13'd3736) || (pixel == 13'd3737) || (pixel == 13'd3749) || (pixel == 13'd3750) || 
                (pixel == 13'd3751) || (pixel == 13'd3752) || (pixel == 13'd3753) || (pixel == 13'd3771) || (pixel == 13'd3772) || (pixel == 13'd3774) || (pixel == 13'd3775) || (pixel == 13'd3778) || 
                (pixel == 13'd3779) || (pixel == 13'd3781) || (pixel == 13'd3782) || (pixel == 13'd3786) || (pixel == 13'd3787) || (pixel == 13'd3788) || (pixel == 13'd3792) || (pixel == 13'd3793) || 
                (pixel == 13'd3796) || (pixel == 13'd3797) || (pixel == 13'd3798) || (pixel == 13'd3802) || (pixel == 13'd3803) || (pixel == 13'd3809) || (pixel == 13'd3810) || (pixel == 13'd3814) || 
                (pixel == 13'd3815) || (pixel == 13'd3830) || (pixel == 13'd3831) || (pixel == 13'd3832) || (pixel == 13'd3833) || (pixel == 13'd3834) || (pixel == 13'd3845) || (pixel == 13'd3846) || 
                (pixel == 13'd3847) || (pixel == 13'd3848) || (pixel == 13'd3849) || (pixel == 13'd3867) || (pixel == 13'd3868) || (pixel == 13'd3870) || (pixel == 13'd3871) || (pixel == 13'd3872) || 
                (pixel == 13'd3874) || (pixel == 13'd3875) || (pixel == 13'd3877) || (pixel == 13'd3878) || (pixel == 13'd3882) || (pixel == 13'd3883) || (pixel == 13'd3888) || (pixel == 13'd3889) || 
                (pixel == 13'd3892) || (pixel == 13'd3893) || (pixel == 13'd3898) || (pixel == 13'd3899) || (pixel == 13'd3900) || (pixel == 13'd3901) || (pixel == 13'd3905) || (pixel == 13'd3906) || 
                (pixel == 13'd3907) || (pixel == 13'd3908) || (pixel == 13'd3909) || (pixel == 13'd3910) || (pixel == 13'd3911) || (pixel == 13'd3926) || (pixel == 13'd3927) || (pixel == 13'd3928) || 
                (pixel == 13'd3929) || (pixel == 13'd3930) || (pixel == 13'd3942) || (pixel == 13'd3943) || (pixel == 13'd3944) || (pixel == 13'd3945) || (pixel == 13'd3963) || (pixel == 13'd3964) || 
                (pixel == 13'd3967) || (pixel == 13'd3968) || (pixel == 13'd3969) || (pixel == 13'd3970) || (pixel == 13'd3973) || (pixel == 13'd3974) || (pixel == 13'd3978) || (pixel == 13'd3979) || 
                (pixel == 13'd3984) || (pixel == 13'd3985) || (pixel == 13'd3988) || (pixel == 13'd3989) || (pixel == 13'd3995) || (pixel == 13'd3996) || (pixel == 13'd3997) || (pixel == 13'd3998) || 
                (pixel == 13'd4001) || (pixel == 13'd4002) || (pixel == 13'd4003) || (pixel == 13'd4004) || (pixel == 13'd4005) || (pixel == 13'd4006) || (pixel == 13'd4007) || (pixel == 13'd4022) || 
                (pixel == 13'd4023) || (pixel == 13'd4024) || (pixel == 13'd4025) || (pixel == 13'd4039) || (pixel == 13'd4040) || (pixel == 13'd4041) || (pixel == 13'd4059) || (pixel == 13'd4060) || 
                (pixel == 13'd4063) || (pixel == 13'd4064) || (pixel == 13'd4065) || (pixel == 13'd4066) || (pixel == 13'd4069) || (pixel == 13'd4070) || (pixel == 13'd4074) || (pixel == 13'd4075) || 
                (pixel == 13'd4076) || (pixel == 13'd4080) || (pixel == 13'd4081) || (pixel == 13'd4084) || (pixel == 13'd4085) || (pixel == 13'd4093) || (pixel == 13'd4094) || (pixel == 13'd4097) || 
                (pixel == 13'd4098) || (pixel == 13'd4118) || (pixel == 13'd4119) || (pixel == 13'd4120) || (pixel == 13'd4136) || (pixel == 13'd4137) || (pixel == 13'd4155) || (pixel == 13'd4156) || 
                (pixel == 13'd4159) || (pixel == 13'd4160) || (pixel == 13'd4161) || (pixel == 13'd4162) || (pixel == 13'd4165) || (pixel == 13'd4166) || (pixel == 13'd4171) || (pixel == 13'd4172) || 
                (pixel == 13'd4173) || (pixel == 13'd4174) || (pixel == 13'd4175) || (pixel == 13'd4176) || (pixel == 13'd4180) || (pixel == 13'd4181) || (pixel == 13'd4186) || (pixel == 13'd4187) || 
                (pixel == 13'd4188) || (pixel == 13'd4189) || (pixel == 13'd4190) || (pixel == 13'd4194) || (pixel == 13'd4195) || (pixel == 13'd4196) || (pixel == 13'd4197) || (pixel == 13'd4198) || 
                (pixel == 13'd4214) || (pixel == 13'd4215) || (pixel == 13'd4251) || (pixel == 13'd4252) || (pixel == 13'd4256) || (pixel == 13'd4257) || (pixel == 13'd4261) || (pixel == 13'd4262) || 
                (pixel == 13'd4268) || (pixel == 13'd4269) || (pixel == 13'd4270) || (pixel == 13'd4271) || (pixel == 13'd4276) || (pixel == 13'd4277) || (pixel == 13'd4282) || (pixel == 13'd4283) || 
                (pixel == 13'd4284) || (pixel == 13'd4285) || (pixel == 13'd4291) || (pixel == 13'd4292) || (pixel == 13'd4293) || (pixel == 13'd4294) || (pixel == 13'd4665) || (pixel == 13'd4666) || 
                (pixel == 13'd4738) || (pixel == 13'd4739) || (pixel == 13'd4740) || (pixel == 13'd4741) || (pixel == 13'd4742) || (pixel == 13'd4761) || (pixel == 13'd4762) || (pixel == 13'd4833) || 
                (pixel == 13'd4834) || (pixel == 13'd4835) || (pixel == 13'd4836) || (pixel == 13'd4837) || (pixel == 13'd4838) || (pixel == 13'd4857) || (pixel == 13'd4858) || (pixel == 13'd4928) || 
                (pixel == 13'd4929) || (pixel == 13'd4930) || (pixel == 13'd4934) || (pixel == 13'd4953) || (pixel == 13'd4954) || (pixel == 13'd5023) || (pixel == 13'd5024) || (pixel == 13'd5025) || 
                (pixel == 13'd5035) || (pixel == 13'd5036) || (pixel == 13'd5037) || (pixel == 13'd5038) || (pixel == 13'd5045) || (pixel == 13'd5046) || (pixel == 13'd5047) || (pixel == 13'd5049) || 
                (pixel == 13'd5050) || (pixel == 13'd5055) || (pixel == 13'd5056) || (pixel == 13'd5057) || (pixel == 13'd5058) || (pixel == 13'd5119) || (pixel == 13'd5120) || (pixel == 13'd5130) || 
                (pixel == 13'd5131) || (pixel == 13'd5132) || (pixel == 13'd5133) || (pixel == 13'd5134) || (pixel == 13'd5135) || (pixel == 13'd5140) || (pixel == 13'd5141) || (pixel == 13'd5142) || 
                (pixel == 13'd5143) || (pixel == 13'd5144) || (pixel == 13'd5145) || (pixel == 13'd5146) || (pixel == 13'd5150) || (pixel == 13'd5151) || (pixel == 13'd5152) || (pixel == 13'd5153) || 
                (pixel == 13'd5154) || (pixel == 13'd5215) || (pixel == 13'd5216) || (pixel == 13'd5225) || (pixel == 13'd5226) || (pixel == 13'd5227) || (pixel == 13'd5231) || (pixel == 13'd5232) || 
                (pixel == 13'd5235) || (pixel == 13'd5236) || (pixel == 13'd5237) || (pixel == 13'd5241) || (pixel == 13'd5242) || (pixel == 13'd5245) || (pixel == 13'd5246) || (pixel == 13'd5250) || 
                (pixel == 13'd5251) || (pixel == 13'd5311) || (pixel == 13'd5312) || (pixel == 13'd5321) || (pixel == 13'd5322) || (pixel == 13'd5327) || (pixel == 13'd5328) || (pixel == 13'd5331) || 
                (pixel == 13'd5332) || (pixel == 13'd5337) || (pixel == 13'd5338) || (pixel == 13'd5341) || (pixel == 13'd5342) || (pixel == 13'd5343) || (pixel == 13'd5344) || (pixel == 13'd5345) || 
                (pixel == 13'd5346) || (pixel == 13'd5347) || (pixel == 13'd5407) || (pixel == 13'd5408) || (pixel == 13'd5417) || (pixel == 13'd5418) || (pixel == 13'd5423) || (pixel == 13'd5424) || 
                (pixel == 13'd5427) || (pixel == 13'd5428) || (pixel == 13'd5433) || (pixel == 13'd5434) || (pixel == 13'd5437) || (pixel == 13'd5438) || (pixel == 13'd5439) || (pixel == 13'd5440) || 
                (pixel == 13'd5441) || (pixel == 13'd5442) || (pixel == 13'd5443) || (pixel == 13'd5504) || (pixel == 13'd5505) || (pixel == 13'd5510) || (pixel == 13'd5513) || (pixel == 13'd5514) || 
                (pixel == 13'd5515) || (pixel == 13'd5519) || (pixel == 13'd5520) || (pixel == 13'd5523) || (pixel == 13'd5524) || (pixel == 13'd5525) || (pixel == 13'd5528) || (pixel == 13'd5529) || 
                (pixel == 13'd5530) || (pixel == 13'd5533) || (pixel == 13'd5534) || (pixel == 13'd5600) || (pixel == 13'd5601) || (pixel == 13'd5602) || (pixel == 13'd5603) || (pixel == 13'd5604) || 
                (pixel == 13'd5605) || (pixel == 13'd5606) || (pixel == 13'd5610) || (pixel == 13'd5611) || (pixel == 13'd5612) || (pixel == 13'd5613) || (pixel == 13'd5614) || (pixel == 13'd5615) || 
                (pixel == 13'd5620) || (pixel == 13'd5621) || (pixel == 13'd5622) || (pixel == 13'd5623) || (pixel == 13'd5624) || (pixel == 13'd5625) || (pixel == 13'd5626) || (pixel == 13'd5630) || 
                (pixel == 13'd5631) || (pixel == 13'd5632) || (pixel == 13'd5633) || (pixel == 13'd5634) || (pixel == 13'd5698) || (pixel == 13'd5699) || (pixel == 13'd5700) || (pixel == 13'd5701) || 
                (pixel == 13'd5702) || (pixel == 13'd5707) || (pixel == 13'd5708) || (pixel == 13'd5709) || (pixel == 13'd5710) || (pixel == 13'd5717) || (pixel == 13'd5718) || (pixel == 13'd5719) || 
                (pixel == 13'd5721) || (pixel == 13'd5722) || (pixel == 13'd5727) || (pixel == 13'd5728) || (pixel == 13'd5729) || (pixel == 13'd5730))
                oled_data <= `OLED_WHITE;
            
            `MENU_LOCK:
                if(
                (pixel == 13'd3034) || (pixel == 13'd3035) || (pixel == 13'd3104) || (pixel == 13'd3105) || (pixel == 13'd3130) || (pixel == 13'd3131) || (pixel == 13'd3200) || (pixel == 13'd3201) || 
                (pixel == 13'd3226) || (pixel == 13'd3227) || (pixel == 13'd3296) || (pixel == 13'd3297) || (pixel == 13'd3322) || (pixel == 13'd3323) || (pixel == 13'd3392) || (pixel == 13'd3393) || 
                (pixel == 13'd3402) || (pixel == 13'd3403) || (pixel == 13'd3404) || (pixel == 13'd3405) || (pixel == 13'd3412) || (pixel == 13'd3413) || (pixel == 13'd3414) || (pixel == 13'd3415) || 
                (pixel == 13'd3418) || (pixel == 13'd3419) || (pixel == 13'd3423) || (pixel == 13'd3424) || (pixel == 13'd3425) || (pixel == 13'd3464) || (pixel == 13'd3465) || (pixel == 13'd3488) || 
                (pixel == 13'd3489) || (pixel == 13'd3497) || (pixel == 13'd3498) || (pixel == 13'd3499) || (pixel == 13'd3500) || (pixel == 13'd3501) || (pixel == 13'd3502) || (pixel == 13'd3507) || 
                (pixel == 13'd3508) || (pixel == 13'd3509) || (pixel == 13'd3510) || (pixel == 13'd3511) || (pixel == 13'd3514) || (pixel == 13'd3515) || (pixel == 13'd3518) || (pixel == 13'd3519) || 
                (pixel == 13'd3520) || (pixel == 13'd3559) || (pixel == 13'd3560) || (pixel == 13'd3561) || (pixel == 13'd3584) || (pixel == 13'd3585) || (pixel == 13'd3592) || (pixel == 13'd3593) || 
                (pixel == 13'd3594) || (pixel == 13'd3598) || (pixel == 13'd3599) || (pixel == 13'd3602) || (pixel == 13'd3603) || (pixel == 13'd3604) || (pixel == 13'd3610) || (pixel == 13'd3611) || 
                (pixel == 13'd3613) || (pixel == 13'd3614) || (pixel == 13'd3615) || (pixel == 13'd3654) || (pixel == 13'd3655) || (pixel == 13'd3656) || (pixel == 13'd3657) || (pixel == 13'd3680) || 
                (pixel == 13'd3681) || (pixel == 13'd3688) || (pixel == 13'd3689) || (pixel == 13'd3694) || (pixel == 13'd3695) || (pixel == 13'd3698) || (pixel == 13'd3699) || (pixel == 13'd3706) || 
                (pixel == 13'd3707) || (pixel == 13'd3708) || (pixel == 13'd3709) || (pixel == 13'd3710) || (pixel == 13'd3749) || (pixel == 13'd3750) || (pixel == 13'd3751) || (pixel == 13'd3752) || 
                (pixel == 13'd3753) || (pixel == 13'd3776) || (pixel == 13'd3777) || (pixel == 13'd3784) || (pixel == 13'd3785) || (pixel == 13'd3790) || (pixel == 13'd3791) || (pixel == 13'd3794) || 
                (pixel == 13'd3795) || (pixel == 13'd3802) || (pixel == 13'd3803) || (pixel == 13'd3804) || (pixel == 13'd3805) || (pixel == 13'd3806) || (pixel == 13'd3845) || (pixel == 13'd3846) || 
                (pixel == 13'd3847) || (pixel == 13'd3848) || (pixel == 13'd3849) || (pixel == 13'd3872) || (pixel == 13'd3873) || (pixel == 13'd3880) || (pixel == 13'd3881) || (pixel == 13'd3882) || 
                (pixel == 13'd3886) || (pixel == 13'd3887) || (pixel == 13'd3890) || (pixel == 13'd3891) || (pixel == 13'd3892) || (pixel == 13'd3895) || (pixel == 13'd3898) || (pixel == 13'd3899) || 
                (pixel == 13'd3901) || (pixel == 13'd3902) || (pixel == 13'd3903) || (pixel == 13'd3942) || (pixel == 13'd3943) || (pixel == 13'd3944) || (pixel == 13'd3945) || (pixel == 13'd3968) || 
                (pixel == 13'd3969) || (pixel == 13'd3970) || (pixel == 13'd3971) || (pixel == 13'd3972) || (pixel == 13'd3973) || (pixel == 13'd3977) || (pixel == 13'd3978) || (pixel == 13'd3979) || 
                (pixel == 13'd3980) || (pixel == 13'd3981) || (pixel == 13'd3982) || (pixel == 13'd3987) || (pixel == 13'd3988) || (pixel == 13'd3989) || (pixel == 13'd3990) || (pixel == 13'd3991) || 
                (pixel == 13'd3994) || (pixel == 13'd3995) || (pixel == 13'd3998) || (pixel == 13'd3999) || (pixel == 13'd4000) || (pixel == 13'd4039) || (pixel == 13'd4040) || (pixel == 13'd4041) || 
                (pixel == 13'd4064) || (pixel == 13'd4065) || (pixel == 13'd4066) || (pixel == 13'd4067) || (pixel == 13'd4068) || (pixel == 13'd4069) || (pixel == 13'd4074) || (pixel == 13'd4075) || 
                (pixel == 13'd4076) || (pixel == 13'd4077) || (pixel == 13'd4084) || (pixel == 13'd4085) || (pixel == 13'd4086) || (pixel == 13'd4087) || (pixel == 13'd4090) || (pixel == 13'd4091) || 
                (pixel == 13'd4095) || (pixel == 13'd4096) || (pixel == 13'd4097) || (pixel == 13'd4136) || (pixel == 13'd4137) || (pixel == 13'd4388) || (pixel == 13'd4389) || (pixel == 13'd4443) || 
                (pixel == 13'd4444) || (pixel == 13'd4445) || (pixel == 13'd4446) || (pixel == 13'd4447) || (pixel == 13'd4448) || (pixel == 13'd4449) || (pixel == 13'd4484) || (pixel == 13'd4485) || 
                (pixel == 13'd4539) || (pixel == 13'd4540) || (pixel == 13'd4541) || (pixel == 13'd4542) || (pixel == 13'd4543) || (pixel == 13'd4544) || (pixel == 13'd4545) || (pixel == 13'd4546) || 
                (pixel == 13'd4580) || (pixel == 13'd4581) || (pixel == 13'd4635) || (pixel == 13'd4636) || (pixel == 13'd4641) || (pixel == 13'd4642) || (pixel == 13'd4676) || (pixel == 13'd4677) || 
                (pixel == 13'd4731) || (pixel == 13'd4732) || (pixel == 13'd4737) || (pixel == 13'd4738) || (pixel == 13'd4743) || (pixel == 13'd4744) || (pixel == 13'd4745) || (pixel == 13'd4746) || 
                (pixel == 13'd4751) || (pixel == 13'd4752) || (pixel == 13'd4753) || (pixel == 13'd4754) || (pixel == 13'd4755) || (pixel == 13'd4760) || (pixel == 13'd4761) || (pixel == 13'd4763) || 
                (pixel == 13'd4764) || (pixel == 13'd4768) || (pixel == 13'd4769) || (pixel == 13'd4770) || (pixel == 13'd4772) || (pixel == 13'd4773) || (pixel == 13'd4827) || (pixel == 13'd4828) || 
                (pixel == 13'd4829) || (pixel == 13'd4830) || (pixel == 13'd4831) || (pixel == 13'd4832) || (pixel == 13'd4838) || (pixel == 13'd4839) || (pixel == 13'd4840) || (pixel == 13'd4841) || 
                (pixel == 13'd4842) || (pixel == 13'd4843) || (pixel == 13'd4847) || (pixel == 13'd4848) || (pixel == 13'd4849) || (pixel == 13'd4850) || (pixel == 13'd4851) || (pixel == 13'd4852) || 
                (pixel == 13'd4856) || (pixel == 13'd4857) || (pixel == 13'd4858) || (pixel == 13'd4859) || (pixel == 13'd4860) || (pixel == 13'd4863) || (pixel == 13'd4864) || (pixel == 13'd4865) || 
                (pixel == 13'd4866) || (pixel == 13'd4867) || (pixel == 13'd4868) || (pixel == 13'd4869) || (pixel == 13'd4923) || (pixel == 13'd4924) || (pixel == 13'd4925) || (pixel == 13'd4926) || 
                (pixel == 13'd4927) || (pixel == 13'd4928) || (pixel == 13'd4929) || (pixel == 13'd4933) || (pixel == 13'd4934) || (pixel == 13'd4935) || (pixel == 13'd4939) || (pixel == 13'd4940) || 
                (pixel == 13'd4947) || (pixel == 13'd4948) || (pixel == 13'd4952) || (pixel == 13'd4953) || (pixel == 13'd4954) || (pixel == 13'd4958) || (pixel == 13'd4959) || (pixel == 13'd4960) || 
                (pixel == 13'd4964) || (pixel == 13'd4965) || (pixel == 13'd5019) || (pixel == 13'd5020) || (pixel == 13'd5025) || (pixel == 13'd5026) || (pixel == 13'd5029) || (pixel == 13'd5030) || 
                (pixel == 13'd5035) || (pixel == 13'd5036) || (pixel == 13'd5039) || (pixel == 13'd5040) || (pixel == 13'd5041) || (pixel == 13'd5042) || (pixel == 13'd5043) || (pixel == 13'd5044) || 
                (pixel == 13'd5048) || (pixel == 13'd5049) || (pixel == 13'd5054) || (pixel == 13'd5055) || (pixel == 13'd5060) || (pixel == 13'd5061) || (pixel == 13'd5115) || (pixel == 13'd5116) || 
                (pixel == 13'd5121) || (pixel == 13'd5122) || (pixel == 13'd5125) || (pixel == 13'd5126) || (pixel == 13'd5131) || (pixel == 13'd5132) || (pixel == 13'd5134) || (pixel == 13'd5135) || 
                (pixel == 13'd5136) || (pixel == 13'd5139) || (pixel == 13'd5140) || (pixel == 13'd5144) || (pixel == 13'd5145) || (pixel == 13'd5150) || (pixel == 13'd5151) || (pixel == 13'd5156) || 
                (pixel == 13'd5157) || (pixel == 13'd5211) || (pixel == 13'd5212) || (pixel == 13'd5216) || (pixel == 13'd5217) || (pixel == 13'd5218) || (pixel == 13'd5221) || (pixel == 13'd5222) || 
                (pixel == 13'd5223) || (pixel == 13'd5227) || (pixel == 13'd5228) || (pixel == 13'd5230) || (pixel == 13'd5231) || (pixel == 13'd5235) || (pixel == 13'd5236) || (pixel == 13'd5240) || 
                (pixel == 13'd5241) || (pixel == 13'd5246) || (pixel == 13'd5247) || (pixel == 13'd5248) || (pixel == 13'd5251) || (pixel == 13'd5252) || (pixel == 13'd5253) || (pixel == 13'd5307) || 
                (pixel == 13'd5308) || (pixel == 13'd5309) || (pixel == 13'd5310) || (pixel == 13'd5311) || (pixel == 13'd5312) || (pixel == 13'd5313) || (pixel == 13'd5318) || (pixel == 13'd5319) || 
                (pixel == 13'd5320) || (pixel == 13'd5321) || (pixel == 13'd5322) || (pixel == 13'd5323) || (pixel == 13'd5326) || (pixel == 13'd5327) || (pixel == 13'd5328) || (pixel == 13'd5329) || 
                (pixel == 13'd5330) || (pixel == 13'd5331) || (pixel == 13'd5332) || (pixel == 13'd5336) || (pixel == 13'd5337) || (pixel == 13'd5343) || (pixel == 13'd5344) || (pixel == 13'd5345) || 
                (pixel == 13'd5346) || (pixel == 13'd5347) || (pixel == 13'd5348) || (pixel == 13'd5349) || (pixel == 13'd5403) || (pixel == 13'd5404) || (pixel == 13'd5405) || (pixel == 13'd5406) || 
                (pixel == 13'd5407) || (pixel == 13'd5408) || (pixel == 13'd5415) || (pixel == 13'd5416) || (pixel == 13'd5417) || (pixel == 13'd5418) || (pixel == 13'd5423) || (pixel == 13'd5424) || 
                (pixel == 13'd5425) || (pixel == 13'd5427) || (pixel == 13'd5428) || (pixel == 13'd5432) || (pixel == 13'd5433) || (pixel == 13'd5440) || (pixel == 13'd5441) || (pixel == 13'd5442) || 
                (pixel == 13'd5444) || (pixel == 13'd5445))
                oled_data <= `OLED_WHITE;

        endcase
    end
    
endmodule
