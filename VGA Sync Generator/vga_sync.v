`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2023 03:26:56 PM
// Design Name: 
// Module Name: vga_sync
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


module vga_sync(
    input clk,
    input rst,
    //input cen,
    
    output hsync,
    output vsync,
    output vde,
    
    output reg [7:0] green,
    output reg [7:0] blue,
    output reg [7:0] red,
    
    output [9:0] px,
    output [9:0] py
    );
    
    wire x,y;
    
    bin_count #(
		.MAX_COUNT(799),
		.WIDTH(10) 
	)
	cntrA(
		.rst(rst),
		.clk(clk),
		.cen(1'b1),
		.val(px)
	);

	//10-wide counter up to 600
	bin_count #(
		.MAX_COUNT(524),
		.WIDTH(10)
	)
	cntrB(
		.rst(rst),
		.clk(clk),
		.cen(y),
		.val(py)
	);
    
    always@(posedge(clk))
    begin
        /*
        if((px >= 442 && px <= 482) && (py >= 250 && py <= 290))
        begin
            red <= 1'b0;
            blue <= 1'b0;
            green <= 1'b0;
        end
        */
        
        if((px >= 442 && px <= 462) || (py >= 282 && py <= 302))
        begin
            red <= 1'b0;
            blue <= 1'b0;
            green <= 1'b0;
        end
        /*
        if(py >= 282 && py <= 302)
        begin
            red <= 1'b0;
            blue <= 1'b0;
            green <= 1'b0;
        end
        */
        
        else
        begin
            red <= 8'hFF;
            blue <= 8'hFF;
            green <= 8'hFF;
        end
    end
    /*
    always@(posedge(clk))
    begin
        if(py >= 282 && px <= 302)
        begin
            red <= 1'b0;
            blue <= 1'b0;
            green <= 1'b0;
        end
        else
        begin
            red <= 8'hFF;
            blue <= 8'hFF;
            green <= 8'hFF;
        end
    end
    */
    
    assign vde = ((px < 784) && (px >=144 )) && ((py >=35) && (py<515));
    assign hsync = (px < 799) && (px >96); //
    assign vsync = (py > 2) && (py<524);
    
    assign y = (px >= 799);
    
endmodule
