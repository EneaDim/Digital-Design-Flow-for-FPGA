# PATHS
mul_asynch = mul_comb
mul_synch = mul_inout_regs


all: clean asynch synch

synch:
	$(MAKE) -C ${mul_synch}

asynch:
	$(MAKE) -C ${mul_asynch}

clean:
	rm -rf mul_comb/model/__pycache__/
	rm -rf mul_comb/tb/__pycache__/
	rm -rf mul_comb/tb/sim_build/
	rm -rf mul_comb/tb/results.xml
	rm -rf mul_comb/tb/dump.vcd
	rm -rf mul_inout_regs/model/__pycache__/
	rm -rf mul_inout_regs/tb/__pycache__/
	rm -rf mul_inout_regs/tb/sim_build/
	rm -rf mul_inout_regs/tb/results.xml
	rm -rf mul_inout_regs/tb/dump.vcd

