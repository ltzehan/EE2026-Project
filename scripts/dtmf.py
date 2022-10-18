import math
from pprint import pprint

dtmf = [697, 770, 852, 941, 1209, 1336, 1477, 1633]

# Sampling frequency (Hz)
# f_samp = 8_000
f_samp = 20_000


def calc_bin(N):

    bins = []
    for f in dtmf:
        # Binned value (decimal)
        kf = N * f / f_samp
        k_down, k_up = math.floor(kf), math.ceil(kf)
        err_down, err_up = abs(f - k_down * f_samp / N), abs(f - k_up * f_samp / N)
        if err_down < err_up:
            k = k_down
        else:
            k = k_up

        bins.append(k)

    if len(set(bins)) == len(dtmf):

        print(f"Sample freq. = {f_samp}")
        print(f"N = {N}")
        err_sum = 0
        for (f, bin) in zip(dtmf, bins):
            err = f - bin * f_samp / N
            err_sum += err**2
            print(f"{f} Hz: \t{bin}\t{err}")

        return err_sum

    return False


if __name__ == "__main__":
    # calc_bin(205)
    # calc_bin(105)
    calc_bin(283)

    ok = []
    n = 1
    while n < 500:
        # err = calc_bin(n)
        # if err != False:
        #     ok.append((err, n))

        if calc_bin(n):
            break

        n += 1

    # pprint(sorted(ok))
