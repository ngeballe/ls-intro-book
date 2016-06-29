# case.rb

def show_case(a)
  answer = case a
    when 42
      "Foty-two!"
    when 47
      "Forty-seven!"
    else
      "Ni l'un ni l'autre!"
    end

  puts answer
end

show_case(47)
show_case(42)
show_case(43)

def case_without_argument(a, b)
  answer = case
    when a == 5
      "a is 5"
    when a > b
      "a is greater than b"
    else
      "a isn't 5, and it isn't greater than b"
    end

  puts answer
end

case_without_argument(8, 7) # "a is greater..."
case_without_argument(9, 9) # "a isn't ..."
case_without_argument(45, 47) # "a isn't..."
case_without_argument(5, 4) # "a is 5"

def aint_that_the_truth(a)
  if a
    puts "how can this be true?"
  else
    puts "it is not true"
  end
end

puts
aint_that_the_truth(5) # "how..."
aint_that_the_truth(nil) # "it is not"
aint_that_the_truth(0) # "how..."
aint_that_the_truth(2 + 2 == 4) # "how"
aint_that_the_truth(2 + 2 == 7) # "it is not"
aint_that_the_truth(!true) # "it is not"
aint_that_the_truth(!false) # "how"
aint_that_the_truth(!10) # "it is not"
