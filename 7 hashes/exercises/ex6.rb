
# def same_letters?(word1, word2)
#   word1.split("").sort == word2.split("").sort
# end

def letters_sorted(word)
  word.split("").sort
end

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

letters_to_words = {}

words.each do |word|
  word_letters = letters_sorted(word)
  if letters_to_words.has_key?(word_letters)
    letters_to_words[word_letters] << word
  else
    letters_to_words[word_letters] = [word]
  end
end

p letters_to_words

puts "Final Answer:"
letters_to_words.values.each { |word_set| p word_set }
