# perform_again.rb

def do_it_again
  loop do
    puts "Do you want to do that again?"
    answer = gets.chomp
    if answer != "Y"
      break
    end 
  end
end

puts "Do-while loop"

var = 0

loop do
  puts var
  break if var >= 10
  var += 1
end

# should print 10

puts "Regular while loop"

var = 0

while var < 10
  puts var
  var += 1
end

# should not print 10

puts "Until loop"

var = 0

until var >= 10
  puts var
  var += 1
end