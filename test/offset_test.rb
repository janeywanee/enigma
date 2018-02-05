require "./test/test_helper"
require "./lib/offset"


class TestOffset < Minitest::Test
  def test_create_today_date_in_offset
    offset = Offset.new
    assert_instance_of Date, offset.today
  end

  def test_create_key_in_offset
    offset = Offset.new
    assert_instance_of Key, offset.key
  end

  def test_convert_date_into_ddmmyy
    offset = Offset.new
    assert_equal offset.convert_date, "040218"
  end

  def test_last_four_of_squared_date
    offset = Offset.new
    assert_equal offset.last_four.length, 4
  end

  def test_offset_a_thru_d
    offset = Offset.new
    assert_equal offset.a_offset, offset.last_four[-4]
    assert_equal offset.b_offset, offset.last_four[-3]
    assert_equal offset.c_offset, offset.last_four[-2]
    assert_equal offset.d_offset, offset.last_four[-1]
  end

  def test_offset_totals
    offset = Offset.new
    assert_equal offset.a_total, (offset.a_offset.to_i + offset.key.rotation_a.to_i)
    assert_equal offset.b_total, (offset.b_offset.to_i + offset.key.rotation_b.to_i)
    assert_equal offset.c_total, (offset.c_offset.to_i + offset.key.rotation_c.to_i)
    assert_equal offset.d_total, (offset.d_offset.to_i + offset.key.rotation_d.to_i)
  end
end
