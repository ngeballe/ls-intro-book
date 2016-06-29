def number_size_if
  puts "Enter a number between 0 and 100"
  number = gets.chomp.to_i

  if number < 0
    puts "You can't enter a negative number"
  elsif number <= 50
    puts "#{number} is between 0 and 50"
  elsif number <= 100
    puts "#{number} is between 51 and 100"
  else
    puts "#{number} is above 100"
  end
end

def number_size_case
  puts "Enter a number between 0 and 100"
  number = gets.chomp.to_i

  report = case
    when number < 0
      "You can't enter a negative number"
    when number <= 50
      "#{number} is between 0 and 50"
    when number <= 100
      "#{number} is between 51 and 100"
    else
      "#{number} is above 100"
    end

  puts report
end

number_size_if
number_size_case