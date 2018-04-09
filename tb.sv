// A very simple test bench for testing the system
//

`timescale 1ns/10ps

`include "ifft.v"

module top();

reg clk,rst;
reg [27:0] dir,dii;
reg pushin;
wire [27:0] dor,doi;
wire pushout;
reg pushouto;
reg [27:0] doro,doio;

reg debug=1;

integer fh;
reg done;
integer ccnt,wix;
integer l;
integer cycnt;
string cd,ln;
reg [27:0] rl,im;
integer armcnt=0;
integer deathout=400;

reg [55:0] pf[$],pdata;
reg [55:0] exp[$],edata;

integer oneout=0;

ifft i(clk,rst,pushin,dir,dii,pushout,dor,doi);

initial begin
clk=0;
pushin=0;
repeat(2000000) begin
  #5 clk=~clk;
end

$display("Ran out of clocks");
$finish;

end

initial begin
if(debug) begin
  $dumpfile("ifft.vpd");
  $dumpvars(9,top);
end
end

task die(string msg);
  $display("\n\n\n\n\n");
  $display("Error %t --- %s",$realtime,msg);
  #5;
  $display("Simulation aborting");
  $display("\n\n\n\n\n");
  $finish;
endtask : die

function reg[27:0] delta(reg [27:0] a, reg[27:0] b);
    reg [27:0] w;
    w=a-b;
    if(w[27]) w=-w;
//    $display("a %x b %x delta %d",a,b,w);
    return w;
endfunction : delta

always @(posedge(clk)) begin
    if(oneout > 0) begin
      oneout -= 1;
    end else begin      
      if(pf.size() >= 32) begin
        oneout=200;
        repeat(32) begin
          @(posedge(clk)) #1;
          pushin=1;
          {dir,dii}=pf.pop_front();
          if($urandom_range(0,255)>150) begin
            @(posedge(clk)) #1;
            oneout -= 1;
            pushin=0;
            {dir,dii}={$random(),$random()};
            repeat($urandom_range(1,5)) @(posedge(clk)) #1 oneout -=1;
          end
        end
        @(posedge(clk)) #1
        pushin=0;
        oneout -=1;        
      end 
    end
end

always @(posedge(clk)) begin
    if(armcnt < 10) begin
        armcnt += 1;
    end else begin
      pushouto=pushout;
      doro=dor;
      doio=doi;
      if(pushout === 1'bx) begin
        die("pushout is x");
      end
      #0.1;
      if(pushout !== pushouto) begin
        die("No hold time on pushout");
      end
      if(dor !== doro) begin
        die("No hold time on dor");
      end
      if(doi !== doio) begin
        die("No hold time on doi");
      end
      if(dor === 28'hXXXXXXX) begin
        die("dor is x");
      end
      if(doi === 28'hXXXXXXX) begin
        die("doi is x");
      end
      if(pushout===1'b1) begin
        if(exp.size()==0) begin
            die("You pushed out when nothing was expected");
        end
        edata = exp.pop_front();
//        $display("edata %h",edata);
        if(delta(dor,edata[55:28])>8) begin
            die($sformatf("dor rec %h exp %h",dor,edata[55:28]));
        end
        if(delta(doi,edata[27:0])>8) begin
            die($sformatf("doi rec %h exp %h",doi,edata[27:0]));
        end
        deathout=400;
      end else begin
        if(deathout <= 0) begin
          die("Didn't see output for 400 clocks");
        end
        if(exp.size()==0 && pf.size()==0) begin
          $display("\n\nOh what great joy, you passed the simulation\n\n");
          $finish;
        end
        deathout -= 1;
      end
    end
end



initial begin
  rst=0;
  @(posedge(clk)) #1;
  rst=1;
  repeat(3) @(posedge(clk)) #1;
  rst=0;
  fh = $fopen("td.txt","r");
  repeat(3) @(posedge(clk)) #1;
  done=0;
  while(!done) begin
    cd="e";
    l=$fgets(ln,fh);
    l=$sscanf(ln,"%s %d %h %h",cd,wix,rl,im);
    if(cd=="e") begin
      done=1;
    end else if (cd == "i") begin
//      $display("i %h %h",rl,im);
      pf.push_back({rl,im});
    end else if (cd == "o") begin
//      $display("o %h %h",rl,im);
      exp.push_back({rl,im});
    end else begin
      $display("I got an unknown char of %s",cd);
    end
  
  end

end








endmodule
