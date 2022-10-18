from fxpmath import Fxp
from FixedPoint import FXfamily, FXnum
import math
import numpy as np
import pylab

# Adapted from: https://gist.github.com/sebpiq/4128537

B_INT = 17
B_FRAC = 15
# n_bits = bits to right of binary point
# n_intbits = bits to left (incl. sign)
q30_30 = FXfamily(n_bits=B_FRAC, n_intbits=B_INT)

DEBUG_INTMD = False


def fp(x):
    # return x
    return FXnum(x, q30_30)
    # return Fxp(x, signed=True, n_word=B_WORD, n_frac=B_FRAC)


def ashex(fp):
    return hex(int(float(fp) * 2**B_FRAC))


def goertzel(samples, sample_rate):
    # Frequency spacing between bins
    f_bin = sample_rate / len(samples)
    bins = [f_bin * k for k in range(len(samples))]

    freqs = []
    result = []
    for (k, freq) in enumerate(bins):
        if freq >= 3000:
            break

        w_k = 2 * np.pi * freq / sample_rate
        cos_w_k = 2 * math.cos(w_k)
        val = fp(cos_w_k)

        if DEBUG_INTMD:
            print("=" * 50)
            print("k        =", k)
            print("freq     =", freq)
            print("val      =", val)

        s1, s2 = fp(0), fp(0)
        OFFSET = 12
        for mic in samples:
            # 1 CLK after mic
            x = fp(mic / 2**OFFSET)
            s1_mul = val * s1
            s2_inv = -s2
            # 2 CLK after mic
            s = x + s1_mul + s2_inv
            # s = x + (val * s1) - s2
            s1, s2 = s, s1
            if DEBUG_INTMD:
                print("=" * 50)
                print("val      =", ashex(val), "\t", val)
                print("mic      =", ashex(val))
                print("-" * 50)
                print("x        =", ashex(x), "\t", x)
                print("s1_mul   =", ashex(s1_mul), "\t", s1_mul)
                print("s2_inv   =", ashex(s2_inv), "\t", s2_inv)
                print("-" * 50)
                print("s        =", ashex(s), "\t", s)
                print("s1       =", ashex(s1), "\t", s1)
                print("s2       =", ashex(s2), "\t", s2)

        y1, y2 = float(s1), float(s2)
        y1_sqr = y1 * y1
        y2_sqr = y2 * y2
        y1_y2 = y1 * y2
        y1_y2_val = y1_y2 * float(val)
        power = 0
        power = y1_sqr + y2_sqr - y1_y2_val

        print("=" * 50)
        print("k        =", k)
        print("freq     =", freq)
        print("y1       =", y1)
        print("y2       =", y2)
        print("y1_sqr   =", y1_sqr)
        print("y2_sqr   =", y2_sqr)
        print("y1_y2    =", y1_y2)
        print("y1_y2_val=", y1_y2_val)
        print("power    =", power)

        freqs.append(freq)
        result.append(power)

    return (freqs, result)


if __name__ == "__main__":

    SAMPLE_FREQ = 20_000
    SAMPLE_NUM = 171

    OUT_BITS = 12
    OUT_AMP = 2**OUT_BITS - 1

    t = np.linspace(0, 1, SAMPLE_FREQ)[:SAMPLE_NUM]
    # dtmf = [697, 770, 852, 941, 1209, 1336, 1477, 1633]
    dtmf = [1633]
    # dtmf_sample = [np.sin(2 * np.pi * freq * t) for freq in dtmf]
    dtmf_sample = [
        # np.sin(2 * np.pi * freq * t)
        int(OUT_AMP / 2) * np.sin(2 * np.pi * freq * t) + int(OUT_AMP / 2)
        for freq in dtmf
    ]

    pylab.plot(dtmf_sample[0])
    with open("input.mem", "w") as ff:
        # Left-pad hex value with zeros until len 3
        # 0xAAA
        ff.write("\n".join(["0x{0:0{1}X}".format(int(x), 3) for x in dtmf_sample[0]]))

    for i in range(len(dtmf)):
        pylab.subplot(2, len(dtmf), i + 1)
        pylab.title(f"{dtmf[i]} Hz")
        pylab.plot(t, dtmf_sample[i])

        freqs, result = goertzel(dtmf_sample[i], SAMPLE_FREQ)

        pylab.subplot(2, len(dtmf), len(dtmf) + i + 1)
        pylab.plot(freqs, result, "o")
        pylab.xlim([600, 1800])

    pylab.show()
