📌 Overview

This project implements the core components of a 32-bit CPU architecture using VHDL. Each module of the datapath and control system was designed, simulated, and verified using ModelSim.

The project demonstrates how a processor executes instructions through the interaction of memory, registers, ALU, and control logic.

🎯 Objectives
Design key CPU components in VHDL
Simulate and verify each module
Understand datapath and control interaction
Implement basic MIPS-like instruction execution

🧱 Architecture

The CPU consists of the following components:

Instruction Memory
Register File (8 × 32-bit)
ALU (Arithmetic Logic Unit)
Data Memory
ALU Control Unit
Main Control Unit

🔗 Data Flow
Instruction Memory → Control Unit → Register File → ALU → Data Memory
                              ↓
                        ALU Control
                        
⚙️ Implemented Instructions
R-Type
add
sub
and
or
slt

I-Type
addi
slti
lw
sw
beq

J-Type
j
jal

📁 Project Structure
src/
  alu_32.vhd
  data_memory_32.vhd
  register_file_32.vhd
  instruction_memory_32.vhd
  alu_control_32.vhd
  control_unit_32.vhd

testbench/
  tb_alu_32.vhd
  tb_data_memory_32.vhd
  tb_register_file_32.vhd
  tb_instruction_memory_32.vhd
  tb_alu_control_32.vhd
  tb_control_unit_32.vhd
  
🧪 Simulation

All modules were tested using ModelSim.

Example Commands
vcom src/alu_32.vhd
vcom testbench/tb_alu_32.vhd
vsim work.tb_alu_32
add wave *
run 200 ns
✅ Results

All modules were successfully verified:

✔ ALU operations (ADD, SUB, AND, OR, SLT)
✔ Memory read/write operations
✔ Register write and dual-read functionality
✔ Instruction fetch correctness
✔ ALU control signal mapping
✔ Control unit signal generation

Simulation waveforms confirmed correct behavior for all test cases.

⚠️ Challenges Faced
Signals showing “No Data” → Fixed by adding wave before simulation
Initial ‘X’ values (metavalue warning) → Fixed via signal initialization
Understanding ALU vs ALU Control → Separated responsibilities clearly
Instruction encoding → Used standard MIPS format

🚀 Future Improvements
Integrate all modules into a complete CPU
Implement pipelining
Add hazard detection and forwarding
Expand instruction set
Execute full programs (multi-cycle design)

🛠️ Tools Used
VHDL
ModelSim
VS Code

📚 References
Computer Organization and Architecture Lecture Notes
MIPS Architecture Documentation
IEEE VHDL Libraries (STD_LOGIC_1164, NUMERIC_STD)
ModelSim Documentation

👤 Author

Glenn AshiteyFio Ashitey & Jeffrey Somuah Sarpong

Computer Engineering Students

⭐ If you found this helpful

Feel free to star ⭐ the repo!
