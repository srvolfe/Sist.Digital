module g(
input [0:5] SW,
input [0:1] KEY,
input CLOCK_50,

output reg [0:6] HEX0,
output reg [0:6] HEX1,
output reg [0:6] HEX2,
output reg [0:6] HEX3

);

always @(posedge CLOCK_50) begin


//A
if (      (SW[0] == 1) && (SW[1] == 0) && (SW[2] == 0) && (SW[3] == 0) && (SW[4] == 0) && (SW[5] == 0) && KEY[0]==0) begin
HEX0[0] <= 0;
HEX0[1] <= 0;
HEX0[2] <= 0;
HEX0[3] <= 1;
HEX0[4] <= 0;
HEX0[5] <= 0;
HEX0[6] <= 0;
end

//B
else if ( (SW[0] == 1) && (SW[1] == 1) && (SW[2] == 0) && (SW[3] == 0) && (SW[4] == 0) && (SW[5] == 0)&& KEY[0]==0) begin

HEX0[0] <= 1;
HEX0[1] <= 1;
HEX0[2] <= 0;
HEX0[3] <= 0;
HEX0[4] <= 0;
HEX0[5] <= 0;
HEX0[6] <= 0;
end

//C
else if ( (SW[0] == 1) && (SW[1] == 0) && (SW[2] == 0) && (SW[3] == 1) && (SW[4] == 0) && (SW[5] == 0)&& KEY[0]==0) begin
HEX0[0] <= 0;
HEX0[1] <= 1;
HEX0[2] <= 1;
HEX0[3] <= 0;
HEX0[4] <= 0;
HEX0[5] <= 0;
HEX0[6] <= 1;
end

//D
else if ( (SW[0] == 1) && (SW[1] == 0) && (SW[2] == 0) && (SW[3] == 1) && (SW[4] == 1) && (SW[5] == 0)&& KEY[0]==0) begin

HEX0[0] <= 1;
HEX0[1] <= 0;
HEX0[2] <= 0;
HEX0[3] <= 0;
HEX0[4] <= 0;
HEX0[5] <= 1;
HEX0[6] <= 0;
end

//E
else if ( (SW[0] == 1) && (SW[1] == 0) && (SW[2] == 0) && (SW[3] == 0) && (SW[4] == 1) && (SW[5] == 0)&& KEY[0]==0) begin

HEX0[0] <= 0;
HEX0[1] <= 1;
HEX0[2] <= 1;
HEX0[3] <= 0;
HEX0[4] <= 0;
HEX0[5] <= 0;
HEX0[6] <= 0;
end

//F
else if ( (SW[0] == 1) && (SW[1] == 1) && (SW[2] == 0) && (SW[3] == 1) && (SW[4] == 0) && (SW[5] == 0)&& KEY[0]==0) begin

HEX0[0] <= 0;
HEX0[1] <= 1;
HEX0[2] <= 1;
HEX0[3] <= 1;
HEX0[4] <= 0;
HEX0[5] <= 0;
HEX0[6] <= 0;
end

//G
else if ( (SW[0] == 1) && (SW[1] == 1) && (SW[2] == 0) && (SW[3] == 1) && (SW[4] == 1) && (SW[5] == 0)&& KEY[0]==0) begin

HEX0[0] <= 0;
HEX0[1] <= 1;
HEX0[2] <= 0;
HEX0[3] <= 0;
HEX0[4] <= 0;
HEX0[5] <= 0;
HEX0[6] <= 0;
end

//H
else if ( (SW[0] == 1) && (SW[1] == 1) && (SW[2] == 0) && (SW[3] == 0) && (SW[4] == 1) && (SW[5] == 0)&& KEY[0]==0) begin

HEX0[0] <= 1;
HEX0[1] <= 0;
HEX0[2] <= 0;
HEX0[3] <= 1;
HEX0[4] <= 0;
HEX0[5] <= 0;
HEX0[6] <= 0;
end

//I
else if ( (SW[0] == 0) && (SW[1] == 1) && (SW[2] == 0) && (SW[3] == 1) && (SW[4] == 0) && (SW[5] == 0)&& KEY[0]==0) begin

