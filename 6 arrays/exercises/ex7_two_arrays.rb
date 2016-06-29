# ex7_two_arrays.rb

# Write a program that iterates over an array and builds a new array that is the result of incrementing each value in the original array by a value of 2. You should have two arrays at the end of this program, The original array and the new array you've created. Print both arrays to the screen using the p method instead of puts.

array = [3, 8, 4, 2, 7, 12, 9]


new_array = []

array.each do |value|
  new_array << value + 2
end

# or
# new_array = array.map do |value|
#   value + 2
# end

p array
p new_array

