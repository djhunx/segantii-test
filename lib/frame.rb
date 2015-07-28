class Frame
  attr_accessor :pins
  attr_accessor :scores

  def initialize(pins)
    @pins = [pins.to_i]
    @scores = [pins.to_i]
    @strike = pins.to_i == 10
  end

  def strike?
    @strike
  end

  def spare?
    !strike? && @pins.inject(0) {|total,n| total + n } == 10
  end

  def hit(pins)
    @pins.push(pins.to_i)
    @scores.push(pins.to_i)
  end

end