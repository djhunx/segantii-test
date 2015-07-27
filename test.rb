print "Input scores separated by comma: "
scores = gets

total_score = scores.split(',').inject(0) do |total, score|
  total + score.to_i
end

puts scores
puts  "Total Score: #{total_score}"