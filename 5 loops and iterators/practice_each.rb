# practice_each.rb

names = ["Fred", "Jen", "Kate", "Carlos", "Joe", "Tom", "Susie"]
x = 1

#names.each { |name| puts name }

names.each do |name|
  puts "#{x}. #{name}"
  x += 1
end


