def factorize(n, factors)
  return factors if n == 1
  
  2.upto n do |i|
    if n % i == 0
      factor = i
      factors << factor
      return factorize n/factor, factors
    end
  end
  
end

puts factorize(600851475143, []).max

