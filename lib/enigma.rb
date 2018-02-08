# creates enigma object for encryption and decryption
class Enigma
  attr_reader :split,
              :offset

  def initialize
    @offset = Offset.new
    @alphabet = ("a".."z").to_a.push(".")
  end

  def rotate_a(letter)
    position = @alphabet.index(letter)
    rotated_alphabet = @alphabet.rotate(@offset.a_total)
    zipped_alphabet = @alphabet.zip(rotated_alphabet)
    zipped_alphabet[position][1]
  end

  def rotate_b(letter)
    if letter.nil?
      ""
    else
      position = @alphabet.index(letter)
      rotated_alphabet = @alphabet.rotate(@offset.b_total)
      zipped_alphabet = @alphabet.zip(rotated_alphabet)
      zipped_alphabet[position][1]
    end
  end

  def rotate_c(letter)
    if letter.nil?
      ""
    else
      position = @alphabet.index(letter)
      rotated_alphabet = @alphabet.rotate(@offset.c_total)
      zipped_alphabet = @alphabet.zip(rotated_alphabet)
      zipped_alphabet[position][1]
    end
  end

  def rotate_d(letter)
    if letter.nil?
      ""
    else
      position = @alphabet.index(letter)
      rotated_alphabet = @alphabet.rotate(@offset.d_total)
      zipped_alphabet = @alphabet.zip(rotated_alphabet)
      zipped_alphabet[position][1]
    end
  end

  def encrypt_chunk(chunk)
    new_array = chunk.scan(/./)
    encrypt_a = rotate_a(new_array[0])
    encrypt_b = rotate_b(new_array[1])
    encrypt_c = rotate_c(new_array[2])
    encrypt_d = rotate_d(new_array[3])
    "#{encrypt_a}#{encrypt_b}#{encrypt_c}#{encrypt_d}"
  end

  def encrypt(my_message, key = nil, date = nil)
    message = my_message.delete(" ").scan(/.{1,4}/)
    message = message.map do |chunk|
      encrypt_chunk(chunk)
    end
    message.join
  end

  def decrypt_letter_a(letter)
    position = @alphabet.index(letter)
    rotated_alphabet = @alphabet.rotate(-1 * @offset.a_total)
    zipped_alphabet = @alphabet.zip(rotated_alphabet)
    zipped_alphabet[position][1]
  end

  def decrypt_letter_b(letter)
    if letter.nil?
      ""
    else
      position = @alphabet.index(letter)
      rotated_alphabet = @alphabet.rotate(-1 * @offset.b_total)
      zipped_alphabet = @alphabet.zip(rotated_alphabet)
      zipped_alphabet[position][1]
    end
  end

  def decrypt_letter_c(letter)
    if letter.nil?
      ""
    else
      position = @alphabet.index(letter)
      rotated_alphabet = @alphabet.rotate(-1 * @offset.c_total)
      zipped_alphabet = @alphabet.zip(rotated_alphabet)
      zipped_alphabet[position][1]
    end
  end

  def decrypt_letter_d(letter)
    if letter.nil?
      ""
    else
      position = @alphabet.index(letter)
      rotated_alphabet = @alphabet.rotate(-1 * @offset.d_total)
      zipped_alphabet = @alphabet.zip(rotated_alphabet)
      zipped_alphabet[position][1]
    end
  end

  def decrypt_chunk(chunk)
    new_array = chunk.scan(/./)
    decrypt_a = decrypt_letter_a(new_array[0])
    decrypt_b = decrypt_letter_b(new_array[1])
    decrypt_c = decrypt_letter_c(new_array[2])
    decrypt_d = decrypt_letter_d(new_array[3])
    "#{decrypt_a}#{decrypt_b}#{decrypt_c}#{decrypt_d}"
  end

  def decrypt(my_message, key = nil, date = nil)
    message = my_message.delete(" ").scan(/.{1,4}/)
    message = message.map do |chunk|
      decrypt_chunk(chunk)
    end.join
  end

  def crack(output, date = Date.today)
    last_seven = output[-7..-1]
    unless last_seven == "..end.."
      decrypt(output, key = 10_000)
      key += 1
    end
    decrypt(output, key)
  end
end