HEX0[0] <= 1;
HEX0[1] <= 0;
HEX0[2] <= 0;
HEX0[3] <= 1;
HEX0[4] <= 1;
HEX0[5] <= 1;
HEX0[6] <= 1;
end

//J
else if ( (SW[0] == 0) && (SW[1] == 1) && (SW[2] == 0) && (SW[3] == 1) && (SW[4] == 1) && (SW[5] == 0)&& KEY[0]==0) begin

HEX0[0] <= 1;
HEX0[1] <= 0;
HEX0[2] <= 0;
HEX0[3] <= 0;
HEX0[4] <= 0;
HEX0[5] <= 1;
HEX0[6] <= 1;
end


//L
else if ( (SW[0] == 1) && (SW[1] == 1) && (SW[2] == 1) && (SW[3] == 0) && (SW[4] == 0) && (SW[5] == 0)&& KEY[0]==0) begin

HEX0[0] <= 1;
HEX0[1] <= 1;
HEX0[2] <= 1;
HEX0[3] <= 0;
HEX0[4] <= 0;
HEX0[5] <= 0;
HEX0[6] <= 1;
end

//M
else if ( (SW[0] == 1) && (SW[1] == 0) && (SW[2] == 1) && (SW[3] == 1) && (SW[4] == 0) && (SW[5] == 0)&& KEY[0]==0) begin

HEX0[0] <= 0;
HEX0[1] <= 1;
HEX0[2] <= 0;
HEX0[3] <= 1;
HEX0[4] <= 0;
HEX0[5] <= 1;
HEX0[6] <= 1;
end



//N
else if (      (SW[0] == 1) && (SW[1] == 0) && (SW[2] == 1) && (SW[3] == 1) && (SW[4] == 1) && (SW[5] == 0) && KEY[0]==0) begin
HEX0[0] <= 1;
HEX0[1] <= 1;
HEX0[2] <= 0;
HEX0[3] <= 1;
HEX0[4] <= 0;
HEX0[3] <= 0;
HEX0[4] <= 0;
HEX0[5] <= 0;
HEX0[6] <= 1;
end

//P
else if (      (SW[0] == 1) && (SW[1] == 1) && (SW[2] == 1) && (SW[3] == 1) && (SW[4] == 0) && (SW[5] == 0) && KEY[0]==0) begin
HEX0[0] <= 0;
HEX0[1] <= 0;
HEX0[2] <= 1;
HEX0[3] <= 1;
HEX0[4] <= 0;
HEX0[5] <= 0;
HEX0[6] <= 0;
end

//Q
else if (      (SW[0] == 1) && (SW[1] == 1) && (SW[2] == 1) && (SW[3] == 1) && (SW[4] == 1) && (SW[5] == 0) && KEY[0]==0) begin
HEX0[0] <= 0;
HEX0[1] <= 0;
HEX0[2] <= 0;
HEX0[3] <= 1;
HEX0[4] <= 1;
HEX0[5] <= 0;
HEX0[6] <= 0;
end

//R
else if (      (SW[0] == 1) && (SW[1] == 1) && (SW[2] == 1) && (SW[3] == 0) && (SW[4] == 1) && (SW[5] == 0) && KEY[0]==0) begin
HEX0[0] <= 1;
HEX0[1] <= 1;
HEX0[2] <= 1;
HEX0[3] <= 1;
HEX0[4] <= 0;
HEX0[5] <= 1;
HEX0[6] <= 0;
end

//S
else if (      (SW[0] == 0) && (SW[1] == 1) && (SW[2] == 1) && (SW[3] == 1) && (SW[4] == 0) && (SW[5] == 0) && KEY[0]==0) begin
HEX0[0] <= 0;
HEX0[1] <= 1;
HEX0[2] <= 0;
HEX0[3] <= 0;
HEX0[4] <= 1;
HEX0[5] <= 0;
HEX0[6] <= 0;
end

