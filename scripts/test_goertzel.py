from random import random
from fxpmath import Fxp

B_DEC = 30
B_FRAC = 30
B_WORD = 1 + B_DEC + B_FRAC

# To fixed-point representation
def fp(x):
    return Fxp(x, signed=True, n_word=B_WORD, n_frac=B_FRAC).bin()


def test_goertzel_fp():
    for test_case in range(1, 10):
        x = int(2**12 * random())

        # Format as Verilog
        print(f"x = {x};")
        print("#10;")
        print(f"`assert(y, {B_WORD}'b{fp(x /2**12)});")
        print("#10;")


# TODO: Signed
def test_goertzel_mul():
    for test_case in range(1, 10):
        a = 2**12 * (random() - 0.5) * 2
        b = 2**12 * (random() - 0.5) * 2
        y = a * b

        # Format as Verilog
        print(f"// a = {a}")
        print(f"// b = {b}")
        print(f"// y = {y}")
        print(f"a = {B_WORD}'b{fp(a)};")
        print(f"b = {B_WORD}'b{fp(b)};")
        print("#10;")
        print(f'$display("Expected = {fp(y)}");')
        print(f'$display("Actual   = %b", y);')
        print(f'$display("Diff.    = %d", $signed({B_WORD}\'b{fp(y)} - y));')
        print("#10;\n")


if __name__ == "__main__":
    test_goertzel_mul()
    # test_goertzel_fp()
