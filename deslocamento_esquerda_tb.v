`include "deslocamento_esquerda.v"

module deslocamento_esquerda_tb;
    reg clock;
    reg [31:0]sinal_original;
    wire [31:0]sinal_deslocado;

    initial begin
        $monitor("clock=%b, Sinal Original=%b, Sinal Deslocado=%b", clock, sinal_original, sinal_deslocado);
        clock = 0;
        #5 sinal_original = 32'b00000000000000000000000000000100;
        #5 sinal_original = 32'b00000000000000000000000000001000;
        #5 $finish;
    end

    always begin
      #5 clock = !clock;
    end

    deslocamento_esquerda UO(clock,sinal_original,sinal_deslocado);

endmodule 
