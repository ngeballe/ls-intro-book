# Use the each_with_index method to iterate through an array of your creation that prints each index and value of the array.

people = %w(Tom Sue Maria Thai Jackie Molly)

people.each_with_index do |name, index|
  #puts "#{index}. #{name}"
  # add 1 to index
  puts "#{index + 1}. #{name}"
end