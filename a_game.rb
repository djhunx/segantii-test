#!/usr/bin/ruby

require_relative 'lib/bowling_game'

print "Input scores separated by comma: "
bowls = gets

game = BowlingGame.new(bowls)

puts bowls
puts  "Total Score: #{game.score}"