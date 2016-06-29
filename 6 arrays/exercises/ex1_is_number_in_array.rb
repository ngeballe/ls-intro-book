# Below we have given you an array and a number. Write a program that checks to see if the number appears in the array.


def number_in_array?(array, number)
  #array.include?(number)
  # or with each
  array.each do |item|
    return true if item == number
  end
  false
end


arr = [1, 3, 5, 7, 9, 11]
number = 3

puts number_in_array?(arr, number)