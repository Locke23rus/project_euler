var limit = 4000000
  , a = 1
  , b = 1
  , c = 1
  , sum = 0;

while (b < limit) {
  if (b % 2 == 0) {
    sum += b;
  }
  c = a;
  a = b;
  b = a + c;
}

console.log(sum);
