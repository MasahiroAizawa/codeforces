#! /usr/bin/env ruby

### not cleared

n = STDIN.gets.to_i
points = []
n.times {
  x, y = STDIN.gets.to_s.split(' ').map(&:to_i)
  points << [x, y]
}

if points.length != n
  raise ArgumentError.new
end

points = points.sort do |a, b|
  if (result = a[0] <=> b[0]) != 0
    result
  else
    a[1] <=> b[1]
  end
end

steps = []
points.each do |point|
  x = point[0]
  unless x.zero?
    steps << "1 #{x > 0 ? x : -1 * x} #{x > 0 ? :R : :L}"
  end
  y = point[1]
  unless y.zero?
    steps << "1 #{y > 0 ? y : -1 * y} #{y > 0 ? :U : :D}"
  end
  steps << "2"
  unless y.zero?
    steps <<  "1 #{y > 0 ? y : -1 * y} #{y > 0 ? :D : :U}"
  end
  unless x.zero?
    steps <<  "1 #{x > 0 ? x : -1 * x} #{x > 0 ? :L : :R}"
  end
  steps << "3"
end
puts steps.length
steps.each{|step| puts step}

