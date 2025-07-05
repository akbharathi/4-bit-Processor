# 4-bit Processor Design

### Simple CPU Architecture with Verilog HDL

---

## 📄 Project Overview

This project implements a **4-bit simple processor** using Verilog HDL. The processor supports basic arithmetic operations, register transfers, and a halt instruction. It includes essential components such as:

* **Program Counter**
* **Instruction ROM**
* **Register File**
* **4-bit ALU**
* **Testbench for verification**

The processor sequentially fetches instructions from a hardcoded instruction memory, executes register and ALU operations, and halts based on the instruction sequence.

---

## 🖥️ Processor Components

### 1. `cpu4` - CPU Core

The top-level module integrates all components:

* **Program Counter (PC)**: Handles instruction sequencing.
* **Instruction ROM**: Stores the predefined instruction set.
* **Register File (4x4)**: Contains four general-purpose 4-bit registers.
* **ALU**: Performs bitwise and arithmetic operations.
* **Control Logic**: Decodes instructions and manages write enables.
* **Halt Logic**: Stops the processor when the halt instruction is executed.

---

### 2. `pc4` - Program Counter

* Increments the PC by one on each clock cycle.
* Supports synchronous reset and clock enable.

---

### 3. `instruction_rom` - Instruction Memory

* Hardcoded with a sequence of instructions.
* Example operations:

  * `MOV` immediate values to registers.
  * `ADD` and `SUB` register contents.
  * `HLT` instruction to stop execution.

---

### 4. `regfile4x4` - Register File

* Four 4-bit registers.
* Supports synchronous writes and dual read ports.
* Fully functional with selective write enable.

---

### 5. `alu4` - 4-bit ALU

* Supports bitwise OR, AND, XOR, and NOT operations.
* Receives control signals from the decoded opcode.

---

## ✅ Supported Instructions

| Opcode (3 bits) | Instruction | Operation                     |
| --------------- | ----------- | ----------------------------- |
| `000`           | ADD         | Addition between registers    |
| `001`           | SUB         | Subtraction between registers |
| `010`           | XOR         | Bitwise XOR                   |
| `011`           | MOV         | Move immediate to register    |
| `110`           | HLT         | Halt processor                |

---

## 🧪 Testbench: `tb_cpu4`

* Simulates the processor with multiple test cases.
* Instructions executed:

  1. Move immediate values to registers.
  2. Perform multiple additions.
  3. Perform multiple subtractions.
  4. Halt the processor.

### Test Sequence:

| Step | Operation                       |
| ---- | ------------------------------- |
| 1    | MOV R0, 3                       |
| 2    | MOV R1, 5                       |
| 3    | MOV R2, 2                       |
| 4    | MOV R3, 1                       |
| 5    | ADD R0, R1 → R0 = 8             |
| 6    | ADD R1, R2 → R1 = 7             |
| 7    | ADD R3, R0 → R3 = 9             |
| 8    | SUB R0, R3 → R0 = -1            |
| 9    | SUB R1, R0 → R1 = 8             |
| 10   | HLT (Processor halts execution) |

---

## ⚙️ Simulation Details

* **Clock Frequency:** 50 MHz (20 ns period)
* **Simulation Steps:** Instruction fetch and execution every 30-40 ns.
* **Automatic Halt Detection:** Simulation terminates upon `halt` signal.

---

## 📂 File Structure

```text
├── cpu4.v             # CPU Top Module
├── pc4.v              # Program Counter
├── instruction_rom.v  # Instruction Memory
├── regfile4x4.v       # Register File
├── alu4.v             # Arithmetic Logic Unit
├── tb_cpu4.v          # Testbench
└── README.md          # Project Description
```

---

## 🚀 How to Run

1. Load all Verilog files into your simulator (ModelSim, Vivado, etc.).
2. Run the `tb_cpu4` testbench.
3. Observe the register outputs and the `halt` signal progression.
4. Simulation automatically ends when the processor halts.

---

## ✨ Key Features

* Basic 4-bit instruction set
* Multi-register architecture
* Instruction sequencing with Program Counter
* Comprehensive test cases for functional verification
* Clean and modular design

