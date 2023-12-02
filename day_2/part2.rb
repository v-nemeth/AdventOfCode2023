def get_max_color(color, line)
  max = 0
  0..100.times do |amount|
    max = amount if line.include?("#{amount} #{color}") and amount > max
  end
  max
end

startTime = Time.now
lines = File.open('day_2/data.txt').readlines.map(&:chomp)

sum = 0
lines.each do |line|
  sum += get_max_color('red', line) * get_max_color('green', line) * get_max_color('blue', line)
end
puts sum
endTime = Time.now

puts "Executiontime: #{(endTime - startTime)*1000} ms"


