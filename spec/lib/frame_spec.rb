require 'spec_helper'
require 'bowling_game'
require 'frame'

describe Frame do

  it "should detect a strike" do
    pins = 10
    frame = Frame.new(pins)
    expect(frame.strike?).to be true
  end

  it "should detect a spare" do
    frame = Frame.new(6)
    frame.hit(4)
    expect(frame.spare?).to be true
  end
end