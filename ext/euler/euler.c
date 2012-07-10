#include <ruby.h>

static short int euler_c_is_prime(unsigned int n) {
  if (n == 1) return 1;
  else if (n < 4) return 1;
  else if (n % 2 == 0) return 0;
  else if (n < 9) return 1;
  else if (n % 3 == 0) return 0;
  else {
    int r = floor(sqrt(n));
    int f = 5;
    while (f <= r) {
      if (n % f == 0) return 0;
      if (n % (f + 2) == 0) return 0;
      f += 6;
    }
    return 1;
  }
}

static VALUE euler_rb_is_prime(VALUE self, VALUE number) {
  return euler_c_is_prime(NUM2INT(number)) ? Qtrue : Qfalse;
}

static VALUE euler_rb_primes(VALUE self, VALUE number) {
  unsigned int n = NUM2UINT(number);
  unsigned int count = 3;
  unsigned int candidate = 5;
  while (count < n)
  {
    candidate += 2;
    if (euler_c_is_prime(candidate)) count += 1 ;
    if (count == n) break;
    candidate += 4;
    if (euler_c_is_prime(candidate)) count += 1 ;
  }
  return UINT2NUM(candidate);
}

void Init_euler_ext() {
  VALUE klass = rb_define_class("Euler", rb_cObject);

  rb_define_singleton_method(klass, "prime?", euler_rb_is_prime, 1);
  rb_define_singleton_method(klass, "primes", euler_rb_primes, 1);
}

