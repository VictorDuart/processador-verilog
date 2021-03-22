`include "banco_registradores.v"

module banco_registradores_tb;
    reg clock, RegWrite;
    reg [4:0]rs;
    reg [4:0]rt;
    reg [4:0]rd;
    reg [31:0]dado_escrita;

    wire [31:0]dado_lido1;
    wire [31:0]dado_lido2;

    initial begin
        $monitor("clock=%b, RegWrite=%b, rs=%b, rt=%b, rd=%b, dado_escrita=%b, dado1=%b, dado2=%b", clock, RegWrite, rs, rt, rd, dado_escrita, dado_lido1, dado_lido2);
        clock = 0;
        #5 RegWrite = 1'b1;
        rs = 5'b00001;
        rt = 5'b00011;
        rd = 5'b00100;
        dado_escrita = 32'b00000000000000000000000000001000;
        #5 rs = 5'b00100;
        rt = 5'b00100;
        rd = 5'b00110;
         dado_escrita = 32'b00000000000000000000000000001111;
        #5 $finish;
    end

    always begin
      #5 clock = !clock;
    end

    banco_registradores UO(clock, RegWrite, rs, rt, rd, dado_escrita, dado_lido1, dado_lido2);

endmodule // banco_registradores_tb