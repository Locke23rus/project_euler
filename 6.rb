class Integer
  def sum_of_squares
    self * (self + 1) * (2 * self + 1) / 6
  end

  def square_of_sum
    self**2 * (self + 1)**2 / 4
  end
end

n = 100

puts n.square_of_sum - n.sum_of_squares
