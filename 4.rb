class Integer
  def palindrome?
    to_s == to_s.reverse
  end
end

n = 999
max = 0

100.upto n do |i|
  i.upto n do |j|
    x = i * j
    max = x if x.palindrome? && x > max
  end
end

puts max
