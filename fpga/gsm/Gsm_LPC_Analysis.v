/* verilator lint_off UNUSED */
/* verilator lint_off WIDTH */
/* verilator lint_off DECLFILENAME */
/* verilator lint_off STMTDLY */
/* verilator lint_off UNDRIVEN */
// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2016.4
// Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="Gsm_LPC_Analysis,hls_ip_2016_4,{HLS_INPUT_TYPE=c,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xqku115-rlf1924-2-i,HLS_INPUT_CLOCK=20.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=19.053000,HLS_SYN_LAT=-1,HLS_SYN_TPT=none,HLS_SYN_MEM=6,HLS_SYN_DSP=1348,HLS_SYN_FF=12199,HLS_SYN_LUT=31340}" *)

module Gsm_LPC_Analysis (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        s_address0,
        s_ce0,
        s_we0,
        s_d0,
        s_q0,
        s_address1,
        s_ce1,
        s_we1,
        s_d1,
        s_q1
);

parameter    ap_ST_fsm_state1 = 7'b1;
parameter    ap_ST_fsm_state2 = 7'b10;
parameter    ap_ST_fsm_state3 = 7'b100;
parameter    ap_ST_fsm_state4 = 7'b1000;
parameter    ap_ST_fsm_state5 = 7'b10000;
parameter    ap_ST_fsm_state6 = 7'b100000;
parameter    ap_ST_fsm_state7 = 7'b1000000;
parameter    ap_const_lv32_0 = 32'b00000000000000000000000000000000;
parameter    ap_const_lv32_1 = 32'b1;
parameter    ap_const_lv32_4 = 32'b100;
parameter    ap_const_lv4_0 = 4'b0000;
parameter    ap_const_lv32_3 = 32'b11;
parameter    ap_const_lv32_5 = 32'b101;
parameter    ap_const_lv32_2 = 32'b10;
parameter    ap_const_lv32_6 = 32'b110;
parameter    ap_const_lv4_8 = 4'b1000;
parameter    ap_const_lv4_1 = 4'b1;
parameter    ap_const_lv4_A = 4'b1010;
parameter    ap_const_lv32_F = 32'b1111;
parameter    ap_const_lv16_8000 = 16'b1000000000000000;
parameter    ap_const_lv16_0 = 16'b0000000000000000;
parameter    ap_const_lv16_7FFF = 16'b111111111111111;
parameter    ap_const_lv16_5666 = 16'b101011001100110;
parameter    ap_const_lv16_799A = 16'b111100110011010;
parameter    ap_const_lv16_D4CD = 16'b1101010011001101;
parameter    ap_const_lv16_2 = 16'b10;
parameter    ap_const_lv16_6800 = 16'b110100000000000;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [7:0] s_address0;
output   s_ce0;
output   s_we0;
output  [15:0] s_d0;
input  [15:0] s_q0;
output  [7:0] s_address1;
output   s_ce1;
output   s_we1;
output  [15:0] s_d1;
input  [15:0] s_q1;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[7:0] s_address0;
reg s_ce0;
reg s_we0;
reg[15:0] s_d0;
reg[7:0] s_address1;
reg s_ce1;
reg s_we1;
reg[15:0] s_d1;

