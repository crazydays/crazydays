a = gets.chomp.split(/, */).sort.reverse

puts "Size #{a.size}"
a.each { |val| puts val }
