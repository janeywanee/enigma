require "./test/test_helper"
require "./lib/offset"


class TestOffset < Minitest::Test
  def test_create_key_in_offset
    offset = Offset.new
    assert_instance_of Key, offset.key
  end

  def test_convert_date_returns_last_four
    offset = Offset.new
    assert_equal 4, offset.convert_date.length
  end

  def test_offset_totals
    offset = Offset.new
    assert_equal offset.a_total, (offset.last_four[-4].to_i + offset.key.rotation_a.to_i)
    assert_equal offset.b_total, (offset.last_four[-3].to_i + offset.key.rotation_b.to_i)
    assert_equal offset.c_total, (offset.last_four[-2].to_i + offset.key.rotation_c.to_i)
    assert_equal offset.d_total, (offset.last_four[-1].to_i + offset.key.rotation_d.to_i)
  end
end
