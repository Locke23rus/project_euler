target = step = 2520

(11...20).each do |i|
  if (target % i).nonzero?
    target += step while (target % i).nonzero?
    step = target
  end
end

puts target

