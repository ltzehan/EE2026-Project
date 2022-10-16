#
#   Generates a .mem file representing a sine wave for use with $readmemh
#

import numpy as np
import matplotlib.pylab as plt

#
#   Parameters
#

OUT_FREQ = 4_000
# Output will range from 0 to 2**OUT_BITS-1
OUT_BITS = 12

# 100 MHz default clock
CLK_FREQ = 100 * 1e6
SIZE = int(CLK_FREQ / OUT_FREQ)
OUT_AMP = 2**OUT_BITS - 1


def gen_mem():
    print(f"Output size:\t {SIZE} samples")
    print(f"Output freq.:\t {OUT_FREQ} Hz")
    print(f"Output range:\t 0 - {2**OUT_BITS - 1}")

    x = np.arange(0, SIZE)
    y = int(OUT_AMP / 2) * np.sin(2 * np.pi * x / SIZE) + int(OUT_AMP / 2)
    y_int = np.rint(y)

    with open("sine.mem", "w") as ff:
        ff.write("\n".join([hex(int(v))[2:] for v in y_int]))

    plt.scatter(x, y_int, s=0.1)
    plt.show()


if __name__ == "__main__":
    gen_mem()
