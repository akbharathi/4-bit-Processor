module cpu4(
  input clk,
  input reset,
  output [3:0] pc,
  output [3:0] r0,
  output [3:0] r1,
  output [3:0] r2,
  output [3:0] r3,
  output halt
);

wire [7:0] instr;
wire [2:0] opcode;
wire [1:0] rdst, rsrc;
wire [3:0] imm;
wire [3:0] rdata1, rdata2, alu_out;
wire wr_en;

//Program Counter
pc4 pc_counter(.clk(clk), .reset(reset), .en(~halt), .pc(pc));

// Instruction Fetch
instruction_rom rom(.addr(pc), .instruction(instr));

assign opcode = instr[7:5];
assign rdst   = instr[4:3];
assign rsrc   = instr[2:1];
assign imm    = {2'b00, instr[0], instr[0]}; // extend to 4-bit imm

assign wr_en = (opcode == 3'b000 || opcode == 3'b001 || opcode == 3'b010 || opcode == 3'b011);

// Register File
regfile4x4 regs(
  .clk(clk), .reset(reset),
  .wr_addr(rdst), .wr_en(wr_en), .wr_data(alu_out),
  .rd_addr1(rdst), .rd_addr2(rsrc),
  .rd_data1(rdata1), .rd_data2(rdata2),
  .r0(r0), .r1(r1), .r2(r2), .r3(r3)  
);

// ALU
alu4 alu(
  .A(rdata1),
  .B((opcode == 3'b011) ? imm : rdata2),
  .op(opcode),
  .result(alu_out)
);

// HALT
assign halt = (opcode == 3'b110);

endmodule