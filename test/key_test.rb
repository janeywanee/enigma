require "./test/test_helper"

require "./lib/key"

class Test_Key < Minitest::Test

  def test_key_exists
    key = Key.new
    assert_instance_of Key, key
  end

  def test_key_is_a_number
    key = Key.new
    assert_equal key.num, 12345
  end



end
