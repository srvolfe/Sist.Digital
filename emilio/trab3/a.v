module Somador(

	input clk, // clock para acumular multiplicações da diagonal principal (dp)
	input in_tipo_diag, // clock para acumular multiplicações da diagonal secundária (ds)
	input clk_result, // clock para subtrair a diagonal secundária da principal (dp - ds) 

	// Variáveis referentes as multiplicações 
	// das coordenadas no cálculo da determinante 
	input [15:0] in_a,
	input [15:0] in_b,

	output[15:0] out_s, // saída acumulada da dp
	output[15:0] out_s2, // saída acumulada da ds
	output[15:0] out_result, // saída da dp - ds
 
	// A = (x1,y1)
	output[15:0] out_x1,
	output[15:0] out_y1,
	
	// B = (x2,y2)
	output[15:0] out_x2,
	output[15:0] out_y2,

	// C = (x3,y3)
	output[15:0] out_x3,
	output[15:0] out_y3

);

	reg [15:0] reg_s = 0; // dp
	reg [15:0] reg_s2 = 0; // ds
	reg [15:0] reg_result = 0; // dp - ds

	// A = (x1,y1)
	reg [15:0] reg_x1 = 1; // coordenada do eixo x do ponto A do triângulo
	reg [15:0] reg_y1 = 2; // coordenada do eixo y do ponto A do triângulo
	  
	// B = (x2,y2)
	reg [15:0] reg_x2 = 3; // coordenada do eixo y do ponto B do triângulo
	reg [15:0] reg_y2 = 4; // coordenada do eixo y do ponto B do triângulo

	// C = (x3,y3)
	reg [15:0] reg_x3 = 5; // coordenada do eixo y do ponto C do triângulo
	reg [15:0] reg_y3 = 3; // coordenada do eixo y do ponto C do triângulo

	assign out_s  = reg_s; 
	assign out_s2  = reg_s2;
	assign out_result = reg_result;
	  
	assign out_x1 = reg_x1;
	assign out_y1 = reg_y1;

	assign out_x2 = reg_x2;
	assign out_y2 = reg_y2;

	assign out_x3 = reg_x3;
	assign out_y3 = reg_y3;

	always @(posedge clk)          reg_s      <= reg_s  + (in_a * in_b);
	always @(posedge in_tipo_diag) reg_s2     <= reg_s2 + (in_a * in_b);
	always @(posedge clk_result)   reg_result <= reg_s  - reg_s2;

endmodule

module test;

	reg clk;
	reg in_tipo_diag;
	reg clk_result;
	reg[15:0] in_a, in_b;

	wire[15:0] out_s;
	wire[15:0] out_s2;
	wire[15:0] out_result;

	//ponto a
	wire[15:0] out_x1;
	wire[15:0] out_y1;

	//ponto b
	wire[15:0] out_x2;
	wire[15:0] out_y2;

	//ponto c
	wire[15:0] out_x3;
	wire[15:0] out_y3;
  
	Somador A(
		clk, 
		in_tipo_diag,
		clk_result,
		in_a,
		in_b, 
		out_s,
		out_s2,
		out_result,
		out_x1,
		out_y1,
		out_x2, 
		out_y2,
		out_x3,
		out_y3 
	);

	initial begin

		$dumpvars(0, A);

			//diagonal principal
			#0
			clk <= 1;
			in_tipo_diag <= 0;
			clk_result <= 0;
			in_a <= out_x1;
			in_b <= out_y2;


			#5
			clk <= ~clk;
			#5
			clk <= ~clk;
			in_a <= out_x2;
			in_b <= out_y3;

			#5
			clk <= ~clk;

			#5
			clk <= ~clk;
			in_a <= out_y1;
			in_b <= out_x3;

			#5
			clk <= ~clk;


			//diagonal secundária
			#5
			in_tipo_diag <= 1;
			in_a <= out_x3;
			in_b <= out_y2;

			#5
			in_tipo_diag <= ~in_tipo_diag;

			#5
			in_tipo_diag <= ~in_tipo_diag;
			in_a <= out_x2;
			in_b <= out_y1;
			#5
			in_tipo_diag <= ~in_tipo_diag;
			#5
			in_tipo_diag <= ~in_tipo_diag;
			in_a <= out_y3;
			in_b <= out_x1;

			#5
			clk_result <= ~clk_result;

			#500;

		$finish;
	end

endmodule
