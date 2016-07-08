# ex1.rb


# Given a hash of family members, with keys as the title and an array of names as the values, use Ruby's built-in select method to gather only immediate family members' names into a new array.

# Given
family = { uncles: ["bob", "joe", "steve"],
           sisters: ["jane", "jill", "beth"],
           brothers: ["frank","rob","david"],
           aunts: ["mary","sally","susan"]
         }

# immediate_family = family.to_a.select { |relationship, people| [:sisters, :brothers].include?(relationship) }
# immediate_family = immediate_family.map { |relationship, people| people }
# immediate_family = immediate_family.flatten
# p immediate_family

# Correct Answer:
immediate_family = family.select do |relationship, people|
  relationship == :sisters || relationship == :brothers
end

arr = immediate_family.values.flatten
p arr  


