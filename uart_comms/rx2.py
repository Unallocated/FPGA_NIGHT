import serial
import struct
import time

s = serial.Serial("/dev/ttyUSB0", 115200)

derf = ''
for i in range(0, 2):
	derf += '\xff'

val = 0;

while 1:
  s.write('\x55\x55')

  payload = struct.pack('B', val)+derf

  checksum = len(payload)

  s.write(struct.pack('B', len(payload)))

  for i in bytearray(payload):
    checksum = checksum ^ i
    s.write(struct.pack('B', i))

  s.write(struct.pack('B', checksum))

  s.flush()

  if val == 255:
    val = 0
  else:
    val += 1
  time.sleep(0.125)

