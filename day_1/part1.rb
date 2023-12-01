lines = []

File.open('day_1/data.txt') do |file|
  lines = file.readlines.map(&:chomp)
end

sum = 0
lines.each do |line|
  numbers_list = line.scan(/\d/).map(&:to_i)
  puts sum if line == '2z'
  sum += "#{numbers_list.first}#{numbers_list.last}".to_i
  puts sum if line == '2z'
end

puts sum

