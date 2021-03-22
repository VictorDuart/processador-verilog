module teste;
    
    reg [4:0]x;
    initial begin
      x = 5'b00001;
    end

    initial begin
      $display("x = %d", x);
    end


endmodule