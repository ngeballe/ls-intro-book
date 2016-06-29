# scope.rb

# a = 5

# 3.times do |n|
#   a = 3
#   b = 5
# end

# puts a
# puts b

a = 5

def some_method
  a = 3
end

puts a # a still = 5, b/c the a inside the method is different