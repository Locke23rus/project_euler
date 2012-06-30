target = step = 2520

(11...20).each do |i|
  unless (target % i).zero?
    while (target % i) != 0
      target += step
    end
    step = target
  end
end

puts target

