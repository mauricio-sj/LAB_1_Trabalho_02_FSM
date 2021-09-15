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
            .rst(rst)
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
  #30;
      rst = 0;
  #40;
  inp = 1;
  #10;
  inp = 1;
  #10;
  inp = 1; 
  #20;
  inp = 0; 
$display("inp:%d clk:%d  rst:%d outp:%d", inp, clk, rst, outp);

 end
      
endmodule