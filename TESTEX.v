`include "muxALUSrc.v"
`include "muxRegDest.v"
`include "somador.v"
`include "deslocamento_esquerda.v"
`include "ALUControl.v"
`include "ULA.v"

module EX();

reg clock;
//entradas do módulo
reg [31:0]PC4;
reg [31:0]dado1ALU;
reg [31:0]dado2ALU;
reg [31:0]endereco;
reg [4:0]reg2;
reg [4:0]reg3;
reg ALUSrc_EX;
reg [5:0]functEx;
reg [1:0]ALUOpEx;
reg regDestEx;

//saidas dos modulos internos
wire [31:0]enderecoSHIFT;
wire [31:0]saidaMuxALUSrc;
wire [2:0]saidaULAControl;
wire [4:0]RD;
wire [31:0]saidaSomador;
wire [31:0]saidaULA;
wire zeroEx;

//nitial begin
//  functEx = endereco[5:0];
//end

initial begin
  $monitor("clock = %b \n dado1 = %b \n dado2 = %b \n saida ULA = %b \n", clock, dado1ALU, dado2ALU, saidaULA, RD);
          clock = 0;
          #5 PC4 =  32'b00000000000000000000000001010101;
          ALUSrc_EX = 0;
          ALUOpEx = 2'b00;
          regDestEx = 0;
          reg2 = 5'b00010;
          reg3 = 5'b00011;
          dado1ALU = 32'b00000000000000000000000000000001;
          dado2ALU = 32'b00000000000000000000000000000001;
          endereco = 32'b00000000000000000000000000100000;
          functEx = endereco[5:0];
          #20 clock = 0;
          $finish;
end

initial begin
  #5 clock = ~clock;
end

deslocamento_esquerda desloca(.clock(clock), .sinal_original(endereco), .sinal_deslocado(enderecoSHIFT));

somador soma(.clock(clock), .entrada1(PC4), .entrada2(enderecoSHIFT), .resultado(saidaSomador));

muxALUSrc muxALUSrcEx(.clock(clock), .dado1(dado2ALU), .dado2(endereco), .ALUSrc(ALUSrc_EX), .saida(saidaMuxALUSrc));

ALUControl ALUCtrl(.clock(clock), .funct(functEx), .ALUOp(ALUOpEx), .saida(saidaULAControl));

muxRegDest muxRD(.clock(clock), .r1(reg2), .r2(reg3), .regDest(regDestEx), .saida(RD));

ULA ulaEx(.clock(clock), .entrada1(dado1ALU), .entrada2(dado2ALU), .ALUControl(saidaULAControl), .zero(zeroEx), .resultado(saidaULA));




endmodule