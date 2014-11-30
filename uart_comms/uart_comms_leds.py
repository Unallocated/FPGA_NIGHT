#!/usr/bin/python

# Needed to talk to the serial port (must have pyserial!!)
import serial
# Needed to quit and to get command line args
import sys
# Provides byte packing methods
import struct

# Make sure the correct number of args are provided
if len(sys.argv) < 4 or len(sys.argv) > 5:
  print "Usage: %s <com port/device> <baud rate> <flag> [<payload>]" % sys.argv[0];
  print "\n"
  print "\tCOM Port/Device: For Windows, this will be COMX (replace X with the appropriate number).  For Linux, this will usually be /dev/ttyUSBX (replace X with the appropriate number"
  print "\tBaud Rate: Baud rate to send serial data at"
  print "\tFlag: First payload byte to send.  MUST BE HEX!!!  Should be 0x00, 0x01, 0x02, or 0x03.  Other values will result in the error pattern being shown"
  print "\tPayload: This is optional.  MUST BE HEX!!!  Used with flag 0x03 as the second payload byte."
  print "\n"
  sys.exit(1)

# Attempt to connect to the serial port
try:
  ser = serial.Serial(sys.argv[1], sys.argv[2])
except serial.SerialException as e:
  # Could not connect to the serial port.  Error and exit
  print "Could not open serial port %s at baud rate %s.  Details => %s" % (sys.argv[1], sys.argv[2], e)
  sys.exit(1)

# Attempt to parse the flag value.  It should be a hex character.  It could have a leading 0x, so make sure to get rid of that
try:
  flag = sys.argv[3].replace("0x","").decode("hex")
except Exception as e:
  # Could not parse the hex string.  Error and bail
  print "Could not decode %s as hex.  Details => %s" % (sys.argv[3], e)
  sys.exit(1)

# Figure out how long the payload should be.  By default it is one
# It can be two is the extra byte is provided
length = 1
if len(sys.argv) == 5:
  length = 2

# Start building the frame.  Add the preamble, then add the length, and finally the flag
data = '\x55\x55'
data += struct.pack("B", length)
data += flag

# Start calculating the checksum.  All that is available right now is the length and the flag
checksum = length ^ ord(flag)


# When the extra byte is specified, it needs to be converted to a byte, added to the frame, and
# added to the checksum
if length == 2:
  try:
    extra = sys.argv[4].replace("0x","").decode("hex")
  except Exception as e:
    print "Could not parse hex byte %s.  Details => %s" % (sys.argv[4], e)
    sys.exit(1)
    
  data += extra
  checksum = checksum ^ ord(extra)

# Append the checksum to the frame
data += struct.pack("B", checksum)

# Let the user know what data is being sent
print "Sending: %s" % ':'.join(d.encode('hex') for d in data)

# Send data to the FPGA and flush the stream
ser.write(data)
ser.flush()
