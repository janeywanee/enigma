require "./test/test_helper"
require "./lib/enigma"
require "pry"

class TestEnigma < Minitest::Test
  def test_it_exists
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
  end

  def test_offset_calc
    enigma = Enigma.new
    assert_instance_of Offset, enigma.offset
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
binding.pry
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

  def test_can_encrypt_chunks
    enigma = Enigma.new
    first_chunk = "this"
    refute enigma.encrypt_chunk(first_chunk) == "this"
    #this test will always pass... ask instructor?
  end

  def test_encrypt_chunks_less_than_four_chars
    enigma = Enigma.new
    chunk = "et"
    assert_equal enigma.encrypt_chunk(chunk).length, "et".length
  end

  def test_encrypt_returns_scrambled_message
    enigma = Enigma.new
    encryption = enigma.encrypt("this is so secret")
    assert_equal encryption.length, "thisissosecret".length
  end
end
