`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//
//  FILL IN THE FOLLOWING INFORMATION:
//
//  LAB SESSION DAY (Delete where applicable): FRIDAY P.M.
//
//  STUDENT A NAME: Lee Tze Han
//  STUDENT A MATRICULATION NUMBER: A0164549U
//
//  STUDENT B NAME: Yan Zaiya
//  STUDENT B MATRICULATION NUMBER: A0239612E
//
//////////////////////////////////////////////////////////////////////////////////


module Top_Student(
    input CLK,
    input [1:0] sw,
    input btnU, input btnL, input btnR, input btnD, input btnC, 
    input J_MIC3_Pin3, output J_MIC3_Pin1, output J_MIC3_Pin4,
    output [6:0] JX,
    output reg [15:0] led,
    output reg [6:0] seg, output reg [3:0] an
    );

    `include "constants.v"

    // 20kHz clock
    wire clk20k;
    fclk #(.khz(20)) clk_20khz(CLK, clk20k);
    // 6.25MHz clock
    wire clk6p25m;
    fclk #(.khz(6250)) clk_6p25mhz(CLK, clk6p25m);

    /**
     *  Inputs
     */
         
    wire d_btnU, d_btnL, d_btnR, d_btnD, d_btnC; // debounced
    debouncer(CLK, btnU, d_btnU);
    debouncer(CLK, btnL, d_btnL);
    debouncer(CLK, btnR, d_btnR);
    debouncer(CLK, btnD, d_btnD);
    debouncer(CLK, btnC, d_btnC);
    
    wire dh_btnU;
    debouncer_hold #(.M(19_999)) (CLK, btnU, dh_btnU);
    
    wire e_btnU, e_btnL, e_btnR, e_btnD, e_btnC; // rising edge
    edge_detector(CLK, d_btnU, e_btnU);
    edge_detector(CLK, d_btnL, e_btnL);
    edge_detector(CLK, d_btnR, e_btnR);
    edge_detector(CLK, d_btnD, e_btnD);
    edge_detector(CLK, d_btnC, e_btnC);
    
    wire [11:0] mic_out;
    Audio_Capture audio_capture(
        .CLK(CLK),
        .cs(clk20k),
        .MISO(J_MIC3_Pin3),
        .clk_samp(J_MIC3_Pin1),
        .sclk(J_MIC3_Pin4),
        .sample(mic_out)
        );
    
    /**
     *  OLED
     */
    
    reg [15:0] oled_data;
    wire frame_begin, sending_pixels, sample_pixel;
    wire [12:0] pixel_index;
    Oled_Display oled_display(
        .clk(clk6p25m), 
        .reset(0), 
        .frame_begin(frame_begin), 
        .sending_pixels(sending_pixels),
        .sample_pixel(sample_pixel),
        .pixel_index(pixel_index),
        .pixel_data(oled_data),
        .cs(JX[0]), .sdin(JX[1]), .sclk(JX[2]), .d_cn(JX[3]), .resn(JX[4]), .vccen(JX[5]), .pmoden(JX[6]),
        .teststate(0)
        );

    /**
     *  DTMF
     */
     
    wire [6:0] dtmf_seg;
    wire [15:0] dtmf_led;
    wire [15:0] dtmf_oled_data;
    dtmf dtmf(
        .CLK(CLK),
        .mic_clk(clk20k),
        .btnL(e_btnL),
        .btnR(e_btnR),
        .sw(sw[0]),
        .mic(mic_out),
        .pixel(pixel_index),
        .oled_data(dtmf_oled_data),
        .seg(dtmf_seg),
        .led(dtmf_led)
        );
        
    /**
     *  Morse Decoder
     */

    wire morse_valid;
    wire [5:0] morse_symbol;
    wire [15:0] morse_led;
    wire [6:0] morse_seg;
    wire [3:0] morse_an;
    morse morse(
        .CLK(CLK),
        .sample_clk(clk20k),
        .in_btn(dh_btnU),
        .in_mic(mic_out),
        .sw(sw[0]),
        .valid(morse_valid),
        .symbol(morse_symbol),
        .led(morse_led)
        );
        
    morse_segment morse_segment(
        .CLK(CLK),
        .valid(morse_valid),
        .symbol(morse_symbol),
        .seg(morse_seg),
        .an(morse_an)
        );

    /**
     *  Tasks 4A-4C
     */
    
    wire task_4a_led;
    wire task_4b_led;
    wire [4:0] task_4c_led;
    wire [15:0] task_4a_oled_data;
    wire [15:0] task_4b_oled_data;
    task_4(
        .CLK(CLK),
        .btnU(e_btnU),
        .btnD(btnD),
        .pixel_index(pixel_index),
        .mic_out(mic_out),
        .task_4a_led(task_4a_led),
        .task_4b_led(task_4b_led),
        .task_4c_led(task_4c_led),
        .task_4a_oled_data(task_4a_oled_data),
        .task_4b_oled_data(task_4b_oled_data)
        );
    
    /**
     *  Menu Logic
     */
     
     wire [3:0] menu_sel_state;
     wire [3:0] task_state;
     menu(
         .CLK(CLK),
         .btnL(e_btnL),
         .btnR(e_btnR),
         .btnC(e_btnC),
         .state(menu_sel_state),
         .task_state(task_state)
         );

    reg [7:0] char0, char1, char2, char3;
    wire [6:0] menu_seg;
    wire [3:0] menu_an;
    segment_map(CLK, char0, char1, char2, char3, menu_seg, menu_an);
    
    always @(posedge CLK) begin
        case (menu_sel_state)
            MENU_OLED_A: begin
                char0 <= SEG_BLANK;
                char1 <= SEG_BLANK;
                char2 <= SEG_4;
                char3 <= SEG_A;
            end
            MENU_OLED_B: begin
                char0 <= SEG_BLANK;
                char1 <= SEG_BLANK;
                char2 <= SEG_4;
                char3 <= SEG_B;
            end
            MENU_AVI: begin
                char0 <= SEG_BLANK;
                char1 <= SEG_BLANK;
                char2 <= SEG_4;
                char3 <= SEG_C;
            end
            MENU_DTMF: begin
                char0 <= SEG_D;
                char1 <= SEG_T;
                char2 <= SEG_M;
                char3 <= SEG_F;
            end
            MENU_MORSE: begin
                char0 <= SEG_M;
                char1 <= SEG_O;
                char2 <= SEG_R;
                char3 <= SEG_S;
            end
            
        endcase
    end
    
    /**
     *  Output Switching
     */

    always @(posedge CLK) begin
        // Default values
        oled_data <= 16'b0;
        led <= 16'b0;
        seg <= 7'b1111111;
        an <= 4'b1111;
    
        if (task_state == MENU_OLED_A) begin
            oled_data <= task_4a_oled_data;
            led[14] <= task_4a_led;
        end
        else if (task_state == MENU_OLED_B) begin
            oled_data <= task_4b_oled_data;
            led[12] <= task_4b_led;
        end
        else if (task_state == MENU_AVI) begin
            led[4:0] <= task_4c_led;
        end
        else if (task_state == MENU_DTMF) begin
            oled_data <= dtmf_oled_data;
            led[15:0] <= dtmf_led;
            seg <= dtmf_seg;
            an <= 4'b1110; 
        end
        else if (task_state == MENU_MORSE) begin
            led <= morse_led;
            seg <= morse_seg;
             an <= morse_an;
        end
        else if (task_state == MENU_INACTIVE) begin
             seg <= menu_seg;
             an <= menu_an;
        end
    end

endmodule