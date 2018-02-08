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

  def test_first_character_rotates_by_a
    enigma = Enigma.new
    first_character = "t"
    assert ("a".."z").include?(enigma.rotate_a(first_character))
  end

  def test_second_character_rotates_by_b
    enigma = Enigma.new
    second_character = "h"

    assert ("a".."z").include?(enigma.rotate_a(second_character))
  end

  def test_third_character_rotates_by_c
    enigma = Enigma.new
    third_character = "i"
    assert ("a".."z").include?(enigma.rotate_a(third_character))
  end

  def test_fourth_character_rotates_by_d
    enigma = Enigma.new
    fourth_character = "s"
    assert ("a".."z").include?(enigma.rotate_a(fourth_character))
  end

  def test_can_encrypt_chunks
    enigma = Enigma.new
    first_chunk = "this"
    refute enigma.encrypt_chunk(first_chunk) == "this"
  end

  def test_encrypt_chunks_less_than_four_chars
    enigma = Enigma.new
    chunk = "et"
    assert_equal enigma.encrypt_chunk(chunk).length, "et".length
  end

  def test_encrypt_returns_scrambled_message
    enigma = Enigma.new
    encryption = enigma.encrypt("this is so secret.")
    assert_equal encryption.length, "thisissosecret.".length
  end

  def test_decrypt_for_first_character
    enigma = Enigma.new
    first_character = "t"
    assert_equal enigma.decrypt_letter_a(enigma.rotate_a(first_character)), "t"
  end

  def test_decrypt_bcd_chars
    enigma =Enigma.new
    assert_equal enigma.decrypt_letter_b(enigma.rotate_b("h")), "h"
    assert_equal enigma.decrypt_letter_c(enigma.rotate_c("i")), "i"
    assert_equal enigma.decrypt_letter_d(enigma.rotate_d("s")), "s"
  end

  def test_can_decrypt_chunks
    enigma = Enigma.new
    this = "this"
    assert_equal enigma.decrypt_chunk(enigma.encrypt_chunk(this)), "this"
  end

  def test_decrypt_returns_message
    enigma = Enigma.new
    encryption= enigma.encrypt("this is so secret.")
    assert_equal encryption.length, "thisissosecret.".length
  end

  def test_crack_will_work_with_generated_key
    enigma = Enigma.new
    encryption = enigma.encrypt("this is so secret ..end..")
    result = enigma.crack(encryption)
    assert_equal result, "thisissosecret..end.."
  end

end
