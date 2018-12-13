`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/07 10:58:03
// Design Name: 
// Module Name: mips
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


module mips(
	input wire clk,rst,
	output wire [31:0] pcF,
	input wire [31:0] instrF,
	output wire memwriteM,
	output wire [31:0] aluoutM,writedataM,
	input wire [31:0] readdataM 
    );
	
	wire [5:0] opD,functD,rtD;

	wire regdstE;
	wire [1:0] alusrcE;
	wire pcsrcD,memtoregE,memtoregM,memtoregW,regwriteE,regwriteM,regwriteW;
	wire balD;
	wire [1:0] hilowriteD;

	wire [4:0] alucontrolE;
	wire flushE,equalD;
	wire stallE;

	controller c(
		clk,rst,
		// decode stage
		opD,functD,rtD,
		pcsrcD,branchD,equalD,jumpD,
		balD,
		hilowriteD,
		// execute stage
		flushE,
		stallE,
		memtoregE,alusrcE,
		regdstE,regwriteE,	
		alucontrolE,
		// memory visit stage
		memtoregM,memwriteM,
		regwriteM,
		// write back stage
		memtoregW,regwriteW
		);
	datapath dp(
		clk,rst,
		// fetch stage
		pcF,
		instrF,
		// decode stage
		pcsrcD,branchD,
		jumpD,
		balD,
		equalD,
		opD,functD,rtD,
		hilowriteD,
		// execute stage
		memtoregE,
		alusrcE,regdstE,
		regwriteE,
		alucontrolE,
		flushE,
		stallE,
		// memory visit stage
		memtoregM,
		regwriteM,
		aluoutM,writedataM,
		readdataM,
		// write back stage
		memtoregW,
		regwriteW
	    );
	
endmodule
