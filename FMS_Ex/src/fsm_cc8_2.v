module fsm_cc8_2
(output reg y1, y2, y3,
input jmp, go, sk0, sk1, clk, rst_n);
parameter S0 = 4'b0000,
S1 = 4'b0001,
S2 = 4'b0010,
S3 = 4'b0011,
S4 = 4'b0100,
S5 = 4'b0101,
S6 = 4'b0110,
S7 = 4'b0111,
S8 = 4'b1000,
S9 = 4'b1001;
reg [3:0] state, next;
always @(posedge clk or negedge rst_n)
if (!rst_n) state <= S0;
else state <= next;
always @(state or jmp or go or sk0 or sk1) begin
next = 4'bx;
y1 = 1'b0;
y2 = 1'b0;
y3 = 1'b0;
case (state)
S0 : if (!go) next = S0;
else if (jmp) next = S3;
else next = S1;
S1 : begin
y2 = 1'b1;
if (jmp) next = S3;
else next = S2;
end
S2 : if (jmp) next = S3;
else next = S9;
S3 : begin
y1 = 1'b1;
y2 = 1'b1;
if (jmp) next = S3;
else next = S4;
end
S4 : if (jmp) next = S3;
else if (sk0 && !jmp) next = S6;
else next = S5;
S5 : if (jmp) next = S3;
else if (!sk1 && !sk0 && !jmp) next = S6;
else if (!sk1 && sk0 && !jmp) next = S7;
else if ( sk1 && !sk0 && !jmp) next = S8;
else next = S9;
S6 : begin
y1 = 1'b1;
y2 = 1'b1;
y3 = 1'b1;
if (jmp) next = S3;
else if (go && !jmp) next = S7;
else next = S6;
end
S7 : begin
y3 = 1'b1;
if (jmp) next = S3;
else next = S8;
end
S8 : begin
y2 = 1'b1;
y3 = 1'b1;
if (jmp) next = S3;
else next = S9;
end
S9 : begin
y1 = 1'b1;
y2 = 1'b1;
y3 = 1'b1;
if (jmp) next = S3;
else next = S0;
end
endcase
end
endmodule
