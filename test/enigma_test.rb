require "./test/test_helper"
require "./lib/enigma"

class TestEnigma < Minitest::Test
  def test_it_exists
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
  end

  def test_string_separate_into_4_chars
    enigma = Enigma.new
    message = "this is so secret"
    enigma.separate(message)
    assert_equal enigma.separate(message).count, 4
  end

  def test_first_character_rotates_by_a
    enigma = Enigma.new
    first_character = "t"
    assert ("a".."z").include?(enigma.rotate_a(first_character))
  end

  def test_second_character_rotates_by_a
    enigma = Enigma.new
    second_character = "h"
    assert ("a".."z").include?(enigma.rotate_a(second_character))
  end

  def test_third_character_rotates_by_a
    enigma = Enigma.new
    third_character = "i"
    assert ("a".."z").include?(enigma.rotate_a(third_character))
  end

  def test_fourth_character_rotates_by_a
    enigma = Enigma.new
    fourth_character = "s"
    assert ("a".."z").include?(enigma.rotate_a(fourth_character))
  end

  def test_can_chunk_encrypt
    enigma = Enigma.new
    first_chunk = "this"
    refute enigma.encrypt_chunk(first_chunk),"this"
  end

  #test our offset calc can come in
end
