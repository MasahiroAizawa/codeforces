#! /usr/bin/env ruby

i = STDIN.gets.to_i
list = STDIN.gets.to_s.split(' ')

if list.length != i
  raise ArgumentError.new
end

def sell?(list)
  bills = {25 => 0, 50 => 0, 100 => 0}
  while ruble = list.shift
    case ruble.to_i
    when 25
      bills[25] += 1
    when 50
      return false if bills[25] == 0

      bills[25] -= 1
      bills[50] += 1
    when 100
      return false if bills[25] == 0

      if bills[50] > 0
        bills[50] -= 1
        bills[25] -= 1
        bills[100] += 1
      else
        return false if bills[25] < 3

        bills[25] -= 3
        bills[100] += 1
      end
    end
  end
  true
end

if sell?(list)
  puts 'YES'
else
  puts 'NO'
end

