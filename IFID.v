module IFID(clock, PC4IF, instrucaoIF, PC4ID, instrucaoID);
    input clock;
    input [31:0]PC4IF;
    input [31:0]instrucaoIF;

    output reg [31:0]PC4ID;
    output reg [31:0]instrucaoID;

    always @(posedge clock)begin
      PC4ID = PC4IF;
      instrucaoID = instrucaoIF;
    end

endmodule 