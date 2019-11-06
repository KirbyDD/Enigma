require "./lib/enigma.rb"

enigma = Enigma.new
handle = File.open(ARGV[0], "r")

incoming_msg = handle.read

handle.close
message = enigma.decrypt(incoming_msg, "02715", "040895")

writer = File.open(ARGV[1], "w")
writer.write(message[:decryption])
writer.close

puts "Created '#{ARGV[1]}' with the key of #{message[:key]} and date #{message[:date]}"