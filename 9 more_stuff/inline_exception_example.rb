# inline_exception_example.rb

zero = 0
puts "Before each call"
0.each { |element| puts element } rescue puts "Can't do that!"
# [9, 4, 2, nil].each { |element| puts element } rescue puts "Can't do that!"
puts "After each call"