#! /usr/bin/env ruby

## not cleared

def get_and_split
  STDIN.gets.to_s.split(' ').map(&:to_i)
end

n = STDIN.gets.to_i
types = get_and_split
ski_tracks = get_and_split

if types.length != n || ski_tracks.length != n
  raise ArgumentError.new
end

duplicated_checker = {}
duplicated = {}
ski_tracks.each do |track|
  if duplicated_checker.key?(track)
    duplicated[track] = nil
  else
    duplicated_checker[track] = nil
  end
end

def search(i, ski_tracks, memory, duplicated)
  from = ski_tracks[i]
  if duplicated.key?(from) || from == 0
    return memory
  end
  memory << from
  search(from - 1, ski_tracks, memory, duplicated)
end

def get_path(hotels, ski_tracks, duplicated)
  path = nil
  hotels.each_with_index do |type, i|
    next if type != 1
    tmp = search(i, ski_tracks, [i + 1], duplicated).reverse

    if path.nil?
      path = tmp
    elsif tmp.length > path.length
      path = tmp
    end
  end
  path
end

path = get_path(types, ski_tracks, duplicated)
puts path.length
puts path.join(' ')

