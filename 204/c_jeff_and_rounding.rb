#! /usr/bin/env ruby

n = STDIN.gets.to_i * 2
numbers = STDIN.gets.to_s.split(' ').map(&:to_f)

if numbers.length != n
  raise ArgumentError.new
end

def n_shift(get, give, n)
  n.times{get << give.shift}
  get
end

def pair_calc(a, b, under)
  diff = 0.0
  a.each_with_index do |item_a, i|
    item_b = b[i]
    if under
      diff += (item_a.to_i - item_a)
      diff += ((item_b + 1).to_i - item_b) unless item_b.nil?
    else
      diff += (item_b.to_i - item_b) unless item_b.nil?
      diff += ((item_a + 1).to_i - item_a)
    end
  end
  diff
end

def calc_diff(numbers)
  rounds = numbers.select{|n| n * 1000 % 1000 != 0}
  centers, rounds = rounds.partition{|n| n * 1000 % 500 == 0}
  unders, overs = rounds.partition{|n| n * 1000 % 1000 > 500}

  count_diff = unders.length - overs.length
  if count_diff >= 0
    overs = n_shift(overs, centers, [(count_diff * -1), centers.length].min)
    diff = pair_calc(unders, overs, true)
  elsif count_diff < 0
    unders = n_shift(unders, centers, [count_diff, centers.length].min)
    diff = pair_calc(overs, unders, false)
  else
  end
  unless centers.length % 2 == 0
    diff += diff > 0 ? -0.5 : 0.5
  end
  diff > 0 ? diff : diff * -1
end

diff = calc_diff(numbers)
puts sprintf("%.3f", diff)

