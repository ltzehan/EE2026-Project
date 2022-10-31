`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.10.2022 12:07:03
// Design Name: 
// Module Name: dtmf_grid_oled
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


module dtmf_grid_oled(
    input CLK,
    input [12:0] pixel,
    input row_valid, col_valid,
    input [2:0] row_idx, col_idx,
    output reg [15:0] oled_data
    );
    
    wire [7:0] x, y;
    px_to_xy(pixel, x, y);
    
    wire same_row = (y >= (row_idx >> 4)) && (y <= ((row_idx+1) >> 4));
    wire same_col = (x >= (col_idx >> 4)) && (x <= ((col_idx+1) >> 4));
    
    always @(posedge CLK) begin
        if (
        (pixel == 13'd312) || (pixel == 13'd313) || (pixel == 13'd326) || (pixel == 13'd327) || (pixel == 13'd328) || (pixel == 13'd329) || (pixel == 13'd330) || (pixel == 13'd342) || 
        (pixel == 13'd343) || (pixel == 13'd344) || (pixel == 13'd345) || (pixel == 13'd346) || (pixel == 13'd360) || (pixel == 13'd361) || (pixel == 13'd406) || (pixel == 13'd407) || 
        (pixel == 13'd408) || (pixel == 13'd409) || (pixel == 13'd421) || (pixel == 13'd422) || (pixel == 13'd423) || (pixel == 13'd424) || (pixel == 13'd425) || (pixel == 13'd426) || 
        (pixel == 13'd427) || (pixel == 13'd437) || (pixel == 13'd438) || (pixel == 13'd439) || (pixel == 13'd440) || (pixel == 13'd441) || (pixel == 13'd442) || (pixel == 13'd443) || 
        (pixel == 13'd455) || (pixel == 13'd456) || (pixel == 13'd457) || (pixel == 13'd458) || (pixel == 13'd502) || (pixel == 13'd503) || (pixel == 13'd504) || (pixel == 13'd505) || 
        (pixel == 13'd517) || (pixel == 13'd522) || (pixel == 13'd523) || (pixel == 13'd533) || (pixel == 13'd538) || (pixel == 13'd539) || (pixel == 13'd551) || (pixel == 13'd552) || 
        (pixel == 13'd553) || (pixel == 13'd554) || (pixel == 13'd600) || (pixel == 13'd601) || (pixel == 13'd618) || (pixel == 13'd619) || (pixel == 13'd634) || (pixel == 13'd635) || 
        (pixel == 13'd646) || (pixel == 13'd647) || (pixel == 13'd650) || (pixel == 13'd651) || (pixel == 13'd696) || (pixel == 13'd697) || (pixel == 13'd713) || (pixel == 13'd714) || 
        (pixel == 13'd726) || (pixel == 13'd727) || (pixel == 13'd728) || (pixel == 13'd729) || (pixel == 13'd730) || (pixel == 13'd742) || (pixel == 13'd743) || (pixel == 13'd746) || 
        (pixel == 13'd747) || (pixel == 13'd792) || (pixel == 13'd793) || (pixel == 13'd808) || (pixel == 13'd809) || (pixel == 13'd822) || (pixel == 13'd823) || (pixel == 13'd824) || 
        (pixel == 13'd825) || (pixel == 13'd826) || (pixel == 13'd827) || (pixel == 13'd837) || (pixel == 13'd838) || (pixel == 13'd843) || (pixel == 13'd844) || (pixel == 13'd888) || 
        (pixel == 13'd889) || (pixel == 13'd903) || (pixel == 13'd904) || (pixel == 13'd922) || (pixel == 13'd923) || (pixel == 13'd933) || (pixel == 13'd934) || (pixel == 13'd935) || 
        (pixel == 13'd936) || (pixel == 13'd937) || (pixel == 13'd938) || (pixel == 13'd939) || (pixel == 13'd940) || (pixel == 13'd984) || (pixel == 13'd985) || (pixel == 13'd998) || 
        (pixel == 13'd999) || (pixel == 13'd1013) || (pixel == 13'd1018) || (pixel == 13'd1019) || (pixel == 13'd1029) || (pixel == 13'd1030) || (pixel == 13'd1031) || (pixel == 13'd1032) || 
        (pixel == 13'd1033) || (pixel == 13'd1034) || (pixel == 13'd1035) || (pixel == 13'd1036) || (pixel == 13'd1078) || (pixel == 13'd1079) || (pixel == 13'd1080) || (pixel == 13'd1081) || 
        (pixel == 13'd1082) || (pixel == 13'd1083) || (pixel == 13'd1093) || (pixel == 13'd1094) || (pixel == 13'd1095) || (pixel == 13'd1096) || (pixel == 13'd1097) || (pixel == 13'd1098) || 
        (pixel == 13'd1099) || (pixel == 13'd1109) || (pixel == 13'd1110) || (pixel == 13'd1111) || (pixel == 13'd1112) || (pixel == 13'd1113) || (pixel == 13'd1114) || (pixel == 13'd1115) || 
        (pixel == 13'd1124) || (pixel == 13'd1125) || (pixel == 13'd1132) || (pixel == 13'd1133) || (pixel == 13'd1174) || (pixel == 13'd1175) || (pixel == 13'd1176) || (pixel == 13'd1177) || 
        (pixel == 13'd1178) || (pixel == 13'd1179) || (pixel == 13'd1189) || (pixel == 13'd1190) || (pixel == 13'd1191) || (pixel == 13'd1192) || (pixel == 13'd1193) || (pixel == 13'd1194) || 
        (pixel == 13'd1195) || (pixel == 13'd1206) || (pixel == 13'd1207) || (pixel == 13'd1208) || (pixel == 13'd1209) || (pixel == 13'd1210) || (pixel == 13'd1220) || (pixel == 13'd1221) || 
        (pixel == 13'd1228) || (pixel == 13'd1229) || (pixel == 13'd1848) || (pixel == 13'd1849) || (pixel == 13'd1850) || (pixel == 13'd1861) || (pixel == 13'd1862) || (pixel == 13'd1863) || 
        (pixel == 13'd1864) || (pixel == 13'd1865) || (pixel == 13'd1866) || (pixel == 13'd1867) || (pixel == 13'd1879) || (pixel == 13'd1880) || (pixel == 13'd1881) || (pixel == 13'd1882) || 
        (pixel == 13'd1883) || (pixel == 13'd1893) || (pixel == 13'd1894) || (pixel == 13'd1895) || (pixel == 13'd1896) || (pixel == 13'd1897) || (pixel == 13'd1898) || (pixel == 13'd1943) || 
        (pixel == 13'd1944) || (pixel == 13'd1945) || (pixel == 13'd1946) || (pixel == 13'd1957) || (pixel == 13'd1958) || (pixel == 13'd1959) || (pixel == 13'd1960) || (pixel == 13'd1961) || 
        (pixel == 13'd1962) || (pixel == 13'd1963) || (pixel == 13'd1974) || (pixel == 13'd1975) || (pixel == 13'd1976) || (pixel == 13'd1977) || (pixel == 13'd1978) || (pixel == 13'd1979) || 
        (pixel == 13'd1989) || (pixel == 13'd1990) || (pixel == 13'd1991) || (pixel == 13'd1992) || (pixel == 13'd1993) || (pixel == 13'd1994) || (pixel == 13'd1995) || (pixel == 13'd2039) || 
        (pixel == 13'd2040) || (pixel == 13'd2041) || (pixel == 13'd2042) || (pixel == 13'd2053) || (pixel == 13'd2054) || (pixel == 13'd2069) || (pixel == 13'd2070) || (pixel == 13'd2071) || 
        (pixel == 13'd2085) || (pixel == 13'd2086) || (pixel == 13'd2090) || (pixel == 13'd2091) || (pixel == 13'd2134) || (pixel == 13'd2135) || (pixel == 13'd2137) || (pixel == 13'd2138) || 
        (pixel == 13'd2149) || (pixel == 13'd2150) || (pixel == 13'd2165) || (pixel == 13'd2166) || (pixel == 13'd2181) || (pixel == 13'd2182) || (pixel == 13'd2186) || (pixel == 13'd2187) || 
        (pixel == 13'd2230) || (pixel == 13'd2231) || (pixel == 13'd2233) || (pixel == 13'd2234) || (pixel == 13'd2245) || (pixel == 13'd2246) || (pixel == 13'd2247) || (pixel == 13'd2248) || 
        (pixel == 13'd2249) || (pixel == 13'd2250) || (pixel == 13'd2261) || (pixel == 13'd2262) || (pixel == 13'd2264) || (pixel == 13'd2265) || (pixel == 13'd2266) || (pixel == 13'd2277) || 
        (pixel == 13'd2278) || (pixel == 13'd2279) || (pixel == 13'd2280) || (pixel == 13'd2281) || (pixel == 13'd2282) || (pixel == 13'd2325) || (pixel == 13'd2326) || (pixel == 13'd2329) || 
        (pixel == 13'd2330) || (pixel == 13'd2341) || (pixel == 13'd2342) || (pixel == 13'd2343) || (pixel == 13'd2344) || (pixel == 13'd2345) || (pixel == 13'd2346) || (pixel == 13'd2347) || 
        (pixel == 13'd2357) || (pixel == 13'd2358) || (pixel == 13'd2359) || (pixel == 13'd2360) || (pixel == 13'd2361) || (pixel == 13'd2362) || (pixel == 13'd2363) || (pixel == 13'd2373) || 
        (pixel == 13'd2374) || (pixel == 13'd2375) || (pixel == 13'd2376) || (pixel == 13'd2377) || (pixel == 13'd2378) || (pixel == 13'd2379) || (pixel == 13'd2421) || (pixel == 13'd2422) || 
        (pixel == 13'd2423) || (pixel == 13'd2424) || (pixel == 13'd2425) || (pixel == 13'd2426) || (pixel == 13'd2427) || (pixel == 13'd2442) || (pixel == 13'd2443) || (pixel == 13'd2453) || 
        (pixel == 13'd2454) || (pixel == 13'd2458) || (pixel == 13'd2459) || (pixel == 13'd2469) || (pixel == 13'd2470) || (pixel == 13'd2474) || (pixel == 13'd2475) || (pixel == 13'd2517) || 
        (pixel == 13'd2518) || (pixel == 13'd2519) || (pixel == 13'd2520) || (pixel == 13'd2521) || (pixel == 13'd2522) || (pixel == 13'd2523) || (pixel == 13'd2533) || (pixel == 13'd2538) || 
        (pixel == 13'd2539) || (pixel == 13'd2549) || (pixel == 13'd2550) || (pixel == 13'd2554) || (pixel == 13'd2555) || (pixel == 13'd2565) || (pixel == 13'd2566) || (pixel == 13'd2570) || 
        (pixel == 13'd2571) || (pixel == 13'd2617) || (pixel == 13'd2618) || (pixel == 13'd2629) || (pixel == 13'd2630) || (pixel == 13'd2631) || (pixel == 13'd2632) || (pixel == 13'd2633) || 
        (pixel == 13'd2634) || (pixel == 13'd2635) || (pixel == 13'd2645) || (pixel == 13'd2646) || (pixel == 13'd2647) || (pixel == 13'd2648) || (pixel == 13'd2649) || (pixel == 13'd2650) || 
        (pixel == 13'd2651) || (pixel == 13'd2661) || (pixel == 13'd2662) || (pixel == 13'd2663) || (pixel == 13'd2664) || (pixel == 13'd2665) || (pixel == 13'd2666) || (pixel == 13'd2667) || 
        (pixel == 13'd2713) || (pixel == 13'd2714) || (pixel == 13'd2726) || (pixel == 13'd2727) || (pixel == 13'd2728) || (pixel == 13'd2729) || (pixel == 13'd2730) || (pixel == 13'd2742) || 
        (pixel == 13'd2743) || (pixel == 13'd2744) || (pixel == 13'd2745) || (pixel == 13'd2746) || (pixel == 13'd2757) || (pixel == 13'd2758) || (pixel == 13'd2759) || (pixel == 13'd2760) || 
        (pixel == 13'd2761) || (pixel == 13'd2762) || (pixel == 13'd3381) || (pixel == 13'd3382) || (pixel == 13'd3383) || (pixel == 13'd3384) || (pixel == 13'd3385) || (pixel == 13'd3386) || 
        (pixel == 13'd3387) || (pixel == 13'd3398) || (pixel == 13'd3399) || (pixel == 13'd3400) || (pixel == 13'd3401) || (pixel == 13'd3402) || (pixel == 13'd3414) || (pixel == 13'd3415) || 
        (pixel == 13'd3416) || (pixel == 13'd3417) || (pixel == 13'd3418) || (pixel == 13'd3431) || (pixel == 13'd3432) || (pixel == 13'd3433) || (pixel == 13'd3434) || (pixel == 13'd3477) || 
        (pixel == 13'd3478) || (pixel == 13'd3479) || (pixel == 13'd3480) || (pixel == 13'd3481) || (pixel == 13'd3482) || (pixel == 13'd3483) || (pixel == 13'd3493) || (pixel == 13'd3494) || 
        (pixel == 13'd3495) || (pixel == 13'd3496) || (pixel == 13'd3497) || (pixel == 13'd3498) || (pixel == 13'd3499) || (pixel == 13'd3509) || (pixel == 13'd3510) || (pixel == 13'd3511) || 
        (pixel == 13'd3512) || (pixel == 13'd3513) || (pixel == 13'd3514) || (pixel == 13'd3515) || (pixel == 13'd3526) || (pixel == 13'd3527) || (pixel == 13'd3528) || (pixel == 13'd3529) || 
        (pixel == 13'd3530) || (pixel == 13'd3531) || (pixel == 13'd3577) || (pixel == 13'd3578) || (pixel == 13'd3589) || (pixel == 13'd3590) || (pixel == 13'd3594) || (pixel == 13'd3595) || 
        (pixel == 13'd3605) || (pixel == 13'd3606) || (pixel == 13'd3610) || (pixel == 13'd3611) || (pixel == 13'd3621) || (pixel == 13'd3622) || (pixel == 13'd3623) || (pixel == 13'd3627) || 
        (pixel == 13'd3673) || (pixel == 13'd3674) || (pixel == 13'd3685) || (pixel == 13'd3686) || (pixel == 13'd3690) || (pixel == 13'd3691) || (pixel == 13'd3701) || (pixel == 13'd3702) || 
        (pixel == 13'd3706) || (pixel == 13'd3707) || (pixel == 13'd3717) || (pixel == 13'd3718) || (pixel == 13'd3768) || (pixel == 13'd3769) || (pixel == 13'd3782) || (pixel == 13'd3783) || 
        (pixel == 13'd3784) || (pixel == 13'd3785) || (pixel == 13'd3786) || (pixel == 13'd3797) || (pixel == 13'd3798) || (pixel == 13'd3799) || (pixel == 13'd3800) || (pixel == 13'd3801) || 
        (pixel == 13'd3802) || (pixel == 13'd3803) || (pixel == 13'd3813) || (pixel == 13'd3814) || (pixel == 13'd3864) || (pixel == 13'd3865) || (pixel == 13'd3878) || (pixel == 13'd3879) || 
        (pixel == 13'd3880) || (pixel == 13'd3881) || (pixel == 13'd3882) || (pixel == 13'd3894) || (pixel == 13'd3895) || (pixel == 13'd3896) || (pixel == 13'd3898) || (pixel == 13'd3899) || 
        (pixel == 13'd3909) || (pixel == 13'd3910) || (pixel == 13'd3959) || (pixel == 13'd3960) || (pixel == 13'd3973) || (pixel == 13'd3974) || (pixel == 13'd3978) || (pixel == 13'd3979) || 
        (pixel == 13'd3994) || (pixel == 13'd3995) || (pixel == 13'd4005) || (pixel == 13'd4006) || (pixel == 13'd4055) || (pixel == 13'd4056) || (pixel == 13'd4069) || (pixel == 13'd4070) || 
        (pixel == 13'd4074) || (pixel == 13'd4075) || (pixel == 13'd4089) || (pixel == 13'd4090) || (pixel == 13'd4091) || (pixel == 13'd4101) || (pixel == 13'd4102) || (pixel == 13'd4103) || 
        (pixel == 13'd4107) || (pixel == 13'd4150) || (pixel == 13'd4151) || (pixel == 13'd4165) || (pixel == 13'd4166) || (pixel == 13'd4167) || (pixel == 13'd4168) || (pixel == 13'd4169) || 
        (pixel == 13'd4170) || (pixel == 13'd4171) || (pixel == 13'd4181) || (pixel == 13'd4182) || (pixel == 13'd4183) || (pixel == 13'd4184) || (pixel == 13'd4185) || (pixel == 13'd4186) || 
        (pixel == 13'd4198) || (pixel == 13'd4199) || (pixel == 13'd4200) || (pixel == 13'd4201) || (pixel == 13'd4202) || (pixel == 13'd4203) || (pixel == 13'd4246) || (pixel == 13'd4247) || 
        (pixel == 13'd4262) || (pixel == 13'd4263) || (pixel == 13'd4264) || (pixel == 13'd4265) || (pixel == 13'd4266) || (pixel == 13'd4277) || (pixel == 13'd4278) || (pixel == 13'd4279) || 
        (pixel == 13'd4280) || (pixel == 13'd4281) || (pixel == 13'd4295) || (pixel == 13'd4296) || (pixel == 13'd4297) || (pixel == 13'd4298) || (pixel == 13'd4934) || (pixel == 13'd4935) || 
        (pixel == 13'd4936) || (pixel == 13'd4937) || (pixel == 13'd4938) || (pixel == 13'd4951) || (pixel == 13'd4952) || (pixel == 13'd4954) || (pixel == 13'd4955) || (pixel == 13'd4965) || 
        (pixel == 13'd4966) || (pixel == 13'd4967) || (pixel == 13'd4968) || (pixel == 13'd4969) || (pixel == 13'd4970) || (pixel == 13'd5029) || (pixel == 13'd5030) || (pixel == 13'd5031) || 
        (pixel == 13'd5032) || (pixel == 13'd5033) || (pixel == 13'd5034) || (pixel == 13'd5035) || (pixel == 13'd5047) || (pixel == 13'd5048) || (pixel == 13'd5050) || (pixel == 13'd5051) || 
        (pixel == 13'd5061) || (pixel == 13'd5062) || (pixel == 13'd5063) || (pixel == 13'd5064) || (pixel == 13'd5065) || (pixel == 13'd5066) || (pixel == 13'd5067) || (pixel == 13'd5112) || 
        (pixel == 13'd5125) || (pixel == 13'd5126) || (pixel == 13'd5130) || (pixel == 13'd5131) || (pixel == 13'd5143) || (pixel == 13'd5144) || (pixel == 13'd5146) || (pixel == 13'd5147) || 
        (pixel == 13'd5157) || (pixel == 13'd5158) || (pixel == 13'd5162) || (pixel == 13'd5163) || (pixel == 13'd5164) || (pixel == 13'd5206) || (pixel == 13'd5208) || (pixel == 13'd5210) || 
        (pixel == 13'd5221) || (pixel == 13'd5222) || (pixel == 13'd5226) || (pixel == 13'd5227) || (pixel == 13'd5237) || (pixel == 13'd5238) || (pixel == 13'd5239) || (pixel == 13'd5240) || 
        (pixel == 13'd5241) || (pixel == 13'd5242) || (pixel == 13'd5243) || (pixel == 13'd5244) || (pixel == 13'd5253) || (pixel == 13'd5254) || (pixel == 13'd5259) || (pixel == 13'd5260) || 
        (pixel == 13'd5303) || (pixel == 13'd5304) || (pixel == 13'd5305) || (pixel == 13'd5317) || (pixel == 13'd5318) || (pixel == 13'd5322) || (pixel == 13'd5323) || (pixel == 13'd5335) || 
        (pixel == 13'd5336) || (pixel == 13'd5338) || (pixel == 13'd5339) || (pixel == 13'd5349) || (pixel == 13'd5350) || (pixel == 13'd5355) || (pixel == 13'd5356) || (pixel == 13'd5399) || 
        (pixel == 13'd5400) || (pixel == 13'd5401) || (pixel == 13'd5413) || (pixel == 13'd5414) || (pixel == 13'd5418) || (pixel == 13'd5419) || (pixel == 13'd5430) || (pixel == 13'd5431) || 
        (pixel == 13'd5433) || (pixel == 13'd5434) || (pixel == 13'd5445) || (pixel == 13'd5446) || (pixel == 13'd5451) || (pixel == 13'd5452) || (pixel == 13'd5494) || (pixel == 13'd5496) || 
        (pixel == 13'd5498) || (pixel == 13'd5509) || (pixel == 13'd5510) || (pixel == 13'd5514) || (pixel == 13'd5515) || (pixel == 13'd5525) || (pixel == 13'd5526) || (pixel == 13'd5527) || 
        (pixel == 13'd5528) || (pixel == 13'd5529) || (pixel == 13'd5530) || (pixel == 13'd5531) || (pixel == 13'd5532) || (pixel == 13'd5541) || (pixel == 13'd5542) || (pixel == 13'd5547) || 
        (pixel == 13'd5548) || (pixel == 13'd5592) || (pixel == 13'd5605) || (pixel == 13'd5606) || (pixel == 13'd5610) || (pixel == 13'd5611) || (pixel == 13'd5622) || (pixel == 13'd5623) || 
        (pixel == 13'd5625) || (pixel == 13'd5626) || (pixel == 13'd5637) || (pixel == 13'd5638) || (pixel == 13'd5642) || (pixel == 13'd5643) || (pixel == 13'd5644) || (pixel == 13'd5701) || 
        (pixel == 13'd5702) || (pixel == 13'd5703) || (pixel == 13'd5704) || (pixel == 13'd5705) || (pixel == 13'd5706) || (pixel == 13'd5707) || (pixel == 13'd5718) || (pixel == 13'd5719) || 
        (pixel == 13'd5721) || (pixel == 13'd5722) || (pixel == 13'd5733) || (pixel == 13'd5734) || (pixel == 13'd5735) || (pixel == 13'd5736) || (pixel == 13'd5737) || (pixel == 13'd5738) || 
        (pixel == 13'd5739) || (pixel == 13'd5798) || (pixel == 13'd5799) || (pixel == 13'd5800) || (pixel == 13'd5801) || (pixel == 13'd5802) || (pixel == 13'd5814) || (pixel == 13'd5815) || 
        (pixel == 13'd5817) || (pixel == 13'd5818) || (pixel == 13'd5829) || (pixel == 13'd5830) || (pixel == 13'd5831) || (pixel == 13'd5832) || (pixel == 13'd5833) || (pixel == 13'd5834)) begin
        
            if (row_valid && col_valid) begin
                oled_data <= `OLED_RED;
//                if (same_row && same_col)
//                    oled_data <= `OLED_RED;
//                else if (same_row)
//                    oled_data <= `OLED_GREEN;
//                else if (same_col)
//                    oled_data <= `OLED_GREEN;
            end
            else
                oled_data <= `OLED_WHITE;
        
        end
        else
            oled_data <= `OLED_BLACK;
    end
    
endmodule
