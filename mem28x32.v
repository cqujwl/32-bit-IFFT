module mem28x32(input clk,input [4:0] waddr, 
    input [27:0] wdata, input write,
    input [4:0] raddr, output [27:0] rdata);


reg [27:0] mem[0:31];

reg [27:0] rdatax;

wire [27:0] w0,w1,w2,w3,w4,w5,w6,w7;
assign w0=mem[0];
assign w1=mem[1];
assign w2=mem[2];

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
