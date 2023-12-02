def check_color(max, color, line)
  max..100.times do |amount|
    amount += max
    return false if line.include?("#{amount} #{color}")
  end
  true
end


lines = File.open('day_2/data.txt').readlines.map(&:chomp)

sum = 0
lines.each do |line|
  id = line.scan(/\d+:/).join.gsub(':', '').to_i

  sum += id if check_color(13, 'red', line) and
    check_color(14, 'green', line) and
    check_color(15, 'blue', line)
end

puts sum



