limit = 4_000_000
a = b = 1
sum = 0

while b < limit
  sum += b if b.even?
  a, b = b, a + b
end

puts sum

