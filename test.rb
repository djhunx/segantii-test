#!/usr/bin/ruby

class Frame
  attr_accessor :pins
  attr_accessor :scores

  def initialize(pins)
    @pins = [pins]
    @scores = [pins]
    @strike = pins == 10
  end

  def strike?
    @strike
  end

  def spare?
    !strike? && pins.inject(0) {|total,n| total + n } == 10
  end

end


print "Input scores separated by comma: "
bowls = gets

frame = nil
frames = []

# group each throws to a frame
bowls.split(',').each do |pins|

  if frame.nil?
    frame =  Frame.new(pins.to_i)
    frames << frame

    if frame.strike?
      frame = nil
      next
    end

  else

    frame.pins.push(pins.to_i)
    frame.scores.push(pins.to_i)
    frames.pop
    frames << frame
    frame = nil

  end
end

#puts frames.inspect

# build the scores for each frame
frames.each_with_index do |frame, idx|

  if (idx < 10)
    if frame.strike?
      next_frame = frames.at(idx+1)
      if next_frame
        if next_frame.strike?
          frame.scores += [10]
          next_next_frame = frames.at(idx+2)
          frame.scores += next_next_frame.pins.first(1)
        else
          frame.scores += next_frame.pins.first(2)
        end
      end
    end

    if frame.spare?
      next_frame = frames.at(idx+1)
      if next_frame
        frame.scores += next_frame.pins.first(1)
      end
    end
  end
end

#puts frames.inspect


# finally, get the total scores for the 10 frames
total_score = frames.first(10).inject(0) do |total, f|
  total + f.scores.inject {|sum, n| sum + n }
end

puts bowls
puts  "Total Score: #{total_score}"