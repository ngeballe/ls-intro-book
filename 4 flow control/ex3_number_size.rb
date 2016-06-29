# ex3_number_size.rb

def number_size
  puts "Enter a number between 0 and 100"
  number = gets.chomp.to_i

  # report = case
  #   when number.between?(0, 50)
  #     "Your number is between 0 and 50"
  #   when number.between?(51, 100)
  #     "Your number is between 51 and 100"
  #   when number > 100
  #     "Your number is greater than 100"
  #   end
  # puts report
  if number < 0
    puts "You can't enter a negative number"
  elsif number <= 50
    puts "#{number} is between 0 and 50"
  elsif number <= 100
    puts "#{number} is between 51 and 100"
  else
    puts "#{number} is greater than 100"
  end
end

number_size