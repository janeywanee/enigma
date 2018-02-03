# creates key object for use in offset
class Key
  attr_reader :num

  def initialize
    @num = 5.times.map { rand(1..9) }.join
  end

  def rotation_a
    @num[0] + @num[1]
  end

  def rotation_b
    @num[1] + @num[2]
  end

  def rotation_c
    @num[2] + @num[3]
  end

  def rotation_d
    @num[3] + @num[4]
  end
end
