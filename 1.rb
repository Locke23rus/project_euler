range = 0...1000
numbers = (range.step(3).to_a + range.step(5).to_a).uniq
sum = numbers.uniq.reduce(:+)

puts sum

