# What method could you use to find out if a Hash contains a specific value in it? Write a program to demonstrate this use.

h = {ron: "Sales", sarah: "Finance", kim: "Product", joan: "Marketing"}

puts h.values.include?("Marketing")

# Correct (better) answer:
puts h.has_value?("Marketing")