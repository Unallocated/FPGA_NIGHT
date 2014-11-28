#!/bin/python

import serial
import sys
import struct

s = serial.Serial(sys.argv[1], sys.argv[2])
s.write('\x55\x55\x04\x03')

checksum = 0x04 ^ 0x03

orig = sys.argv[3].split('.')
whole = int(orig[0])
frac = float("0.%s" % orig[1])

#result = int('{:0b}'.format((whole << 6) + int(frac * 64))[::-1], 2)
result = int((whole << 6) + int(frac * 64))

parts = bytearray(struct.pack("B", result))
print "%02x" % parts[0]

s.write(struct.pack("B", parts[0]))
checksum = checksum ^ parts[0]

s.write(struct.pack("B", checksum))

s.flush()
