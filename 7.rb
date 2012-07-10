require 'benchmark'
require 'euler'
require 'prime'

def lame
  limit = 10_001
  count = 2
  i = 1

  loop do
    m = i * 6
    n = m - 1
    if Prime.prime?(n)
      count += 1
      return n if count == limit
    end
    n = m + 1
    if Prime.prime?(n)
      count += 1
      return n if count == limit
    end
    i += 1
  end
end

def pro
  limit = 10_001
  count = 1
  candidate = 1
  begin
    candidate += 2
    count += 1 if Prime.prime?(candidate)
  end until count == limit
  candidate
end

def pro_ext
  limit = 10_001
  count = 1
  candidate = 1
  begin
    candidate += 2
    count += 1 if Euler.prime?(candidate)
  end until count == limit
  candidate
end

def cheat
  prime = Prime.new
  10_000.times { prime.next }
  prime.next
end

def cheat_ext
  Euler.primes 10_001
end

puts lame
puts pro
puts pro_ext
puts cheat
puts cheat_ext

n = 10
Benchmark.bm(10) do |x|
  x.report('lame') { n.times { lame } }
  x.report('pro') { n.times { pro } }
  x.report('pro_ext') { n.times { pro_ext } }
  x.report('cheat') { n.times { cheat } }
  x.report('cheat_ext') { n.times { cheat_ext } }
end
