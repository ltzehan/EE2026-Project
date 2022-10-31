`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.10.2022 22:57:45
// Design Name: 
// Module Name: lock_confirm_oled
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


module lock_confirm_oled(
    input CLK,
    input [12:0] pixel,
    output reg [16:0] oled_data
    );
    
    always @(posedge CLK) begin
        if (
            (pixel == 13'd2383) || (pixel == 13'd2478) || (pixel == 13'd2479) || (pixel == 13'd2480) || (pixel == 13'd2574) || (pixel == 13'd2575) || (pixel == 13'd2576) || (pixel == 13'd2577) || 
            (pixel == 13'd2626) || (pixel == 13'd2627) || (pixel == 13'd2628) || (pixel == 13'd2671) || (pixel == 13'd2672) || (pixel == 13'd2673) || (pixel == 13'd2674) || (pixel == 13'd2697) || 
            (pixel == 13'd2698) || (pixel == 13'd2699) || (pixel == 13'd2700) || (pixel == 13'd2721) || (pixel == 13'd2722) || (pixel == 13'd2723) || (pixel == 13'd2724) || (pixel == 13'd2726) || 
            (pixel == 13'd2727) || (pixel == 13'd2768) || (pixel == 13'd2769) || (pixel == 13'd2770) || (pixel == 13'd2771) || (pixel == 13'd2792) || (pixel == 13'd2793) || (pixel == 13'd2794) || 
            (pixel == 13'd2795) || (pixel == 13'd2796) || (pixel == 13'd2797) || (pixel == 13'd2817) || (pixel == 13'd2818) || (pixel == 13'd2822) || (pixel == 13'd2823) || (pixel == 13'd2865) || 
            (pixel == 13'd2866) || (pixel == 13'd2867) || (pixel == 13'd2868) || (pixel == 13'd2887) || (pixel == 13'd2888) || (pixel == 13'd2889) || (pixel == 13'd2893) || (pixel == 13'd2913) || 
            (pixel == 13'd2914) || (pixel == 13'd2962) || (pixel == 13'd2963) || (pixel == 13'd2964) || (pixel == 13'd2965) || (pixel == 13'd2983) || (pixel == 13'd2984) || (pixel == 13'd2992) || 
            (pixel == 13'd2993) || (pixel == 13'd2994) || (pixel == 13'd2995) || (pixel == 13'd2996) || (pixel == 13'd3000) || (pixel == 13'd3001) || (pixel == 13'd3003) || (pixel == 13'd3004) || 
            (pixel == 13'd3005) || (pixel == 13'd3008) || (pixel == 13'd3009) || (pixel == 13'd3010) || (pixel == 13'd3011) || (pixel == 13'd3012) || (pixel == 13'd3013) || (pixel == 13'd3014) || 
            (pixel == 13'd3015) || (pixel == 13'd3018) || (pixel == 13'd3019) || (pixel == 13'd3021) || (pixel == 13'd3022) || (pixel == 13'd3024) || (pixel == 13'd3025) || (pixel == 13'd3027) || 
            (pixel == 13'd3028) || (pixel == 13'd3030) || (pixel == 13'd3031) || (pixel == 13'd3032) || (pixel == 13'd3037) || (pixel == 13'd3038) || (pixel == 13'd3048) || (pixel == 13'd3049) || 
            (pixel == 13'd3050) || (pixel == 13'd3051) || (pixel == 13'd3052) || (pixel == 13'd3053) || (pixel == 13'd3054) || (pixel == 13'd3055) || (pixel == 13'd3056) || (pixel == 13'd3057) || 
            (pixel == 13'd3058) || (pixel == 13'd3059) || (pixel == 13'd3060) || (pixel == 13'd3061) || (pixel == 13'd3062) || (pixel == 13'd3079) || (pixel == 13'd3080) || (pixel == 13'd3087) || 
            (pixel == 13'd3088) || (pixel == 13'd3089) || (pixel == 13'd3090) || (pixel == 13'd3091) || (pixel == 13'd3092) || (pixel == 13'd3093) || (pixel == 13'd3096) || (pixel == 13'd3097) || 
            (pixel == 13'd3098) || (pixel == 13'd3099) || (pixel == 13'd3100) || (pixel == 13'd3101) || (pixel == 13'd3102) || (pixel == 13'd3104) || (pixel == 13'd3105) || (pixel == 13'd3106) || 
            (pixel == 13'd3107) || (pixel == 13'd3108) || (pixel == 13'd3109) || (pixel == 13'd3110) || (pixel == 13'd3111) || (pixel == 13'd3114) || (pixel == 13'd3115) || (pixel == 13'd3116) || 
            (pixel == 13'd3117) || (pixel == 13'd3118) || (pixel == 13'd3120) || (pixel == 13'd3121) || (pixel == 13'd3122) || (pixel == 13'd3123) || (pixel == 13'd3124) || (pixel == 13'd3125) || 
            (pixel == 13'd3126) || (pixel == 13'd3127) || (pixel == 13'd3128) || (pixel == 13'd3129) || (pixel == 13'd3133) || (pixel == 13'd3134) || (pixel == 13'd3144) || (pixel == 13'd3145) || 
            (pixel == 13'd3146) || (pixel == 13'd3147) || (pixel == 13'd3148) || (pixel == 13'd3149) || (pixel == 13'd3150) || (pixel == 13'd3151) || (pixel == 13'd3152) || (pixel == 13'd3153) || 
            (pixel == 13'd3154) || (pixel == 13'd3155) || (pixel == 13'd3156) || (pixel == 13'd3157) || (pixel == 13'd3158) || (pixel == 13'd3159) || (pixel == 13'd3175) || (pixel == 13'd3176) || 
            (pixel == 13'd3183) || (pixel == 13'd3184) || (pixel == 13'd3188) || (pixel == 13'd3189) || (pixel == 13'd3192) || (pixel == 13'd3193) || (pixel == 13'd3197) || (pixel == 13'd3198) || 
            (pixel == 13'd3201) || (pixel == 13'd3202) || (pixel == 13'd3206) || (pixel == 13'd3207) || (pixel == 13'd3210) || (pixel == 13'd3211) || (pixel == 13'd3216) || (pixel == 13'd3217) || 
            (pixel == 13'd3220) || (pixel == 13'd3221) || (pixel == 13'd3224) || (pixel == 13'd3225) || (pixel == 13'd3240) || (pixel == 13'd3241) || (pixel == 13'd3242) || (pixel == 13'd3243) || 
            (pixel == 13'd3244) || (pixel == 13'd3245) || (pixel == 13'd3246) || (pixel == 13'd3247) || (pixel == 13'd3248) || (pixel == 13'd3249) || (pixel == 13'd3250) || (pixel == 13'd3251) || 
            (pixel == 13'd3252) || (pixel == 13'd3253) || (pixel == 13'd3254) || (pixel == 13'd3271) || (pixel == 13'd3272) || (pixel == 13'd3279) || (pixel == 13'd3280) || (pixel == 13'd3284) || 
            (pixel == 13'd3285) || (pixel == 13'd3288) || (pixel == 13'd3289) || (pixel == 13'd3293) || (pixel == 13'd3294) || (pixel == 13'd3297) || (pixel == 13'd3298) || (pixel == 13'd3302) || 
            (pixel == 13'd3303) || (pixel == 13'd3306) || (pixel == 13'd3307) || (pixel == 13'd3312) || (pixel == 13'd3313) || (pixel == 13'd3316) || (pixel == 13'd3317) || (pixel == 13'd3320) || 
            (pixel == 13'd3321) || (pixel == 13'd3346) || (pixel == 13'd3347) || (pixel == 13'd3348) || (pixel == 13'd3349) || (pixel == 13'd3367) || (pixel == 13'd3368) || (pixel == 13'd3369) || 
            (pixel == 13'd3373) || (pixel == 13'd3375) || (pixel == 13'd3376) || (pixel == 13'd3380) || (pixel == 13'd3381) || (pixel == 13'd3384) || (pixel == 13'd3385) || (pixel == 13'd3389) || 
            (pixel == 13'd3390) || (pixel == 13'd3393) || (pixel == 13'd3394) || (pixel == 13'd3398) || (pixel == 13'd3399) || (pixel == 13'd3402) || (pixel == 13'd3403) || (pixel == 13'd3408) || 
            (pixel == 13'd3409) || (pixel == 13'd3412) || (pixel == 13'd3413) || (pixel == 13'd3416) || (pixel == 13'd3417) || (pixel == 13'd3441) || (pixel == 13'd3442) || (pixel == 13'd3443) || 
            (pixel == 13'd3444) || (pixel == 13'd3464) || (pixel == 13'd3465) || (pixel == 13'd3466) || (pixel == 13'd3467) || (pixel == 13'd3468) || (pixel == 13'd3469) || (pixel == 13'd3471) || 
            (pixel == 13'd3472) || (pixel == 13'd3473) || (pixel == 13'd3474) || (pixel == 13'd3475) || (pixel == 13'd3476) || (pixel == 13'd3477) || (pixel == 13'd3480) || (pixel == 13'd3481) || 
            (pixel == 13'd3485) || (pixel == 13'd3486) || (pixel == 13'd3489) || (pixel == 13'd3490) || (pixel == 13'd3494) || (pixel == 13'd3495) || (pixel == 13'd3498) || (pixel == 13'd3499) || 
            (pixel == 13'd3504) || (pixel == 13'd3505) || (pixel == 13'd3508) || (pixel == 13'd3509) || (pixel == 13'd3512) || (pixel == 13'd3513) || (pixel == 13'd3517) || (pixel == 13'd3518) || 
            (pixel == 13'd3536) || (pixel == 13'd3537) || (pixel == 13'd3538) || (pixel == 13'd3539) || (pixel == 13'd3561) || (pixel == 13'd3562) || (pixel == 13'd3563) || (pixel == 13'd3564) || 
            (pixel == 13'd3568) || (pixel == 13'd3569) || (pixel == 13'd3570) || (pixel == 13'd3571) || (pixel == 13'd3572) || (pixel == 13'd3576) || (pixel == 13'd3577) || (pixel == 13'd3581) || 
            (pixel == 13'd3582) || (pixel == 13'd3585) || (pixel == 13'd3586) || (pixel == 13'd3590) || (pixel == 13'd3591) || (pixel == 13'd3594) || (pixel == 13'd3595) || (pixel == 13'd3600) || 
            (pixel == 13'd3601) || (pixel == 13'd3604) || (pixel == 13'd3605) || (pixel == 13'd3608) || (pixel == 13'd3609) || (pixel == 13'd3613) || (pixel == 13'd3614) || (pixel == 13'd3631) || 
            (pixel == 13'd3632) || (pixel == 13'd3633) || (pixel == 13'd3634) || (pixel == 13'd3726) || (pixel == 13'd3727) || (pixel == 13'd3728) || (pixel == 13'd3729) || (pixel == 13'd3822) || 
            (pixel == 13'd3823) || (pixel == 13'd3824) || (pixel == 13'd3919) || (pixel == 13'd4400) || (pixel == 13'd4495) || (pixel == 13'd4496) || (pixel == 13'd4497) || (pixel == 13'd4559) || 
            (pixel == 13'd4560) || (pixel == 13'd4590) || (pixel == 13'd4591) || (pixel == 13'd4592) || (pixel == 13'd4593) || (pixel == 13'd4617) || (pixel == 13'd4618) || (pixel == 13'd4619) || 
            (pixel == 13'd4620) || (pixel == 13'd4655) || (pixel == 13'd4656) || (pixel == 13'd4685) || (pixel == 13'd4686) || (pixel == 13'd4687) || (pixel == 13'd4688) || (pixel == 13'd4712) || 
            (pixel == 13'd4713) || (pixel == 13'd4714) || (pixel == 13'd4715) || (pixel == 13'd4716) || (pixel == 13'd4717) || (pixel == 13'd4751) || (pixel == 13'd4752) || (pixel == 13'd4780) || 
            (pixel == 13'd4781) || (pixel == 13'd4782) || (pixel == 13'd4783) || (pixel == 13'd4807) || (pixel == 13'd4808) || (pixel == 13'd4809) || (pixel == 13'd4813) || (pixel == 13'd4847) || 
            (pixel == 13'd4848) || (pixel == 13'd4875) || (pixel == 13'd4876) || (pixel == 13'd4877) || (pixel == 13'd4878) || (pixel == 13'd4903) || (pixel == 13'd4904) || (pixel == 13'd4911) || 
            (pixel == 13'd4912) || (pixel == 13'd4913) || (pixel == 13'd4914) || (pixel == 13'd4915) || (pixel == 13'd4919) || (pixel == 13'd4920) || (pixel == 13'd4922) || (pixel == 13'd4923) || 
            (pixel == 13'd4924) || (pixel == 13'd4929) || (pixel == 13'd4930) || (pixel == 13'd4931) || (pixel == 13'd4932) || (pixel == 13'd4936) || (pixel == 13'd4937) || (pixel == 13'd4938) || 
            (pixel == 13'd4939) || (pixel == 13'd4943) || (pixel == 13'd4944) || (pixel == 13'd4947) || (pixel == 13'd4948) || (pixel == 13'd4970) || (pixel == 13'd4971) || (pixel == 13'd4972) || 
            (pixel == 13'd4973) || (pixel == 13'd4999) || (pixel == 13'd5000) || (pixel == 13'd5007) || (pixel == 13'd5008) || (pixel == 13'd5009) || (pixel == 13'd5010) || (pixel == 13'd5011) || 
            (pixel == 13'd5012) || (pixel == 13'd5015) || (pixel == 13'd5016) || (pixel == 13'd5017) || (pixel == 13'd5018) || (pixel == 13'd5019) || (pixel == 13'd5020) || (pixel == 13'd5021) || 
            (pixel == 13'd5024) || (pixel == 13'd5025) || (pixel == 13'd5026) || (pixel == 13'd5027) || (pixel == 13'd5028) || (pixel == 13'd5031) || (pixel == 13'd5032) || (pixel == 13'd5033) || 
            (pixel == 13'd5034) || (pixel == 13'd5035) || (pixel == 13'd5036) || (pixel == 13'd5039) || (pixel == 13'd5040) || (pixel == 13'd5043) || (pixel == 13'd5044) || (pixel == 13'd5065) || 
            (pixel == 13'd5066) || (pixel == 13'd5067) || (pixel == 13'd5068) || (pixel == 13'd5069) || (pixel == 13'd5070) || (pixel == 13'd5071) || (pixel == 13'd5072) || (pixel == 13'd5073) || 
            (pixel == 13'd5074) || (pixel == 13'd5075) || (pixel == 13'd5076) || (pixel == 13'd5077) || (pixel == 13'd5078) || (pixel == 13'd5079) || (pixel == 13'd5095) || (pixel == 13'd5096) || 
            (pixel == 13'd5107) || (pixel == 13'd5108) || (pixel == 13'd5111) || (pixel == 13'd5112) || (pixel == 13'd5116) || (pixel == 13'd5117) || (pixel == 13'd5120) || (pixel == 13'd5121) || 
            (pixel == 13'd5127) || (pixel == 13'd5128) || (pixel == 13'd5131) || (pixel == 13'd5132) || (pixel == 13'd5135) || (pixel == 13'd5136) || (pixel == 13'd5160) || (pixel == 13'd5161) || 
            (pixel == 13'd5162) || (pixel == 13'd5163) || (pixel == 13'd5164) || (pixel == 13'd5165) || (pixel == 13'd5166) || (pixel == 13'd5167) || (pixel == 13'd5168) || (pixel == 13'd5169) || 
            (pixel == 13'd5170) || (pixel == 13'd5171) || (pixel == 13'd5172) || (pixel == 13'd5173) || (pixel == 13'd5174) || (pixel == 13'd5175) || (pixel == 13'd5191) || (pixel == 13'd5192) || 
            (pixel == 13'd5200) || (pixel == 13'd5201) || (pixel == 13'd5202) || (pixel == 13'd5203) || (pixel == 13'd5204) || (pixel == 13'd5207) || (pixel == 13'd5208) || (pixel == 13'd5212) || 
            (pixel == 13'd5213) || (pixel == 13'd5216) || (pixel == 13'd5217) || (pixel == 13'd5223) || (pixel == 13'd5224) || (pixel == 13'd5225) || (pixel == 13'd5226) || (pixel == 13'd5227) || 
            (pixel == 13'd5228) || (pixel == 13'd5231) || (pixel == 13'd5232) || (pixel == 13'd5257) || (pixel == 13'd5258) || (pixel == 13'd5259) || (pixel == 13'd5260) || (pixel == 13'd5261) || 
            (pixel == 13'd5262) || (pixel == 13'd5263) || (pixel == 13'd5264) || (pixel == 13'd5265) || (pixel == 13'd5266) || (pixel == 13'd5267) || (pixel == 13'd5268) || (pixel == 13'd5269) || 
            (pixel == 13'd5270) || (pixel == 13'd5271) || (pixel == 13'd5287) || (pixel == 13'd5288) || (pixel == 13'd5289) || (pixel == 13'd5293) || (pixel == 13'd5295) || (pixel == 13'd5296) || 
            (pixel == 13'd5299) || (pixel == 13'd5300) || (pixel == 13'd5303) || (pixel == 13'd5304) || (pixel == 13'd5308) || (pixel == 13'd5309) || (pixel == 13'd5312) || (pixel == 13'd5313) || 
            (pixel == 13'd5319) || (pixel == 13'd5320) || (pixel == 13'd5327) || (pixel == 13'd5328) || (pixel == 13'd5354) || (pixel == 13'd5355) || (pixel == 13'd5356) || (pixel == 13'd5357) || 
            (pixel == 13'd5384) || (pixel == 13'd5385) || (pixel == 13'd5386) || (pixel == 13'd5387) || (pixel == 13'd5388) || (pixel == 13'd5389) || (pixel == 13'd5391) || (pixel == 13'd5392) || 
            (pixel == 13'd5393) || (pixel == 13'd5394) || (pixel == 13'd5395) || (pixel == 13'd5396) || (pixel == 13'd5399) || (pixel == 13'd5400) || (pixel == 13'd5404) || (pixel == 13'd5405) || 
            (pixel == 13'd5408) || (pixel == 13'd5409) || (pixel == 13'd5410) || (pixel == 13'd5411) || (pixel == 13'd5412) || (pixel == 13'd5415) || (pixel == 13'd5416) || (pixel == 13'd5417) || 
            (pixel == 13'd5418) || (pixel == 13'd5419) || (pixel == 13'd5420) || (pixel == 13'd5423) || (pixel == 13'd5424) || (pixel == 13'd5427) || (pixel == 13'd5428) || (pixel == 13'd5451) || 
            (pixel == 13'd5452) || (pixel == 13'd5453) || (pixel == 13'd5454) || (pixel == 13'd5481) || (pixel == 13'd5482) || (pixel == 13'd5483) || (pixel == 13'd5484) || (pixel == 13'd5488) || 
            (pixel == 13'd5489) || (pixel == 13'd5490) || (pixel == 13'd5491) || (pixel == 13'd5492) || (pixel == 13'd5495) || (pixel == 13'd5496) || (pixel == 13'd5500) || (pixel == 13'd5501) || 
            (pixel == 13'd5505) || (pixel == 13'd5506) || (pixel == 13'd5507) || (pixel == 13'd5508) || (pixel == 13'd5512) || (pixel == 13'd5513) || (pixel == 13'd5514) || (pixel == 13'd5515) || 
            (pixel == 13'd5516) || (pixel == 13'd5519) || (pixel == 13'd5520) || (pixel == 13'd5523) || (pixel == 13'd5524) || (pixel == 13'd5548) || (pixel == 13'd5549) || (pixel == 13'd5550) || 
            (pixel == 13'd5551) || (pixel == 13'd5645) || (pixel == 13'd5646) || (pixel == 13'd5647) || (pixel == 13'd5648) || (pixel == 13'd5742) || (pixel == 13'd5743) || (pixel == 13'd5744) || 
            (pixel == 13'd5745) || (pixel == 13'd5839) || (pixel == 13'd5840) || (pixel == 13'd5841) || (pixel == 13'd5936))
            oled_data <= `OLED_WHITE;
        else if (
            (pixel == 13'd319) || (pixel == 13'd320) || (pixel == 13'd321) || (pixel == 13'd322) || (pixel == 13'd323) || (pixel == 13'd324) || (pixel == 13'd325) || (pixel == 13'd326) || 
            (pixel == 13'd327) || (pixel == 13'd414) || (pixel == 13'd415) || (pixel == 13'd416) || (pixel == 13'd417) || (pixel == 13'd418) || (pixel == 13'd419) || (pixel == 13'd420) || 
            (pixel == 13'd421) || (pixel == 13'd422) || (pixel == 13'd423) || (pixel == 13'd424) || (pixel == 13'd509) || (pixel == 13'd510) || (pixel == 13'd511) || (pixel == 13'd512) || 
            (pixel == 13'd513) || (pixel == 13'd514) || (pixel == 13'd515) || (pixel == 13'd516) || (pixel == 13'd517) || (pixel == 13'd518) || (pixel == 13'd519) || (pixel == 13'd520) || 
            (pixel == 13'd521) || (pixel == 13'd605) || (pixel == 13'd606) || (pixel == 13'd607) || (pixel == 13'd608) || (pixel == 13'd609) || (pixel == 13'd610) || (pixel == 13'd611) || 
            (pixel == 13'd612) || (pixel == 13'd613) || (pixel == 13'd614) || (pixel == 13'd615) || (pixel == 13'd616) || (pixel == 13'd617) || (pixel == 13'd618) || (pixel == 13'd701) || 
            (pixel == 13'd702) || (pixel == 13'd703) || (pixel == 13'd704) || (pixel == 13'd705) || (pixel == 13'd706) || (pixel == 13'd707) || (pixel == 13'd708) || (pixel == 13'd709) || 
            (pixel == 13'd710) || (pixel == 13'd711) || (pixel == 13'd712) || (pixel == 13'd713) || (pixel == 13'd714) || (pixel == 13'd795) || (pixel == 13'd796) || (pixel == 13'd797) || 
            (pixel == 13'd798) || (pixel == 13'd799) || (pixel == 13'd800) || (pixel == 13'd806) || (pixel == 13'd807) || (pixel == 13'd808) || (pixel == 13'd809) || (pixel == 13'd810) || 
            (pixel == 13'd811) || (pixel == 13'd812) || (pixel == 13'd813) || (pixel == 13'd814) || (pixel == 13'd815) || (pixel == 13'd816) || (pixel == 13'd817) || (pixel == 13'd818) || 
            (pixel == 13'd819) || (pixel == 13'd820) || (pixel == 13'd821) || (pixel == 13'd822) || (pixel == 13'd823) || (pixel == 13'd824) || (pixel == 13'd825) || (pixel == 13'd826) || 
            (pixel == 13'd827) || (pixel == 13'd828) || (pixel == 13'd829) || (pixel == 13'd830) || (pixel == 13'd831) || (pixel == 13'd832) || (pixel == 13'd891) || (pixel == 13'd892) || 
            (pixel == 13'd893) || (pixel == 13'd894) || (pixel == 13'd895) || (pixel == 13'd896) || (pixel == 13'd902) || (pixel == 13'd903) || (pixel == 13'd904) || (pixel == 13'd905) || 
            (pixel == 13'd906) || (pixel == 13'd907) || (pixel == 13'd908) || (pixel == 13'd909) || (pixel == 13'd910) || (pixel == 13'd911) || (pixel == 13'd912) || (pixel == 13'd913) || 
            (pixel == 13'd914) || (pixel == 13'd915) || (pixel == 13'd916) || (pixel == 13'd917) || (pixel == 13'd918) || (pixel == 13'd919) || (pixel == 13'd920) || (pixel == 13'd921) || 
            (pixel == 13'd922) || (pixel == 13'd923) || (pixel == 13'd924) || (pixel == 13'd925) || (pixel == 13'd926) || (pixel == 13'd927) || (pixel == 13'd928) || (pixel == 13'd929) || 
            (pixel == 13'd987) || (pixel == 13'd988) || (pixel == 13'd989) || (pixel == 13'd990) || (pixel == 13'd991) || (pixel == 13'd992) || (pixel == 13'd998) || (pixel == 13'd999) || 
            (pixel == 13'd1000) || (pixel == 13'd1001) || (pixel == 13'd1002) || (pixel == 13'd1003) || (pixel == 13'd1004) || (pixel == 13'd1005) || (pixel == 13'd1006) || (pixel == 13'd1007) || 
            (pixel == 13'd1008) || (pixel == 13'd1009) || (pixel == 13'd1010) || (pixel == 13'd1011) || (pixel == 13'd1012) || (pixel == 13'd1013) || (pixel == 13'd1014) || (pixel == 13'd1015) || 
            (pixel == 13'd1016) || (pixel == 13'd1017) || (pixel == 13'd1018) || (pixel == 13'd1019) || (pixel == 13'd1020) || (pixel == 13'd1021) || (pixel == 13'd1022) || (pixel == 13'd1023) || 
            (pixel == 13'd1024) || (pixel == 13'd1025) || (pixel == 13'd1083) || (pixel == 13'd1084) || (pixel == 13'd1085) || (pixel == 13'd1086) || (pixel == 13'd1087) || (pixel == 13'd1088) || 
            (pixel == 13'd1094) || (pixel == 13'd1095) || (pixel == 13'd1096) || (pixel == 13'd1097) || (pixel == 13'd1098) || (pixel == 13'd1099) || (pixel == 13'd1100) || (pixel == 13'd1101) || 
            (pixel == 13'd1102) || (pixel == 13'd1103) || (pixel == 13'd1104) || (pixel == 13'd1105) || (pixel == 13'd1106) || (pixel == 13'd1107) || (pixel == 13'd1108) || (pixel == 13'd1109) || 
            (pixel == 13'd1110) || (pixel == 13'd1111) || (pixel == 13'd1112) || (pixel == 13'd1113) || (pixel == 13'd1114) || (pixel == 13'd1115) || (pixel == 13'd1116) || (pixel == 13'd1117) || 
            (pixel == 13'd1118) || (pixel == 13'd1119) || (pixel == 13'd1120) || (pixel == 13'd1121) || (pixel == 13'd1179) || (pixel == 13'd1180) || (pixel == 13'd1181) || (pixel == 13'd1182) || 
            (pixel == 13'd1183) || (pixel == 13'd1184) || (pixel == 13'd1190) || (pixel == 13'd1191) || (pixel == 13'd1192) || (pixel == 13'd1193) || (pixel == 13'd1194) || (pixel == 13'd1195) || 
            (pixel == 13'd1196) || (pixel == 13'd1197) || (pixel == 13'd1198) || (pixel == 13'd1199) || (pixel == 13'd1200) || (pixel == 13'd1201) || (pixel == 13'd1202) || (pixel == 13'd1203) || 
            (pixel == 13'd1204) || (pixel == 13'd1205) || (pixel == 13'd1206) || (pixel == 13'd1207) || (pixel == 13'd1208) || (pixel == 13'd1209) || (pixel == 13'd1210) || (pixel == 13'd1211) || 
            (pixel == 13'd1212) || (pixel == 13'd1213) || (pixel == 13'd1214) || (pixel == 13'd1215) || (pixel == 13'd1216) || (pixel == 13'd1277) || (pixel == 13'd1278) || (pixel == 13'd1279) || 
            (pixel == 13'd1280) || (pixel == 13'd1281) || (pixel == 13'd1282) || (pixel == 13'd1283) || (pixel == 13'd1284) || (pixel == 13'd1285) || (pixel == 13'd1286) || (pixel == 13'd1287) || 
            (pixel == 13'd1288) || (pixel == 13'd1289) || (pixel == 13'd1290) || (pixel == 13'd1298) || (pixel == 13'd1299) || (pixel == 13'd1300) || (pixel == 13'd1301) || (pixel == 13'd1302) || 
            (pixel == 13'd1308) || (pixel == 13'd1309) || (pixel == 13'd1310) || (pixel == 13'd1311) || (pixel == 13'd1373) || (pixel == 13'd1374) || (pixel == 13'd1375) || (pixel == 13'd1376) || 
            (pixel == 13'd1377) || (pixel == 13'd1378) || (pixel == 13'd1379) || (pixel == 13'd1380) || (pixel == 13'd1381) || (pixel == 13'd1382) || (pixel == 13'd1383) || (pixel == 13'd1384) || 
            (pixel == 13'd1385) || (pixel == 13'd1386) || (pixel == 13'd1394) || (pixel == 13'd1395) || (pixel == 13'd1396) || (pixel == 13'd1397) || (pixel == 13'd1398) || (pixel == 13'd1404) || 
            (pixel == 13'd1405) || (pixel == 13'd1406) || (pixel == 13'd1407) || (pixel == 13'd1469) || (pixel == 13'd1470) || (pixel == 13'd1471) || (pixel == 13'd1472) || (pixel == 13'd1473) || 
            (pixel == 13'd1474) || (pixel == 13'd1475) || (pixel == 13'd1476) || (pixel == 13'd1477) || (pixel == 13'd1478) || (pixel == 13'd1479) || (pixel == 13'd1480) || (pixel == 13'd1481) || 
            (pixel == 13'd1490) || (pixel == 13'd1491) || (pixel == 13'd1492) || (pixel == 13'd1493) || (pixel == 13'd1494) || (pixel == 13'd1500) || (pixel == 13'd1501) || (pixel == 13'd1502) || 
            (pixel == 13'd1503) || (pixel == 13'd1566) || (pixel == 13'd1567) || (pixel == 13'd1568) || (pixel == 13'd1569) || (pixel == 13'd1570) || (pixel == 13'd1571) || (pixel == 13'd1572) || 
            (pixel == 13'd1573) || (pixel == 13'd1574) || (pixel == 13'd1575) || (pixel == 13'd1576) || (pixel == 13'd1587) || (pixel == 13'd1588) || (pixel == 13'd1589) || (pixel == 13'd1597) || 
            (pixel == 13'd1598) || (pixel == 13'd1663) || (pixel == 13'd1664) || (pixel == 13'd1665) || (pixel == 13'd1666) || (pixel == 13'd1667) || (pixel == 13'd1668) || (pixel == 13'd1669) || 
            (pixel == 13'd1670) || (pixel == 13'd1671))
            oled_data <= `OLED_ORANGE;
        else
            oled_data <= `OLED_BLACK;
    end
        
endmodule
