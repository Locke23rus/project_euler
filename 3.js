var prime_factors = []
  , max = 0;

function factorize(n, factors) {
  if (n == 1) {
    return factors;
  }
  for (var i = 2; i <= n; i ++) {
    if (n % i == 0) {
      var factor = i;
      factors.push(factor);
      break;
    }
  }
  return factorize(n / factor, factors);
}

prime_factors = factorize(600851475143, []);

max = Math.max.apply(Math, prime_factors);

console.log(max);
