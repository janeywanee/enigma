# creates enigma object for encryption and decryption
class Enigma
  attr_reader :split

  def initialize
  end

  def split(message)
    @message = message
    @message.delete(' ').scan(/.{1,4}/)
  end
  #iterate each array element
  #then "each within each" EXCEPT create another method for
  #the next each AKA move a,b,c, or d

  #zip??
end
