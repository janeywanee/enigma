# creates enigma object for encryption and decryption
class Enigma
  attr_reader :split

  def initialize
  end

  def split(message)
    @message = message
    @message.delete(' ').scan(/.{1,4}/)
  end
end
