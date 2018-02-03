# creates key object for use in offset
class Key
  attr_reader :num

  def initialize
    @num = 5.times.map { rand(1..9) }.join
  end
end
