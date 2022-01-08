# DIGITAL DESIGN FLOW

# Design / Design Verification / Synthesys / Place&Route / Bitstream Generation FPGA

A unique flow to integrate all the steps during digital design of ASICs.

Designs:
- Combinational Multiplier
- Multiplier wit IN/OUT regs

## SystemVerilog Design

Really simple design: unsigned multiplier.

SystemVerilog is an HDL very usefull in order to design and also to perform verification, and also for UVM.

## Design Verification

The DV is performed using COCOTB.

The waveforms can be seen through GTKWAVE.

### Requirements to perform verification e visualize waveforms

pip install cocotb

apt install gtkwave

## Synthesys

The synthesis is done using YOSYS.

### Requirements to Synthetize

VWalkthrough <https://github.com/YosysHQ/yosys>

## Place&Route

The P&R is done with nextpnr-ice40

### Requirements to Place&Route

Walktrhough <https://github.com/steveicarus/iverilog>

Walktrhough <https://github.com/ddm/icetools>

Walkthrough <https://github.com/YosysHQ/nextpnr>

Build it with the GUI.
