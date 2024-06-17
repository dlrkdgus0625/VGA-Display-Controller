`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/08/30 00:28:48
// Design Name: 
// Module Name: bin_count
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


module bin_count #(parameter MAX_COUNT = 255, WIDTH = 8)
(
	input rst, clk, cen,
	output reg [WIDTH-1:0] val
);
    //reg [WIDTH-1:0] limit;
   // reg [WIDTH-1:0] tmp;
    
    //assign limit = $clog2(MAX_COUNT+1); width has to be in 
	//module description here
	always@(posedge(clk))
	begin
	   
	   begin
	       if(val >= MAX_COUNT)
	       val<=0;
	       else if(rst)
	       val <= 0;
	       else if (cen)
	       val <= val +1;
	   end
	   
	end
	
endmodule
