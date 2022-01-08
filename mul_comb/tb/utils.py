import random
import math

def rand_bin_values(nbit):
    a = random.randint(0, 2**(nbit)-1)
    b = random.randint(0, 2**(nbit)-1)

    return a, b


