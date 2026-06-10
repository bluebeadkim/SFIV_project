# Sensor Data Calibration & Stuck-At Fault Injection Safety Verification

## 1. Project Overview
### Project Overview
- **Description:** This project focuses on desiging a digital core that detects and corrects signal disortion and internal hardware defects (Stuck-at Faults) occuring at the post-stage of a sensor AFE. The ultimate goal is to independently bulid a functional safety fault injection verification framework leveraging pure Verilog testbench structural consructs 

- **Key Features:**
    - **ECC Hamming code:** Real-time 1-bit error correction (SEC) and 2-bit error detection (DED) during data transmission and buffering
    - **TMR (Triple Modular Redundancy):** Triplication of critical control registers combined with majority voter logic to mask physical hardware failures.
    - **Fault Injection Task:** Automated verification environment capable of randomly injecting Stuck-at-0/1 faults during runtime utilizing 'force' and 'release' statemenrs.

### Tech Stack
- **Hardware Description Language (HDL):** Verilog / System Verilog
- **Simulation Engine:** Icarus Verilog('iverilog')
- **Waveform Viewer:** GTKWave
- **Operating System Environmnet:** Ubuntu Linux 26.04 LTS (VirtualBox)

### Collaboration & Project Tracking Tools
- **Version Control:** Git/GitHub
- **Progress Tracking:** GitHub Repositoty Documentation

## 2. Development Environment Setup
### Environment Setup Guide
- **Prerequisite Software:**
    - 'iverilog' (Icarus Verilog Compiler)
    - 'gtkwave' (VCD Waveform Viewer)
- **Recommended IDE & Extensions:**
    - 'Vim'
    - VS code Extension: Verilog-HDL/SystemVerilog/OpenVera

### Project Installation & Execution
- **Environment installation:**
    '''bash
    sudo apt update
    sudo apt install iverilog gtkwave -y

## 3. Directory Structure
.
    - .git/             # Git repository history & configuration 
    - .sensor logic.v   # Design Under Test (DUT) - Sensor digital core loigc
    - tb sensor logic.v # Testbench containing fault injection tasks&scenarios
    - pipeline test.vcd # Generated waveform simulaion data (Temporary)
    - README.md         # project documentation & engineering logs

## 4. Core Code & Verification Matrix
### Key Modules & Testbench Overview
    - **sensor_logic.v**
        : Implements the main buffer registry to latch raw sensor digital input synchronously.
        : Integration of Hamming SEC-DED annd TMR registers.
    - **tb_sensor_logic.v**
        : Generates the 50MHz test clock and manages system initialization 
        : Implements runtime fault simulation using Verilog structural 'force' and 'release' statements.

### Project Progress
    - Establish devlopement and verification environment [v]
    - Link remote GitHub repository with local VirtualBox environment [v]
    - Implement basic And/Buffer gate fault injection test [v]
    - DUT RTL Design (Implement Hamming Code ECC Encoder/Decoder and TMR circuits)
    - Advace testbench architecture using customized fault injection 'task' blocks
    - Quantitative reliability analysis (Derive final Fault Coverage Matrix table) 
### Verification Matrix
    ScenarioID      |TargetNode         |InjectedFaultType      |SafetyMechanism    |ErrorDetection     |OutputIntegrity    |Result(P/F)
    TC-01           |dut.filtere data out[0]                   |                       |                   |                   |                   |
    TC-02           |                   |                       |                   |                   |                   |
    TC-03           |                   |                       |                   |                   |                   |
### Troubleshooting & Engineering Log    
