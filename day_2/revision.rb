
# Heres the oneliner
puts File.open('day_2/data.txt').readlines.map(&:chomp).map{ |line| line.gsub(' blue','B').gsub(' red','R').gsub(' green','G').scan(/(\d{1,2})R|(\d{1,2})G|(\d{1,2})B/).transpose.map(&:compact).map {|sub| sub.map(&:to_i).max}.inject(:*)}.sum

# And the oneliner without gsub formatted to be more readable
puts File.open('day_2/data.txt').readlines.map(&:chomp)
         .map{ |line|
           line.scan(/(\d{1,2}) red|(\d{1,2}) green|(\d{1,2}) blue/)
               .transpose
               .map(&:compact)
               .map {|sub|
                 sub.map(&:to_i).max
               }.inject(:*)
         }.sum
