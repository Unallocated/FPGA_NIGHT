import serial
import struct
import time
import sys

if len(sys.argv) != 4:
  print "Usage: ",sys.argv[0]," <serial_port> <baud_rate> <number_of_extra_payload_bytes>"
  sys.exit(1)

port = sys.argv[1]
baudRate = int(sys.argv[2])
payloadByteCount = int(sys.argv[3])

s = serial.Serial(port, baudRate)


derf = ''
for i in range(0, payloadByteCount):
	derf += '\xff'

val = 0;

print "Each frame will have", len(derf), "extra byte(s) attached"

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

