#! /usr/bin/env ruby

n = STDIN.gets.to_i
numbers = STDIN.gets.to_s.split(' ').map(&:to_i)

if numbers.length != n
  raise ArgumentError.new
end

def get_arithmetic_progression(numbers)
  list = []
  targets = numbers.sort.uniq

  targets.each do |n|
    if numbers.count{|i| i == n} == 1
      list << [n, 0]
      next
    end

    ns = []
    numbers.each_with_index do |item, i|
      ns << i if item == n
    end

    diff = ns[1] - ns[0]
    accept = ns.each_cons(2).all? do |l|
      l[1] - l[0] == diff
    end
    list << [n, diff] if accept
  end
  list
end

list = get_arithmetic_progression(numbers)
puts list.length
list.each do |l|
  puts l.join(' ')
end

