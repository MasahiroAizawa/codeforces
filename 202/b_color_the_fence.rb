#! /usr/bin/env ruby

paint = STDIN.gets.to_i
digits = STDIN.gets.to_s.split(' ').map(&:to_i).first(9)

def paint_fence(paint, digits)
  if paint == 0 || digits.min > paint
    puts '-1'
    return
  end

  min = 100000
  idx = nil
  digits.each_with_index do |require_digit, i|
    next if require_digit > min

    min = require_digit
    idx = i + 1
  end

  count = paint / min
  rest = paint % min
  suppl = []

  end_flg = false
  while rest > 0 && !end_flg
    digits.reverse.each_with_index do |require_digit, i|
      if (digit = 9 - i) <= idx
        end_flg = true
        break
      end
      if rest >= (require_digit - min)
        rest -= (require_digit - min)
        suppl << digit
        break
      end
    end
  end

  puts (idx.to_s * count).chars.map {|i|
    (alter = suppl.shift) ? alter : i
  }.join
end

paint_fence(paint, digits)

