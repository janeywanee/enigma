require "./test/test_helper"
require "./lib/offset"
require "pry"


class TestOffset < Minitest::Test
  def test_create_today_date_in_offset
    offset = Offset.new
    assert_instance_of Date, offset.today
  end

  def test_convert_date_into_ddmmyy
    offset = Offset.new
    binding.pry
    assert_equal offset.convert_date, "040218"
  end
end
