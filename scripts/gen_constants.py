from fxpmath import Fxp
import math

B_DEC = 16
B_FRAC = 15
B_WORD = 1 + B_DEC + B_FRAC

SAMPLE_FREQ = 8_000
N = 205
# SAMPLE_FREQ = 20_000
# N = 171

# To fixed-point representation
def fp(x):
    return Fxp(x, signed=True, n_word=B_WORD, n_frac=B_FRAC).hex()


if __name__ == "__main__":

    val = []
    f_bin = SAMPLE_FREQ / N
    for k in range(N):
        w_k = 2 * math.pi * f_bin * k / SAMPLE_FREQ
        cos_w_k = 2 * math.cos(w_k)

        val.append(fp(cos_w_k))

    with open("val.mem", "w") as ff:
        ff.write("\n".join(val))