(* fsm_encoding = "none" *) reg   [6:0] ap_CS_fsm;
wire   [0:0] ap_CS_fsm_state1;
reg   [31:0] L_ACF_0_reg_296;
wire   [0:0] ap_CS_fsm_state2;
wire    grp_Autocorrelation_fu_81_ap_done;
reg   [31:0] L_ACF_1_reg_301;
reg   [31:0] L_ACF_2_reg_306;
reg   [31:0] L_ACF_3_reg_311;
reg   [31:0] L_ACF_4_reg_316;
reg   [31:0] L_ACF_5_reg_321;
reg   [31:0] L_ACF_6_reg_326;
reg   [31:0] L_ACF_7_reg_331;
reg   [31:0] L_ACF_8_reg_336;
wire   [3:0] t_fu_154_p2;
reg   [3:0] t_reg_344;
wire   [0:0] ap_CS_fsm_state5;
reg   [7:0] s_addr_reg_349;
wire   [0:0] exitcond_i_fu_148_p2;
wire    grp_Autocorrelation_fu_81_ap_start;
wire    grp_Autocorrelation_fu_81_ap_idle;
wire    grp_Autocorrelation_fu_81_ap_ready;
wire   [7:0] grp_Autocorrelation_fu_81_s_address0;
wire    grp_Autocorrelation_fu_81_s_ce0;
wire    grp_Autocorrelation_fu_81_s_we0;
wire   [15:0] grp_Autocorrelation_fu_81_s_d0;
wire   [7:0] grp_Autocorrelation_fu_81_s_address1;
wire    grp_Autocorrelation_fu_81_s_ce1;
wire    grp_Autocorrelation_fu_81_s_we1;
wire   [15:0] grp_Autocorrelation_fu_81_s_d1;
wire   [31:0] grp_Autocorrelation_fu_81_ap_return_0;
wire   [31:0] grp_Autocorrelation_fu_81_ap_return_1;
wire   [31:0] grp_Autocorrelation_fu_81_ap_return_2;
wire   [31:0] grp_Autocorrelation_fu_81_ap_return_3;
wire   [31:0] grp_Autocorrelation_fu_81_ap_return_4;
wire   [31:0] grp_Autocorrelation_fu_81_ap_return_5;
wire   [31:0] grp_Autocorrelation_fu_81_ap_return_6;
wire   [31:0] grp_Autocorrelation_fu_81_ap_return_7;
wire   [31:0] grp_Autocorrelation_fu_81_ap_return_8;
wire    grp_Reflection_coefficie_fu_89_ap_start;
wire    grp_Reflection_coefficie_fu_89_ap_done;
wire    grp_Reflection_coefficie_fu_89_ap_idle;
wire    grp_Reflection_coefficie_fu_89_ap_ready;
wire   [7:0] grp_Reflection_coefficie_fu_89_y_address0;
wire    grp_Reflection_coefficie_fu_89_y_ce0;
wire    grp_Reflection_coefficie_fu_89_y_we0;
wire   [15:0] grp_Reflection_coefficie_fu_89_y_d0;
wire   [7:0] grp_Reflection_coefficie_fu_89_y_address1;
wire    grp_Reflection_coefficie_fu_89_y_ce1;
wire    grp_Reflection_coefficie_fu_89_y_we1;
wire   [15:0] grp_Reflection_coefficie_fu_89_y_d1;
wire    grp_Quantization_and_cod_fu_106_ap_start;
wire    grp_Quantization_and_cod_fu_106_ap_done;
wire    grp_Quantization_and_cod_fu_106_ap_idle;
wire    grp_Quantization_and_cod_fu_106_ap_ready;
wire   [7:0] grp_Quantization_and_cod_fu_106_LAR_address0;
wire    grp_Quantization_and_cod_fu_106_LAR_ce0;
wire    grp_Quantization_and_cod_fu_106_LAR_we0;
wire   [15:0] grp_Quantization_and_cod_fu_106_LAR_d0;
wire   [7:0] grp_Quantization_and_cod_fu_106_LAR_address1;
wire    grp_Quantization_and_cod_fu_106_LAR_ce1;
wire    grp_Quantization_and_cod_fu_106_LAR_we1;
wire   [15:0] grp_Quantization_and_cod_fu_106_LAR_d1;
reg   [3:0] t_i_reg_70;
wire   [0:0] ap_CS_fsm_state4;
wire   [0:0] ap_CS_fsm_state6;
reg    ap_reg_grp_Autocorrelation_fu_81_ap_start;
reg    ap_reg_grp_Reflection_coefficie_fu_89_ap_start;
wire   [0:0] ap_CS_fsm_state3;
reg    ap_reg_grp_Quantization_and_cod_fu_106_ap_start;
wire   [0:0] ap_CS_fsm_state7;
wire   [63:0] sum_i_cast_fu_168_p1;
wire   [15:0] tmp_42_i_fu_287_p3;
wire   [7:0] sum_i2_fu_160_p3;
wire   [0:0] tmp_i_i_fu_181_p2;
wire   [15:0] tmp_38_i_i_fu_187_p2;
wire   [0:0] tmp_fu_173_p3;
wire   [15:0] tmp_39_i_i_fu_193_p3;
wire   [15:0] temp_fu_201_p3;
wire   [14:0] tmp_2_i_fu_215_p4;
wire   [15:0] tmp_61_fu_241_p2;
wire   [0:0] tmp_i_fu_209_p2;
wire  signed [15:0] temp_31_fu_225_p1;
wire   [15:0] temp_33_fu_247_p2;
wire   [0:0] tmp_39_i_fu_229_p2;
wire   [0:0] sel_tmp1_i_fu_261_p2;
wire   [0:0] sel_tmp2_i_fu_267_p2;
wire   [15:0] temp_32_fu_235_p2;
wire   [15:0] temp_34_fu_253_p3;
wire   [15:0] temp_35_fu_273_p3;
wire   [15:0] tmp_41_i_fu_281_p2;
reg   [6:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 ap_CS_fsm = 7'b1;
#0 ap_reg_grp_Autocorrelation_fu_81_ap_start = 1'b0;
#0 ap_reg_grp_Reflection_coefficie_fu_89_ap_start = 1'b0;
#0 ap_reg_grp_Quantization_and_cod_fu_106_ap_start = 1'b0;
end

Autocorrelation grp_Autocorrelation_fu_81(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_Autocorrelation_fu_81_ap_start),
    .ap_done(grp_Autocorrelation_fu_81_ap_done),
    .ap_idle(grp_Autocorrelation_fu_81_ap_idle),
    .ap_ready(grp_Autocorrelation_fu_81_ap_ready),
    .s_address0(grp_Autocorrelation_fu_81_s_address0),
    .s_ce0(grp_Autocorrelation_fu_81_s_ce0),
    .s_we0(grp_Autocorrelation_fu_81_s_we0),
    .s_d0(grp_Autocorrelation_fu_81_s_d0),
    .s_q0(s_q0),
    .s_address1(grp_Autocorrelation_fu_81_s_address1),
    .s_ce1(grp_Autocorrelation_fu_81_s_ce1),
    .s_we1(grp_Autocorrelation_fu_81_s_we1),
    .s_d1(grp_Autocorrelation_fu_81_s_d1),
    .s_q1(s_q1),
    .ap_return_0(grp_Autocorrelation_fu_81_ap_return_0),
    .ap_return_1(grp_Autocorrelation_fu_81_ap_return_1),
    .ap_return_2(grp_Autocorrelation_fu_81_ap_return_2),
    .ap_return_3(grp_Autocorrelation_fu_81_ap_return_3),
    .ap_return_4(grp_Autocorrelation_fu_81_ap_return_4),
    .ap_return_5(grp_Autocorrelation_fu_81_ap_return_5),
    .ap_return_6(grp_Autocorrelation_fu_81_ap_return_6),
    .ap_return_7(grp_Autocorrelation_fu_81_ap_return_7),
    .ap_return_8(grp_Autocorrelation_fu_81_ap_return_8)
);

