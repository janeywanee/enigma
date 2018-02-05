require "./test/test_helper"
require "./lib/enigma"

class TestEnigma < Minitest::Test
  def test_it_exists
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
  end

  def test_string_splits_into_4_chars
    enigma = Enigma.new
    message = "this is so secret"
    enigma.split(message)
    assert_equal enigma.split(message).count, 4
  end

  #test our offset calc can come in
end
