# ex1_lab.rb

# Write a program that checks if the sequence of characters "lab" exists in the following strings. If it does exist, print out the word.

#     "laboratory"
#     "experiment"
#     "Pans Labyrinth"
#     "elaborate"
#     "polar bear"

["laboratory", "experiment", "Pans Labyrinth", "elaborate", "polar bear"].each do |str|
  puts str if str =~ /lab/
end

puts

# official answer:
def check_in(word)
  if /lab/i =~ word
    puts word
  else
    puts "No match"
  end
end

check_in "laboratory"
check_in "experiment"
check_in "Pans Labyrinth"
check_in "elaborate"
check_in "polar bear"