Reflection_coefficie grp_Reflection_coefficie_fu_89(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_Reflection_coefficie_fu_89_ap_start),
    .ap_done(grp_Reflection_coefficie_fu_89_ap_done),
    .ap_idle(grp_Reflection_coefficie_fu_89_ap_idle),
    .ap_ready(grp_Reflection_coefficie_fu_89_ap_ready),
    .L_ACF_0_read(L_ACF_0_reg_296),
    .L_ACF_1_read(L_ACF_1_reg_301),
    .L_ACF_2_read(L_ACF_2_reg_306),
    .L_ACF_3_read(L_ACF_3_reg_311),
    .L_ACF_4_read(L_ACF_4_reg_316),
    .L_ACF_5_read(L_ACF_5_reg_321),
    .L_ACF_6_read(L_ACF_6_reg_326),
    .L_ACF_7_read(L_ACF_7_reg_331),
    .L_ACF_8_read(L_ACF_8_reg_336),
    .y_address0(grp_Reflection_coefficie_fu_89_y_address0),
    .y_ce0(grp_Reflection_coefficie_fu_89_y_ce0),
    .y_we0(grp_Reflection_coefficie_fu_89_y_we0),
    .y_d0(grp_Reflection_coefficie_fu_89_y_d0),
    .y_address1(grp_Reflection_coefficie_fu_89_y_address1),
    .y_ce1(grp_Reflection_coefficie_fu_89_y_ce1),
    .y_we1(grp_Reflection_coefficie_fu_89_y_we1),
    .y_d1(grp_Reflection_coefficie_fu_89_y_d1)
);

