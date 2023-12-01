lines = File.open('day_1/data.txt').readlines.map(&:chomp)

def convert_first_to_integer(string)
  hash = {one: 1, two: 2, three: 3, four: 4, five: 5, six:6, seven: 7, eight: 8, nine: 9}

  build_integer = ''

  string.each_char do |char|
    return string.sub!(match_hash?(build_integer, hash).to_s, "#{hash[match_hash?(build_integer, hash)]}#{match_hash?(build_integer, hash)}") if match_hash?(build_integer, hash)
    build_integer += char
  end
end

def convert_last_to_integer(string)
  string.reverse!
  hash = {eno: 1, owt: 2, eerht: 3, ruof: 4, evif: 5, xis:6, neves: 7, thgie: 8, enin: 9}

  build_integer = ''

  string.each_char do |char|
    return string.sub!(match_hash?(build_integer, hash).to_s, "#{hash[match_hash?(build_integer, hash)]}#{match_hash?(build_integer, hash)}").reverse! if match_hash?(build_integer, hash)
    build_integer += char
  end
  string.reverse!
end


def match_hash?(build_integer, hash)
  hash.each do |key, value|
    return key if build_integer.include?(key.to_s)
  end
  nil
end




sum = 0
lines.each do |line|
  #puts "__________________________________________________" if line == "one6onepkpnfhqmp"

  #puts "ORIGINAL LINE: #{line}"
  convert_first_to_integer(line)
  #puts "FIRST CONVERT: #{line}"
  convert_last_to_integer(line)
  #puts "LAST CONVERT: #{line}"
  numbers_list = line.scan(/\d/).map(&:to_i)
  final_number = "#{numbers_list.first}#{numbers_list.last}".to_i
  #puts "FINAL NUMBER: #{final_number}"
  sum += final_number
end

puts sum


