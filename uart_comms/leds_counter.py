#!/bin/python

import serial
import sys
import struct
import time

if len(sys.argv) != 3:
  print "Usage: %s <com port/device> <baud rate>" % sys.argv[0];
  print "\n"
  print "\tCOM Port/Device: For Windows, this will be COMX (replace X with the appropriate number).  For Linux, this will usually be /dev/ttyUSBX (replace X with the appropriate number"
  print "\tBaud Rate: Baud rate to send serial data at"
  print "\n"
  sys.exit(1)

# Attempt to connect to the serial port
try:
  ser = serial.Serial(sys.argv[1], sys.argv[2])
except serial.SerialException as e:
  # Could not connect to the serial port.  Error and exit
  print "Could not open serial port %s at baud rate %s.  Details => %s" % (sys.argv[1], sys.argv[2], e)
  sys.exit(1)

# Start building the frame.  Add the preamble, then add the length, and finally the flag
length = 2
flag = '\x03'
originalData = '\x55\x55'
originalData += struct.pack("B", length)
originalData += flag

# Start calculating the checksum.  All that is available right now is the length and the flag
startingChecksum = length ^ ord(flag)

for i in range(0, 255):
  extra = struct.pack("B", i)
  data = originalData
  data += extra
  checksum = startingChecksum ^ ord(extra)
  data += struct.pack("B", checksum)

  # Let the user know what data is being sent
  print "Sending: %s" % ':'.join(d.encode('hex') for d in data)

  # Send data to the FPGA and flush the stream
  ser.write(data)
  ser.flush()

  time.sleep(0.125)
