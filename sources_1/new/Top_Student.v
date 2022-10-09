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

module Top_Student (
    input CLK,
    input [1:0] sw,
    input btnU, input btnL, input btnR, input btnD, input btnC, 
    input J_MIC3_Pin3, output J_MIC3_Pin1, output J_MIC3_Pin4,
    output [6:0] JX,
    output [15:0] led,
    output [6:0] seg, output [3:0] an
    );

    // 20kHz clock
    wire clk20k;
    fclk #(.khz(20)) clk_20khz(CLK, clk20k);
    // 6.25MHz clock
    wire clk6p25m;
    fclk #(.khz(6250)) clk_6p25mhz(CLK, clk6p25m);
    
    wire d_btnU, d_btnL, d_btnR, d_btnD, d_btnC; // debounced
    debouncer(CLK, btnU, d_btnU);
    debouncer(CLK, btnL, d_btnL);
    debouncer(CLK, btnR, d_btnR);
    debouncer(CLK, btnD, d_btnD);
    debouncer(CLK, btnC, d_btnC);
    
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
    
    wire [15:0] oled_data;
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

    // 0: Menu inactive
    // 1: OLED Task A (4.2A)
    // 2: OLED Task B (4.2B)
    // 3: AVI Task (4.2C)
    wire [3:0] menu_led_state;
    wire [3:0] task_state;
    menu(
        .CLK(CLK),
        .btnL(d_btnL),
        .btnR(d_btnR),
        .btnC(d_btnC),
        .btnD(d_btnD),
        .state(menu_led_state),
        .task_state(task_state)
        );

    // TODO: Debugging
    assign an = 4'b0000;
    assign seg = (task_state != MENU_INACTIVE) ? {7{1'b1}} : menu_led_state;

    wire task_4a_led;
    wire [4:0] task_4c_led;
    wire [15:0] task_oled_data;

    assign led[14] = task_4a_led;
    assign led[4:0] = task_4c_led;
    assign oled_data = task_oled_data;
    
    task_4(
        .CLK(CLK),
        .btnU(d_btnU),
        .pixel_index(pixel_index),
        .mic_out(mic_out),
        .task_4a_led(task_4a_led),
        .task_4c_led(task_4c_led),
        .oled_data(task_oled_data)
        );

endmodule