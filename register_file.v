module regfile4x4(
  input clk,
  input reset,
  input [1:0] wr_addr,
  input wr_en,
  input [3:0] wr_data,
  input [1:0] rd_addr1,
  input [1:0] rd_addr2,
  output [3:0] rd_data1,
  output [3:0] rd_data2,
  output [3:0] r0,
  output [3:0] r1,
  output [3:0] r2,
  output [3:0] r3
);

wire [3:0] load;

assign load = (wr_en) ? (4'b0001 << wr_addr) : 4'b0000;

// FDREs for R0
FDRE #(.INIT(1'b0)) r0_0 (.C(clk), .R(reset), .CE(load[0]), .D(wr_data[0]), .Q(r0[0]));
FDRE #(.INIT(1'b0)) r0_1 (.C(clk), .R(reset), .CE(load[0]), .D(wr_data[1]), .Q(r0[1]));
FDRE #(.INIT(1'b0)) r0_2 (.C(clk), .R(reset), .CE(load[0]), .D(wr_data[2]), .Q(r0[2]));
FDRE #(.INIT(1'b0)) r0_3 (.C(clk), .R(reset), .CE(load[0]), .D(wr_data[3]), .Q(r0[3]));
// Repeat for r1
FDRE #(.INIT(1'b0)) r1_0 (.C(clk), .R(reset), .CE(load[1]), .D(wr_data[0]), .Q(r1[0]));
FDRE #(.INIT(1'b0)) r1_1 (.C(clk), .R(reset), .CE(load[1]), .D(wr_data[1]), .Q(r1[1]));
FDRE #(.INIT(1'b0)) r1_2 (.C(clk), .R(reset), .CE(load[1]), .D(wr_data[2]), .Q(r1[2]));
FDRE #(.INIT(1'b0)) r1_3 (.C(clk), .R(reset), .CE(load[1]), .D(wr_data[3]), .Q(r1[3]));
// r2
FDRE #(.INIT(1'b0)) r2_0 (.C(clk), .R(reset), .CE(load[2]), .D(wr_data[0]), .Q(r2[0]));
FDRE #(.INIT(1'b0)) r2_1 (.C(clk), .R(reset), .CE(load[2]), .D(wr_data[1]), .Q(r2[1]));
FDRE #(.INIT(1'b0)) r2_2 (.C(clk), .R(reset), .CE(load[2]), .D(wr_data[2]), .Q(r2[2]));
FDRE #(.INIT(1'b0)) r2_3 (.C(clk), .R(reset), .CE(load[2]), .D(wr_data[3]), .Q(r2[3]));
// r3
FDRE #(.INIT(1'b0)) r3_0 (.C(clk), .R(reset), .CE(load[3]), .D(wr_data[0]), .Q(r3[0]));
FDRE #(.INIT(1'b0)) r3_1 (.C(clk), .R(reset), .CE(load[3]), .D(wr_data[1]), .Q(r3[1]));
FDRE #(.INIT(1'b0)) r3_2 (.C(clk), .R(reset), .CE(load[3]), .D(wr_data[2]), .Q(r3[2]));
FDRE #(.INIT(1'b0)) r3_3 (.C(clk), .R(reset), .CE(load[3]), .D(wr_data[3]), .Q(r3[3]));

// MUX for rd_data1 and rd_data2
assign rd_data1 = (rd_addr1 == 2'b00) ? r0 :
                  (rd_addr1 == 2'b01) ? r1 :
                  (rd_addr1 == 2'b10) ? r2 : r3;

assign rd_data2 = (rd_addr2 == 2'b00) ? r0 :
                  (rd_addr2 == 2'b01) ? r1 :
                  (rd_addr2 == 2'b10) ? r2 : r3;

endmodule