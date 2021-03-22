`include "banco_registradores.v"
`include "extensor16_32.v"

module ID_novo(clock, rs, rt, rd, funct, address, adressjump, PC4ID, WB, WriteRegister, regWrite, dadolido1, dadolido2, sinalextendido, 
                rt_mux, rd_mux, rs_fw, rt_fw, PC4ID_out);

input clock;
input [4:0]rs;
input [4:0]rt;
input [4:0]rd;
input [5:0]funct;
input [15:0]address;
input [25:0]adressjump;
input [31:0]PC4ID;
input [31:0]WB;
input [4:0]WriteRegister;
input regWrite;

output [31:0]dadolido1;
output [31:0]dadolido2;
output [31:0]sinalextendido;
output reg [4:0]rt_mux;
output reg [4:0]rd_mux;
output reg [4:0]rs_fw;
output reg [4:0]rt_fw;
output reg [31:0]PC4ID_out;

initial begin
  rt_mux = rt;
  rt_fw = rt;
  rd_mux = rd;
  rs_fw = rs;
  PC4ID_out = PC4ID;
end




//input [31:0]WB;



banco_registradores banco(.clock(clock), .RegWrite(regWrite), .r1(rs), .r2(rt), .r3(rd), .dado_escrita(WB), .dado_lido1(dadolido1), .dado_lido2(dadolido2));

extensor16_32 extensor(.clock(clock), .sinal16(address), .sinal32(sinalextendido));

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