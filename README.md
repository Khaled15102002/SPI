# SPI Slave with Single-Port RAM (FPGA Design)

## 📖 Overview
This project implements an **SPI Slave interface with a Single-Port RAM** on FPGA.  
The SPI slave was designed using an FSM with multiple encoding techniques (Gray, One-Hot, Sequential) to evaluate timing and performance.  
RTL was written in Verilog, verified with QuestaSim, and synthesized/implemented in Vivado, achieving timing closure and error-free linting.

## ⚙️ Features
- SPI Slave interface (MISO, MOSI, SS_n, SCLK)
- Integrated Single-Port RAM for read/write operations
- FSM-based design with configurable encoding:
  - Gray Encoding  
  - One-Hot Encoding  
  - Sequential Encoding  
- Highest frequency implementation selected based on timing analysis
- Debug core added to observe internal signals (MISO, MOSI, SS_n, clk, rst_n)

## 🛠️ Tools & Technologies
- **Language:** Verilog HDL  
- **Simulation:** QuestaSim (functional verification & waveform analysis)  
- **Synthesis/Implementation:** Vivado (schematic, timing, utilization)  
- **Target Device:** Xilinx FPGA (xc7a200tffg1156-3)  

## 🚀 Deliverables
- RTL & Testbench code  
- Simulation waveforms  
- Constraint file (switches for `rst_n`, `SS_n`, `MOSI` and LED for `MISO`)  
- FSM encoding reports (Gray, One-Hot, Sequential)  
- Schematic, utilization, and timing reports  
- Bitstream file generation  
- Linting results (no errors)  
 

## 🖥️ Simulation & Results
- [PDF Report](https://github.com/Khaled15102002/SPI/blob/main/SPI%20Slave%20With%20single%20Port%20RAM.pdf) 

## 📌 Steps 
- [PDF](https://github.com/Khaled15102002/SPI/blob/main/SPI.pdf) 

