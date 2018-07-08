module Somador(

	input clk, // clock para acumular multiplicações da diagonal principal (dp)
	input in_tipo_diag, // clock para acumular multiplicações da diagonal secundária (ds)
	input clk_result, // clock para subtrair a diagonal secundária da principal (dp - ds) 

	// Variáveis referentes as multiplicações 
	// das coordenadas no cálculo da determinante 
	input [15:0] in_a,
	input [15:0] in_b,
	
	input [15:0] in_a1,
	input [15:0] in_b1,
	
	input [15:0] in_a2,
	input [15:0] in_b2,
	
	input [15:0] in_a3,
	input [15:0] in_b3,

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
	output[15:0] out_y3,

	// D = (x4,y4)
	output[15:0] out_x4,
	output[15:0] out_y4
);
	//Area MAIOR
	reg [15:0] reg_s = 0; // dp
	reg [15:0] reg_s2 = 0; // ds
	reg [15:0] reg_result = 0; // dp - ds
	
	//Area DAB
	reg [15:0] reg_dab_p = 0; // dp
	reg [15:0] reg_dab_s = 0; // ds
	reg [15:0] reg_result_dab = 0; // dp - ds
	//Area DAC
	reg [15:0] reg_dac_p = 0; // dp
	reg [15:0] reg_dac_s = 0; // ds
	reg [15:0] reg_result_dac = 0; // dp - ds
	//Area DBC
	reg [15:0] reg_dbc_p = 0; // dp
	reg [15:0] reg_dbc_s = 0; // ds
	reg [15:0] reg_result_dbc = 0; // dp - ds

	// A = (x1,y1)
	reg [15:0] reg_x1 = 1; // coordenada do eixo x do ponto A do triângulo
	reg [15:0] reg_y1 = 2; // coordenada do eixo y do ponto A do triângulo
	  
	// B = (x2,y2)
	reg [15:0] reg_x2 = 3; // coordenada do eixo y do ponto B do triângulo
	reg [15:0] reg_y2 = 4; // coordenada do eixo y do ponto B do triângulo

	// C = (x3,y3)
	reg [15:0] reg_x3 = 5; // coordenada do eixo y do ponto C do triângulo
	reg [15:0] reg_y3 = 3; // coordenada do eixo y do ponto C do triângulo
	
	// D = (x4,y4)
	reg [15:0] reg_x4 = 0; // coordenada do eixo y do ponto C do triângulo
	reg [15:0] reg_y4 = 0; // coordenada do eixo y do ponto C do triângulo

	assign out_s  = reg_s; 
	assign out_s2  = reg_s2;
	assign out_result = reg_result;
	  
	assign out_x1 = reg_x1;
	assign out_y1 = reg_y1;

	assign out_x2 = reg_x2;
	assign out_y2 = reg_y2;

	assign out_x3 = reg_x3;
	assign out_y3 = reg_y3;
	
	assign out_x4 = reg_x4;
	assign out_y4 = reg_y4;
	
	
	always @(posedge clk)begin   
		reg_s      <= reg_s  + (in_a * in_b);
		reg_dab_p <= reg_dab_p + (in_a1 * in_b1); 
		reg_dac_p <= reg_dac_p + (in_a2 * in_b2); 
		reg_dbc_p <= reg_dbc_p + (in_a3 * in_b3); 
		
	end
	
	always @(posedge in_tipo_diag) begin
		reg_s2     <= reg_s2 + (in_a * in_b);
		reg_dab_s <= reg_dab_s + (in_a1 * in_b1); 
		reg_dac_s <= reg_dac_s + (in_a2 * in_b2); 
		reg_dbc_s <= reg_dbc_s + (in_a3 * in_b3); 
		
	end
	
	always @(posedge clk_result)
	begin
		if(reg_s > reg_s2)
			reg_result <= reg_s  - reg_s2;
		else
			reg_result <= reg_s2  - reg_s;
	end
	
	
	//DAB	
	always @(posedge clk_result)
	begin
		if(reg_dab_p > reg_dab_s)
			reg_result_dab <= reg_dab_p  - reg_dab_s;
		else
			reg_result_dab <= reg_dab_s  - reg_dab_p;
	end
	
//DAC		
	always @(posedge clk_result)
	begin
		if(reg_dac_p > reg_dac_s)
			reg_result_dac <= reg_dac_p  - reg_dac_s;
		else
			reg_result_dac <= reg_dac_s  - reg_dac_p;
	end
	
	
		//DBC
	always @(posedge clk_result)
	begin
		if(reg_dab_p > reg_dab_s)
			reg_result_dbc <= reg_dbc_p  - reg_dbc_s;
		else
			reg_result_dbc <= reg_dbc_s  - reg_dbc_p;
	end
	

