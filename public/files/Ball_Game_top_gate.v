
module Ball_Game_top ( clk, rst_n, button_start_i, button_pause_i, 
        button_left_i, button_right_i, led_win_o, led_defeat_o, led8x8_R_o, 
        led8x8_C_o );
  output [7:0] led8x8_R_o;
  output [7:0] led8x8_C_o;
  input clk, rst_n, button_start_i, button_pause_i, button_left_i,
         button_right_i;
  output led_win_o, led_defeat_o;
  wire   clk_div_w, ball_vel_ver_w, ball_vel_hor_w, \Ball_game_clock/N17 ,
         \Ball_game_clock/N16 , \Ball_game_clock/N15 , \Ball_game_clock/N14 ,
         \Ball_game_clock/N13 , \Ball_game_clock/N12 , \Ball_game_clock/N11 ,
         \Ball_game_clock/N10 , \Ball_game_clock/N9 , \Ball_game_clock/N8 ,
         \Ball_game_clock/N7 , \Ball_game_clock/N6 , \Ball_game_clock/N5 ,
         \Ball_game_clock/div_cnt_r[0] , \Ball_game_clock/div_cnt_r[1] ,
         \Ball_game_clock/div_cnt_r[2] , \Ball_game_clock/div_cnt_r[3] ,
         \Ball_game_clock/div_cnt_r[4] , \Ball_game_clock/div_cnt_r[5] ,
         \Ball_game_clock/div_cnt_r[6] , \Ball_Game_control/N93 ,
         \Ball_Game_control/N74 , \Ball_Game_control/N72 ,
         \Ball_Game_control/gamepause_r , \Ball_Game_control/gamestart_r ,
         \Ball_Game_display/N37 , \Ball_Game_display/N15 ,
         \Ball_Game_display/N12 , \Ball_Game_display/row_scan_pos_y_next_r[0] ,
         \Ball_Game_display/row_scan_pos_y_next_r[1] ,
         \Ball_Game_display/row_scan_pos_y_next_r[2] , n159, n160, n171, n172,
         n173, n174, n176, n178, n179, n180, n181, n182, n183, n184, n185,
         n186, n187, n190, n191, n192, n193, n194, n195, n196, n197, n198,
         n199, n200, n201, n202, n203, n204, n205, n206, n207, n208, n209,
         n210, n211, n212, n213, n214, n215, n216, n217, n218, n219, n220,
         n221, n222, n223, n224, n225, n226, n227, n228, n229, n230, n231,
         n232, n233, n234, n235, n236, n237, n238, n239, n240, n241, n242,
         n243, n244, n245, n246, n247, n248, n249, n250, n251, n252, n253,
         n254, n255, n256, n257, n258, n259, n260, n261, n262, n263, n264,
         n265, n266, n267, n268, n269, n270, n271, n272, n273, n274, n275,
         n276, n277, n278, n279, n280, n281, n282, n283, n284, n285, n286,
         n287, n288, n289, n290, n291, n292, n293, n294, n295, n296, n297,
         n298, n299, n300, n301, n302, n303, n304, n305, n306, n307, n308,
         n309, n310, n311, n312, n313, n314, n315, n316, n317, n318, n319,
         n320, n321, n322, n323, n324, n325, n326, n327, n328, n329, n330,
         n331, n332, n333, n334, n335, n336, n337, n338, n339, n340, n341,
         n342, n343, n344, n345, n346, n347, n348, n349;
  wire   [2:0] board_pos_x_next_w;
  wire   [2:0] board_pos_x_w;
  wire   [2:0] ball_pos_y_w;
  wire   [2:0] ball_pos_x_w;
  wire   [7:0] target_C_w;

  DFFRHQ \Ball_game_clock/div_cnt_r_reg[6]  ( .D(\Ball_game_clock/N17 ), .CK(
        clk), .RN(rst_n), .Q(\Ball_game_clock/div_cnt_r[6] ) );
  DFFRHQ \Ball_game_clock/clk_div_o_reg  ( .D(n160), .CK(clk), .RN(rst_n), .Q(
        clk_div_w) );
  DFFRHQ \Ball_game_clock/div_cnt_r_reg[5]  ( .D(\Ball_game_clock/N16 ), .CK(
        clk), .RN(rst_n), .Q(\Ball_game_clock/div_cnt_r[5] ) );
  DFFRHQ \Ball_game_clock/div_cnt_r_reg[0]  ( .D(\Ball_game_clock/N11 ), .CK(
        clk), .RN(rst_n), .Q(\Ball_game_clock/div_cnt_r[0] ) );
  DFFRHQ \Ball_game_clock/div_cnt_r_reg[1]  ( .D(\Ball_game_clock/N12 ), .CK(
        clk), .RN(rst_n), .Q(\Ball_game_clock/div_cnt_r[1] ) );
  DFFRHQ \Ball_game_clock/div_cnt_r_reg[2]  ( .D(\Ball_game_clock/N13 ), .CK(
        clk), .RN(rst_n), .Q(\Ball_game_clock/div_cnt_r[2] ) );
  DFFRHQ \Ball_game_clock/div_cnt_r_reg[3]  ( .D(\Ball_game_clock/N14 ), .CK(
        clk), .RN(rst_n), .Q(\Ball_game_clock/div_cnt_r[3] ) );
  DFFRHQ \Ball_game_clock/div_cnt_r_reg[4]  ( .D(\Ball_game_clock/N15 ), .CK(
        clk), .RN(rst_n), .Q(\Ball_game_clock/div_cnt_r[4] ) );
  DFFRHQ \Ball_Game_control/gamestart_r_reg  ( .D(n159), .CK(clk), .RN(rst_n), 
        .Q(\Ball_Game_control/gamestart_r ) );
  DFFRHQ \Ball_Game_control/gamepause_r_reg  ( .D(n187), .CK(clk), .RN(rst_n), 
        .Q(\Ball_Game_control/gamepause_r ) );
  DFFRHQ \Ball_Game_control/board_pos_x_next_o_reg[2]  ( .D(
        \Ball_Game_control/N74 ), .CK(clk), .RN(rst_n), .Q(
        board_pos_x_next_w[2]) );
  DFFRHQ \Ball_Game_board/board_pos_x_o_reg[2]  ( .D(board_pos_x_next_w[2]), 
        .CK(clk_div_w), .RN(rst_n), .Q(board_pos_x_w[2]) );
  DFFRHQ \Ball_Game_control/board_pos_x_next_o_reg[0]  ( .D(
        \Ball_Game_control/N72 ), .CK(clk), .RN(rst_n), .Q(
        board_pos_x_next_w[0]) );
  DFFRHQ \Ball_Game_board/board_pos_x_o_reg[0]  ( .D(board_pos_x_next_w[0]), 
        .CK(clk_div_w), .RN(rst_n), .Q(\Ball_Game_control/N93 ) );
  DFFSHQ \Ball_Game_control/board_pos_x_next_o_reg[1]  ( .D(n337), .CK(clk), 
        .SN(rst_n), .Q(board_pos_x_next_w[1]) );
  DFFSHQ \Ball_Game_board/board_pos_x_o_reg[1]  ( .D(board_pos_x_next_w[1]), 
        .CK(clk_div_w), .SN(rst_n), .Q(board_pos_x_w[1]) );
  DFFRHQ \Ball_Game_ball/ball_pos_x_o_reg[0]  ( .D(n184), .CK(clk_div_w), .RN(
        rst_n), .Q(ball_pos_x_w[0]) );
  DFFSHQ \Ball_Game_ball/ball_pos_y_o_reg[2]  ( .D(n185), .CK(clk_div_w), .SN(
        rst_n), .Q(ball_pos_y_w[2]) );
  DFFRHQ \Ball_Game_ball/ball_pos_x_o_reg[2]  ( .D(n182), .CK(clk_div_w), .RN(
        rst_n), .Q(ball_pos_x_w[2]) );
  DFFRHQ \Ball_Game_control/ball_vel_hor_o_reg  ( .D(n181), .CK(clk), .RN(
        rst_n), .Q(ball_vel_hor_w) );
  DFFSHQ \Ball_Game_ball/ball_pos_x_o_reg[1]  ( .D(n183), .CK(clk_div_w), .SN(
        rst_n), .Q(ball_pos_x_w[1]) );
  DFFSHQ \Ball_Game_ball/ball_pos_y_o_reg[1]  ( .D(n180), .CK(clk_div_w), .SN(
        rst_n), .Q(ball_pos_y_w[1]) );
  DFFSHQ \Ball_Game_control/target_C_o_reg[3]  ( .D(n347), .CK(clk), .SN(rst_n), .Q(target_C_w[3]) );
  DFFSHQ \Ball_Game_control/target_C_o_reg[2]  ( .D(n176), .CK(clk), .SN(rst_n), .Q(target_C_w[2]) );
  DFFSHQ \Ball_Game_control/target_C_o_reg[1]  ( .D(n346), .CK(clk), .SN(rst_n), .Q(target_C_w[1]) );
  DFFSHQ \Ball_Game_control/target_C_o_reg[0]  ( .D(n178), .CK(clk), .SN(rst_n), .Q(target_C_w[0]) );
  DFFRHQ \Ball_Game_control/ball_vel_ver_o_reg  ( .D(n186), .CK(clk), .RN(
        rst_n), .Q(ball_vel_ver_w) );
  DFFRHQ \Ball_Game_ball/ball_pos_y_o_reg[0]  ( .D(n179), .CK(clk_div_w), .RN(
        rst_n), .Q(ball_pos_y_w[0]) );
  DFFSHQ \Ball_Game_control/target_C_o_reg[4]  ( .D(n174), .CK(clk), .SN(rst_n), .Q(target_C_w[4]) );
  DFFSHQ \Ball_Game_control/target_C_o_reg[5]  ( .D(n173), .CK(clk), .SN(rst_n), .Q(target_C_w[5]) );
  DFFSHQ \Ball_Game_control/target_C_o_reg[6]  ( .D(n172), .CK(clk), .SN(rst_n), .Q(target_C_w[6]) );
  DFFSHQ \Ball_Game_control/target_C_o_reg[7]  ( .D(n171), .CK(clk), .SN(rst_n), .Q(target_C_w[7]) );
  DFFSHQ \Ball_Game_display/row_scan_pos_y_next_r_reg[0]  ( .D(n348), .CK(clk), 
        .SN(rst_n), .Q(\Ball_Game_display/row_scan_pos_y_next_r[0] ) );
  DFFSHQ \Ball_Game_display/row_scan_pos_y_next_r_reg[1]  ( .D(
        \Ball_Game_display/N12 ), .CK(clk), .SN(rst_n), .Q(
        \Ball_Game_display/row_scan_pos_y_next_r[1] ) );
  DFFSHQ \Ball_Game_display/row_scan_pos_y_next_r_reg[2]  ( .D(n349), .CK(clk), 
        .SN(rst_n), .Q(\Ball_Game_display/row_scan_pos_y_next_r[2] ) );
  DFFRHQ \Ball_Game_display/led8x8_R_o_reg[0]  ( .D(\Ball_Game_display/N37 ), 
        .CK(clk), .RN(rst_n), .Q(led8x8_R_o[0]) );
  DFFRHQ \Ball_Game_display/led8x8_R_o_reg[3]  ( .D(n194), .CK(clk), .RN(rst_n), .Q(led8x8_R_o[3]) );
  DFFRHQ \Ball_Game_display/led8x8_R_o_reg[2]  ( .D(n192), .CK(clk), .RN(rst_n), .Q(led8x8_R_o[2]) );
  DFFRHQ \Ball_Game_display/led8x8_R_o_reg[4]  ( .D(n191), .CK(clk), .RN(rst_n), .Q(led8x8_R_o[4]) );
  DFFRHQ \Ball_Game_display/led8x8_R_o_reg[6]  ( .D(n190), .CK(clk), .RN(rst_n), .Q(led8x8_R_o[6]) );
  DFFRHQ \Ball_Game_display/led8x8_R_o_reg[7]  ( .D(n201), .CK(clk), .RN(rst_n), .Q(led8x8_R_o[7]) );
  DFFRHQ \Ball_Game_display/led8x8_R_o_reg[1]  ( .D(n202), .CK(clk), .RN(rst_n), .Q(led8x8_R_o[1]) );
  DFFRHQ \Ball_Game_display/led8x8_C_o_reg[2]  ( .D(n344), .CK(clk), .RN(rst_n), .Q(led8x8_C_o[2]) );
  DFFRHQ \Ball_Game_display/led8x8_C_o_reg[1]  ( .D(n340), .CK(clk), .RN(rst_n), .Q(led8x8_C_o[1]) );
  DFFRHQ \Ball_Game_display/led8x8_C_o_reg[0]  ( .D(n338), .CK(clk), .RN(rst_n), .Q(led8x8_C_o[0]) );
  DFFRHQ \Ball_Game_display/led8x8_C_o_reg[3]  ( .D(n339), .CK(clk), .RN(rst_n), .Q(led8x8_C_o[3]) );
  DFFRHQ \Ball_Game_display/led8x8_C_o_reg[4]  ( .D(n341), .CK(clk), .RN(rst_n), .Q(led8x8_C_o[4]) );
  DFFRHQ \Ball_Game_display/led8x8_C_o_reg[5]  ( .D(n342), .CK(clk), .RN(rst_n), .Q(led8x8_C_o[5]) );
  DFFRHQ \Ball_Game_display/led8x8_C_o_reg[6]  ( .D(n343), .CK(clk), .RN(rst_n), .Q(led8x8_C_o[6]) );
  DFFRHQ \Ball_Game_display/led8x8_C_o_reg[7]  ( .D(n345), .CK(clk), .RN(rst_n), .Q(led8x8_C_o[7]) );
  DFFRHQ \Ball_Game_display/led8x8_R_o_reg[5]  ( .D(n193), .CK(clk), .RN(rst_n), .Q(led8x8_R_o[5]) );
  AND2 U182 ( .A(\Ball_game_clock/div_cnt_r[1] ), .B(
        \Ball_game_clock/div_cnt_r[0] ), .Y(n196) );
  AND2 U183 ( .A(\Ball_game_clock/div_cnt_r[2] ), .B(n196), .Y(n197) );
  AND2 U184 ( .A(\Ball_game_clock/div_cnt_r[3] ), .B(n197), .Y(n198) );
  AND2 U185 ( .A(\Ball_game_clock/div_cnt_r[4] ), .B(n198), .Y(n199) );
  AND2 U186 ( .A(\Ball_game_clock/div_cnt_r[5] ), .B(n199), .Y(n200) );
  BUF U187 ( .I(\Ball_Game_display/N15 ), .O(n201) );
  BUF U188 ( .I(n195), .O(n202) );
  XOR2 U189 ( .A(\Ball_game_clock/div_cnt_r[1] ), .B(
        \Ball_game_clock/div_cnt_r[0] ), .Y(\Ball_game_clock/N5 ) );
  XOR2 U190 ( .A(\Ball_game_clock/div_cnt_r[2] ), .B(n196), .Y(
        \Ball_game_clock/N6 ) );
  XOR2 U191 ( .A(\Ball_game_clock/div_cnt_r[3] ), .B(n197), .Y(
        \Ball_game_clock/N7 ) );
  XOR2 U192 ( .A(\Ball_game_clock/div_cnt_r[4] ), .B(n198), .Y(
        \Ball_game_clock/N8 ) );
  XOR2 U193 ( .A(\Ball_game_clock/div_cnt_r[5] ), .B(n199), .Y(
        \Ball_game_clock/N9 ) );
  XOR2 U194 ( .A(\Ball_game_clock/div_cnt_r[6] ), .B(n200), .Y(
        \Ball_game_clock/N10 ) );
  INV U195 ( .A(n203), .Y(n337) );
  AOI21 U196 ( .A0(board_pos_x_next_w[1]), .A1(n204), .B0(n205), .Y(n203) );
  MX2 U197 ( .A(board_pos_x_w[1]), .B(n206), .S0(n207), .Y(n205) );
  MX2 U198 ( .A(n208), .B(n209), .S0(n210), .Y(n206) );
  INV U199 ( .A(n211), .Y(n338) );
  AOI222 U200 ( .A0(n212), .A1(n213), .B0(board_pos_x_w[1]), .B1(n214), .C0(
        n201), .C1(target_C_w[0]), .Y(n211) );
  INV U201 ( .A(n215), .Y(n339) );
  AOI221 U202 ( .A0(n212), .A1(n216), .B0(n201), .B1(target_C_w[3]), .C0(n217), 
        .Y(n215) );
  INV U203 ( .A(n218), .Y(n217) );
  AOI32 U204 ( .A0(n202), .A1(\Ball_Game_control/N93 ), .A2(n219), .B0(n214), 
        .B1(n220), .Y(n218) );
  INV U205 ( .A(n221), .Y(n340) );
  AOI222 U206 ( .A0(n212), .A1(n222), .B0(n223), .B1(n214), .C0(n201), .C1(
        target_C_w[1]), .Y(n221) );
  NOR2B U207 ( .AN(n202), .B(n224), .Y(n214) );
  INV U208 ( .A(n225), .Y(n341) );
  AOI222 U209 ( .A0(n202), .A1(n219), .B0(n213), .B1(n226), .C0(n201), .C1(
        target_C_w[4]), .Y(n225) );
  INV U210 ( .A(n227), .Y(n342) );
  AOI222 U211 ( .A0(n222), .A1(n226), .B0(n202), .B1(n228), .C0(n201), .C1(
        target_C_w[5]), .Y(n227) );
  NOR2B U212 ( .AN(n210), .B(board_pos_x_w[2]), .Y(n228) );
  INV U213 ( .A(n229), .Y(n343) );
  AOI222 U214 ( .A0(n226), .A1(n230), .B0(n202), .B1(n231), .C0(n201), .C1(
        target_C_w[6]), .Y(n229) );
  NOR2B U215 ( .AN(n224), .B(board_pos_x_w[1]), .Y(n231) );
  INV U216 ( .A(n232), .Y(n344) );
  AOI222 U217 ( .A0(n202), .A1(n233), .B0(n212), .B1(n230), .C0(n201), .C1(
        target_C_w[2]), .Y(n232) );
  NOR4B U218 ( .AN(ball_pos_x_w[2]), .B(n234), .C(n235), .D(n236), .Y(n212) );
  INV U219 ( .A(n237), .Y(n345) );
  AOI222 U220 ( .A0(n238), .A1(n202), .B0(n216), .B1(n226), .C0(n201), .C1(
        target_C_w[7]), .Y(n237) );
  NOR4B U221 ( .AN(n239), .B(n236), .C(n234), .D(n235), .Y(n226) );
  XOR2 U222 ( .A(n240), .B(n241), .Y(n235) );
  XOR2 U223 ( .A(n242), .B(n243), .Y(n234) );
  XOR2 U224 ( .A(n348), .B(n244), .Y(n236) );
  AOI21 U225 ( .A0(n222), .A1(n245), .B0(n246), .Y(n346) );
  INV U226 ( .A(target_C_w[1]), .Y(n246) );
  AOI21 U227 ( .A0(n216), .A1(n245), .B0(n247), .Y(n347) );
  INV U228 ( .A(target_C_w[3]), .Y(n247) );
  INV U229 ( .A(n248), .Y(n349) );
  AOI211 U230 ( .A0(\Ball_Game_display/row_scan_pos_y_next_r[0] ), .A1(
        \Ball_Game_display/row_scan_pos_y_next_r[2] ), .B0(n249), .C0(
        \Ball_Game_display/N37 ), .Y(n248) );
  NOR3B U231 ( .AN(\Ball_Game_display/row_scan_pos_y_next_r[0] ), .B(
        \Ball_Game_display/row_scan_pos_y_next_r[1] ), .C(
        \Ball_Game_display/row_scan_pos_y_next_r[2] ), .Y(n195) );
  NOR3B U232 ( .AN(\Ball_Game_display/row_scan_pos_y_next_r[0] ), .B(n240), 
        .C(\Ball_Game_display/row_scan_pos_y_next_r[2] ), .Y(n194) );
  NOR3B U233 ( .AN(\Ball_Game_display/row_scan_pos_y_next_r[0] ), .B(n243), 
        .C(\Ball_Game_display/row_scan_pos_y_next_r[1] ), .Y(n193) );
  NOR3B U234 ( .AN(\Ball_Game_display/row_scan_pos_y_next_r[1] ), .B(
        \Ball_Game_display/row_scan_pos_y_next_r[2] ), .C(
        \Ball_Game_display/row_scan_pos_y_next_r[0] ), .Y(n192) );
  NOR2B U235 ( .AN(\Ball_Game_display/row_scan_pos_y_next_r[2] ), .B(n250), 
        .Y(n191) );
  NOR2B U236 ( .AN(n249), .B(\Ball_Game_display/row_scan_pos_y_next_r[0] ), 
        .Y(n190) );
  OAI2BB2 U237 ( .B0(button_start_i), .B1(n251), .A0N(button_pause_i), .A1N(
        \Ball_Game_control/gamestart_r ), .Y(n187) );
  INV U238 ( .A(\Ball_Game_control/gamepause_r ), .Y(n251) );
  OAI32 U239 ( .A0(n241), .A1(ball_pos_y_w[0]), .A2(n252), .B0(n253), .B1(n254), .Y(n186) );
  NOR2 U240 ( .A(n255), .B(n256), .Y(n252) );
  AOI2BB1 U241 ( .A0N(n257), .A1N(n258), .B0(ball_pos_y_w[2]), .Y(n256) );
  MX2 U242 ( .A(n259), .B(n260), .S0(n261), .Y(n258) );
  NOR2B U243 ( .AN(n262), .B(n263), .Y(n260) );
  XOR2 U244 ( .A(ball_pos_x_w[2]), .B(n264), .Y(n263) );
  NOR2 U245 ( .A(n265), .B(n266), .Y(n259) );
  XOR2 U246 ( .A(board_pos_x_w[2]), .B(ball_pos_x_w[2]), .Y(n266) );
  OAI222 U247 ( .A0(n267), .A1(n268), .B0(n269), .B1(n270), .C0(n271), .C1(
        n242), .Y(n185) );
  OAI222 U248 ( .A0(n272), .A1(n268), .B0(n273), .B1(n274), .C0(n275), .C1(
        n276), .Y(n184) );
  OAI222 U249 ( .A0(n277), .A1(n268), .B0(n278), .B1(n274), .C0(n275), .C1(
        n279), .Y(n183) );
  OAI222 U250 ( .A0(n269), .A1(n268), .B0(n267), .B1(n274), .C0(n275), .C1(
        n239), .Y(n182) );
  OR2 U251 ( .A(n280), .B(n281), .Y(n274) );
  OR2 U252 ( .A(n282), .B(n283), .Y(n267) );
  MX2 U253 ( .A(n284), .B(n285), .S0(n286), .Y(n283) );
  NOR2B U254 ( .AN(n287), .B(n288), .Y(n285) );
  AND2 U255 ( .A(n288), .B(n289), .Y(n284) );
  NOR2 U256 ( .A(n289), .B(n290), .Y(n282) );
  XOR2 U257 ( .A(n286), .B(n288), .Y(n290) );
  OAI22 U258 ( .A0(n239), .A1(n280), .B0(n242), .B1(n291), .Y(n288) );
  INV U259 ( .A(n292), .Y(n269) );
  MX2 U260 ( .A(n293), .B(n294), .S0(n295), .Y(n292) );
  MX2 U261 ( .A(n296), .B(n297), .S0(ball_pos_x_w[2]), .Y(n294) );
  MX2 U262 ( .A(n296), .B(n297), .S0(ball_pos_y_w[2]), .Y(n293) );
  XNOR2 U263 ( .A(n298), .B(n299), .Y(n297) );
  MX2 U264 ( .A(n299), .B(n300), .S0(n298), .Y(n296) );
  OAI2BB2 U265 ( .B0(n301), .B1(n287), .A0N(n239), .A1N(n216), .Y(n181) );
  NOR2B U266 ( .AN(n213), .B(n239), .Y(n301) );
  OAI222 U267 ( .A0(n278), .A1(n268), .B0(n277), .B1(n270), .C0(n271), .C1(
        n241), .Y(n180) );
  AOI21 U268 ( .A0(n302), .A1(n300), .B0(n299), .Y(n277) );
  NOR2 U269 ( .A(n302), .B(n300), .Y(n299) );
  AOI2BB1 U270 ( .A0N(n303), .A1N(n272), .B0(n298), .Y(n302) );
  AND2 U271 ( .A(n303), .B(n272), .Y(n298) );
  MX2 U272 ( .A(ball_pos_y_w[1]), .B(ball_pos_x_w[1]), .S0(n295), .Y(n303) );
  AOI21 U273 ( .A0(ball_vel_hor_w), .A1(n304), .B0(n289), .Y(n278) );
  NOR2B U274 ( .AN(n287), .B(n304), .Y(n289) );
  AOI2BB1 U275 ( .A0N(n273), .A1N(n305), .B0(n286), .Y(n304) );
  AND2 U276 ( .A(n305), .B(n273), .Y(n286) );
  OAI22 U277 ( .A0(n279), .A1(n280), .B0(n241), .B1(n291), .Y(n305) );
  OAI222 U278 ( .A0(n273), .A1(n268), .B0(n272), .B1(n270), .C0(n271), .C1(
        n244), .Y(n179) );
  NAND2B U279 ( .AN(n295), .B(n271), .Y(n270) );
  MX2 U280 ( .A(ball_pos_x_w[0]), .B(ball_pos_y_w[0]), .S0(n291), .Y(n272) );
  NAND2B U281 ( .AN(n291), .B(n271), .Y(n268) );
  AOI31 U282 ( .A0(ball_vel_ver_w), .A1(n244), .A2(n306), .B0(n281), .Y(n271)
         );
  INV U283 ( .A(n307), .Y(n306) );
  AOI21 U284 ( .A0(n242), .A1(n257), .B0(n255), .Y(n307) );
  NOR4BB U285 ( .AN(n308), .BN(ball_vel_hor_w), .C(n262), .D(n309), .Y(n255)
         );
  XOR2 U286 ( .A(ball_pos_x_w[2]), .B(n310), .Y(n309) );
  NOR2B U287 ( .AN(n223), .B(n224), .Y(n310) );
  XOR2 U288 ( .A(n210), .B(n279), .Y(n262) );
  AOI21 U289 ( .A0(board_pos_x_w[1]), .A1(\Ball_Game_control/N93 ), .B0(n220), 
        .Y(n210) );
  NOR3B U290 ( .AN(n261), .B(ball_pos_y_w[2]), .C(n238), .Y(n308) );
  NOR4BB U291 ( .AN(n265), .BN(n311), .C(n312), .D(n261), .Y(n257) );
  XOR2 U292 ( .A(n276), .B(n313), .Y(n261) );
  XOR2 U293 ( .A(n239), .B(n314), .Y(n312) );
  NOR2 U294 ( .A(n219), .B(n233), .Y(n314) );
  NOR2B U295 ( .AN(n315), .B(n224), .Y(n233) );
  NOR2 U296 ( .A(ball_vel_hor_w), .B(n316), .Y(n311) );
  XOR2 U297 ( .A(board_pos_x_w[1]), .B(ball_pos_x_w[1]), .Y(n265) );
  INV U298 ( .A(ball_pos_y_w[0]), .Y(n244) );
  OAI2BB2 U299 ( .B0(n280), .B1(n276), .A0N(ball_pos_y_w[0]), .A1N(n295), .Y(
        n273) );
  NOR2 U300 ( .A(n317), .B(n300), .Y(n280) );
  NOR2B U301 ( .AN(n291), .B(n317), .Y(n300) );
  INV U302 ( .A(n295), .Y(n291) );
  NOR2B U303 ( .AN(n287), .B(ball_vel_ver_w), .Y(n295) );
  NOR2B U304 ( .AN(n254), .B(n287), .Y(n317) );
  INV U305 ( .A(ball_vel_hor_w), .Y(n287) );
  INV U306 ( .A(ball_vel_ver_w), .Y(n254) );
  AOI21 U307 ( .A0(n213), .A1(n245), .B0(n318), .Y(n178) );
  INV U308 ( .A(target_C_w[0]), .Y(n318) );
  AOI21 U309 ( .A0(n230), .A1(n245), .B0(n319), .Y(n176) );
  INV U310 ( .A(target_C_w[2]), .Y(n319) );
  NOR2B U311 ( .AN(n253), .B(n239), .Y(n245) );
  INV U312 ( .A(ball_pos_x_w[2]), .Y(n239) );
  AOI21 U313 ( .A0(n213), .A1(n320), .B0(n321), .Y(n174) );
  INV U314 ( .A(target_C_w[4]), .Y(n321) );
  NOR2B U315 ( .AN(ball_pos_x_w[0]), .B(n279), .Y(n213) );
  AOI21 U316 ( .A0(n222), .A1(n320), .B0(n322), .Y(n173) );
  NOR2B U317 ( .AN(ball_pos_x_w[1]), .B(ball_pos_x_w[0]), .Y(n222) );
  INV U318 ( .A(n323), .Y(n172) );
  OAI2BB1 U319 ( .A0N(n230), .A1N(n320), .B0(target_C_w[6]), .Y(n323) );
  NOR2B U320 ( .AN(n279), .B(n276), .Y(n230) );
  INV U321 ( .A(ball_pos_x_w[1]), .Y(n279) );
  AOI21 U322 ( .A0(n216), .A1(n320), .B0(n324), .Y(n171) );
  NOR2B U323 ( .AN(n253), .B(ball_pos_x_w[2]), .Y(n320) );
  NOR4BB U324 ( .AN(ball_pos_y_w[2]), .BN(ball_vel_ver_w), .C(n241), .D(
        ball_pos_y_w[0]), .Y(n253) );
  INV U325 ( .A(ball_pos_y_w[1]), .Y(n241) );
  NOR2B U326 ( .AN(n276), .B(ball_pos_x_w[1]), .Y(n216) );
  INV U327 ( .A(ball_pos_x_w[0]), .Y(n276) );
  XOR2 U328 ( .A(clk_div_w), .B(n325), .Y(n160) );
  OR2 U329 ( .A(button_start_i), .B(\Ball_Game_control/gamestart_r ), .Y(n159)
         );
  NOR2B U330 ( .AN(\Ball_game_clock/N10 ), .B(n325), .Y(\Ball_game_clock/N17 )
         );
  NOR2B U331 ( .AN(\Ball_game_clock/N9 ), .B(n325), .Y(\Ball_game_clock/N16 )
         );
  NOR2B U332 ( .AN(\Ball_game_clock/N8 ), .B(n325), .Y(\Ball_game_clock/N15 )
         );
  NOR2B U333 ( .AN(\Ball_game_clock/N7 ), .B(n325), .Y(\Ball_game_clock/N14 )
         );
  NOR2B U334 ( .AN(\Ball_game_clock/N6 ), .B(n325), .Y(\Ball_game_clock/N13 )
         );
  NOR2B U335 ( .AN(\Ball_game_clock/N5 ), .B(n325), .Y(\Ball_game_clock/N12 )
         );
  AND4 U336 ( .A(\Ball_game_clock/div_cnt_r[5] ), .B(
        \Ball_game_clock/div_cnt_r[4] ), .C(\Ball_game_clock/div_cnt_r[6] ), 
        .D(n326), .Y(n325) );
  AND4 U337 ( .A(\Ball_game_clock/div_cnt_r[3] ), .B(
        \Ball_game_clock/div_cnt_r[1] ), .C(\Ball_game_clock/div_cnt_r[2] ), 
        .D(\Ball_game_clock/div_cnt_r[0] ), .Y(n326) );
  INV U338 ( .A(\Ball_game_clock/div_cnt_r[0] ), .Y(\Ball_game_clock/N11 ) );
  NOR2B U339 ( .AN(n327), .B(\Ball_Game_display/row_scan_pos_y_next_r[2] ), 
        .Y(\Ball_Game_display/N37 ) );
  NOR2B U340 ( .AN(n249), .B(n348), .Y(\Ball_Game_display/N15 ) );
  NOR2B U341 ( .AN(\Ball_Game_display/row_scan_pos_y_next_r[1] ), .B(n243), 
        .Y(n249) );
  INV U342 ( .A(\Ball_Game_display/row_scan_pos_y_next_r[2] ), .Y(n243) );
  OAI21 U343 ( .A0(n348), .A1(n240), .B0(n250), .Y(\Ball_Game_display/N12 ) );
  INV U344 ( .A(n327), .Y(n250) );
  NOR2B U345 ( .AN(n240), .B(\Ball_Game_display/row_scan_pos_y_next_r[0] ), 
        .Y(n327) );
  INV U346 ( .A(\Ball_Game_display/row_scan_pos_y_next_r[1] ), .Y(n240) );
  INV U347 ( .A(\Ball_Game_display/row_scan_pos_y_next_r[0] ), .Y(n348) );
  OAI2BB1 U348 ( .A0N(board_pos_x_next_w[2]), .A1N(n204), .B0(n328), .Y(
        \Ball_Game_control/N74 ) );
  AOI32 U349 ( .A0(n207), .A1(n209), .A2(n264), .B0(board_pos_x_w[2]), .B1(
        n329), .Y(n328) );
  OAI2BB1 U350 ( .A0N(n223), .A1N(n208), .B0(n207), .Y(n329) );
  INV U351 ( .A(n220), .Y(n223) );
  INV U352 ( .A(n330), .Y(n264) );
  OAI32 U353 ( .A0(n313), .A1(n219), .A2(n315), .B0(board_pos_x_w[2]), .B1(
        n331), .Y(n330) );
  NOR2B U354 ( .AN(n219), .B(n313), .Y(n331) );
  NOR2B U355 ( .AN(board_pos_x_w[1]), .B(board_pos_x_w[2]), .Y(n219) );
  OAI2BB1 U356 ( .A0N(board_pos_x_next_w[0]), .A1N(n204), .B0(n332), .Y(
        \Ball_Game_control/N72 ) );
  MX2 U357 ( .A(n313), .B(n333), .S0(n207), .Y(n332) );
  AOI221 U358 ( .A0(n208), .A1(n238), .B0(n209), .B1(n316), .C0(n281), .Y(n207) );
  NOR3B U359 ( .AN(n313), .B(n315), .C(n224), .Y(n316) );
  INV U360 ( .A(board_pos_x_w[2]), .Y(n224) );
  NOR2B U361 ( .AN(n220), .B(board_pos_x_w[2]), .Y(n238) );
  NOR2B U362 ( .AN(n315), .B(\Ball_Game_control/N93 ), .Y(n220) );
  INV U363 ( .A(board_pos_x_w[1]), .Y(n315) );
  OR2 U364 ( .A(n334), .B(\Ball_Game_control/N93 ), .Y(n333) );
  INV U365 ( .A(\Ball_Game_control/N93 ), .Y(n313) );
  NOR2B U366 ( .AN(n334), .B(n281), .Y(n204) );
  INV U367 ( .A(n275), .Y(n281) );
  NOR4B U368 ( .AN(\Ball_Game_control/gamestart_r ), .B(
        \Ball_Game_control/gamepause_r ), .C(led_defeat_o), .D(led_win_o), .Y(
        n275) );
  NOR2B U369 ( .AN(n335), .B(n336), .Y(led_win_o) );
  OR4 U370 ( .A(target_C_w[2]), .B(target_C_w[3]), .C(target_C_w[1]), .D(
        target_C_w[0]), .Y(n336) );
  NOR4BB U371 ( .AN(n324), .BN(n322), .C(target_C_w[4]), .D(target_C_w[6]), 
        .Y(n335) );
  INV U372 ( .A(target_C_w[5]), .Y(n322) );
  INV U373 ( .A(target_C_w[7]), .Y(n324) );
  NOR3B U374 ( .AN(n242), .B(ball_pos_y_w[1]), .C(ball_pos_y_w[0]), .Y(
        led_defeat_o) );
  INV U375 ( .A(ball_pos_y_w[2]), .Y(n242) );
  NOR2 U376 ( .A(n209), .B(n208), .Y(n334) );
  NOR2B U377 ( .AN(button_left_i), .B(button_right_i), .Y(n208) );
  NOR2B U378 ( .AN(button_right_i), .B(button_left_i), .Y(n209) );
endmodule

