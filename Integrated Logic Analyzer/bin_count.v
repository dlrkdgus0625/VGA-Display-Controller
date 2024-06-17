`timescale 1ns / 1ps



module bin_count #(parameter MAX_COUNT = 255, WIDTH = 8)
(
	//input rst,
	input clk,
	input cen,
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
	       //else if(rst)
	       //val <= 0;
	       else if (cen)
	       val <= val +1;
	   end
	   
	end
	
endmodule
