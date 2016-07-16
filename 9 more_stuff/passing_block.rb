# passing_block.rb

def take_block(number, &block)
  block.call(number)
end

number = 42
take_block(number) do |num|
  puts "Block being called in the method! #{num}"
end



def take_block2(number)
  yield number
end

number = 49

take_block2(number) do |num|
  puts "Call me maybe...#{num}"
end