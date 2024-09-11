`timescale 10ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/30/2023 03:21:24 PM
// Design Name: 
// Module Name: wrapper_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module wrapper_tb;
    reg rst;
    reg cen;
    reg clk;
    
    wire [9:0] a_val;
    wire [9:0] b_val;
    wire A;
    wire B;
    
    //wire B;
    
    wrapper CUT (.rst(rst),
                 .clk(clk), 
                 .cen(cen),
                 .a_val(a_val),
                 .b_val(b_val)
                 );
    
   
    initial begin
    rst = 1;
    clk = 0;
    cen = 0;
    #50;
    
    rst = 0;
    cen = 1'b1;
    clk = 0;
    #500;
    //$finish;
    end
    
    always begin
        #5 clk = ~clk;
    end   
   
    
    
   
    
endmodule
