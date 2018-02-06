# creates enigma object for encryption and decryption
class Enigma
  attr_reader :split

  def initialize
    @offset = Offset.new
  end

  def separate(message)
    @message = message
    @message = @message.delete(' ').scan(/.{1,4}/)
  end

  def rotate_a(letter)
    alphabet = ("a".."z").to_a
    position = alphabet.index(letter)
    rotated_alphabet = alphabet.rotate(@offset.a_total)
    zipped_alphabet = alphabet.zip(rotated_alphabet)
    zipped_alphabet[position][1]

  end





end
