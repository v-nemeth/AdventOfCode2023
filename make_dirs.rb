# Loop from 1 to 24
(1..24).each {|number| Dir.mkdir("day_#{number}") unless Dir.exist?("day_#{number}")}