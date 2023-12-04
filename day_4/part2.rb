def calculate_win_amount(winning_nums, card_nums)
  amount = 0
  card_nums.each {|num| amount += 1 if winning_nums.include?(num)}

  amount
end

lines = File.open("day_4/data.txt").readlines.map {|line| line.chomp.gsub(/Card +/, "").split("|")}

# Get them into [1, [winning_nums], [card_nums]] format
lines = lines.map{|card| [card.first.scan(/(\d+):/).first.map(&:to_i).first, card.first.gsub(/\d+:/, "").split(" ").map(&:to_i), card.last.split(" ").map(&:to_i)]}

num_of_cards = (1..lines.size).map {1}

lines.each do |line|
  win_amount = calculate_win_amount(line[1], line[2])

  (0..win_amount-1).each do |i|
    next if win_amount == 0
    num_of_cards[line[0]+i] += num_of_cards[line[0]-1]
  end
end
puts num_of_cards.sum