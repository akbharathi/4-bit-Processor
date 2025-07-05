module alu4(
  input [3:0] A, B,
  input [2:0] op,
  output [3:0] result
);

assign result = (op == 3'b000) ? A | B :
                (op == 3'b001) ? A & B :
                (op == 3'b010) ? A ^ B:
                (op == 3'b011) ? ~B :
                4'b0000;

endmodule