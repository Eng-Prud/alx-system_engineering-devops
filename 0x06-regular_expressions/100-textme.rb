#!/usr/bin/env ruby
#Your script should output: [SENDER],[RECEIVER],[FLAGS]
#The sender phone number or name (including country code if present)
#The receiver phone number or name (including country code if present)
#The flags that were used

# Read the log file provided as input
log_file = ARGF.read

# Extract sender, receiver, and flags from each log entry
log_file.scan(/\[from:([\w\s\+]+)\] \[to:([\w\s\+]+)\] \[flags:(.*?)\]/) do |sender, receiver, flags|
  puts "#{sender},#{receiver},#{flags}"
end

