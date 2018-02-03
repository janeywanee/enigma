require "./test/test_helper"
require "pry"
require "./lib/key"

class TestKey < Minitest::Test
  def test_key_exists
    key = Key.new
    assert_instance_of Key, key
  end

  def test_key_num_attr_is_five_chars_long
    key = Key.new
    assert_equal key.num.length, 5
  end

  def test_first_to_digits_of_the_key_rotation_A
    key = Key.new
    
    assert_equal key.rotation_A.length, 2
    assert_equal key.rotation_B.length, 2
    assert_equal key.rotation_C.length, 2
    assert_equal key.rotation_D.length, 2
  end


end
