`timescale 1ns / 1ps

module vga_wrapper(
	input clk,
	input rst,
	output hdmi_clk_n,
	output hdmi_clk_p,
	output [2:0] hdmi_tx_n,
	output [2:0] hdmi_tx_p
);

	wire clk_25MHz, clk_125MHz;
	wire locked;
	wire hsync, vsync, vde;
	wire [7:0] red, green, blue;
	wire [9:0] x_pix, y_pix;


    
	//clock wizard configured with a 1x and 5x clock
	clk_wiz_0 clk_wiz (
		.clk_out1(clk_25MHz),
		.clk_out2(clk_125MHz),
		.reset(rst),
		.locked(locked),
		.clk_in1(clk)
	);
    

	//VGA Sync signal generator
	vga_sync vga (
		.clk(clk_25MHz),
		.rst(rst),
		.hsync(hsync),
		.vsync(vsync),
		.vde(vde),
		.px(x_pix),
		.py(y_pix),
		.red(red),
		.blue(blue),
		.green(green)
	);


	//Real Digital VGA to HDMI converter
	hdmi_tx_0 vga_to_hdmi (
		//Clocking and Reset
		.pix_clk(clk_25MHz),
		.pix_clkx5(clk_125MHz),
		.pix_clk_locked(locked),
		//Reset is active HIGH
		.rst(rst),

		//Color and Sync Signals
		.red(red),
		.green(green),
		.blue(blue),
		.hsync(hsync),
		.vsync(vsync),
		.vde(vde),

		//aux Data (unused)
		.aux0_din(4'b0),
		.aux1_din(4'b0),
		.aux2_din(4'b0),
		.ade(1'b0),

		//Differential outputs
		.TMDS_CLK_P(hdmi_clk_p),          
		.TMDS_CLK_N(hdmi_clk_n),          
		.TMDS_DATA_P(hdmi_tx_p),         
		.TMDS_DATA_N(hdmi_tx_n)          
	);

endmodule