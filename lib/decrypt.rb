require_relative "./enigma"

encryption_file = File.open(ARGV[0], "r")
encryption = encryption_file.read.delete("\n")
encryption_file.close

enigma = Enigma.new

decryption_file = File.open(ARGV[1], "w")
decryption_file.write(enigma.decrypt(encryption, ARGV[2], Date.today))
decryption_file.close

puts "Created 'decrypted.txt' with key #{ARGV[2]} and #{ARGV[3]}"
