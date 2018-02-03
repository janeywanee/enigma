# creates key object for use in offset
class Key
  attr_reader :num

  def initialize
    @num = 5.times.map { rand(1..9) }.join
  end

  def rotation_A
    @num[0] + @num[1]
  end

  def rotation_B
    @num[1] + @num[2]
  end

  def rotation_C
    @num[2] + @num[3]
  end

  def rotation_D
    @num[3] + @num[4]
  end
end
