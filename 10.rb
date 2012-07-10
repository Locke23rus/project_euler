require 'benchmark'
require 'prime'
require 'euler'

def lame
  sum = 0
  Prime.each 2_000_000 do |i|
    sum += i
  end
  sum
end

def pro_1
  limit = 2_000_000
  sum = n = 5
  while n <= limit
    sum += n if Prime.prime?(n)
    n += 2
    sum += n if n <= limit && Prime.prime?(n)
    n += 4
  end
  sum
end

def pro_1_ext
  limit = 2_000_000
  sum = n = 5
  while n <= limit
    sum += n if Euler.prime?(n)
    n += 2
    sum += n if n <= limit && Euler.prime?(n)
    n += 4
  end
  sum
end

def pro_2
  limit = 2_000_000
  crosslimit = Math.sqrt(limit).floor
  sieve = Array.new limit+1, false
  n = 4
  while n <= limit
    sieve[n] = true
    n += 2
  end
  n = 3
  while n <= crosslimit
    unless sieve[n]
      m = n**2
      while m <= limit
        sieve[m] = true
        m += 2*n
      end
    end
    n += 2
  end
  sum = 0
  2.upto limit do |i|
    sum += i unless sieve[i]
  end
  sum
end

def pro_3
  limit = 2_000_000
  sievebound = (limit - 1) / 2
  sieve = Array.new sievebound+1, false
  crosslimit = (Math.sqrt(limit).floor - 1) / 2
  1.upto crosslimit do |i|
    unless sieve[i]
      j = 2*i*(i + 1)
      while j <= sievebound
        sieve[j] = true
        j += 2*i + 1
      end
    end
  end
  sum = 2
  1.upto sievebound do |i|
    sum += 2*i + 1 unless sieve[i]
  end
  sum
end

n = 10
Benchmark.bm(10) do |x|
  x.report('lame') { n.times { lame } }
  x.report('pro_1') { n.times { pro_1 } }
  x.report('pro_1_ext') { n.times { pro_1_ext } }
  x.report('pro_2') { n.times { pro_2 } }
  x.report('pro_3') { n.times { pro_3 } }
end
