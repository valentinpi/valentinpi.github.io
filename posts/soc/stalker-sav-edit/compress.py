#!/home/valentin/dev/stalker-sav-edit/bin/python3

import io
import lzo
import struct
import sys

HEADER = b"\xFF\xFF\xFF\xFF\x03\x00\x00\x00"

if len(sys.argv) < 2:
    print("Not enough arguments", file=sys.stderr)

file_name = sys.argv[1]

decomp = io.open(file_name, "rb")
data = decomp.read()
decomp.close()

size = len(data)

comp = lzo.compress(data, 1, False)

out = io.open(file_name[0:len(file_name) - 1] + "c", "wb")
out.write(comp)
out.close()

out = io.open(file_name[0:len(file_name) - 2], "wb")
out.write(HEADER)
out.write(struct.pack("<I", size))
out.write(comp)
out.close()
