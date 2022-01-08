import model
import utils
import random
import cocotb
from cocotb.clock import Clock
from cocotb.triggers import Timer, FallingEdge


@cocotb.test()
async def tb_mul(dut):
    """ Test that multiplies 2 random unsigned numbers """

    nbit = 8
    n_op = 100
    for i in range(n_op):
        a, b = utils.rand_bin_values(nbit)
        dut.a.value =  a
        dut.b.value =  b

        expected_outcome = model.ref_mul_model(a, b)

        # CHECK
        await Timer(10, 'ns')
        assert dut.out.value == expected_outcome, "output q was incorrect on the {}th cycle".format(i)

@cocotb.test()
async def tb_mul_locally(dut):
    """ Test that multiplies 2 unsigned numbers """

    nbit = 8
    a = [0, 2**nbit-1, 2**nbit-1, 0, 2**nbit-1, 0, 2**nbit-1, 0]
    b = [0, 2**nbit-1, 2**nbit-1, 0, 0, 2**nbit-1, 0, 2**nbit-1]
    for i in range(len(a)):
        a_val, b_val = a[i], b[i]
        dut.a.value =  a_val
        dut.b.value =  b_val

        expected_outcome = model.ref_mul_model(a[i], b[i])

        # CHECK
        await Timer(10, 'ns')
        assert dut.out.value == expected_outcome, "output q was incorrect on the {}th cycle".format(i)
    
    
