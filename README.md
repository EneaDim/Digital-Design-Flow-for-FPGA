# DIGITAL DESIGN FLOW

## *Design / Design Verification / Synthesys / Place&Route / Bitstream Generation for FPGA*

A unique flow to integrate all the steps during digital design of ASICs.

#

***Designs:***

- Combinational Multiplier
- Multiplier with IN/OUT regs

#

***Directory structure for each design:***

- model: it contains the python model of the design.
- rtl  : it contains the HDL files that implements the design, SystemVerilog is used as HDL.
- tb   : it contains the python file that implements the testbench.<br/> It drives the inputs and monitors the outputs, comparing them with the model.<br/> The simulation is driven by cocotb. 
- syn  : it contains the yosys script to synthetize the design for an FPGA.<br/> It contains also the Verilog description of the synthesis and the json file which also describes the design and will be used as input for the Place & Route flow.
- pr   : it contains the .asc file which describes the Place & Route for an ice-40 FPGA.

#

***Requirement to implement this flow:***

### Requirements to perform simulation, verification and visualize waveforms

- Design : <https://github.com/steveicarus/iverilog> or other simulator for SystemVerilog files.
- Design Verification : <https://github.com/cocotb/cocotb>
- Waveform visualization : <https://github.com/gtkwave/gtkwave>

### Requirements to Synthetize

Walkthrough <https://github.com/YosysHQ/yosys>


### Requirements to Place&Route

Walkthrough <https://github.com/YosysHQ/nextpnr>

Build it with the GUI.

### Requirements to generate Bitstream for ice-40 FPGAs

Walkthrough <https://github.com/ddm/icetools>

#

# ***Description of the flow***


## SystemVerilog Design

Really simple design: unsigned multiplier.

SystemVerilog is an HDL very usefull in order to design and also to perform verification, and also for UVM.

## Design Verification

The DV is performed using COCOTB.<br/>
Cocotb is a COroutine based COsimulation TestBench environment for verifying VHDL and SystemVerilog RTL using Python.<br/> Cocotb encourages the same philosophy of design re-use and randomized testing as UVM. 
Drive and monitor phases on the interfaces of the device under test are simple to implement, so also a check and compare with the model can be easily done.
**Test Architecture Structure**
- Driver to set the inputs of the DUT
- Monitor to look at the ouputs of the DUT
- Model the check the behavior of the DUT
<img src="test_arch.png">

The waveforms of the testbench can be seen through GTKWAVE.

## Synthesys

The synthesis is done using YOSYS. A popular synthesys tool for FPGAs.<br/>
**Steps:**
1. Read files
2. Set TOP module
3. Translate Process Blocks / Always Blocks
4. Detect and optimize FSM (Not used actually, but necessary for further implementation)
5. Covert design into logical netlist with *techmap*
6. Mapping to internal cell library with *abc*
7. Synthetize for ice-40 FPGAs

## Place&Route

The P&R is done with nextpnr-ice40. A tool used to implement P&R for ice-40 FPGAs.<br/> The .asc file that describes the Place&Route on ice-40 FPGA can be viewed on <https://knielsen.github.io/ice40_viewer/ice40_viewer.html>

## Bitstream Generation
The Bitstream Generation is driven using icestorm in order to implement it on an ice-40 FPGA.
