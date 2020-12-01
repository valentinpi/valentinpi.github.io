#!/home/valentin/dev/stalker-sav-edit/bin/python3

import io
import lzo
import sys

if len(sys.argv) < 3:
    print("Not enough arguments", file=sys.stderr)
    exit(1)

file_name = sys.argv[1]
size = int(sys.argv[2], base=16)

save = io.open(file_name, "rb")
data = save.read()
save.close()

decomp = lzo.decompress(data, False, size)

out = io.open(file_name[0:len(file_name) - 1] + "d", "wb")
out.write(decomp)
out.close()
