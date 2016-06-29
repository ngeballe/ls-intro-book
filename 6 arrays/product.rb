# product.rb

array1 = ["Bob", "Fred", "Sue"]
array2 = ["Smith", "Green", "Martinez", "Huang"]

combined = array1.product(array2)

p combined

final = combined.map { |first, last| "#{first} #{last}" }

final.each { |full_name| puts "My name is #{full_name}." }