endmodule

module test;

	reg clk;
	reg in_tipo_diag;
	reg clk_result;
	reg[15:0] in_a, in_b, in_a1, in_b1, in_a2, in_b2, in_a3, in_b3;

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
	
	//ponto D
	wire[15:0] out_x4;
	wire[15:0] out_y4;
	
	
  
	Somador A(
		clk, 
		in_tipo_diag,
		clk_result,
		in_a,
		in_b,
		in_a1,
		in_b1,
		in_a2,
		in_b2,
		in_a3,
		in_b3,
		out_s,
		out_s2,
		out_result,
		out_x1,
		out_y1,
		out_x2, 
		out_y2,
		out_x3,
		out_y3,
		out_x4,
		out_y4 	
		
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
				//DAB
				in_a1 <= out_x4;
				in_b1 <= out_y1;
				//DAC
				in_a2 <= out_x4;
				in_b2 <= out_y1; 
				//DBC
				in_a3 <= out_x4;
				in_b3 <= out_y2;


			#5			
			clk <= ~clk;
			#5
			clk <= ~clk;
			in_a <= out_x2;
			in_b <= out_y3;
				//DAB
				in_a1 <= out_x1;
				in_b1 <= out_y2;
				//DAC
				in_a2 <= out_x1;
				in_b2 <= out_y3;
				//DBC
				in_a3 <= out_y3;
				in_b3 <= out_x2;

			#5
			clk <= ~clk;

			#5
			clk <= ~clk;
			in_a <= out_y1;
			in_b <= out_x3;
				//DAB
				in_b1 <= out_x2;
				in_a1 <= out_y4;
				
				//DAC
				in_a2 <= out_x3;
				in_b2 <= out_y4;
				//DBC
				in_a3 <= out_y4;
				in_b3 <= out_x3;

			#5
			clk <= ~clk;


			//diagonal secundária
			#5
			in_tipo_diag <= 1;
			in_a <= out_x3;
			in_b <= out_y2;
				//DAB
				in_a1 <= out_x2;
				in_b1 <= out_y1;
				//DAC
				in_a2 <= out_y1;
				in_b2 <= out_x3;
				//DBC
				in_a3 <= out_x3;
				in_b3 <= out_y2;

			#5
			in_tipo_diag <= ~in_tipo_diag;

			#5
			in_tipo_diag <= ~in_tipo_diag;
			in_a <= out_x2;
			in_b <= out_y1;
				//DAB
				in_a1 <= out_x1;
				in_b1 <= out_y4;
				//DAC
				in_a2 <= out_y4;
				in_b2<= out_x1;
				//DBC
				in_a3 <= out_x2;
				in_b3 <= out_y4;
			#5
			in_tipo_diag <= ~in_tipo_diag;
			#5
			in_tipo_diag <= ~in_tipo_diag;
			in_a <= out_y3;
			in_b <= out_x1;
				//DAB
				in_a1 <= out_x4;
				in_b1 <= out_y2;
				//DAC
				in_a2 <= out_y3;
				in_b2 <= out_x4;
				//DBC
				in_a3 <= out_y3;
				in_b3 <= out_x4;

			#5
			clk_result <= ~clk_result;

			#500;

		$finish;
	end

endmodule
//-------------------------------
module Vga (
  	input CLOCK_50,
  	output [3:0] VGA_R,
  	output [3:0] VGA_G,
	output [3:0] VGA_B,
 	output VGA_HS,
	output VGA_VS);

reg [10:0] cx = 0;
reg [9:0]  cy = 0;


assign VGA_R = v ? 4'hf : 4'b0;
assign VGA_G = v ? (q ? 4'hf : 4'h0) : 4'b0;
assign VGA_B = v ? 4'h0 : 4'b0;

wire v = (cx >= 285) & (cx < 1555) & (cy >= 35) & (cy < 515);

wire q = (cx );

assign VGA_HS = cx >= 190;
assign VGA_VS = cy >= 2;

always @(posedge CLOCK_50) begin
	if (cx == 1585) 
    begin
        if (cy == 525) begin
			cy <= 0;
        end
		else 
			cy <= cy + 1;
		cx <= 0;
	end
    else 
    begin			
        // cy <= cy;
		cx <= cx + 1;
    end
end


endmodule
