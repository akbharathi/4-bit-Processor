//module tb_cpu4;

//  // Inputs
//  reg clk;
//  reg reset;

//  // Outputs
//  wire [3:0] pc;
//  wire [3:0] r0, r1, r2, r3; // Register outputs
//  wire halt;

//  // Instantiate the CPU
//  cpu4 cpu_inst(
//    .clk(clk),
//    .reset(reset),
//    .pc(pc),
//    .r0(r0),
//    .r1(r1),
//    .r2(r2),
//    .r3(r3),
//    .halt(halt)
//  );

//  // Clock Generation (50MHz clock)
//  always begin
//    #10 clk = ~clk; // Toggle clock every 10ns for 50MHz
//  end

//  // Initialize Signals and Apply Test Cases
//  initial begin
//    clk = 0;
//    reset = 1; // Apply reset initially

//    // Wait for a few clock cycles to ensure reset
//    #30;
//    reset = 0; // Release reset

//    // Test Case 1: MOV R0, 3 (instruction at address 0)
//    #40; // Wait for 2 clock cycles (Instruction fetch and execute)

//    // Test Case 2: MOV R1, 5 (instruction at address 1)
//    #40; // Wait for 2 clock cycles

//    // Test Case 3: ADD R0, R1 (instruction at address 2)
//    #40; // Wait for 2 clock cycles

//    // Test Case 4: HLT (instruction at address 3)
//    #40; // Wait for 2 clock cycles

//    // Allow a short delay to stabilize before ending simulation
//    #50;
//    $finish;
//  end

//  // Stop simulation automatically when halt is reached
//  always @(posedge clk) begin
//    if (halt) begin
//      $finish;
//    end
//  end

//endmodule

module tb_cpu4;

  // Inputs
  reg clk;
  reg reset;

  // Outputs
  wire [3:0] pc;
  wire [3:0] r0, r1, r2, r3; // Register outputs
  wire halt;

  // Instantiate the CPU
  cpu4 cpu_inst(
    .clk(clk),
    .reset(reset),
    .pc(pc),
    .r0(r0),
    .r1(r1),
    .r2(r2),
    .r3(r3),
    .halt(halt)
  );

  // Clock Generation (50MHz clock)
  always begin
    #10 clk = ~clk; // Toggle clock every 10ns
  end

  // Initialize Signals and Apply Extended Test Cases
  initial begin
    clk = 0;
    reset = 1; // Apply reset initially

    // Wait for a few clock cycles to ensure reset
    #30;
    reset = 0; // Release reset

    // Test Case 1: MOV R0, 3
    #30;

    // Test Case 2: MOV R1, 5
    #30;

    // Test Case 3: MOV R2, 2
    #30;

    // Test Case 4: MOV R3, 1
    #30;

    // Test Case 5: ADD R0, R1 (R0 = 3 + 5 = 8)
    #30;

    // Test Case 6: ADD R1, R2 (R1 = 5 + 2 = 7)
    #30;

    // Test Case 7: ADD R3, R0 (R3 = 1 + 8 = 9)
    #30;

    // Test Case 8: SUB R0, R3 (R0 = 8 - 9 = -1)
    #30;

    // Test Case 9: SUB R1, R0 (R1 = 7 - (-1) = 8)
    #30;

    // Test Case 10: HLT
    #30;

    // End simulation after short delay
    #40;
    $finish;
  end

  // Stop simulation automatically when halt is reached
  always @(posedge clk) begin
    if (halt) begin
      $finish;
    end
  end

endmodule

