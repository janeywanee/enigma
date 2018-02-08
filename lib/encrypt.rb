require_relative "./enigma"

message_file = File.open(ARGV[0], "r")
message = message_file.read.delete(" ").delete("\n")
message_file.close

enigma = Enigma.new

encryption_file = File.open(ARGV[1], "w")
encryption_file.write(enigma.encrypt(message))
encryption_file.close

puts "Created 'encrypted.txt' with the key #{enigma.offset.key.num} and #{Date.today}"
