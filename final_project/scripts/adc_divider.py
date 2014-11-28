#!/bin/python

import serial
import sys
import struct

s = serial.Serial(sys.argv[1], sys.argv[2])
s.write('\x55\x55\x04\x02')

#print bytearray(int(sys.argv[3]))
#print struct.pack("I", int(sys.argv[3]))

checksum = 0x04 ^ 0x02

parts = bytearray(struct.pack("I", int(sys.argv[3])))

for i in range(0, 3):
  s.write(struct.pack("B", parts[i]))
  print "%02x" % parts[i]
  checksum = checksum ^ parts[i]

s.write(struct.pack("B", checksum))

s.flush()
