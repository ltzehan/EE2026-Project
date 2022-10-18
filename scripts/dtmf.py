dtmf = [697, 770, 852, 941, 1209, 1336, 1477, 1633]

# Sampling frequency (Hz)
f_samp = 20_000


def calc_bin(N):
    dtmf_bin = [int(N * f / f_samp) for f in dtmf]

    if len(set(dtmf_bin)) == len(dtmf):
        print(f"Sample freq. = {f_samp}")
        print(f"N = {N}")
        for (f, bin) in zip(dtmf, dtmf_bin):
            print(f"{f} Hz: \t{bin}")

        return True

    return False


if __name__ == "__main__":

    n = 1
    while True:
        if calc_bin(n):
            break
        n += 1
