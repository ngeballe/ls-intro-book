# Write a method that counts down to zero using recursion.

def countdown(num)
  puts num
  if num > 0
    countdown(num - 1)
  end
end

puts "Enter a number to count down from."
number = gets.chomp.to_i

while number < 0
  puts "The number must be positive. Try again."
  number = gets.chomp.to_i
end

countdown(number)
