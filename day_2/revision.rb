lines = File.open('day_2/data.txt').readlines.map(&:chomp)



lines.each do |line|
  puts line.gsub(' blue','B').gsub(' red','R').gsub(' green','G')
  puts line.gsub(' blue','B').gsub(' red','R').gsub(' green','G').scan(/(\d{1,2})R|(\d{1,2})G|(\d{1,2})B/).to_s

  puts line.gsub(' blue','B').gsub(' red','R').gsub(' green','G').scan(/(\d{1,2})R|(\d{1,2})G|(\d{1,2})B/).transpose.map(&:compact).to_s
  puts line.gsub(' blue','B').gsub(' red','R').gsub(' green','G').scan(/(\d{1,2})R|(\d{1,2})G|(\d{1,2})B/).transpose.map(&:compact).map {|sub| sub.map(&:to_i).max}.to_s
  puts line.gsub(' blue','B').gsub(' red','R').gsub(' green','G').scan(/(\d{1,2})R|(\d{1,2})G|(\d{1,2})B/).transpose.map(&:compact).map {|sub| sub.map(&:to_i).max}.inject(:*)
end

# Heres the oneliner
puts File.open('day_2/data.txt').readlines.map(&:chomp).map{ |line| line.gsub(' blue','B').gsub(' red','R').gsub(' green','G').scan(/(\d{1,2})R|(\d{1,2})G|(\d{1,2})B/).transpose.map(&:compact).map {|sub| sub.map(&:to_i).max}.inject(:*)}.sum
