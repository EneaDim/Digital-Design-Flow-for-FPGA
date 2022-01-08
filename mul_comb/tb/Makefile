# Makefile

TOPLEVEL_LANG = verilog

PWD = $(shell pwd)

# Import path for model used in tb_mul.py file
export PYTHONPATH := $(PWD)/../model:$(PYTHONPATH)

VERILOG_SOURCES = $(shell pwd)/../rtl/unsigned_mult.sv
TOPLEVEL = unsigned_mult
MODULE = tb_mul

include $(shell cocotb-config --makefiles)/Makefile.sim
