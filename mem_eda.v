module mem28x32(input clk,input [4:0] waddr, 
    input [27:0] wdata, input write,
                input [4:0] raddr, output [27:0] rdata, w0,w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15,w16,w17,w18,w19,w20,w21,w22,w23,w24,w25,w26,w27, w28,w29,w30,w31);

//output [27:0] w0,w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13, w14,w15,w16,w17,w18,w19,w20,w21,w22,w23,w24,w25,w26,w27, w28,w29,w30,w31;
  
reg [27:0] mem[0:31];

reg [27:0] rdatax;

  reg [27:0] w0,w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13, w14,w15,w16,w17,w18,w19,w20,w21,w22,w23,w24,w25,w26,w27, w28,w29,w30,w31;
  reg [55:0] wmult;
  always @(*) begin
  w0<=mem[0];
    w1<=mem[1];
    w2<=mem[2];
    w3<=mem[3];
    w4<=mem[4];
    w5<=mem[5];
    w6<=mem[6];
    w7<=mem[7];
    w8<=mem[8];
    w9<=mem[9];
    w10<=mem[10];
    w11<=mem[11];
    w12<=mem[12];
    w13<=mem[13];
    w14<=mem[14];
    w15<=mem[15];
    w16<=mem[16];
    w17<=mem[17];
    w18<=mem[18];
    w19<=mem[19];
    w20<=mem[20];
    w21<=mem[21];
    w22<=mem[22];
    w23<=mem[23];
    w24<=mem[24];
    w25<=mem[25];
    w26<=mem[26];
    w27<=mem[27];
    w28<=mem[28];
    w29<=mem[29];
    w30<=mem[30];
      w31<=mem[31];
    //wmult = ((w1+w2) * w3);
  end 
  
  
assign rdata = rdatax;

always @(*) begin
  rdatax <= #2 mem[raddr];
end

always @(posedge(clk)) begin
  if(write) begin
    mem[waddr]<=#2 wdata;
  end
end

endmodule
