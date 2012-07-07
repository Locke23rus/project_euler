limit = 500
sum_equal = false
product_equal = false
product = 0

100.upto limit do |a|
  (a + 1).upto limit do |b|
    (b + 1).upto limit do |c|
      sum = a + b + c
      break if sum > 1000
      sum_equal = sum == 1000
      if sum_equal
        product_equal = a**2 + b**2 == c**2
        if product_equal
          product = a * b * c
          break
        end
      end
    end
    break if sum_equal && product_equal
  end
  break if sum_equal && product_equal
end

puts product
