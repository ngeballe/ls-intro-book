# playing_with_blocks.rb

def take_block(test_arg, &block)
  block.call(test_arg)
end

take_block(test_arg) do
  puts "You called the block with #{test_arg}!"
end