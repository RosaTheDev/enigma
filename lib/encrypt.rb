require './lib/enigma'

message_to_encrypt = File.open(ARGV[0], "r")
text = message_to_encrypt.read.strip
message_to_encrypt.close

enigma = Enigma.new

message_to_decrypt = File.open(ARGV[1], "w")
message_to_decrypt.write(enigma.encrypt(text))
message_to_decrypt.close

puts "Created 'encrypted.txt' with the key #{enigma.key} and date #{enigma.date}"
 
