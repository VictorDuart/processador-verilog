`include "ULA.v"

module ULA_tb;
    reg clock;
    reg [31:0]entrada1;
    reg [31:0]entrada2;
    reg [2:0]ALUControl;

    wire zero;
    wire [31:0]resultado;

    initial begin
      $monitor("clock=%b, entrada 1=%b, entrada 2=%b, ALUControl=%b, zero=%b, resultado=%b", clock, entrada1, entrada2, ALUControl, zero, resultado);
      clock = 0;
      #5 entrada1 <= 32'b00000000000000000000000000000001;
      entrada2 <= 32'b00000000000000000000000000000010;
      ALUControl <= 3'b010;
      #5 entrada1 <= 32'b00000000000000000000000000000001;
      entrada2 <= 32'b00000000000000000000000000000001;
      ALUControl <= 3'b110;
      #10 $finish;
    end
    
    always begin
      #5 clock = !clock;
    end

    ULA U0(clock, entrada1, entrada2, ALUControl, zero, resultado);

endmodule