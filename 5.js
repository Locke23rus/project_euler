var step = 2520
  , target = 2520;

for (var i = 11; i < 20; i ++) {
  if (target % i != 0) {
    while (target % i != 0) {
      target += step;
    }
    step = target;
  }
}

console.log(target);
