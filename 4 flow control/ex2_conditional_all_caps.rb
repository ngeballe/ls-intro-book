# ex2_conditional_all_caps.rb

def all_caps_if_long(str)
  if str.length > 10
    str.upcase
  else
    str
  end

# or
  # size = str.length
  # case
  # when size > 10
  #   str.upcase
  # else
  #   str
  # end
end

puts all_caps_if_long("john") # johm
puts all_caps_if_long("Mary-Sue and Aunt Lou") # "MARY SUE AND AUNT LOU"
puts all_caps_if_long("x" * 10) # "xxxxxxxxxx"
puts all_caps_if_long("x" * 11) # "XXXXXXXXXXX"