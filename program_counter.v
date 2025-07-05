module pc4(
  input clk,
  input reset,
  input en,
  output [3:0] pc
);

wire [3:0] next;
assign next = pc + 1;

// FDRE: D-type flip-flop with an active-high clock enable (CE) & synchronous active-high reset (R)
FDRE #(.INIT(1'b0)) pc0 (.C(clk), .R(reset), .CE(en), .D(next[0]), .Q(pc[0]));
FDRE #(.INIT(1'b0)) pc1 (.C(clk), .R(reset), .CE(en), .D(next[1]), .Q(pc[1]));
FDRE #(.INIT(1'b0)) pc2 (.C(clk), .R(reset), .CE(en), .D(next[2]), .Q(pc[2]));
FDRE #(.INIT(1'b0)) pc3 (.C(clk), .R(reset), .CE(en), .D(next[3]), .Q(pc[3]));

endmodule