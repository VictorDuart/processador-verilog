module ULA(clock, entrada1, entrada2, ALUControl, zero, resultado);
    input clock;
    input [31:0]entrada1;
    input [31:0]entrada2;
    input [2:0]ALUControl;

    output reg zero;
    output reg [31:0]resultado;

    always @(posedge clock or negedge clock)begin
      case(ALUControl)
        3'b010: resultado = entrada1 + entrada2;

        3'b110: resultado = entrada1 - entrada2;

        3'b000: resultado = entrada1 && entrada2;

        3'b001: resultado = entrada1 || entrada2;

        3'b111: if ((entrada1 - entrada2) < 0) begin
                    resultado = 32'b00000000000000000000000000000001;
                end else begin
                    resultado = 32'b00000000000000000000000000000000;
                end

        default: $display("Valor de ALUControl não suportada!");
      endcase

      if (resultado == 32'b00000000000000000000000000000000) begin
          zero = 1'b1;
      end
    end

endmodule // ULA