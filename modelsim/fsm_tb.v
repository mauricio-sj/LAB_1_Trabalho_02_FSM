`timescale 1ns / 1ps  

module tb_fsm;
//Inputs
 reg inp;
 reg clk;
 reg rst;
//Outputs

 wire outp;
 // Verilog code for FSM Detector 1110
 
 
 FSM test_unit(
            .inp(inp),       
            .clk(clk),
            .rst(rst),
	    .outp(outp)
);
initial begin
 clk = 0;
 forever #5 clk = ~clk;
 end 
 initial begin
  // Initialize Inputs
  inp = 0;
  rst = 1;
  // Wait 100 ns for global reset to finish
  @(posedge clk)
  @(negedge clk)
  rst = 0;
  inp = 1;
  #1
  @(negedge clk)
  @(negedge clk)
  inp = 0;
  @(posedge clk)
  $display("inp:%d clk:%d  rst:%d outp:%d esperado: 1", inp, clk, rst, outp);
  inp = 1;
  #1
  @(negedge clk)
  @(negedge clk)
  @(negedge clk)
  $display("inp:%d clk:%d  rst:%d outp:%d esperado: 0", inp, clk, rst, outp);

 end
      
endmodule