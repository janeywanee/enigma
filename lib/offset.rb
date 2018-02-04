# creates offset object for use in encryption
require "date"

class Offset
  attr_reader :today


  def initialize
    @today = Date.today
    @a_offset = ""
  end

  def convert_date
    @today.strftime("%d%m%y")
  end

  def last_four
    squared_date = convert_date.to_i ** 2
    squared_date.to_s[-4..-1]
  end

  def a_offset
    @a_offset = last_four[-4]
  end

  def b_offset
    @b_offset = last_four[-3]
  end

  def c_offset
    @c_offset = last_four[-2]
  end

  def d_offset
    @d_offset = last_four[-1]
  end
end
