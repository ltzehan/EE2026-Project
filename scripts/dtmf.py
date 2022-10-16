dtmf = {697, 770, 852, 941, 1209, 1336, 1477, 1633}

# Number of samples
N = 40
# Sampling frequency (Hz)
f_samp = 4_000

if __name__ == "__main__":
    f_bin = f_samp // N
    dtmf_bin = [f // f_bin for f in dtmf]

    print(dtmf_bin)
    if len(set(dtmf_bin)) != len(dtmf):
        print("DTMF tones do not have distinct freq. bins")
