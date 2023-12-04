lines = File.open("day_4/data.txt").readlines.map {|line| line.chomp.gsub(/Card +\d+: /, "").split("|")}

def calculate_points(num)
  score = 1*2**(num-1)
  score == 0.5 ? 0 : score
end

sum = 0
lines.each do |line|
  winning_numbers = line[0].split(" ").map(&:to_i)
  card_numbers = line[1].split(" ").map(&:to_i)

  amount = 0
  card_numbers.each {|num| amount += 1 if winning_numbers.include?(num)}
  sum += calculate_points(amount)
end
puts sum
