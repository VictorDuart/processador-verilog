`include "banco_registradores.v"
`include "extensor16_32.v"

module ID(clock, instrucao, PC4ID, RD, EscReg, WB, saida1, saida2, PC4ID_out, sinal32saida, reg1, reg2, reg3);

input clock;
input [31:0]instrucao;
input [4:0]RD;
input EscReg;
input [31:0]WB;
input [31:0]PC4ID;

output reg [4:0]reg1;
output reg [4:0]reg2;
output reg [4:0]reg3;
reg [15:0]sinal16entrada;

output [31:0]saida1;
output [31:0]saida2;
output [31:0]sinal32saida;
output reg [31:0]PC4ID_out;

always @(posedge clock or negedge clock)begin
  reg1 = instrucao[25:21];
  reg2 = instrucao[20:16];
  reg3 = instrucao[15:11];
  sinal16entrada = instrucao[15:0];
  PC4ID_out = PC4ID;
end

banco_registradores banco(.clock(clock), .RegWrite(EscReg), .r1(reg1), .r2(reg2), .r3(RD), .dado_escrita(WB), .dado_lido1(saida1), .dado_lido2(saida2));

extensor16_32 extensor(.clock(clock), .sinal16(sinal16entrada), .sinal32(sinal32saida));

/*initial begin
    $monitor("clock = %b \n registrador1 = %b \n registrador2 = %b \n registradordestino = %b \n dado escrito = %b \n dado 1 = %b, dado 2 = %b, sinal extendido = %b", clock, reg1, reg2, RD, WB, saida1, saida2, sinal32saida);
    clock = 0;
    EscReg = 0;
    //#5 instrucao = 32'b00000000001000100000000000000001;
    #5 RD = 32'b00000;
    //WB = 32'b00000000001000100000000000000000;
    
    #40 $finish;
end

always begin
  #5 clock = ~clock;
end*/

//banco_registradores banco(.clock(clock), .RegWrite(EscReg), .r1(reg1), .r2(reg2), .r3(RD), .dado_escrita(WB), .dado_lido1(saida1), .dado_lido2(saida2));

//extensor16_32 extensor(.clock(clock), .sinal16(sinal16entrada), .sinal32(sinal32saida));

endmodule