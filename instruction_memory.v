module instruction_rom(
  input [3:0] addr,
  output [7:0] instruction
);

assign instruction = (addr == 4'd0) ? 8'b01000011 : // MOV R0, 3
                     (addr == 4'd1) ? 8'b01010101 : // MOV R1, 5
                     (addr == 4'd2) ? 8'b01100010 : // MOV R2, 2
                     (addr == 4'd3) ? 8'b01110001 : // MOV R3, 1
                     (addr == 4'd4) ? 8'b00000101 : // ADD R0, R1 (R0 = 3 + 5 = 8)
                     (addr == 4'd5) ? 8'b00001010 : // ADD R1, R2 (R1 = 5 + 2 = 7)
                     (addr == 4'd6) ? 8'b00011100 : // ADD R3, R0 (R3 = 1 + 8 = 9)
                     (addr == 4'd7) ? 8'b00100011 : // SUB R0, R3 (R0 = 8 - 9 = -1)
                     (addr == 4'd8) ? 8'b00110100 : // SUB R1, R0 (R1 = 7 - (-1) = 8)
                     (addr == 4'd9) ? 8'b01100000 : // HLT
                     8'b11000000; // Default halt instruction

endmodule
