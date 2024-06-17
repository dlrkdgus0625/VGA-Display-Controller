`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/08/30 00:27:00
// Design Name: 
// Module Name: wrapper
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

module wrapper(
    input clk,
    input cen,
    input rst,

    output [9:0] a_val,
    output [9:0] b_val,
    output A,
    output B
    );
    
	//wire clkb;
	wire a_en,b_en;
	wire clk_7M;
	//wire clk_B;
	wire wiz_lock;

	
	clk_wiz_0 inst_clk_wiz
	(
	// Clock out ports
	.clk_out1(clk_7M),     // output clk_out1
	//.clk_out2(clk_B),     // output clk_out2
	// Status and control signals
	.reset(rst), // input reset
	.locked(wiz_lock),       // output locked
	// Clock in ports
	.clk_in1(clk)		//input clk_in1
	);
 
	//define 10 bit wide counter which overflows at 823
	//called cntrA
	bin_count #(
		.MAX_COUNT(823),
		.WIDTH(10) 
	)
	cntrA(
		.rst(rst),
		.clk(clk_7M),
		.cen(a_en),
		.val(a_val)
	);

	//10-wide counter up to 600
	bin_count #(
		.MAX_COUNT(600),
		.WIDTH(10)
	)
	cntrB(
		.rst(rst),
		.clk(clk_7M),
		.cen(b_en),
		.val(b_val)
	);


	assign a_en = 1'b1; //counter A always enabled
	
	//counter B increments when cntA at max count
	assign b_en = (a_val >= 822);

	  
	//start output on when counter reset/overflow
	//turn outputs off when respective counters are at half value
	//assign A = (a_val<=412);
	//assign B = (b_val<=300);

endmodule
