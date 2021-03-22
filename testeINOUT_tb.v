`include "testeINOUT.v"

module testeINOUT_tb();
     reg t;

     initial begin
       $monitor("inout = %b", t);
       
     end

endmodule