# FILES
FILES = rtl/unsigned_mult.sv

# TOP NAME
TOP = unsigned_mult

# MODEL
MODEL = model

# TESTBENCH
COCOTB = tb
#
# Simulation Viewer
WAVEFORM_VIEWER = gtkwave

# Synthesys YOSYS
YOSYS = yosys
SYNDIR = syn

# Place & Route
PLACEROUTE = nextpnr-ice40
PLACEROUTEDIR = pr

# Bitstream
BITSTREAMPACK = icepack 
BITSTREAMPROG = iceprog 

all: clean simulate view synth placeroute bitstream

simulate:
	$(MAKE) -C ${COCOTB}

view:
	gtkwave $(COCOTB)/dump.vcd

synth:
	$(YOSYS) syn/synth.ys
	@mv $(TOP)_synth.v ./$(SYNDIR)/
	@mv $(TOP)_synth.json ./$(SYNDIR)/

placeroute:
	@$(PLACEROUTE) --json ./$(SYNDIR)/$(TOP)_synth.json  --asc ./$(PLACEROUTEDIR)/$(TOP)_synth.asc 

bitstream:
	@$(BITSTREMPACK) $(PLACEROUTEDIR)/$(TOP)_synth.asc $(TOP).bin
	@$(BITSTREAMPROG) $(TOP).bin
clean:
	rm -rf $(MODEL)/__pycache__/
	rm -rf $(COCOTB)/__pycache__/
	rm -rf $(COCOTB)/sim_build/
	rm -rf $(COCOTB)/results.xml
	rm -rf $(COCOTB)/dump.vcd
	rm -rf $(SYNDIR)/*.json
	rm -rf $(SYNDIR)/*.v
	

