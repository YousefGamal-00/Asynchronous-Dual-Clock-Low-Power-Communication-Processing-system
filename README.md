# **Asynchronous-Dual-Clock-Low-Power-Communication-Processing-system**

## 📌 Project Description

This project demonstrates the **end-to-end ASIC design flow** starting from **RTL design** all the way to **GDSII generation**.
The system is designed to **receive commands** via a **UART receiver**, execute different functions such as:

* Register File read/write operations
* Processing using the **ALU block**

Results are transferred to the **UART transmitter** through an **asynchronous FIFO** to safely handle multiple clock domains and prevent data loss.

---

## 🏗️ Project Phases

### **1. RTL Design**

* Designed system blocks from scratch using **Verilog/SystemVerilog**:

  * ALU
  * Register File
  * Synchronous FIFO
  * Integer Clock Divider
  * Clock Gating
  * Synchronizers
  * Main Controller
  * UART TX
  * UART RX

### **2. Verification**

* Integrated all blocks into a complete SoC.
* Developed a **self-checking testbench Class-based**.
* Verified functionality through **constrained-random testing, assertions, and functional coverage**.

### **3. Synthesis**

* Applied design constraints using **TCL scripts**.
* Synthesized and optimized the RTL using **Synopsys Design Compiler**.

### **4. Timing Analysis**

* Performed **Static Timing Analysis (STA)**.
* Identified and fixed **setup and hold violations**.

### **5. Formal Verification**

* Verified functional equivalence between RTL and netlist using **Synopsys Formality**.
