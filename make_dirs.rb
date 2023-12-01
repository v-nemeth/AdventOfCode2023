# Loop from 1 to 24
(1..24).each do |number|
  dir_name = "day_#{number}"
  Dir.mkdir(dir_name) unless Dir.exist?(dir_name)
end