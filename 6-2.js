var n = 100
  , sum_of_squares = 0
  , square_of_sum = 0
  , result = 0;

sum_of_squares = n * (n + 1) * (2 * n + 1) / 6;
square_of_sum = Math.pow(n, 2) * Math.pow((n + 1), 2) / 4;
result = square_of_sum - sum_of_squares;

console.log(result);
