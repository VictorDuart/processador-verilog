module banco_registradores(clock, RegWrite, r1, r2, r3, dado_escrita, dado_lido1, dado_lido2);

    input clock;
    input RegWrite;
    input [4:0]r1;
    input [4:0]r2;
    input [4:0]r3;
    input [31:0]dado_escrita;

    output reg [31:0]dado_lido1;
    output reg [31:0]dado_lido2;

    reg [31:0]registradores[31:0]; //mips possui 32 registradores todos com 32 bits 

    initial begin
    registradores[0] = 32'b00000000000000000000000000000000;
    registradores[1] = 32'b00000000000000000000000000000001;
    registradores[2] = 32'b00000000000000000000000000000010;
    registradores[3] = 32'b00000000000000000000000000000100;
    registradores[4] = 32'b00000000000000000000000000001000;
    registradores[5] = 32'b00000000000000000000000000010000;
    registradores[6] = 32'b00000000000000000000000000100000;
    registradores[7] = 32'b00000000000000000000000001000000;
    registradores[8] = 32'b00000000000000000000000010000000;
    registradores[9] = 32'b00000000000000000000000100000000;
    registradores[10] = 32'b00000000000000000000000100000001;    
    registradores[11] = 32'b00000000000000000000000100000010;
    registradores[12] = 32'b00000000000000000000000100000100;
    registradores[13] = 32'b00000000000000000000000100001000;
    registradores[14] = 32'b00000000000000000000000100010000;
    registradores[15] = 32'b00000000000000000000000100100000;
    registradores[16] = 32'b00000000000000000000000101000000;
    registradores[17] = 32'b00000000000000000000001110000000;
    registradores[18] = 32'b00000000000000000000000100000011;
    registradores[19] = 32'b00000000000000000000000100001100;
    registradores[20] = 32'b00000000000000000000000100011000;
    registradores[21] = 32'b00000000000000000000000101100000;
    registradores[22] = 32'b00000000000000000000000111100000;
    registradores[23] = 32'b00000000000000000000000100011110;
    registradores[24] = 32'b00000000000010000000000100000010;
    registradores[25] = 32'b00000000000010001000000100000000;
    registradores[26] = 32'b00000000000000011000000100000000;
    registradores[27] = 32'b00000000000000111000000100000000;
    registradores[28] = 32'b00000000000000000001000100000000;
    registradores[29] = 32'b00000000000000000011000100000000;
    registradores[30] = 32'b00000000000000000111000100000000;
    registradores[31] = 32'b00000000000000000001000100000000;
    end

    always @ (posedge clock)begin
      dado_lido1 = registradores[r1];
      dado_lido2 = registradores[r2];
    end

    always @ (negedge clock)begin
      if(RegWrite == 1)begin
        registradores[r3] = dado_escrita;
      end
    end
      
endmodule