Quantization_and_cod grp_Quantization_and_cod_fu_106(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_Quantization_and_cod_fu_106_ap_start),
    .ap_done(grp_Quantization_and_cod_fu_106_ap_done),
    .ap_idle(grp_Quantization_and_cod_fu_106_ap_idle),
    .ap_ready(grp_Quantization_and_cod_fu_106_ap_ready),
    .LAR_address0(grp_Quantization_and_cod_fu_106_LAR_address0),
    .LAR_ce0(grp_Quantization_and_cod_fu_106_LAR_ce0),
    .LAR_we0(grp_Quantization_and_cod_fu_106_LAR_we0),
    .LAR_d0(grp_Quantization_and_cod_fu_106_LAR_d0),
    .LAR_q0(s_q0),
    .LAR_address1(grp_Quantization_and_cod_fu_106_LAR_address1),
    .LAR_ce1(grp_Quantization_and_cod_fu_106_LAR_ce1),
    .LAR_we1(grp_Quantization_and_cod_fu_106_LAR_we1),
    .LAR_d1(grp_Quantization_and_cod_fu_106_LAR_d1),
    .LAR_q1(s_q1)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_reg_grp_Autocorrelation_fu_81_ap_start <= 1'b0;
    end else begin
        if (((ap_CS_fsm_state1 == 1'b1) & ~(ap_start == 1'b0))) begin
            ap_reg_grp_Autocorrelation_fu_81_ap_start <= 1'b1;
        end else if ((1'b1 == grp_Autocorrelation_fu_81_ap_ready)) begin
            ap_reg_grp_Autocorrelation_fu_81_ap_start <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_reg_grp_Quantization_and_cod_fu_106_ap_start <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_state5) & ~(exitcond_i_fu_148_p2 == 1'b0))) begin
            ap_reg_grp_Quantization_and_cod_fu_106_ap_start <= 1'b1;
        end else if ((1'b1 == grp_Quantization_and_cod_fu_106_ap_ready)) begin
            ap_reg_grp_Quantization_and_cod_fu_106_ap_start <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_reg_grp_Reflection_coefficie_fu_89_ap_start <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state3)) begin
            ap_reg_grp_Reflection_coefficie_fu_89_ap_start <= 1'b1;
        end else if ((1'b1 == grp_Reflection_coefficie_fu_89_ap_ready)) begin
            ap_reg_grp_Reflection_coefficie_fu_89_ap_start <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        t_i_reg_70 <= t_reg_344;
    end else if (((1'b1 == ap_CS_fsm_state4) & ~(1'b0 == grp_Reflection_coefficie_fu_89_ap_done))) begin
        t_i_reg_70 <= ap_const_lv4_0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state2) & ~(1'b0 == grp_Autocorrelation_fu_81_ap_done))) begin
        L_ACF_0_reg_296 <= grp_Autocorrelation_fu_81_ap_return_0;
        L_ACF_1_reg_301 <= grp_Autocorrelation_fu_81_ap_return_1;
        L_ACF_2_reg_306 <= grp_Autocorrelation_fu_81_ap_return_2;
        L_ACF_3_reg_311 <= grp_Autocorrelation_fu_81_ap_return_3;
        L_ACF_4_reg_316 <= grp_Autocorrelation_fu_81_ap_return_4;
        L_ACF_5_reg_321 <= grp_Autocorrelation_fu_81_ap_return_5;
        L_ACF_6_reg_326 <= grp_Autocorrelation_fu_81_ap_return_6;
        L_ACF_7_reg_331 <= grp_Autocorrelation_fu_81_ap_return_7;
        L_ACF_8_reg_336 <= grp_Autocorrelation_fu_81_ap_return_8;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state5) & (exitcond_i_fu_148_p2 == 1'b0))) begin
        s_addr_reg_349[3 : 0] <= sum_i_cast_fu_168_p1[3 : 0];
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        t_reg_344 <= t_fu_154_p2;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state7) & ~(1'b0 == grp_Quantization_and_cod_fu_106_ap_done))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_start) & (ap_CS_fsm_state1 == 1'b1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state7) & ~(1'b0 == grp_Quantization_and_cod_fu_106_ap_done))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        s_address0 = s_addr_reg_349;
    end else if (((1'b1 == ap_CS_fsm_state5) & (exitcond_i_fu_148_p2 == 1'b0))) begin
        s_address0 = sum_i_cast_fu_168_p1;
    end else if ((1'b1 == ap_CS_fsm_state7)) begin
        s_address0 = grp_Quantization_and_cod_fu_106_LAR_address0;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        s_address0 = grp_Reflection_coefficie_fu_89_y_address0;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        s_address0 = grp_Autocorrelation_fu_81_s_address0;
    end else begin
        s_address0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        s_address1 = grp_Quantization_and_cod_fu_106_LAR_address1;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        s_address1 = grp_Reflection_coefficie_fu_89_y_address1;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        s_address1 = grp_Autocorrelation_fu_81_s_address1;
    end else begin
        s_address1 = 'bx;
    end
end

always @ (*) begin
    if ((((1'b1 == ap_CS_fsm_state5) & (exitcond_i_fu_148_p2 == 1'b0)) | (1'b1 == ap_CS_fsm_state6))) begin
        s_ce0 = 1'b1;
    end else if ((1'b1 == ap_CS_fsm_state7)) begin
        s_ce0 = grp_Quantization_and_cod_fu_106_LAR_ce0;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        s_ce0 = grp_Reflection_coefficie_fu_89_y_ce0;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        s_ce0 = grp_Autocorrelation_fu_81_s_ce0;
    end else begin
        s_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        s_ce1 = grp_Quantization_and_cod_fu_106_LAR_ce1;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        s_ce1 = grp_Reflection_coefficie_fu_89_y_ce1;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        s_ce1 = grp_Autocorrelation_fu_81_s_ce1;
    end else begin
        s_ce1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        s_d0 = tmp_42_i_fu_287_p3;
    end else if ((1'b1 == ap_CS_fsm_state7)) begin
        s_d0 = grp_Quantization_and_cod_fu_106_LAR_d0;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        s_d0 = grp_Reflection_coefficie_fu_89_y_d0;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        s_d0 = grp_Autocorrelation_fu_81_s_d0;
    end else begin
        s_d0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        s_d1 = grp_Quantization_and_cod_fu_106_LAR_d1;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        s_d1 = grp_Reflection_coefficie_fu_89_y_d1;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        s_d1 = grp_Autocorrelation_fu_81_s_d1;
    end else begin
        s_d1 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        s_we0 = 1'b1;
    end else if ((1'b1 == ap_CS_fsm_state7)) begin
        s_we0 = grp_Quantization_and_cod_fu_106_LAR_we0;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        s_we0 = grp_Reflection_coefficie_fu_89_y_we0;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        s_we0 = grp_Autocorrelation_fu_81_s_we0;
    end else begin
        s_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        s_we1 = grp_Quantization_and_cod_fu_106_LAR_we1;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        s_we1 = grp_Reflection_coefficie_fu_89_y_we1;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        s_we1 = grp_Autocorrelation_fu_81_s_we1;
    end else begin
        s_we1 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (~(ap_start == 1'b0)) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (~(1'b0 == grp_Autocorrelation_fu_81_ap_done)) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            if (~(1'b0 == grp_Reflection_coefficie_fu_89_ap_done)) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state5 : begin
            if (~(exitcond_i_fu_148_p2 == 1'b0)) begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state7 : begin
            if (~(1'b0 == grp_Quantization_and_cod_fu_106_ap_done)) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[ap_const_lv32_0];

assign ap_CS_fsm_state2 = ap_CS_fsm[ap_const_lv32_1];

assign ap_CS_fsm_state3 = ap_CS_fsm[ap_const_lv32_2];

assign ap_CS_fsm_state4 = ap_CS_fsm[ap_const_lv32_3];

assign ap_CS_fsm_state5 = ap_CS_fsm[ap_const_lv32_4];

assign ap_CS_fsm_state6 = ap_CS_fsm[ap_const_lv32_5];

assign ap_CS_fsm_state7 = ap_CS_fsm[ap_const_lv32_6];

assign exitcond_i_fu_148_p2 = ((t_i_reg_70 == ap_const_lv4_8) ? 1'b1 : 1'b0);

assign grp_Autocorrelation_fu_81_ap_start = ap_reg_grp_Autocorrelation_fu_81_ap_start;

assign grp_Quantization_and_cod_fu_106_ap_start = ap_reg_grp_Quantization_and_cod_fu_106_ap_start;

assign grp_Reflection_coefficie_fu_89_ap_start = ap_reg_grp_Reflection_coefficie_fu_89_ap_start;

assign sel_tmp1_i_fu_261_p2 = (tmp_i_fu_209_p2 ^ 1'b1);

assign sel_tmp2_i_fu_267_p2 = (tmp_39_i_fu_229_p2 & sel_tmp1_i_fu_261_p2);

assign sum_i2_fu_160_p3 = {{ap_const_lv4_A}, {t_i_reg_70}};

assign sum_i_cast_fu_168_p1 = sum_i2_fu_160_p3;

assign t_fu_154_p2 = (t_i_reg_70 + ap_const_lv4_1);

assign temp_31_fu_225_p1 = $signed(tmp_2_i_fu_215_p4);

assign temp_32_fu_235_p2 = ($signed(ap_const_lv16_D4CD) + $signed(temp_fu_201_p3));

assign temp_33_fu_247_p2 = (ap_const_lv16_6800 + tmp_61_fu_241_p2);

assign temp_34_fu_253_p3 = ((tmp_i_fu_209_p2[0:0] === 1'b1) ? temp_31_fu_225_p1 : temp_33_fu_247_p2);

assign temp_35_fu_273_p3 = ((sel_tmp2_i_fu_267_p2[0:0] === 1'b1) ? temp_32_fu_235_p2 : temp_34_fu_253_p3);

assign temp_fu_201_p3 = ((tmp_fu_173_p3[0:0] === 1'b1) ? tmp_39_i_i_fu_193_p3 : s_q0);

assign tmp_2_i_fu_215_p4 = {{temp_fu_201_p3[ap_const_lv32_F : ap_const_lv32_1]}};

assign tmp_38_i_i_fu_187_p2 = (ap_const_lv16_0 - s_q0);

assign tmp_39_i_fu_229_p2 = (($signed(temp_fu_201_p3) < $signed(16'b111100110011010)) ? 1'b1 : 1'b0);

assign tmp_39_i_i_fu_193_p3 = ((tmp_i_i_fu_181_p2[0:0] === 1'b1) ? ap_const_lv16_7FFF : tmp_38_i_i_fu_187_p2);

assign tmp_41_i_fu_281_p2 = (ap_const_lv16_0 - temp_35_fu_273_p3);

assign tmp_42_i_fu_287_p3 = ((tmp_fu_173_p3[0:0] === 1'b1) ? tmp_41_i_fu_281_p2 : temp_35_fu_273_p3);

assign tmp_61_fu_241_p2 = temp_fu_201_p3 << ap_const_lv16_2;

assign tmp_fu_173_p3 = s_q0[ap_const_lv32_F];

assign tmp_i_fu_209_p2 = (($signed(temp_fu_201_p3) < $signed(16'b101011001100110)) ? 1'b1 : 1'b0);

assign tmp_i_i_fu_181_p2 = ((s_q0 == ap_const_lv16_8000) ? 1'b1 : 1'b0);

always @ (posedge ap_clk) begin
    s_addr_reg_349[7:4] <= 4'b1010;
end

endmodule //Gsm_LPC_Analysis
