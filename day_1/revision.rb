enumerator = File.open('day_1/data.txt').readlines.map(&:chomp).map do |line| updated_line = line.gsub("one", "o1e").gsub("two", "t2o").gsub("three", "t3e").gsub("four", "f4r").gsub("five", "f5e").gsub("six", "s6x").gsub("seven", "s7n").gsub("eight", "e8t").gsub("nine", "n9e")
  [updated_line.scan(/\d/).first, updated_line.scan(/\d/).last].join.to_i end.sum
puts enumerator
