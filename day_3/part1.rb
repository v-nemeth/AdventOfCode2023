def find_whole_number(i,j, lines)
  matches = lines[i].to_enum(:scan, /\d+/).map { Regexp.last_match }

  # Find the match that includes the given index
  match = matches.find { |m| (m.begin(0)..m.end(0)).cover?(j) }

  # Return the matched number or nil if not found
  match ? match[0].to_i : nil
end

lines = File.open("day_3/data.txt").readlines.map(&:chomp)

sym_indexes = lines.map do |line|
  line.chars.each_with_index.select { |char, idx| char.match(/[^\w\s.]/) }.map(&:last)
end
puts sym_indexes.to_s

gears = []
line = -1
sym_indexes.each do |index_list|
  line += 1
  index_list.each do |index|
    next if index.nil?

    skip_j = []
    numbers = []
    (-1..1).each do |i|
      (-1..1).each do |j|
        next unless lines[line+i][index+j].match?(/\d+/)
        next if skip_j.include?(index+j)

        skip_j.append(index+j+1) unless j == 1
        skip_j.append(index+j+2) if j == -1 and lines[line+i][index+j+1].match?(/\d+/)
        num = find_whole_number(line+i,index+j, lines)
        numbers.append(num)
      end
      skip_j = []
    end
    gears.append(numbers)
  end
end
puts gears.select{|gear| gear.size == 2}.map{|gear| gear.inject(:*)}.sum
