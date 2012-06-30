Number.prototype.reverse = function() {
  return parseInt(this.toString().split('').reverse().join(''), 10);
}

Number.prototype.isPalindrome = function() {
  return this == this.reverse();
}

var max = 0
  , x;

for (var i = 100; i < 999; i++) {
  for (var j = i; j < 999; j++) {
    x = i * j;
    if (x.isPalindrome() && x > max) {
      max = x;
    }
  }
}

console.log(max);
