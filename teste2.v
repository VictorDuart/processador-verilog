module teste2;
    reg [4:0]palavra = 5'b00111;

    reg [1:0]silaba;

    initial begin
      silaba = palavra[1:0];
    end

    initial begin
      $display("silaba = %b", silaba);
    end

endmodule