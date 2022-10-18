#
#   Generates a .mem file representing a sine wave for use with $readmemh
#

import numpy as np
import matplotlib.pylab as plt

#
#   Parameters
#

CLK_FREQ = 100_000_000
SAMP_FREQ = 20_000
OUT_FREQ = 1633
# Output will range from 0 to 2**OUT_BITS-1
OUT_BITS = 12

# Nyquist criterion
assert SAMP_FREQ > 2 * OUT_FREQ

# Number of sampled points
# Using the Basys3 clock and then a separate clock to actually generate the samples
SIZE = int(CLK_FREQ // OUT_FREQ)
OUT_AMP = 2**OUT_BITS - 1


def gen_mem():
    print(f"Clock freq.:\t {CLK_FREQ} Hz")
    print(f"Sample freq.:\t {SAMP_FREQ} Hz")
    print(f"Output size:\t {SIZE} samples")
    print(f"Output freq.:\t {OUT_FREQ} Hz")
    print(f"Output range:\t 0 - {2**OUT_BITS - 1}")

    sample = np.arange(0, SIZE)
    t = sample / CLK_FREQ
    y = int(OUT_AMP / 2) * np.sin(2 * np.pi * OUT_FREQ * t) + int(OUT_AMP / 2)
    y_int = np.rint(y)

    with open("sine.mem", "w") as ff:
        ff.write("\n".join([hex(int(v))[2:] for v in y_int]))

    fig = plt.figure(1)
    ax = fig.add_subplot(111)
    ax.set_xlabel("Sample #")
    ax.set_ylabel("mic data")
    ax.scatter(
        sample,
        y_int,
        s=0.2,
    )
    plt.show()


if __name__ == "__main__":
    gen_mem()
