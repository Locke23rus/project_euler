target = 1000
sum = 0

(1...1000).each do |i|
  sum += i if (i % 3).zero? || (i % 5).zero?
end

puts sum
