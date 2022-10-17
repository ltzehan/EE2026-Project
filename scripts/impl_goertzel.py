from fxpmath import Fxp
from FixedPoint import FXfamily, FXnum
import math
import numpy as np
import pylab

# Adapted from: https://gist.github.com/sebpiq/4128537

B_INT = 16
B_FRAC = 15
q30_30 = FXfamily(n_bits=B_FRAC, n_intbits=B_INT)


def fp(x):
    return FXnum(x, q30_30)
    # return Fxp(x, signed=True, n_word=B_WORD, n_frac=B_FRAC)


def goertzel(samples, sample_rate):
    # Frequency spacing between bins
    f_bin = sample_rate / len(samples)
    bins = [f_bin * k for k in range(len(samples))]

    freqs = []
    result = []
    for freq in bins:
        if freq >= 3000:
            break

        w_k = 2 * np.pi * freq / sample_rate
        cos_w_k = 2 * math.cos(w_k)
        cos_w_k = fp(cos_w_k)

        s_prev1, s_prev2 = fp(0), fp(0)
        for mic in samples:
            x = fp(mic / 2**8)
            s = x + (cos_w_k * s_prev1) - s_prev2
            s_prev1, s_prev2 = s, s_prev1
            # print("=" * 50)
            # print(x)
            # print(s)
            # print(s_prev1)
            # print(s_prev2)

        y1, y2 = s_prev1, s_prev2
        power = (y1**2) + (y2**2) - (y1 * y2 * cos_w_k)

        freqs.append(freq)
        result.append(power)

    return (freqs, result)


if __name__ == "__main__":

    SAMPLE_FREQ = 20_000
    SAMPLE_NUM = 171

    t = np.linspace(0, 1, SAMPLE_FREQ)[:SAMPLE_NUM]
    dtmf = [697, 770, 852, 941, 1209, 1336, 1477, 1633]
    # dtmf = [770]
    dtmf_sample = [2 + np.sin(2 * np.pi * freq * t) for freq in dtmf]

    # applying Goertzel on those signals, and plotting results
    # freqs, results = goertzel(sine_wave, SAMPLE_RATE, (400, 500), (1000, 1100))

    for i in range(len(dtmf)):
        pylab.subplot(2, len(dtmf), i + 1)
        pylab.title(f"{dtmf[i]} Hz")
        pylab.plot(t, dtmf_sample[i])

        freqs, result = goertzel(dtmf_sample[i], SAMPLE_FREQ)
        pylab.subplot(2, len(dtmf), len(dtmf) + i + 1)
        pylab.plot(freqs, result, "o")
        pylab.xlim([600, 1800])

    pylab.show()
