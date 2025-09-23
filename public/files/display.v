module display(
 input clk,
 input rst_n,
 output lcd_en, // LED enable
 output lcd_rs, // register select
                        // 0 : write command register
                        // 1 : write data register
 output lcd_rw, // Read/Write Signal
                        // 0 : write
                        // 1 : No function
 output reg [7:0] lcd_db,
 output lcd_rst);
 
 reg  [7:0] tmp1;
 reg  [7:0] tmp2;
 reg  [6:0] cnt_lcd; 
 wire  rst;
// ------------
// Text LCD Main Circuit
// ------------

assign rst = rst_n;
assign lcd_rw = 1'b0;
assign lcd_rs = 1'b1;
assign lcd_rst = rst;
assign lcd_en = cnt_lcd[0];

always @(posedge clk or posedge rst)
   if (rst) lcd_db <= 0;
   else if (lcd_en & cnt_lcd[6]) lcd_db <= tmp1;
   else if (lcd_en & ~cnt_lcd[6]) lcd_db <= tmp2;
   else lcd_db <= 0;
       
always @(posedge clk or posedge rst)
   if (rst) cnt_lcd <= 0;
   else  cnt_lcd <= cnt_lcd + 1;
      

always @(cnt_lcd)
   case(cnt_lcd[5:1])
   'h0 : tmp1 = 'h0A;    // *
   'h1 : tmp1 = 'h0A;    // *
   'h2 : tmp1 = 'h00;    // space
   'h3 : tmp1 = 'h37;    // W
   'h4 : tmp1 = 'h45;    // e
   'h5 : tmp1 = 'h4C;    // l
   'h6 : tmp1 = 'h43;    // c
   'h7 : tmp1 = 'h4F;    // o
   'h8 : tmp1 = 'h4D;    // m
   'h9 : tmp1 = 'h45;    // e
   'hA : tmp1 = 'h00;    // space
   'hB : tmp1 = 'h34;  // T
   'hC : tmp1 = 'h4F;  // o
   'hD : tmp1 = 'h00;    // space
   'hE : tmp1 = 'h0A;    // *
   'hF : tmp1 = 'h0A;    // *
   'h10 : tmp1 = 'h26;  // F
   'h11 : tmp1 = 'h35; // U
   'h12 : tmp1 = 'h24; // D
   'h13 : tmp1 = 'h21; // A
   'h14 : tmp1 = 'h2e; // N
   'h15 : tmp1 = 'h00; // space
   'h16 : tmp1 = 'h35; // U
   'h17 : tmp1 = 'h4e; // n
   'h18 : tmp1 = 'h49; // i
   'h19 : tmp1 = 'h56; // v
   'h1A : tmp1 = 'h45; // e
   'h1B : tmp1 = 'h52; // r
   'h1C : tmp1 = 'h53; // s
   'h1D : tmp1 = 'h49; // i
   'h1E : tmp1 = 'h54; // t
   'h1F : tmp1 = 'h59; // y
   default : tmp1 = 'h00;
   endcase

always @(cnt_lcd)
   case(cnt_lcd[5:1])
   'h0 : tmp2 = 'h00; // space
   'h1 : tmp2 = 'h00; // space
   'h2 : tmp2 = 'h00; // space
   'h3 : tmp2 = 'h2C; // L
   'h4 : tmp2 = 'h49; // i
   'h5 : tmp2 = 'h55; // u
   'h6 : tmp2 = 'h00; // space
   'h7 : tmp2 = 'h33; // S
   'h8 : tmp2 = 'h49; // i
   'h9 : tmp2 = 'h4D; // m
   'hA : tmp2 = 'h49; // i
   'hB : tmp2 = 'h4E; // n
   'hC : tmp2 = 'h00; // space
   'hD : tmp2 = 'h00; // space
   'hE : tmp2 = 'h00; // space
   'hF : tmp2 = 'h00; // space  
   'h10 : tmp2 = 'h00;  // space
   'h11 : tmp2 = 'h00; // space
   'h12 : tmp2 = 'h00; // space
   'h13 : tmp2 = 'h11; // 1
   'h14 : tmp2 = 'h19; // 9
   'h15 : tmp2 = 'h12; // 2
   'h16 : tmp2 = 'h11; // 1
   'h17 : tmp2 = 'h12; // 2
   'h18 : tmp2 = 'h10; // 0
   'h19 : tmp2 = 'h12; // 2
   'h1A : tmp2 = 'h10; // 0
   'h1B : tmp2 = 'h10; // 0
   'h1C : tmp2 = 'h16; // 6
   'h1D : tmp2 = 'h10; // 0
   'h1E : tmp2 = 'h00; // space
   'h1F : tmp2 = 'h00; // space
   default : tmp2 = 'h00;
   endcase
             
endmodule
