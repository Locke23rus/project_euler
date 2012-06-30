var sum_of_squares = 0
, square_of_sum = 0
, result = 0
, i = 1;

for (i = 1; i <= 100; i++) {
    sum_of_squares += i * i;
    square_of_sum += i;
}

square_of_sum *= square_of_sum;
result = square_of_sum - sum_of_squares;

console.log(result);