//T
else if (      (SW[0] == 0) && (SW[1] == 1) && (SW[2] == 1) && (SW[3] == 1) && (SW[4] == 1) && (SW[5] == 0) && KEY[0]==0) begin
HEX0[0] <= 1;
HEX0[1] <= 1;
HEX0[2] <= 0;
HEX0[3] <= 0;
HEX0[4] <= 0;
HEX0[5] <= 0;
HEX0[6] <= 0;
end

//U
else if (      (SW[0] == 1) && (SW[1] == 0) && (SW[2] == 1) && (SW[3] == 0) && (SW[4] == 0) && (SW[5] == 1) && KEY[0]==0) begin
HEX0[0] <= 1;
HEX0[1] <= 0;
HEX0[2] <= 0;
HEX0[3] <= 0;
HEX0[4] <= 0;
HEX0[5] <= 0;
HEX0[6] <= 1;
end

//V
else if (      (SW[0] == 1) && (SW[1] == 1) && (SW[2] == 1) && (SW[3] == 0) && (SW[4] == 0) && (SW[5] == 1) && KEY[0]==0) begin
HEX0[0] <= 1;
HEX0[1] <= 1;
HEX0[2] <= 0;
HEX0[3] <= 0;
HEX0[4] <= 0;
HEX0[5] <= 1;
HEX0[6] <= 1;
end

//W
else if (      (SW[0] == 0) && (SW[1] == 1) && (SW[2] == 1) && (SW[3] == 1) && (SW[4] == 1) && (SW[5] == 1) && KEY[0]==0) begin
HEX0[0] <= 1;
HEX0[1] <= 0;
HEX0[2] <= 1;
HEX0[3] <= 0;
HEX0[4] <= 1;
HEX0[5] <= 0;
HEX0[6] <= 1;
end

//X
else if (      (SW[0] == 1) && (SW[1] == 0) && (SW[2] == 1) && (SW[3] == 1) && (SW[4] == 0) && (SW[5] == 1) && KEY[0]==0) begin
HEX0[0] <= 1;
HEX0[1] <= 0;
HEX0[2] <= 1;
HEX0[3] <= 1;
HEX0[4] <= 0;
HEX0[5] <= 0;
HEX0[6] <= 0;
end



//Y
else if (      (SW[0] == 1) && (SW[1] == 0) && (SW[2] == 1) && (SW[3] == 1) && (SW[4] == 1) && (SW[5] == 1) && KEY[0]==0) begin
HEX0[0] <= 1;
HEX0[1] <= 0;
HEX0[2] <= 0;
HEX0[3] <= 0;
HEX0[4] <= 1;
HEX0[5] <= 0;
HEX0[6] <= 0;
end

//Z
else if (      (SW[0] == 1) && (SW[1] == 0) && (SW[2] == 1) && (SW[3] == 0) && (SW[4] == 1) && (SW[5] == 1) && KEY[0]==0) begin
HEX0[0] <= 0;
HEX0[1] <= 0;
HEX0[2] <= 1;
HEX0[3] <= 0;
HEX0[4] <= 0;
HEX0[5] <= 1;
HEX0[6] <= 0;
end


else begin
HEX0[0] <= 1;
HEX0[1] <= 1;
HEX0[2] <= 1;
HEX0[3] <= 1;
HEX0[4] <= 1;
HEX0[5] <= 1;
HEX0[6] <= 1;

HEX1[0] <= 1;
HEX1[1] <= 1;
HEX1[2] <= 1;
HEX1[3] <= 1;
HEX1[4] <= 1;
HEX1[5] <= 1;
HEX1[6] <= 1;

HEX2[0] <= 1;
HEX2[1] <= 1;
HEX2[2] <= 1;
HEX2[3] <= 1;
HEX2[4] <= 1;
HEX2[5] <= 1;
HEX2[6] <= 1;

HEX3[0] <= 1;
HEX3[1] <= 1;
HEX3[2] <= 1;
HEX3[3] <= 1;
HEX3[4] <= 1;
HEX3[5] <= 1;
HEX3[6] <= 1;

end

end


endmodule



