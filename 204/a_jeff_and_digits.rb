#! /usr/bin/env ruby

n = STDIN.gets.to_i
numbers = STDIN.gets.to_s.split(' ').map(&:to_i)

if numbers.length != n
  raise ArgumentError.new
end

def check(numbers, n)
  if numbers.none?(&:zero?)
    return nil
  end
  numbers.sort!.reverse!

  while numbers.first == 5
    sum = numbers.count{|i| i == 5} * 5
    if sum % 9 == 0
      return numbers.join.to_i
    end
    numbers.shift
  end

  0
end

answer = check(numbers, n)
if answer.nil?
  puts "-1"
else
  puts answer
end

