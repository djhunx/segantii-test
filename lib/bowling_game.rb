require_relative 'frame'

class BowlingGame
  attr_reader :hits
  attr_accessor :frames

  def initialize(hits)
    @hits = hits
    @frames = []

    frame = nil
    hits.split(',').each do |pins|

      if frame.nil?
        frame =  Frame.new(pins)
        @frames << frame

        if frame.strike?
          frame = nil
          next
        end

      else
        frame.hit(pins)
        @frames.pop
        @frames << frame
        frame = nil

      end
    end

    # build the scores for each frame
    @frames.each_with_index do |frame, idx|

      if (idx < 10)
        if frame.strike?
          next_frame = @frames.at(idx+1)
          if next_frame
            if next_frame.strike?
              frame.scores += [10]
              next_next_frame = @frames.at(idx+2)
              frame.scores += next_next_frame.pins.first(1) unless next_next_frame.nil?
            else
              frame.scores += next_frame.pins.first(2)
            end
          end
        end

        if frame.spare?
          next_frame = @frames.at(idx+1)
          frame.scores += next_frame.pins.first(1) unless next_frame.nil?
        end
      end
    end
  end

  def score
    @score ||= @frames.first(10).inject(0) do |total, f|
      total + f.scores.inject {|sum, n| sum + n }
    end
  end

end