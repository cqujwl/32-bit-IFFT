// Code your design here
`include "mem28x32.v"

module fifo(clk,rst,pushin,a,b,pushout,z);
input clk,rst;      // a clock and reset include
  input [27:0] a, b;
input pushin;
output pushout;
wire pushout;
output [27:0] z;
wire [27:0] z;
wire [27:0] z0,z1,z2,zm;
wire pout0,pout1,pout2;
  reg [27:0] al,bl, res, real0add, imag0add,real1add, imag1add, real2add, imag2add, real3add, imag3add, real4add, imag4add, real5add, imag5add, real6add, imag6add, real7add, imag7add, real8add, imag8add, real9add, imag9add, real10add, imag10add, real11add, imag11add, real12add, imag12add, real13add, imag13add, real14add, imag14add, real15add, imag15add, real16add, imag16add, real17add, imag17add, real18add, imag18add, real19add, imag19add, real20add, imag20add, real21add, imag21add, real22add, imag22add, real23add, imag23add, real24add, imag24add, real25add, imag25add, real26add, imag26add, real27add, imag27add, real28add, imag28add, real29add, imag29add, real30add, imag30add, real31add, imag31add;
  reg [27:0] y0,y1,y2,y3,y4,y5,y6,y7,y8,y9,y10, y11,y12,y13, y14,y15,y16,y17,y18,y19,y20,y21,y22,y23,y24,y25,y26,y27, y28,y29,y30,y31, x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13, x14,x15,x16,x17,x18,x19,x20,x21,x22,x23,x24,x25,x26,x27, x28,x29,x30,x31;
  
  reg ready;
  reg [2:0] cst, nst;
parameter S0 = 3'b000, //all state
          S1 = 3'b001,
          S2 = 3'b010,
          S3 = 3'b011,
          S4 = 3'b100,
     S5 = 3'b101;

  
reg pushinl,pushoutl;
wire pushoutm;
  reg control;
  reg [4:0] wradd, rdadd;
assign z=res;
assign pushout = pushoutl;
assign pushin1 = pushin;

  mem28x32 A1 (clk, wradd, a, pushin, rdadd, zm, y0,y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11,y12,y13, y14,y15,y16,y17,y18,y19,y20,y21,y22,y23,y24,y25,y26,y27, y28,y29,y30,y31);

  mem28x32 A2 (clk, wradd, b, pushin, rdadd, zm, x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13, x14,x15,x16,x17,x18,x19,x20,x21,x22,x23,x24,x25,x26,x27, x28,x29,x30,x31);
  

  always @(posedge clk)
    case (cst)
      3'b000 : begin end// Reset stage 
        
       3'b001: begin    /// add and subtract 1st stage 
real0add <= (y16[27] == 1'b1 ? (~y16 + 1'b1) : y16) + (y0[27] == 1'b1 ? (~y0 + 1'b1) : y0); 
imag0add <= (x16[27] == 1'b1 ? (~x16 + 1'b1) : x16) + (x0[27] == 1'b1 ? (~x0 + 1'b1) : x0);
		
real1add <= (y17[27] == 1'b1 ? (~y17 + 1'b1) : y17) + (y1[27] == 1'b1 ? (~y1 + 1'b1) : y1); 
imag1add <= (x17[27] == 1'b1 ? (~x17 + 1'b1) : x17) + (x1[27] == 1'b1 ? (~x1 + 1'b1) : x1);
		
real2add <= (y18[27] == 1'b1 ? (~y18 + 1'b1) : y18) + (y2[27] == 1'b1 ? (~y2 + 1'b1) : y2); 
imag2add <= (x18[27] == 1'b1 ? (~x18 + 1'b1) : x18) + (x2[27] == 1'b1 ? (~x2 + 1'b1) : x2);
		
real3add <= (y19[27] == 1'b1 ? (~y19 + 1'b1) : y19) + (y3[27] == 1'b1 ? (~y3 + 1'b1) : y3); 
imag3add <= (x19[27] == 1'b1 ? (~x19 + 1'b1) : x19) + (x3[27] == 1'b1 ? (~x3 + 1'b1) : x3);
		
real4add <= (y20[27] == 1'b1 ? (~y20 + 1'b1) : y20) + (y4[27] == 1'b1 ? (~y4 + 1'b1) : y4); 
imag4add <= (x20[27] == 1'b1 ? (~x20 + 1'b1) : x20) + (x4[27] == 1'b1 ? (~x4 + 1'b1) : x4);
		
real5add <= (y21[27] == 1'b1 ? (~y21 + 1'b1) : y21) + (y5[27] == 1'b1 ? (~y5 + 1'b1) : y5); 
imag5add <= (x21[27] == 1'b1 ? (~x21 + 1'b1) : x21) + (x5[27] == 1'b1 ? (~x5 + 1'b1) : x5);
		
real6add <= (y22[27] == 1'b1 ? (~y22 + 1'b1) : y22) + (y6[27] == 1'b1 ? (~y6 + 1'b1) : y6); 
imag6add <= (x22[27] == 1'b1 ? (~x22 + 1'b1) : x22) + (x6[27] == 1'b1 ? (~x6 + 1'b1) : x6);
		
real7add <= (y23[27] == 1'b1 ? (~y23 + 1'b1) : y23) + (y7[27] == 1'b1 ? (~y7 + 1'b1) : y7); 
imag7add <= (x23[27] == 1'b1 ? (~x23 + 1'b1) : x23) + (x7[27] == 1'b1 ? (~x7 + 1'b1) : x7);
		
real8add <= (y24[27] == 1'b1 ? (~y24 + 1'b1) : y24) + (y8[27] == 1'b1 ? (~y8 + 1'b1) : y8); 
imag8add <= (x24[27] == 1'b1 ? (~x24 + 1'b1) : x24) + (x8[27] == 1'b1 ? (~x8 + 1'b1) : x8);
		
real9add <= (y25[27] == 1'b1 ? (~y25 + 1'b1) : y25) + (y9[27] == 1'b1 ? (~y9 + 1'b1) : y9); 
imag9add <= (x25[27] == 1'b1 ? (~x25 + 1'b1) : x25) + (x9[27] == 1'b1 ? (~x9 + 1'b1) : x9);
		
real10add <= (y26[27] == 1'b1 ? (~y26 + 1'b1) : y26) + (y10[27] == 1'b1 ? (~y10 + 1'b1) : y10); 
imag10add <= (x26[27] == 1'b1 ? (~x26 + 1'b1) : x26) + (x10[27] == 1'b1 ? (~x10 + 1'b1) : x10);
		
real11add <= (y27[27] == 1'b1 ? (~y27 + 1'b1) : y27) + (y11[27] == 1'b1 ? (~y11 + 1'b1) : y11); 
imag11add <= (x27[27] == 1'b1 ? (~x27 + 1'b1) : x27) + (x11[27] == 1'b1 ? (~x11 + 1'b1) : x11);
		
real12add <= (y28[27] == 1'b1 ? (~y28 + 1'b1) : y28) + (y12[27] == 1'b1 ? (~y12 + 1'b1) : y12); 
imag12add <= (x28[27] == 1'b1 ? (~x28 + 1'b1) : x28) + (x12[27] == 1'b1 ? (~x12 + 1'b1) : x12);
		
real13add <= (y29[27] == 1'b1 ? (~y29 + 1'b1) : y29) + (y13[27] == 1'b1 ? (~y13 + 1'b1) : y13); 
imag13add <= (x29[27] == 1'b1 ? (~x29 + 1'b1) : x29) + (x13[27] == 1'b1 ? (~x13 + 1'b1) : x13);
		
real14add <= (y30[27] == 1'b1 ? (~y30 + 1'b1) : y30) + (y14[27] == 1'b1 ? (~y14 + 1'b1) : y14); 
imag14add <= (x30[27] == 1'b1 ? (~x30 + 1'b1) : x30) + (x14[27] == 1'b1 ? (~x14 + 1'b1) : x14);
		
real15add <= (y31[27] == 1'b1 ? (~y31 + 1'b1) : y31) + (y15[27] == 1'b1 ? (~y15 + 1'b1) : y15); 
imag15add <= (x31[27] == 1'b1 ? (~x31 + 1'b1) : x31) + (x15[27] == 1'b1 ? (~x15 + 1'b1) : x15);

/// subtraction

real16add <= -(y16[27] == 1'b1 ? (~y16 + 1'b1) : y16) + (y0[27] == 1'b1 ? (~y0 + 1'b1) : y0); 
imag16add <= -(x16[27] == 1'b1 ? (~x16 + 1'b1) : x16) + (x0[27] == 1'b1 ? (~x0 + 1'b1) : x0);
		
real17add <= -(y17[27] == 1'b1 ? (~y17 + 1'b1) : y17) + (y1[27] == 1'b1 ? (~y1 + 1'b1) : y1); 
imag17add <= -(x17[27] == 1'b1 ? (~x17 + 1'b1) : x17) + (x1[27] == 1'b1 ? (~x1 + 1'b1) : x1);
		
real18add <= -(y18[27] == 1'b1 ? (~y18 + 1'b1) : y18) + (y2[27] == 1'b1 ? (~y2 + 1'b1) : y2); 
imag18add <= -(x18[27] == 1'b1 ? (~x18 + 1'b1) : x18) + (x2[27] == 1'b1 ? (~x2 + 1'b1) : x2);
		
real19add <= -(y19[27] == 1'b1 ? (~y19 + 1'b1) : y19) + (y3[27] == 1'b1 ? (~y3 + 1'b1) : y3); 
imag19add <= -(x19[27] == 1'b1 ? (~x19 + 1'b1) : x19) + (x3[27] == 1'b1 ? (~x3 + 1'b1) : x3);
		
real20add <= -(y20[27] == 1'b1 ? (~y20 + 1'b1) : y20) + (y4[27] == 1'b1 ? (~y4 + 1'b1) : y4); 
imag20add <= -(x20[27] == 1'b1 ? (~x20 + 1'b1) : x20) + (x4[27] == 1'b1 ? (~x4 + 1'b1) : x4);
		
real21add <= -(y21[27] == 1'b1 ? (~y21 + 1'b1) : y21) + (y5[27] == 1'b1 ? (~y5 + 1'b1) : y5); 
imag21add <= -(x21[27] == 1'b1 ? (~x21 + 1'b1) : x21) + (x5[27] == 1'b1 ? (~x5 + 1'b1) : x5);
		
real22add <= -(y22[27] == 1'b1 ? (~y22 + 1'b1) : y22) + (y6[27] == 1'b1 ? (~y6 + 1'b1) : y6); 
imag22add <= -(x22[27] == 1'b1 ? (~x22 + 1'b1) : x22) + (x6[27] == 1'b1 ? (~x6 + 1'b1) : x6);
		
real23add <= -(y23[27] == 1'b1 ? (~y23 + 1'b1) : y23) + (y7[27] == 1'b1 ? (~y7 + 1'b1) : y7); 
imag23add <= -(x23[27] == 1'b1 ? (~x23 + 1'b1) : x23) + (x7[27] == 1'b1 ? (~x7 + 1'b1) : x7);
		
real24add <= -(y24[27] == 1'b1 ? (~y24 + 1'b1) : y24) + (y8[27] == 1'b1 ? (~y8 + 1'b1) : y8); 
imag24add <= -(x24[27] == 1'b1 ? (~x24 + 1'b1) : x24) + (x8[27] == 1'b1 ? (~x8 + 1'b1) : x8);
		
real25add <= -(y25[27] == 1'b1 ? (~y25 + 1'b1) : y25) + (y9[27] == 1'b1 ? (~y9 + 1'b1) : y9); 
imag25add <= -(x25[27] == 1'b1 ? (~x25 + 1'b1) : x25) + (x9[27] == 1'b1 ? (~x9 + 1'b1) : x9);
		
real26add <= -(y26[27] == 1'b1 ? (~y26 + 1'b1) : y26) + (y10[27] == 1'b1 ? (~y10 + 1'b1) : y10); 
imag26add <= -(x26[27] == 1'b1 ? (~x26 + 1'b1) : x26) + (x10[27] == 1'b1 ? (~x10 + 1'b1) : x10);
		
real27add <= -(y27[27] == 1'b1 ? (~y27 + 1'b1) : y27) + (y11[27] == 1'b1 ? (~y11 + 1'b1) : y11); 
imag27add <= -(x27[27] == 1'b1 ? (~x27 + 1'b1) : x27) + (x11[27] == 1'b1 ? (~x11 + 1'b1) : x11);
		
real28add <= -(y28[27] == 1'b1 ? (~y28 + 1'b1) : y28) + (y12[27] == 1'b1 ? (~y12 + 1'b1) : y12); 
imag28add <= -(x28[27] == 1'b1 ? (~x28 + 1'b1) : x28) + (x12[27] == 1'b1 ? (~x12 + 1'b1) : x12);
		
real29add <= -(y29[27] == 1'b1 ? (~y29 + 1'b1) : y29) + (y13[27] == 1'b1 ? (~y13 + 1'b1) : y13); 
imag29add <= -(x29[27] == 1'b1 ? (~x29 + 1'b1) : x29) + (x13[27] == 1'b1 ? (~x13 + 1'b1) : x13);
		
real30add <= -(y30[27] == 1'b1 ? (~y30 + 1'b1) : y30) + (y14[27] == 1'b1 ? (~y14 + 1'b1) : y14); 
imag30add <= -(x30[27] == 1'b1 ? (~x30 + 1'b1) : x30) + (x14[27] == 1'b1 ? (~x14 + 1'b1) : x14);
		
real31add <= -(y31[27] == 1'b1 ? (~y31 + 1'b1) : y31) + (y15[27] == 1'b1 ? (~y15 + 1'b1) : y15); 
imag31add <= -(x31[27] == 1'b1 ? (~x31 + 1'b1) : x31) + (x15[27] == 1'b1 ? (~x15 + 1'b1) : x15);

        nst <= 3'b010;
       end
      
        3'b010 : begin end// multiply output
        default : ready <= 1'bx;
        endcase
        
       

  
    

  always @(posedge rst or posedge clk)
    begin
    if (rst)
      begin
        cst <= 3'b000;
      end
  else begin
    if (ready)
      begin
        cst <= 3'b001;
      end
    else begin
       cst <= nst;
    end
    
  end
  end
  

always @(posedge(clk) or posedge(rst)) 
  begin
    if(rst) 
      begin
        al <= 0;
        bl <= 0;
        pushoutl <= 0;
        pushinl <= 0;
        res <= 0;
        wradd <= 0;
        rdadd <= 0;
        control <= 1;
      end else 
        begin
          if (pushin) 
            begin
              al <= a;
              bl <= b;
              res <= #1 zm;
              //control <=1;
              wradd <= wradd +1;
              rdadd <= rdadd +1;
              if (rdadd == 32)
                begin
                  ready =1'b1;
                end
              else
                begin
                  ready = 1'b0;  
                end
              //pushoutl <= pushin1;
              end
          else begin end
        end
  end
  

endmodule
