#!/usr/bin/python

import serial
import sys
import struct

s = serial.Serial(sys.argv[1], sys.argv[2])
s.write('\x55\x55\x03\x00')

checksum = 0x03 ^ 0x00

parts = bytearray(struct.pack("I", int(sys.argv[3])))

for i in range(0, 2):
  s.write(struct.pack("B", parts[i]))
  checksum = checksum ^ parts[i]

s.write(struct.pack("B", checksum))

s.flush()
