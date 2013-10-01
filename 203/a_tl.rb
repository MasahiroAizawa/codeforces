#! /usr/bin/env ruby

def get_and_split
  STDIN.gets.to_s.split(' ').map(&:to_i)
end

n, m = get_and_split
corrects = get_and_split
wrongs = get_and_split

if corrects.length != n
  raise ArgumentError.new
end

if wrongs.length != m
  raise ArgumentError.new
end

def tl(corrects, wrongs)
  fast_correct = corrects.min
  slow_correct = corrects.max
  fast_wrong = wrongs.min

  if slow_correct >= fast_wrong
    return -1
  end
  if fast_correct * 2 > slow_correct
    return -1
  end
  slow_correct
end


puts tl(corrects, wrongs)

