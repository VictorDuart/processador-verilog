module deslocamento_esquerda(clock, sinal_original, sinal_deslocado);

    input clock;
    input [31:0]sinal_original;
    output reg [31:0]sinal_deslocado;

    always @ (posedge clock or negedge clock)begin
      sinal_deslocado = sinal_original<<2;
    end
endmodule //deslocamento_esquerda
