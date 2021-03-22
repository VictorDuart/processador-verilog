module PC(clock, entrada, saida);

input [31:0]entrada;
input clock;

output reg [31:0]saida = 0;

always @ (posedge clock or negedge clock)begin
  saida = entrada;
end

endmodule