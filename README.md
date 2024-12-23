# Low-Power-Configurable-Multi-Clock-System
### Project Overview
This project involves the complete RTL to GDS implementation of a Low Power Configurable Multi Clock Digital System, designed to perform various operations by receiving commands via a UART receiver. The system processes the commands to execute tasks such as reading/writing to a register file or performing computations using an Arithmetic Logic Unit (ALU). Results are sent back through a UART transmitter, utilizing an asynchronous FIFO to handle different clock rates and prevent data loss.

![SYS](https://github.com/user-attachments/assets/79dcbcb0-cae3-4b1b-9d20-b5187b94a56b)


### Features
**Multi-Clock System**: Supports multiple clock domains with mechanisms to avoid data corruption using synchronizers and asynchronous FIFO.\
**Low Power Design**: Incorporates clock gating and optimized timing paths to minimize power consumption.\
**Full ASIC Flow**: Includes RTL design, synthesis, timing analysis, and physical implementation phases.

### System Components
**ALU (Arithmetic Logic Unit)**: Performs arithmetic and logic operations.
**Register File**: Provides efficient storage for data with read/write capabilities.\
**Asynchronous FIFO**: Enables seamless data transfer across clock domains.\
**Integer Clock Divider**: Generates required clock frequencies.\
**Clock Gating**: Reduces power consumption by selectively turning off clock signals.\
**Synchronizers**: Ensures reliable communication across asynchronous domains.\
**Main Controller**: Manages the overall system operations and command execution.\
**UART Transmitter/Receiver**: Facilitates data exchange with external systems.

### Project Phases

#### **RTL Design**:
Designed system blocks (ALU, Register File, FIFO, Clock Divider, UART, etc.) from scratch using Verilog HDL.

#### Integration and Verification:
Integrated the system and verified functionality through a self-checking testbench.

#### Constraint Development:
Developed synthesis constraints using TCL scripts to guide design tools.

#### Synthesis and Optimization:
Synthesized the RTL design using Synopsys Design Compiler, ensuring optimized area, power, and performance.

#### Timing Analysis:
Identified and fixed setup and hold violations through timing analysis.

#### Equivalence Checking:
Verified functional equivalence between the RTL and the synthesized netlist using Synopsys Formality.

#### Physical Implementation:
Performed physical design using the ASIC flow, including floorplanning, placement, routing, and signoff, culminating in the generation of the GDSII file.

### Tools Used
**Synopsys Design Compiler**: For synthesis and optimization.\
**Synopsys Formality**: For equivalence checking.\
**ASIC Design Flow Tools**: For physical implementation and GDSII generation.

### Project Highlights
Achieved a low-power, high-performance design suitable for configurable multi-clock systems.\
Ensured robustness through asynchronous domain handling and verified through exhaustive testbenches.\
Completed a full ASIC design cycle, delivering a functional GDSII file ready for fabrication.\

### How to Run
Clone the repository
Set up the environment for the tools (Synopsys Design Compiler, Formality, etc.).
Run the provided TCL scripts for synthesis and timing analysis.
Use the testbenches in the verification folder to validate functionality.

