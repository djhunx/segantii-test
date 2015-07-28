require 'spec_helper'
require 'bowling_game'
require 'frame'

describe BowlingGame do

  it "should score 300 for a perfect game" do
    hits = 12.times.collect {10}.join(',')
    game = BowlingGame.new(hits)
    expect(game.score).to equal 300
  end

  it "should score an incomplete game" do
    hits = 5.times.collect {10}.join(',')
    game = BowlingGame.new(hits)
    expect(game.score).to be_a(Fixnum)
  end

  it "should score a strike and the next 2 bowls correctly" do
    hits = "10,6,3"
    game = BowlingGame.new(hits)
    expect(game.score).to be_equal 28
  end

  it "should score a spare and the next 2 bowls correctly" do
    hits = "8,2,6,2"
    game = BowlingGame.new(hits)
    expect(game.score).to be_equal 24
  end
end