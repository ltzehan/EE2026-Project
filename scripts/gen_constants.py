from fxpmath import Fxp
from math import pi, cos

B_DEC = 30
B_FRAC = 30
B_WORD = 1 + B_DEC + B_FRAC

N = 40

# To fixed-point representation
def fp(x):
    return Fxp(x, signed=True, n_word=B_WORD, n_frac=B_FRAC).hex()


if __name__ == "__main__":

    w_k = [fp(cos(2 * pi * k / N)) for k in range(N)]
    with open("cos_w_k.mem", "w") as ff:
        ff.write("\n".join(w_k))
