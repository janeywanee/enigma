# creates offset object for use in encryption
require "date"
require "pry"
class Offset
  attr_reader :today,
              :key


  def initialize
    @today = Date.today
    @key = Key.new
  end

  def convert_date
    @today.strftime("%d%m%y")
  end

  def last_four
    squared_date = convert_date.to_i ** 2
    squared_date.to_s[-4..-1]
  end

  def a_offset
    last_four[-4]
  end

  def b_offset
    last_four[-3]
  end

  def c_offset
    last_four[-2]
  end

  def d_offset
    last_four[-1]
  end

  def a_total
    result = a_offset +
       @key.rotation_a

  end
end
