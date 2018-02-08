require "./enigma"
require "date"

encryption_file = File.open(ARGV[0], "r")
encryption = encryption_file.read.delete("\n")
encryption_file.close

enigma = Enigma.new

cracked_file = File.open(ARGV[1], "w")
cracked_file.write(enigma.crack(encryption, ARGV[2]))
cracked_file.close

puts "Created 'crack.txt' with the cracked #{enigma.offset.key} and #{Date.today}"
