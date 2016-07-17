# ex10.rb

# Can hash values be arrays? Can you have an array of hashes? (give examples)

# Yes and yes

hash_of_arrays = { squares: [1, 4, 9, 16], cubes: [1, 8, 27, 64] }
p hash_of_arrays
p hash_of_arrays.values.map { |value| value.class }.all? { |value_class| value_class == Array }

array_of_hashes = [{one: 1, two: 2}, {a: 1, b: 2}]
p array_of_hashes
p array_of_hashes.all? { |element| element.class == Hash }