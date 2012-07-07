require 'benchmark'

def lame
  limit = 500
  100.upto limit do |a|
    (a + 1).upto limit do |b|
      (b + 1).upto limit do |c|
        sum = a + b + c
        break if sum > 1000
        return a*b*c if sum == 1000 && c**2 == a**2 + b**2
      end
    end
  end
end

def pro_1
  s = 1000
  3.upto (s-3) / 3 do |a|
    (a+1).upto (s - 1 - a) / 2 do |b|
      c = s - a - b
      return a*b*c if c**2 == a**2 + b**2
    end
  end
end

def pro_2
  s = 1000
  s2 = s / 2
  mlimit = Math.sqrt(s2).ceil - 1
  2.upto mlimit do |m|
    if s2 % m == 0
      sm = s2 / m
      while sm % 2 == 0
        sm = sm / 2
      end
      if m % 2 == 1
        k = m + 2
      else
        k = m + 1
      end
      while k < 2*m && k <= sm
        if sm % k == 0 && k.gcd(m) == 1
          d = s2 / (k*m)
          n = k - m
          a = d * (m**2 - n**2)
          b = 2 * d * m * n
          c = d *(m**2 + n**2)
          return a*b*c
        end
        k += 2
      end
    end
  end
end

n = 10
Benchmark.bm do |x|
  x.report { n.times { lame } }
  x.report { n.times { pro_1 } }
  x.report { n.times { pro_2 } }
end
