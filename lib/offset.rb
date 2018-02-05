# creates offset object for use in encryption
require "date"
require "pry"
class Offset
  attr_reader :last_four,
              :key


  def initialize
    @last_four = convert_date
    @key = Key.new
  end

  def convert_date
    (Date.today.strftime("%d%m%y").to_i ** 2).to_s[-4..-1]
  end

  def a_total
    @last_four[-4].to_i + @key.rotation_a.to_i
  end

  def b_total
    @last_four[-3].to_i  + @key.rotation_b.to_i
  end

  def c_total
    @last_four[-2].to_i  + @key.rotation_c.to_i
  end

  def d_total
    @last_four[-1].to_i  + @key.rotation_d.to_i
  end
end
