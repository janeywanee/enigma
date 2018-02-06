# creates enigma object for encryption and decryption
class Enigma
  attr_reader :split,
              :offset

  def initialize
    @offset = Offset.new
    @alphabet = ("a".."z").to_a
  end

  def separate(message)
    @message = message
    @message = @message.delete(' ').scan(/.{1,4}/)
  end

  def rotate_a(letter)
    position = @alphabet.index(letter)
    rotated_alphabet = @alphabet.rotate(@offset.a_total)
    zipped_alphabet = @alphabet.zip(rotated_alphabet)
    zipped_alphabet[position][1]
  end

  def rotate_b(letter)
    position = @alphabet.index(letter)
    rotated_alphabet = @alphabet.rotate(@offset.b_total)
    zipped_alphabet = @alphabet.zip(rotated_alphabet)
    zipped_alphabet[position][1]
  end

  def rotate_c(letter)
    position = @alphabet.index(letter)
    rotated_alphabet = @alphabet.rotate(@offset.c_total)
    zipped_alphabet = @alphabet.zip(rotated_alphabet)
    zipped_alphabet[position][1]
  end

  def rotate_d(letter)
    position = @alphabet.index(letter)
    rotated_alphabet = @alphabet.rotate(@offset.d_total)
    zipped_alphabet = @alphabet.zip(rotated_alphabet)
    zipped_alphabet[position][1]
  end

  def encrypt_chunk(chunk)
    new_array = chunk.scan(/./)
    encrypt_a = rotate_a(new_array[0])
    encrypt_b = rotate_a(new_array[1])
    encrypt_c = rotate_a(new_array[2])
    encrypt_d = rotate_a(new_array[3])
    "#{encrypt_a}#{encrypt_b}#{encrypt_c}#{encrypt_d}"
  end
end
