require './lib/enigma'

message_to_crack = File.open(ARGV[0], "r")
text = message_to_crack.read.strip
message_to_crack.close

enigma = Enigma.new

alan_turing = File.open(ARGV[1], "w")
alan_turing.write(enigma.crack(text, ARGV[2], ARGV[3]))
alan_turing.close

puts "Created 'cracked.txt' with the key #{ARGV[2]} and date #{ARGV[3]}"
