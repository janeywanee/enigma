require "./test/test_helper"
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

end
