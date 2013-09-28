#! /usr/bin/env ruby

n = STDIN.gets.to_i
rounds = STDIN.gets.to_s.split(' ').map(&:to_i).take(n)

if rounds.length != n
  raise ArgumentError.new
end

def how_many(rounds, n)
  max = rounds.max
  diff_total = rounds.inject(0) {|diff, round| diff += max - round}

  if diff_total >= max
    max
  else
    n -= 1
    rest = max - diff_total
    max + (rest / n) + (rest % n == 0 ? 0 : 1)
  end
end

puts how_many(rounds, n)

