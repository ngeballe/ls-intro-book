# iterating_over_hashes.rb

person = {name: 'Julia', height: '5 ft 9 in', weight: '160 lbs', hair: 'brown'}

person.each do |key, value|
  puts "Julia's #{key} is #{value}"
end